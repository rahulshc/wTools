( function _Array_test_s_( ) {

'use strict';

var isBrowser = true;

if( typeof module !== 'undefined' )
{
  isBrowser = false;

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

function arrayIs( test )
{

  test.description = 'an empty array';
  var got = _.arrayIs( [  ] );
  var expected = true;
  test.identical( got, expected );

  test.description = 'an array';
  var got = _.arrayIs( [ 1, 2, 3 ] );
  var expected  = true;
  test.identical( got, expected );

  test.description = 'object';
  var got = _.arrayIs( {  } );
  var expected  = false;
  test.identical( got, expected );

  test.description = 'number';
  var got = _.arrayIs( 6 );
  var expected  = false;
  test.identical( got, expected );

  test.description = 'string';
  var got = _.arrayIs( 'abc' );
  var expected  = false;
  test.identical( got, expected );

  test.description = 'boolean';
  var got = _.arrayIs( true );
  var expected  = false;
  test.identical( got, expected );

  test.description = 'function';
  var got = _.arrayIs( function() {  } );
  var expected  = false;
  test.identical( got, expected );

  test.description = 'a pseudo array';
  var got = ( function() {
    return _.arrayIs( arguments );
  } )('Hello there!');
  var expected = false;
  test.identical( got, expected );

  test.description = 'no argument';
  var got = _.arrayIs();
  var expected  = false;
  test.identical( got, expected );

  test.description = 'null';
  var got = _.arrayIs();
  var expected  = false;
  test.identical( got, expected );


  /**/

  if( Config.debug )
  {



  }

};

//

function arrayLike( test )
{

  test.description = 'an empty array';
  var got = _.arrayLike( [  ] );
  var expected = true;
  test.identical( got, expected );

  test.description = 'an array';
  var got = _.arrayLike( [ 1, 2, 3 ] );
  var expected  = true;
  test.identical( got, expected );

  test.description = 'a pseudo array';
  var got = ( function() {
    return _.arrayLike( arguments );
  } )('Hello there!');
  var expected = true;
  test.identical( got, expected );

  test.description = 'no argument';
  var got = _.arrayLike();
  var expected  = false;
  test.identical( got, expected );

  test.description = 'null';
  var got = _.arrayLike();
  var expected  = false;
  test.identical( got, expected );

  test.description = 'function';
  var got = _.arrayLike( function() {  } );
  var expected  = false;
  test.identical( got, expected );

  test.description = 'string';
  var got = _.arrayLike();
  var expected  = false;
  test.identical( got, expected );

  test.description = 'number';
  var got = _.arrayLike();
  var expected  = false;
  test.identical( got, expected );

  test.description = 'boolean';
  var got = _.arrayLike( true );
  var expected  = false;
  test.identical( got, expected );

  test.description = 'object';
  var got = _.arrayLike();
  var expected  = false;
  test.identical( got, expected );

  /**/

  if( Config.debug )
  {



  }

};


function hasLength( test )
{

  test.description = 'an empty array';
  var got = _.hasLength( [  ] );
  var expected = true;
  test.identical( got, expected );

  test.description = 'an array';
  var got = _.hasLength( [ 1, 2, 3 ] );
  var expected  = true;
  test.identical( got, expected );

  test.description = 'a pseudo array';
  var got = ( function() {
    return _.hasLength( arguments );
  } )('Hello there!');
  var expected = true;
  test.identical( got, expected );

  test.description = 'an array-like';
  var got = _.hasLength( { '0' : 1, '1' : 2, '2' : 3, 'length' : 3 } );
  var expected = true;
  test.identical( got, expected );

  test.description = 'a Function.length';
  function fn( a, b, c ) { };
  var got = _.hasLength( fn );
  var expected = true;
  test.identical( got, expected );

  test.description = 'a "string".length';
  var got = _.hasLength( 'Hello there!' );
  var expected = true;
  test.identical( got, expected );

  test.description = 'no arguments';
  var got = _.hasLength();
  var expected = false;
  test.identical( got, expected );

  test.description = 'null';
  var got = _.hasLength();
  var expected = false;
  test.identical( got, expected );

  /**/

  if( Config.debug )
  {



  }

};

//

function arraySub( test )
{

  test.description = 'nothing';
  var got = _.arraySub( [  ], 0, 0 );
  var expected = [  ];
  test.identical( got, expected );

  test.description = 'two arguments';
  var got = _.arraySub( [  ], 0 );
  var expected = [  ];
  test.identical( got, expected );

  test.description = 'full copy of an array';
  var got = _.arraySub( [ 1, 2, 3, 4, 5 ] );
  var expected = [ 1, 2, 3, 4, 5 ];
  test.identical( got, expected );

  test.description = 'an array of two elements';
  var got = _.arraySub( [ 1, 2, 3, 4, 5 ], 2, 4 );
  var expected = [ 3, 4 ];
  test.identical( got, expected );

  test.description = 'from second index to the (arr.length - 1)';
  var got = _.arraySub( [ 1, 2, 3, 4, 5 ], 2 );
  var expected = [ 3, 4, 5 ];
  test.identical( got, expected );

  test.description = 'an offset from the end of the sequence';
  var got = _.arraySub( [ 1, 2, 3, 4, 5 ], -4 );
  var expected = [ 2, 3, 4, 5 ];
  test.identical( got, expected );

  test.description = 'the two negative index';
  var got = _.arraySub( [ 1, 2, 3, 4, 5 ], -4, -2 );
  var expected = [ 2, 3 ];
  test.identical( got, expected );

  test.description = 'the third index is negative';
  var got = _.arraySub( [ 1, 2, 3, 4, 5 ], 1, -1 );
  var expected = [ 2, 3, 4 ];
  test.identical( got, expected );

  /**/

  if( Config.debug )
  {

    test.description = 'no arguments';
    test.shouldThrowError( function()
    {
      _.arraySub();
    });

    test.description = 'first argument is wrong';
    test.shouldThrowError( function()
    {
      _.arraySub( 'wrong argument', 1, -1 );
    });

    test.description = 'argument is not wrapped into array';
    test.shouldThrowError( function()
    {
      _.arraySub( 1, 2, 3, 4, 5, 2, 4 );
    });

    test.description = 'extra argument';
    test.shouldThrowError( function()
    {
      _.arraySub( [ 1, 2, 3, 4, 5 ], 2, 4, 'redundant argument' );
    });

  }

};

//

function arrayMakeSimilar( test )
{

  test.description = 'an empty array';
  var got = _.arrayMakeSimilar( [  ], 0 );
  var expected = [  ];
  test.identical( got, expected );

  test.description = 'length = 1';
  var got = _.arrayMakeSimilar( [  ], 1 );
  var expected = [ ,  ];
  test.identical( got, expected );

  test.description = 'length = 2';
  var got = _.arrayMakeSimilar( [ 1, 2, 3 ], 2 );
  var expected = [ , , ];
  test.identical( got, expected );

  test.description = 'length = 4';
  var got = _.arrayMakeSimilar( [ 1, 2, 3 ], 4 );
  var expected = [ , , , , ];
  test.identical( got, expected );

  /**/

  if( Config.debug )
  {

    test.description = 'no arguments';
    test.shouldThrowError( function()
    {
      _.arrayMakeSimilar();
    });

    test.description = 'wrong type of argument';
    test.shouldThrowError( function()
    {
      _.arrayMakeSimilar('wrong argument');
    });

    test.description = 'arguments[1] is wrong';
    test.shouldThrowError( function()
    {
      _.arrayMakeSimilar( [ 1, 2, 3 ], 'wrong type of argument' );
    });

    test.description = 'extra argument';
    test.shouldThrowError( function()
    {
      _.arrayMakeSimilar( [ 1, 2, 3 ], 4, 'redundant argument' );
    });

    test.description = 'argument is not wrapped into array';
    test.shouldThrowError( function()
    {
      _.arrayMakeSimilar( 1, 2, 3, 4 );
    });

  }

};

//

function arrayNewOfSameLength( test )
{

  test.description = 'nothing';
  var got = _.arrayNewOfSameLength( [  ] );
  var expected = [  ];
  test.identical( got, expected );

  test.description = 'length = 3';
  var got = _.arrayNewOfSameLength( [ 1, 2, 3 ] );
  var expected = [ , , , ];
  test.identical( got, expected );

  /**/

  if( Config.debug )
  {

    test.description = 'no arguments';
    test.shouldThrowError( function()
    {
      _.arrayNewOfSameLength();
    });

    test.description = 'extra argument';
    test.shouldThrowError( function()
    {
      _.arrayNewOfSameLength( [ 1, 2, 3 ], 'redundant argument' );
    });

    test.description = 'argument is not wrapped into array';
    test.shouldThrowError( function()
    {
      _.arrayNewOfSameLength( 1, 2, 3 );
    });

  }

};

//

function arrayOrNumber( test )
{

  test.description = 'nothing';
  var got = _.arrayOrNumber( [  ], 0 );
  var expected = [  ];
  test.identical( got, expected );

  test.description = 'static array';
  var got = _.arrayOrNumber( 3, 7 );
  var expected = [ 3, 3, 3, 3, 3, 3, 3 ];
  test.identical( got, expected );

  test.description = 'original array';
  var got = _.arrayOrNumber( [ 3, 7, 13 ], 3 );
  var expected = [ 3, 7, 13 ];
  test.identical( got, expected );

  /**/

  if( Config.debug )
  {

    test.description = 'no arguments';
    test.shouldThrowError( function()
    {
      _.arrayOrNumber();
    });

    test.description = 'not enough arguments';
    test.shouldThrowError( function()
    {
      _.arrayOrNumber( [ 1, 2, 3 ] );
    });

    test.description = 'extra argument';
    test.shouldThrowError( function()
    {
      _.arrayOrNumber( [ 1, 2, 3 ], 3, 'redundant argument' );
    });

    test.description = 'wrong type of arguments';
    test.shouldThrowError( function()
    {
      _.arrayOrNumber('wrong argument', 'wrong argument');
    });

    test.description = 'second argument too much';
    test.shouldThrowError( function()
    {
      _.arrayOrNumber( [ 1, 2, 3 ], 4 );
    });

    test.description = 'first three arguments are not wrapped into array';
    test.shouldThrowError( function()
    {
      _.arrayOrNumber( 1, 2, 3, 3 );
    });

  }

};

//

function arraySelect( test )
{

  test.description = 'nothing';
  var got = _.arraySelect( [  ], [  ] );
  var expected = [  ];
  test.identical( got, expected );

  test.description = 'certain elements';
  var got = _.arraySelect( [ 1, 2, 3, 4, 5 ], [ 2, 3, 4 ] );
  var expected = [ 3, 4, 5 ];
  test.identical( got, expected );

  test.description = 'array of undefined';
  var got = _.arraySelect( [ 1, 2, 3 ], [ 4, 5 ] );
  var expected = [ undefined, undefined ];
  test.identical( got, expected );

  /**/

  if( Config.debug )
  {

    test.description = 'no arguments';
    test.shouldThrowError( function()
    {
      _.arraySelect();
    });

    test.description = 'not enough arguments';
    test.shouldThrowError( function()
    {
      _.arraySelect( [ 1, 2, 3 ] );
    });

    test.description = 'wrong type of arguments';
    test.shouldThrowError( function()
    {
      _.arraySelect('wrong argument', 'wrong argument');
    });

    test.description = 'arguments are not wrapped into array';
    test.shouldThrowError( function()
    {
      _.arraySelect( 1, 2, 3, 4, 5 );
    });

  }

};

//

function arrayIron( test )
{

  test.description = 'nothing';
  var got = _.arrayIron();
  var expected = [  ];
  test.identical( got, expected );

  test.description = 'array of the passed arguments';
  var got = _.arrayIron( 'str', {}, [ 1, 2 ], 5, true );
  var expected = [ 'str', {}, 1, 2, 5, true ];
  test.identical( got, expected );

  test.description = 'without undefined';
  var got = _.arrayIron( [ 1, 2, 3 ], 13, 'abc', undefined, null );
  var expected = [ 1, 2, 3, 13, 'abc', null ];
  test.identical( got, expected );

  /**/

  if( Config.debug )
  {

    test.description = 'arguments[0] contains undefined';
    test.shouldThrowError( function()
    {
      _.arrayIron( [ 1, 2, undefined ], 13, 'abc', {} );
    });

  }

};

// ---
// array transformation
// ---

function __arrayPrepend( test )
{
  test.description = 'simple';

  var got = _.__arrayPrepend( [], 1 );
  test.identical( got, [ 1 ] );

  var got = _.__arrayPrepend( [ 1 ], 1 );
  test.identical( got, [ 1, 1 ] );

  var got = _.__arrayPrepend( [ 1 ], 2 );
  test.identical( got, [ 2, 1 ] );

  var got = _.__arrayPrepend( [ 1,2,3 ], 3 );
  test.identical( got, [ 3,1,2,3 ] );

  var got = _.__arrayPrepend( [ 1 ], '1' );
  test.identical( got, [ '1', 1 ] );

  var got = _.__arrayPrepend( [ 1 ], -1 );
  test.identical( got, [ -1, 1 ] );

  var got = _.__arrayPrepend( [ 1 ], [ 1 ] );
  test.identical( got, [ [ 1 ], 1 ] );

  //

  if( Config.debug )
  {
    test.description = 'no args';
    test.shouldThrowError( function()
    {
      _.__arrayPrepend();
    })

    test.description = 'too many args';
    test.shouldThrowError( function()
    {
      _.__arrayPrepend( [], 1, 1 );
    })

    test.description = 'dst is not an array';
    test.shouldThrowError( function()
    {
      _.__arrayPrepend( 1, 1 );
    })
  }
}

//

function __arrayPrepended( test )
{
  test.description = 'simple';

  var dst = [];
  var got = _.__arrayPrepended( dst, 1 );
  test.identical( dst, [ 1 ] );
  test.identical( got, 0 );

  var dst = [ 1 ];
  var got = _.__arrayPrepended( dst, 1 );
  test.identical( dst, [ 1, 1 ] );
  test.identical( got, 0 );

  var dst = [ 1 ];
  var got = _.__arrayPrepended( dst, 2 );
  test.identical( dst, [ 2, 1 ] );
  test.identical( got, 0 );

  var dst = [ 1,2,3 ];
  var got = _.__arrayPrepended( dst, 3 );
  test.identical( dst, [ 3,1,2,3 ] );
  test.identical( got, 0 );

  var dst = [ 1 ];
  var got = _.__arrayPrepended( dst, '1' );
  test.identical( dst, [ '1', 1 ] );
  test.identical( got, 0 );

  var dst = [ 1 ];
  var got = _.__arrayPrepended( dst, -1 );
  test.identical( dst, [ -1, 1 ] );
  test.identical( got, 0 );

  var dst = [ 1 ];
  var got = _.__arrayPrepended( dst, [ 1 ] );
  test.identical( dst, [ [ 1 ], 1 ] );
  test.identical( got, 0 );

  //

  if( Config.debug )
  {
    test.description = 'no args';
    test.shouldThrowError( function()
    {
      _.__arrayPrepended();
    })

    test.description = 'too many args';
    test.shouldThrowError( function()
    {
      _.__arrayPrepended( [], 1, 1 );
    })

    test.description = 'dst is not an array';
    test.shouldThrowError( function()
    {
      _.__arrayPrepended( 1, 1 );
    })
  }
}

//

function __arrayPrependOnce( test )
{
  test.description = 'simple';

  var got = _.__arrayPrependOnce( [], 1 );
  test.identical( got, [ 1 ] );

  var got = _.__arrayPrependOnce( [ 1 ], 1 );
  test.identical( got, [ 1 ] );

  var got = _.__arrayPrependOnce( [ 1 ], 2 );
  test.identical( got, [ 2, 1 ] );

  var got = _.__arrayPrependOnce( [ 1,2,3 ], 3 );
  test.identical( got, [ 1,2,3 ] );

  var got = _.__arrayPrependOnce( [ 1 ], '1' );
  test.identical( got, [ '1', 1 ] );

  var got = _.__arrayPrependOnce( [ 1 ], -1 );
  test.identical( got, [ -1, 1 ] );

  var got = _.__arrayPrependOnce( [ 1 ], [ 1 ] );
  test.identical( got, [ [ 1 ], 1 ] );

  test.description = 'equalizer 2 args';

  var dst = [ { num : 1 },{ num : 2 },{ num : 3 } ];
  var onEqualize = function( a, b )
  {
    return a.num === b.num;
  }
  var got = _.__arrayPrependOnce( dst, { num : 4 }, onEqualize );
  test.identical( got, [ { num : 4 },{ num : 1 },{ num : 2 },{ num : 3 } ] );

  var dst = [ { num : 1 },{ num : 2 },{ num : 3 } ];
  var onEqualize = function( a, b )
  {
    return a.num === b.num;
  }
  var got = _.__arrayPrependOnce( dst, { num : 1 }, onEqualize );
  test.identical( got, [ { num : 1 },{ num : 2 },{ num : 3 } ] );

  test.description = 'equalizer 1 arg';

  var dst = [ { num : 1 },{ num : 2 },{ num : 3 } ];
  var onEqualize = function( a )
  {
    return a.num;
  }
  var got = _.__arrayPrependOnce( dst, 4, onEqualize );
  test.identical( got, [ 4,{ num : 1 },{ num : 2 },{ num : 3 } ] );

  var dst = [ { num : 1 },{ num : 2 },{ num : 3 } ];
  var onEqualize = function( a )
  {
    return a.num;
  }
  var got = _.__arrayPrependOnce( dst, 1, onEqualize );
  test.identical( got, [ { num : 1 },{ num : 2 },{ num : 3 } ] );

  //

  if( Config.debug )
  {
    test.description = 'no args';
    test.shouldThrowError( function()
    {
      _.__arrayPrependOnce();
    })

    test.description = 'dst is not an array';
    test.shouldThrowError( function()
    {
      _.__arrayPrependOnce( 1, 1 );
    })

    test.description = 'onEqualize is not a function';
    test.shouldThrowError( function()
    {
      _.__arrayPrependOnce( 1, 1, 1 );
    })
  }
}

//

function __arrayPrependedOnce( test )
{
  test.description = 'simple';

  var dst = [];
  var got = _.__arrayPrependedOnce( dst, 1 );
  test.identical( dst, [ 1 ] );
  test.identical( got, 0 );

  var dst = [ 1 ];
  var got = _.__arrayPrependedOnce( dst, 1 );
  test.identical( dst, [ 1 ] );
  test.identical( got, -1 );

  var dst = [ 1 ];
  var got = _.__arrayPrependedOnce( dst, 2 );
  test.identical( dst, [ 2, 1 ] );
  test.identical( got, 0 );

  var dst = [ 1,2,3 ];
  var got = _.__arrayPrependedOnce( dst, 3 );
  test.identical( dst, [ 1,2,3 ] );
  test.identical( got, -1 );

  var dst = [ 1 ];
  var got = _.__arrayPrependedOnce( dst, '1' );
  test.identical( dst, [ '1', 1 ] );
  test.identical( got, 0 );

  var dst = [ 1 ];
  var got = _.__arrayPrependedOnce( dst, -1 );
  test.identical( dst, [ -1, 1 ] );
  test.identical( got, 0 );

  var dst = [ 1 ];
  var got = _.__arrayPrependedOnce( dst, [ 1 ] );
  test.identical( dst, [ [ 1 ], 1 ] );
  test.identical( got, 0 );

  test.description = 'equalizer 2 args';

  var dst = [ { num : 1 },{ num : 2 },{ num : 3 } ];
  var onEqualize = function( a, b )
  {
    return a.num === b.num;
  }
  var got = _.__arrayPrependedOnce( dst, { num : 4 }, onEqualize );
  test.identical( dst, [ { num : 4 },{ num : 1 },{ num : 2 },{ num : 3 } ] );
  test.identical( got, 0 );

  var dst = [ { num : 1 },{ num : 2 },{ num : 3 } ];
  var onEqualize = function( a, b )
  {
    return a.num === b.num;
  }
  var got = _.__arrayPrependedOnce( dst, { num : 1 }, onEqualize );
  test.identical( dst, [ { num : 1 },{ num : 2 },{ num : 3 } ] );
  test.identical( got, -1 );

  test.description = 'equalizer 1 arg';

  var dst = [ { num : 1 },{ num : 2 },{ num : 3 } ];
  var onEqualize = function( a )
  {
    return a.num;
  }
  var got = _.__arrayPrependedOnce( dst, 4, onEqualize );
  test.identical( dst, [ 4,{ num : 1 },{ num : 2 },{ num : 3 } ] );
  test.identical( got, 0 );

  var dst = [ { num : 1 },{ num : 2 },{ num : 3 } ];
  var onEqualize = function( a )
  {
    return a.num;
  }
  var got = _.__arrayPrependedOnce( dst, 1, onEqualize );
  test.identical( dst, [ { num : 1 },{ num : 2 },{ num : 3 } ] );
  test.identical( got, -1 );

  //

  if( Config.debug )
  {
    test.description = 'no args';
    test.shouldThrowError( function()
    {
      _.__arrayPrependedOnce();
    })

    test.description = 'third is not a routine';
    test.shouldThrowError( function()
    {
      _.__arrayPrependedOnce( [], 1, 1 );
    })

    test.description = 'dst is not an array';
    test.shouldThrowError( function()
    {
      _.__arrayPrependedOnce( 1, 1 );
    })
  }
}

//

function __arrayPrependOnceStrictly( test )
{
  test.description = 'simple';

  var dst = [];
  var got = _.__arrayPrependOnceStrictly( dst , 1 );
  test.identical( got, [ 1 ] );
  test.identical( got, dst );

  var dst = [ 1 ];
  var got = _.__arrayPrependOnceStrictly( dst, 2 );
  test.identical( got, [ 2, 1 ] );
  test.identical( got, dst );

  var dst = [ 1 ];
  var got = _.__arrayPrependOnceStrictly( dst, '1' );
  test.identical( got, [ '1', 1 ] );
  test.identical( got, dst );

  var dst = [ 1 ];
  var got = _.__arrayPrependOnceStrictly( dst, -1 );
  test.identical( got, [ -1, 1 ] );
  test.identical( got, dst );

  var dst = [ 1 ];
  var got = _.__arrayPrependOnceStrictly( dst, [ 1 ] );
  test.identical( got, [ [ 1 ], 1 ] );

  test.description = 'equalizer 2 args';

  var dst = [ { num : 1 },{ num : 2 },{ num : 3 } ];
  var onEqualize = function( a, b )
  {
    return a.num === b.num;
  }
  var got = _.__arrayPrependOnceStrictly( dst, { num : 4 }, onEqualize );
  test.identical( got, [ { num : 4 },{ num : 1 },{ num : 2 },{ num : 3 } ] );
  test.identical( got, dst );

  test.description = 'equalizer 1 arg';

  var dst = [ { num : 1 },{ num : 2 },{ num : 3 } ];
  var onEqualize = function( a )
  {
    return a.num;
  }
  var got = _.__arrayPrependOnceStrictly( dst, 4, onEqualize );
  test.identical( got, [ 4,{ num : 1 },{ num : 2 },{ num : 3 } ] );
  test.identical( got, dst );

  //

  if( Config.debug )
  {
    test.description = 'no args';
    test.shouldThrowError( function()
    {
      _.__arrayPrependOnceStrictly();
    })

    test.description = 'dst is not an array';
    test.shouldThrowError( function()
    {
      _.__arrayPrependOnceStrictly( 1, 1 );
    })

    test.description = 'ins already exists ion dst';

    test.shouldThrowError( function()
    {
      _.__arrayPrependOnceStrictly( [ 1 ], 1 );
    });

    test.shouldThrowError( function()
    {
       _.__arrayPrependOnceStrictly( [ 1,2,3 ], 3 );
    });

    test.description = 'onEqualize is not a routine';

    test.shouldThrowError( function()
    {
       _.__arrayPrependOnceStrictly( [ 1,2,3 ], 3, 3 );
    });

    test.shouldThrowError( function()
    {
      var dst = [ { num : 1 },{ num : 2 },{ num : 3 } ];
      var onEqualize = function( a, b )
      {
        return a.num === b.num;
      }
      _.__arrayPrependOnceStrictly( dst, { num : 1 }, onEqualize );
    });

    test.shouldThrowError( function()
    {
      var dst = [ { num : 1 },{ num : 2 },{ num : 3 } ];
      var onEqualize = function( a )
      {
        return a.num;
      }
      _.__arrayPrependOnceStrictly( dst, 1, onEqualize );
    });
  }
}

//

function __arrayPrependArray( test )
{

  test.description = 'nothing';
  var got = _.__arrayPrependArray( [], [] );
  var expected = [  ];
  test.identical( got, expected );

  test.description = 'simple';
  var dst = [];
  var got = _.__arrayPrependArray( dst, [ 1, 2, 3 ] );
  test.identical( dst, [ 1, 2, 3 ] );
  test.identical( got, dst );

  var dst = [ 1, 2, 3 ];
  var got = _.__arrayPrependArray( dst,[ 4, 5 ] );
  test.identical( dst, [ 4, 5, 1, 2, 3 ] );
  test.identical( got, dst );

  var dst = [ 1, 1, 1 ];
  var got = _.__arrayPrependArray( dst, [ 1, 1 ] );
  test.identical( dst, [ 1, 1, 1, 1, 1 ] );
  test.identical( got, dst );

  test.description = 'mixed arguments types';
  var dst = [ 1 ];
  var got = _.__arrayPrependArray( dst, [ 'a', 1, [ { a : 1 } ], { b : 2 } ] );
  test.identical( dst, [  'a', 1, [ { a : 1 } ], { b : 2 }, 1  ] );
  test.identical( got, dst );

  test.description = 'argument is undefined';
  var dst = [ 1 ];
  test.shouldThrowError( function ()
  {
    _.__arrayPrependArray( dst, undefined );
  });
  test.identical( dst, [ 1 ] );

  test.description = 'array has undefined';
  var dst = [ 1 ];
  var got;
  test.mustNotThrowError( function ()
  {
    got = _.__arrayPrependArray( dst, [ undefined, 2 ] );
  });
  test.identical( dst, [ undefined, 2, 1 ] );
  test.identical( got, dst );

  /**/

  if( Config.debug )
  {

    test.description = 'no arguments';
    test.shouldThrowError( function()
    {
      _.__arrayPrependArray();
    });

    test.description = 'too many args';
    test.shouldThrowError( function()
    {
      _.__arrayPrependArray( [ 1, 2 ],[ 1 ], [ 2 ] );
    });

    test.description = 'second args is not arrayLike';
    test.shouldThrowError( function()
    {
      _.__arrayPrependArray( [ 1, 2 ], 2 );
    });
  }
};

//

function __arrayPrependedArray( test )
{
  test.description = 'nothing';

  var dst = [];
  var got = _.__arrayPrependedArray( dst, [] );
  test.identical( dst, [] );
  test.identical( got, 0 );

  test.description = 'simple';

  var dst = [];
  var got = _.__arrayPrependedArray( dst, [ 1, 2, 3 ] );
  test.identical( dst, [ 1, 2, 3 ] );
  test.identical( got, 3 );

  test.description = 'prepends only unique elements';

  var dst = [ 1,2,3 ];
  var got = _.__arrayPrependedArray( dst, [ 2, 4, 5 ] );
  test.identical( dst, [ 2, 4, 5, 1, 2, 3 ] );
  test.identical( got, 3 );

  var dst = [ 1, 1, 1 ];
  var got = _.__arrayPrependedArray( dst, [ 1 ] );
  test.identical( dst, [ 1, 1, 1, 1 ] );
  test.identical( got, 1 );

  test.description = 'mixed arguments types';
  var dst = [ 1 ];
  var got = _.__arrayPrependedArray( dst, [ 'a', 1, [ { a : 1 } ], { b : 2 } ] );
  test.identical( dst, [ 'a', 1, [ { a : 1 } ], { b : 2 }, 1  ] );
  test.identical( got, 4 );

  test.description = 'argument is undefined';
  var dst = [ 1 ];
  test.shouldThrowError( function ()
  {
    _.__arrayPrependedArray( dst, undefined );
  });
  test.identical( dst, [ 1 ] );

  test.description = 'array has undefined';
  var dst = [ 1 ];
  test.mustNotThrowError( function ()
  {
    _.__arrayPrependedArray( dst, [ undefined, 2 ] );
  });
  test.identical( dst, [ undefined, 2, 1 ] );

  /**/

  if( Config.debug )
  {

    test.description = 'no arguments';
    test.shouldThrowError( function()
    {
      _.__arrayPrependedArray();
    });

    test.description = 'too many args';
    test.shouldThrowError( function()
    {
      _.__arrayPrependedArray( [ 1, 2 ],[ 1 ], [ 2 ] );
    });

    test.description = 'second args is not arrayLike';
    test.shouldThrowError( function()
    {
      _.__arrayPrependedArray( [ 1, 2 ], 2 );
    });
  }

}

//

function __arrayPrependArrayOnce( test )
{
  test.description = 'nothing';

  var got = _.__arrayPrependArrayOnce( [], [] );
  var expected = [];
  test.identical( got, expected );

  test.description = 'simple';

  var dst = [];
  var got = _.__arrayPrependArrayOnce( dst, [ 1, 2, 3 ] );
  test.identical( dst, [ 1, 2, 3 ] );
  test.identical( got, dst );

  test.description = 'prepends only unique elements';

  var dst = [ 1,2,3 ];
  var got = _.__arrayPrependArrayOnce( dst, [ 2, 4, 5 ] );
  test.identical( dst, [ 4, 5, 1, 2, 3 ] );
  test.identical( got, dst );

  var dst = [ 1, 1, 1 ];
  var got = _.__arrayPrependArrayOnce( dst, [ 1 ] );
  test.identical( dst, [ 1, 1, 1 ] );
  test.identical( got, dst );

  test.description = 'mixed arguments types';
  var dst = [ 1 ];
  var got = _.__arrayPrependArrayOnce( dst, [ 'a', 1, [ { a : 1 } ], { b : 2 } ] );
  test.identical( dst, [ 'a', [ { a : 1 } ], { b : 2 }, 1  ] );
  test.identical( got, dst );

  test.description = 'argument is undefined';
  var dst = [ 1 ];
  test.shouldThrowError( function ()
  {
    _.__arrayPrependArrayOnce( dst, undefined );
  });
  test.identical( dst, [ 1 ] );

  test.description = 'array has undefined';
  var dst = [ 1 ];
  test.mustNotThrowError( function ()
  {
    _.__arrayPrependArrayOnce( dst, [ undefined, 2 ] );
  });
  test.identical( dst, [ undefined, 2, 1 ] );

  /**/

  if( Config.debug )
  {

    test.description = 'no arguments';
    test.shouldThrowError( function()
    {
      _.__arrayPrependArrayOnce();
    });

    test.description = 'too many args';
    test.shouldThrowError( function()
    {
      _.__arrayPrependArrayOnce( [ 1, 2 ],[ 1 ], [ 2 ] );
    });

    test.description = 'second args is not arrayLike';
    test.shouldThrowError( function()
    {
      _.__arrayPrependArrayOnce( [ 1, 2 ], 2 );
    });

    test.description = 'onEqualize is not a routine';
    test.shouldThrowError( function()
    {
      _.__arrayPrependArrayOnce( [ 1, 2 ], [ 2 ], 3 );
    });
  }

}

//

function __arrayPrependedArrayOnce( test )
{
  test.description = 'nothing';

  var dst = [];
  var got = _.__arrayPrependedArrayOnce( dst, [] );
  test.identical( dst, [] );
  test.identical( got, 0 );

  test.description = 'simple';

  var dst = [];
  var got = _.__arrayPrependedArrayOnce( dst, [ 1, 2, 3 ] );
  test.identical( dst, [ 1, 2, 3 ] );
  test.identical( got, 3 );

  test.description = 'prepends only unique elements';

  var dst = [ 1,2,3 ];
  var got = _.__arrayPrependedArrayOnce( dst, [ 2, 4, 5 ] );
  test.identical( dst, [ 4, 5, 1, 2, 3 ] );
  test.identical( got, 2 );

  var dst = [ 1, 1, 1 ];
  var got = _.__arrayPrependedArrayOnce( dst, [ 1 ] );
  test.identical( dst, [ 1, 1, 1 ] );
  test.identical( got, 0 );

  test.description = 'mixed arguments types';
  var dst = [ 1 ];
  var got = _.__arrayPrependedArrayOnce( dst, [ 'a', 1, [ { a : 1 } ], { b : 2 } ] );
  test.identical( dst, [ 'a', [ { a : 1 } ], { b : 2 }, 1  ] );
  test.identical( got, 3 );

  test.description = 'argument is undefined';
  var dst = [ 1 ];
  test.shouldThrowError( function ()
  {
    _.__arrayPrependedArrayOnce( dst, undefined );
  });
  test.identical( dst, [ 1 ] );

  test.description = 'array has undefined';
  var dst = [ 1 ];
  test.mustNotThrowError( function ()
  {
    _.__arrayPrependedArrayOnce( dst, [ undefined, 2 ] );
  });
  test.identical( dst, [ undefined, 2, 1 ] );

  /**/

  if( Config.debug )
  {

    test.description = 'no arguments';
    test.shouldThrowError( function()
    {
      _.__arrayPrependedArrayOnce();
    });

    test.description = 'too many args';
    test.shouldThrowError( function()
    {
      _.__arrayPrependedArrayOnce( [ 1, 2 ],[ 1 ], [ 2 ] );
    });

    test.description = 'second args is not arrayLike';
    test.shouldThrowError( function()
    {
      _.__arrayPrependedArrayOnce( [ 1, 2 ], 2 );
    });

    test.description = 'onEqualize is not a routine';
    test.shouldThrowError( function()
    {
      _.__arrayPrependedArrayOnce( [ 1, 2 ], [ 2 ], 3 );
    });
  }

}

//

function __arrayPrependArrayOnceStrictly( test )
{
  test.description = 'nothing';

  var got = _.__arrayPrependArrayOnceStrictly( [], [] );
  var expected = [];
  test.identical( got, expected );

  test.description = 'simple';

  var dst = [];
  var got = _.__arrayPrependArrayOnceStrictly( dst, [ 1, 2, 3 ] );
  test.identical( dst, [ 1, 2, 3 ] );
  test.identical( got, dst );

  var dst = [ 1, 2, 3 ];
  var got = _.__arrayPrependArrayOnceStrictly( dst, [ 4, 5 ] );
  test.identical( dst, [ 4, 5, 1, 2, 3 ] );
  test.identical( got, dst );

  test.description = 'argument is undefined';
  var dst = [ 1 ];
  test.shouldThrowError( function ()
  {
    _.__arrayPrependArrayOnceStrictly( dst, undefined );
  });
  test.identical( dst, [ 1 ] );

  test.description = 'array has undefined';
  var dst = [ 1 ];
  test.mustNotThrowError( function ()
  {
    _.__arrayPrependArrayOnceStrictly( dst, [ undefined, 2 ] );
  });
  test.identical( dst, [ undefined, 2, 1 ] );

  /**/

  if( Config.debug )
  {

    test.description = 'no arguments';
    test.shouldThrowError( function()
    {
      _.__arrayPrependArrayOnceStrictly();
    });

    test.description = 'too many args';
    test.shouldThrowError( function()
    {
      _.__arrayPrependArrayOnceStrictly( [ 1, 2 ],[ 1 ], [ 2 ] );
    });

    test.description = 'second args is not arrayLike';
    test.shouldThrowError( function()
    {
      _.__arrayPrependArrayOnceStrictly( [ 1, 2 ], 2 );
    });

    test.description = 'one of elements is not unique';

    var dst = [ 1,2,3 ];
    test.shouldThrowError( function ()
    {
      _.__arrayPrependArrayOnceStrictly( dst, [ 4, 5, 2 ] );
    })
    test.identical( dst, [ 4, 5, 1, 2, 3 ] );

    var dst = [ 1, 1, 1 ];
    test.shouldThrowError( function ()
    {
      _.__arrayPrependArrayOnceStrictly( dst, [ 1 ] );
    })
    test.identical( dst, [ 1, 1, 1 ] );

    test.description = 'onEqualize is not a routine';
    test.shouldThrowError( function()
    {
      _.__arrayPrependArrayOnceStrictly( [ 1, 2 ], [ 2 ], 3 );
    });
  }

}

//__arrayPrepend*Arrays*

function __arrayPrependArrays( test )
{

  test.description = 'nothing';
  var got = _.__arrayPrependArrays( [], [] );
  var expected = [  ];
  test.identical( got, expected );

  test.description = 'simple';
  var dst = [];
  var got = _.__arrayPrependArrays( dst, [ 1, 2, 3 ] );
  test.identical( dst, [ 1, 2, 3 ] );
  test.identical( got, dst );

  var dst = [ 1, 2, 3 ];
  var got = _.__arrayPrependArrays( dst,[ 4, 5 ] );
  test.identical( dst, [ 4, 5, 1, 2, 3 ] );
  test.identical( got, dst );

  var dst = [ 1, 1, 1 ];
  var got = _.__arrayPrependArrays( dst, [ 1, 1 ] );
  test.identical( dst, [ 1, 1, 1, 1, 1 ] );
  test.identical( got, dst );

  var dst = [];
  var got = _.__arrayPrependArrays( dst, [ 1 ], [ 2 ], [ 3, [ 4, [ 5 ] ] ] );
  test.identical( dst, [ 1, 2, 3, 4, [ 5 ] ] );
  test.identical( got, dst );

  var dst = [];
  var got = _.__arrayPrependArrays( dst, 1, 2, 3 );
  test.identical( dst, [ 1, 2, 3 ] );
  test.identical( got, dst );

  test.description = 'mixed arguments types';
  var dst = [ 1 ];
  var got = _.__arrayPrependArrays( dst, [ 'a', 1, [ { a : 1 } ], { b : 2 } ] );
  test.identical( dst, [  'a', 1, { a : 1 }, { b : 2 }, 1  ] );
  test.identical( got, dst );

  test.description = 'argument is undefined';
  var dst = [ 1 ];
  test.shouldThrowError( function ()
  {
    _.__arrayPrependArrays( dst, undefined );
  });
  test.identical( dst, [ 1 ] );

  test.description = 'array has undefined';
  var dst = [ 1 ];
  var got;
  test.mustNotThrowError( function ()
  {
    got = _.__arrayPrependArrays( dst, [ undefined, 2 ] );
  });
  test.identical( dst, [ undefined, 2, 1 ] );
  test.identical( got, dst );

  /**/

  if( Config.debug )
  {

    test.description = 'no arguments';
    test.shouldThrowError( function()
    {
      _.__arrayPrependArrays();
    });

    test.description = 'dst is not a array';
    test.shouldThrowError( function()
    {
      _.__arrayPrependArrays( 1, [ 2 ] );
    });

  }
};

//

function __arrayPrependedArrays( test )
{
  test.description = 'nothing';
  var dst = [];
  var got = _.__arrayPrependedArrays( dst, [] );
  var expected = [ ];
  test.identical( dst, expected );
  test.identical( got, 0 );

  test.description = 'simple';
  var dst = [];
  var got = _.__arrayPrependedArrays( dst, [ 1, 2, 3 ] );
  test.identical( dst, [ 1, 2, 3 ] );
  test.identical( got, 3 );

  var dst = [ 1, 2, 3 ];
  var got = _.__arrayPrependedArrays( dst,[ 4, 5 ] );
  test.identical( dst, [ 4, 5, 1, 2, 3 ] );
  test.identical( got, 2 );

  var dst = [ 1, 1, 1 ];
  var got = _.__arrayPrependedArrays( dst, [ 1, 1 ] );
  test.identical( dst, [ 1, 1, 1, 1, 1 ] );
  test.identical( got, 2 );

  var dst = [];
  var got = _.__arrayPrependedArrays( dst, [ 1 ], [ 2 ], [ 3, [ 4, [ 5 ] ] ] );
  test.identical( dst, [ 1, 2, 3, 4, [ 5 ] ] );
  test.identical( got, 5 );

  var dst = [];
  var got = _.__arrayPrependedArrays( dst, 1, 2, 3 );
  test.identical( dst, [ 1, 2, 3 ] );
  test.identical( got, 3 );

  test.description = 'mixed arguments types';
  var dst = [ 1 ];
  var got = _.__arrayPrependedArrays( dst, [ 'a', 1, [ { a : 1 } ], { b : 2 } ] );
  test.identical( dst, [  'a', 1, { a : 1 }, { b : 2 }, 1  ] );
  test.identical( got, 4 );

  test.description = 'argument is undefined';
  var dst = [ 1 ];
  test.shouldThrowError( function ()
  {
    _.__arrayPrependedArrays( dst, undefined );
  });
  test.identical( dst, [ 1 ] );

  test.description = 'array has undefined';
  var dst = [ 1 ];
  var got;
  test.mustNotThrowError( function ()
  {
    got = _.__arrayPrependedArrays( dst, [ undefined, 2 ] );
  });
  test.identical( dst, [ undefined, 2, 1 ] );
  test.identical( got, 2 );

  /**/

  if( Config.debug )
  {

    test.description = 'no arguments';
    test.shouldThrowError( function()
    {
      _.__arrayPrependedArrays();
    });

    test.description = 'dst is not a array';
    test.shouldThrowError( function()
    {
      _.__arrayPrependedArrays( 1, [ 2 ] );
    });

  }
}

//

function __arrayPrependArraysOnce( test )
{
  test.description = 'nothing';

  var got = _.__arrayPrependArraysOnce( [], [] );
  var expected = [];
  test.identical( got, expected );

  test.description = 'simple';

  var dst = [];
  var got = _.__arrayPrependArraysOnce( dst, [ 1, 2, 3 ] );
  test.identical( dst, [ 1, 2, 3 ] );
  test.identical( got, dst );

  test.description = 'prepends only unique elements';

  var dst = [ 1,2,3 ];
  var got = _.__arrayPrependArraysOnce( dst, [ 2, 4, 5 ] );
  test.identical( dst, [ 4, 5, 1, 2, 3 ] );
  test.identical( got, dst );

  var dst = [ 1, 1, 1 ];
  var got = _.__arrayPrependArraysOnce( dst, [ 1 ] );
  test.identical( dst, [ 1, 1, 1 ] );
  test.identical( got, dst );

  test.description = 'mixed arguments types';
  var dst = [ 1 ];
  var got = _.__arrayPrependArraysOnce( dst, [ 'a', 1, [ { a : 1 } ], { b : 2 } ] );
  test.identical( dst, [ 'a', { a : 1 }, { b : 2 }, 1  ] );
  test.identical( got, dst );

  var dst = [ 1, 2, 3, 5 ];
  var got = _.__arrayPrependArraysOnce( dst, [ 1 ], [ 2 ], [ 3, [ 4, [ 5 ] ] ] );
  test.identical( dst, [ 4, [ 5 ], 1, 2, 3, 5 ] );
  test.identical( got, dst );

  var dst = [ 1, 3 ];
  var got = _.__arrayPrependArraysOnce( dst, 1, 2, 3 );
  test.identical( got, [ 2, 1, 3 ] );
  test.identical( dst, got );

  test.description = 'onEqualize';

  var onEqualize = function onEqualize( a, b )
  {
    return a === b;
  }

  var o = { onEqualize : onEqualize };

  var dst = [ 1, 3 ];
  var got = _.__arrayPrependArraysOnce.apply( o,[ dst, 1, 2, 3 ] );
  test.identical( got, [ 2, 1, 3 ] );
  test.identical( dst, got );


  test.description = 'argument is undefined';
  var dst = [ 1 ];
  test.shouldThrowError( function ()
  {
    _.__arrayPrependArraysOnce( dst, undefined );
  });
  test.identical( dst, [ 1 ] );

  test.description = 'array has undefined';
  var dst = [ 1 ];
  test.mustNotThrowError( function ()
  {
    _.__arrayPrependArraysOnce( dst, [ undefined, 2 ] );
  });
  test.identical( dst, [ undefined, 2, 1 ] );

  /**/

  if( Config.debug )
  {

    test.description = 'no arguments';
    test.shouldThrowError( function()
    {
      _.__arrayPrependArraysOnce();
    });

    test.description = 'dst is not a array';
    test.shouldThrowError( function()
    {
      _.__arrayPrependArraysOnce( 1, [ 2 ] );
    });

    test.description = 'onEqualize is not a routine';
    test.shouldThrowError( function()
    {
      var o = { onEqualize : 1 };

      _.__arrayPrependArraysOnce.apply( o,[ [], 1, 2, 3 ] );
    });
  }

}

//

function __arrayPrependArraysOnceStrictly( test )
{
  test.description = 'nothing';

  var got = _.__arrayPrependArraysOnceStrictly( [], [] );
  var expected = [];
  test.identical( got, expected );

  test.description = 'simple';

  var dst = [];
  var got = _.__arrayPrependArraysOnceStrictly( dst, [ 1, 2, 3 ] );
  test.identical( dst, [ 1, 2, 3 ] );
  test.identical( got, dst );

  test.description = 'mixed arguments types';
  var dst = [ 1 ];
  var got = _.__arrayPrependArraysOnceStrictly( dst, [ 'a' ],[ { a : 1 } ], { b : 2 } );
  test.identical( dst, [ 'a', { a : 1 }, { b : 2 }, 1  ] );
  test.identical( got, dst );

  var dst = [ 0 ];
  var got = _.__arrayPrependArraysOnceStrictly( dst, [ 1 ], [ 2 ], [ 3, [ 4, [ 5 ] ] ] );
  test.identical( dst, [ 1, 2, 3, 4, [ 5 ], 0 ] );
  test.identical( got, dst );

  test.description = 'onEqualize';

  var onEqualize = function onEqualize( a, b )
  {
    return a === b;
  }

  var o = { onEqualize : onEqualize };

  var dst = [ 4,5 ];
  var got = _.__arrayPrependArraysOnceStrictly.apply( o,[ dst, 1, 2, 3 ] );
  test.identical( got, [ 1, 2, 3, 4, 5 ] );
  test.identical( dst, got );

  test.description = 'ins has existing element';

  test.description = 'array has undefined';
  var dst = [ 1 ];
  test.mustNotThrowError( function ()
  {
    _.__arrayPrependArraysOnceStrictly( dst, [ undefined, 2 ] );
  });
  test.identical( dst, [ undefined, 2, 1 ] );

  /**/

  if( Config.debug )
  {

    test.description = 'no arguments';
    test.shouldThrowError( function()
    {
      _.__arrayPrependArraysOnceStrictly();
    });

    test.description = 'dst is not a array';
    test.shouldThrowError( function()
    {
      _.__arrayPrependArraysOnceStrictly( 1, [ 2 ] );
    });

    test.description = 'onEqualize is not a routine';
    test.shouldThrowError( function()
    {
      var o = { onEqualize : 1 };

      _.__arrayPrependArraysOnceStrictly.apply( o,[ [], 1, 2, 3 ] );
    });

    var dst = [ 1, 2, 3 ];
    test.shouldThrowError( function ()
    {
      _.__arrayPrependArraysOnceStrictly( dst, [ 4, 2, 5 ] );
    })
    test.identical( dst, [ 4, 5, 1, 2, 3 ] )

    var dst = [ 1, 1, 1 ];
    test.shouldThrowError( function ()
    {
      _.__arrayPrependArraysOnceStrictly( dst, [ 1 ] );
    })
    test.identical( dst, [ 1, 1, 1 ] );

    test.description = 'argument is undefined';
    var dst = [ 1 ];
    test.shouldThrowError( function ()
    {
      _.__arrayPrependArraysOnceStrictly( dst, undefined );
    });
    test.identical( dst, [ 1 ] );
  }

}

//

function __arrayPrependedArraysOnce( test )
{
  test.description = 'nothing';

  var dst = [];
  var got = _.__arrayPrependedArraysOnce( dst, [] );
  var expected = [];
  test.identical( dst, expected );
  test.identical( got, 0 );

  test.description = 'simple';

  var dst = [];
  var got = _.__arrayPrependedArraysOnce( dst, [ 1, 2, 3 ] );
  test.identical( dst, [ 1, 2, 3 ] );
  test.identical( got, 3 );

  test.description = 'prepends only unique elements';

  var dst = [ 1,2,3 ];
  var got = _.__arrayPrependedArraysOnce( dst, [ 2, 4, 5 ] );
  test.identical( dst, [ 4, 5, 1, 2, 3 ] );
  test.identical( got, 2 );

  var dst = [ 1, 1, 1 ];
  var got = _.__arrayPrependedArraysOnce( dst, [ 1 ] );
  test.identical( dst, [ 1, 1, 1 ] );
  test.identical( got, 0 );

  test.description = 'mixed arguments types';
  var dst = [ 1 ];
  var got = _.__arrayPrependedArraysOnce( dst, [ 'a', 1, [ { a : 1 } ], { b : 2 } ] );
  test.identical( dst, [ 'a', { a : 1 }, { b : 2 }, 1  ] );
  test.identical( got, 3 );

  var dst = [ 1, 2, 3, 5 ];
  var got = _.__arrayPrependedArraysOnce( dst, [ 1 ], [ 2 ], [ 3, [ 4, [ 5 ] ] ] );
  test.identical( dst, [ 4, [ 5 ], 1, 2, 3, 5 ] );
  test.identical( got, 2 );

  var dst = [ 1, 3 ];
  var got = _.__arrayPrependedArraysOnce( dst, 1, 2, 3 );
  test.identical( dst, [ 2, 1, 3 ] );
  test.identical( got, 1 );

  test.description = 'onEqualize';

  var onEqualize = function onEqualize( a, b )
  {
    return a === b;
  }

  var o = { onEqualize : onEqualize };

  var dst = [ 1, 3 ];
  var got = _.__arrayPrependedArraysOnce.apply( o,[ dst, 1, 2, 3 ] );
  test.identical( dst, [ 2, 1, 3 ] );
  test.identical( got, 1 );


  test.description = 'argument is undefined';
  var dst = [ 1 ];
  test.shouldThrowError( function ()
  {
    _.__arrayPrependedArraysOnce( dst, undefined );
  });
  test.identical( dst, [ 1 ] );

  test.description = 'array has undefined';
  var dst = [ 1 ];
  test.mustNotThrowError( function ()
  {
    _.__arrayPrependedArraysOnce( dst, [ undefined, 2 ] );
  });
  test.identical( dst, [ undefined, 2, 1 ] );

  /**/

  if( Config.debug )
  {

    test.description = 'no arguments';
    test.shouldThrowError( function()
    {
      _.__arrayPrependedArraysOnce();
    });

    test.description = 'dst is not a array';
    test.shouldThrowError( function()
    {
      _.__arrayPrependedArraysOnce( 1, [ 2 ] );
    });

    test.description = 'onEqualize is not a routine';
    test.shouldThrowError( function()
    {
      var o = { onEqualize : 1 };

      _.__arrayPrependedArraysOnce.apply( o,[ [], 1, 2, 3 ] );
    });
  }

}

//

function __arrayAppendArray( test )
{

  test.description = 'nothing';
  var got = _.__arrayAppendArray( [  ] );
  var expected = [  ];
  test.identical( got, expected );

  test.description = 'an argument';
  var got = _.__arrayAppendArray( [ 1, 2, undefined ] );
  var expected = [ 1, 2, undefined ];
  test.identical( got, expected );

  test.description = 'an array';
  var got = _.__arrayAppendArray( [ 1, 2 ], 'str', false, { a : 1 }, 42, [ 3, 7, 13 ] );
  var expected = [ 1, 2, 'str', false, { a : 1 }, 42, 3, 7, 13 ];
  test.identical( got, expected );

  /**/

  if( Config.debug )
  {

    test.description = 'no arguments';
    test.shouldThrowError( function()
    {
      _.__arrayAppendArray();
    });

    test.description = 'arguments[0] is wrong, has to be an array';
    test.shouldThrowError( function()
    {
      _.__arrayAppendArray( 'wrong argument', 'str', false, { a : 1 }, 42, [ 3, 7, 13 ] );
    });

    test.description = 'arguments[1] is undefined';
    test.shouldThrowError( function()
    {
      _.__arrayAppendArray( [ 1, 2 ], undefined, false, { a : 1 }, 42, [ 3, 7, 13 ] );
    });

  }
};

//

function __arrayAppendedArray( test )
{
  test.description = 'nothing';

  var dst = [];
  var got = _.__arrayAppendedArray( dst, [] );
  test.identical( dst, [] );
  test.identical( got, 0 );

  test.description = 'simple';

  var dst = [];
  var got = _.__arrayAppendedArray( dst, [ 1, 2, 3 ] );
  test.identical( dst, [ 1, 2, 3 ] );
  test.identical( got, 3 );

  test.description = 'prepends only unique elements';

  var dst = [ 1,2,3 ];
  var got = _.__arrayAppendedArray( dst, [ 2, 4, 5 ] );
  test.identical( dst, [ 1, 2, 3, 2, 4, 5 ] );
  test.identical( got, 3 );

  var dst = [ 1, 1, 1 ];
  var got = _.__arrayAppendedArray( dst, [ 1 ] );
  test.identical( dst, [ 1, 1, 1, 1 ] );
  test.identical( got, 1 );

  test.description = 'mixed arguments types';
  var dst = [ 1 ];
  var got = _.__arrayAppendedArray( dst, [ 'a', 1, [ { a : 1 } ], { b : 2 } ] );
  test.identical( dst, [ 1, 'a', 1, [ { a : 1 } ], { b : 2 } ] );
  test.identical( got, 4 );

  test.description = 'argument is undefined';
  var dst = [ 1 ];
  test.shouldThrowError( function ()
  {
    _.__arrayAppendedArray( dst, undefined );
  });
  test.identical( dst, [ 1 ] );

  test.description = 'array has undefined';
  var dst = [ 1 ];
  test.mustNotThrowError( function ()
  {
    _.__arrayAppendedArray( dst, [ undefined, 2 ] );
  });
  test.identical( dst, [ 1,undefined, 2, ] );

  /**/

  if( Config.debug )
  {

    test.description = 'no arguments';
    test.shouldThrowError( function()
    {
      _.__arrayAppendedArray();
    });

    test.description = 'too many args';
    test.shouldThrowError( function()
    {
      _.__arrayAppendedArray( [ 1, 2 ],[ 1 ], [ 2 ] );
    });

    test.description = 'second args is not arrayLike';
    test.shouldThrowError( function()
    {
      _.__arrayAppendedArray( [ 1, 2 ], 2 );
    });
  }

}

//

// function _arrayAppendArrayOnce( test )
// {
//
//   test.description = 'nothing';
//   var got = _._arrayAppendArrayOnce( [  ] );
//   var expected = [  ];
//   test.identical( got, expected );
//
//   test.description = 'an argument';
//   var got = _._arrayAppendArrayOnce( [ 1, 2, undefined ] );
//   var expected = [ 1, 2, undefined ];
//   test.identical( got, expected );
//
//   test.description = 'an array';
//   var got = _._arrayAppendArrayOnce( [ 1, 2 ], 'str', 2, {}, [ 'str', 5 ] );
//   var expected = [ 1, 2, 'str', {}, 5 ];
//   test.identical( got, expected );
//
//   /**/
//
//   if( Config.debug )
//   {
//
//     test.description = 'no arguments';
//     test.shouldThrowError( function()
//     {
//       _._arrayAppendArrayOnce();
//     });
//
//     test.description = 'arguments[0] is wrong, has to be an array';
//     test.shouldThrowError( function()
//     {
//       _._arrayAppendArrayOnce( 'wrong argument', 'str', 2, {}, [ 'str', 5 ] );
//     });
//
//     test.description = 'arguments[3] is undefined';
//     test.shouldThrowError( function()
//     {
//       _._arrayAppendArrayOnce( [ 1, 2 ], 'str', 2, undefined, [ 'str', 5 ] );
//     });
//
//   }
//
// };

//

function __arrayAppend( test )
{
  test.description = 'simple';

  var got = _.__arrayAppend( [], 1 );
  test.identical( got, [ 1 ] );

  var got = _.__arrayAppend( [ 1 ], 1 );
  test.identical( got, [ 1, 1 ] );

  var got = _.__arrayAppend( [ 1 ], 2 );
  test.identical( got, [ 1,2 ] );

  var got = _.__arrayAppend( [ 1,2,3 ], 3 );
  test.identical( got, [ 1,2,3,3 ] );

  var got = _.__arrayAppend( [ 1 ], '1' );
  test.identical( got, [ 1, '1' ] );

  var got = _.__arrayAppend( [ 1 ], -1 );
  test.identical( got, [  1, -1 ] );

  var got = _.__arrayAppend( [ 1 ], [ 1 ] );
  test.identical( got, [  1,[ 1 ] ] );

  //

  if( Config.debug )
  {
    test.description = 'no args';
    test.shouldThrowError( function()
    {
      _.__arrayAppend();
    })

    test.description = 'too many args';
    test.shouldThrowError( function()
    {
      _.__arrayAppend( [], 1, 1 );
    })

    test.description = 'dst is not an array';
    test.shouldThrowError( function()
    {
      _.__arrayAppend( 1, 1 );
    })
  }
}

//

function __arrayAppended( test )
{
  test.description = 'simple';

  var dst = [];
  var got = _.__arrayAppended( dst, 1 );
  test.identical( dst, [ 1 ] );
  test.identical( got, 0 );

  var dst = [ 1 ];
  var got = _.__arrayAppended( dst, 1 );
  test.identical( dst, [ 1, 1 ] );
  test.identical( got, 1 );

  var dst = [ 1 ];
  var got = _.__arrayAppended( dst, 2 );
  test.identical( dst, [ 1, 2 ] );
  test.identical( got, 1 );

  var dst = [ 1,2,3 ];
  var got = _.__arrayAppended( dst, 3 );
  test.identical( dst, [ 1,2,3,3 ] );
  test.identical( got, 3 );

  var dst = [ 1 ];
  var got = _.__arrayAppended( dst, '1' );
  test.identical( dst, [ 1, '1' ] );
  test.identical( got, 1 );

  var dst = [ 1 ];
  var got = _.__arrayAppended( dst, -1 );
  test.identical( dst, [ 1, -1 ] );
  test.identical( got, 1 );

  var dst = [ 1 ];
  var got = _.__arrayAppended( dst, [ 1 ] );
  test.identical( dst, [ 1, [ 1 ] ] );
  test.identical( got, 1 );

  //

  if( Config.debug )
  {
    test.description = 'no args';
    test.shouldThrowError( function()
    {
      _.__arrayAppended();
    })

    test.description = 'too many args';
    test.shouldThrowError( function()
    {
      _.__arrayAppended( [], 1, 1 );
    })

    test.description = 'dst is not an array';
    test.shouldThrowError( function()
    {
      _.__arrayAppended( 1, 1 );
    })
  }
}

//

function __arrayAppendOnce( test )
{
  test.description = 'simple';

  var got = _.__arrayAppendOnce( [], 1 );
  test.identical( got, [ 1 ] );

  var got = _.__arrayAppendOnce( [ 1 ], 1 );
  test.identical( got, [ 1 ] );

  var got = _.__arrayAppendOnce( [ 1 ], 2 );
  test.identical( got, [ 1,2 ] );

  var got = _.__arrayAppendOnce( [ 1,2,3 ], 3 );
  test.identical( got, [ 1,2,3 ] );

  var got = _.__arrayAppendOnce( [ 1 ], '1' );
  test.identical( got, [ 1, '1' ] );

  var got = _.__arrayAppendOnce( [ 1 ], -1 );
  test.identical( got, [ 1, -1 ] );

  var got = _.__arrayAppendOnce( [ 1 ], [ 1 ] );
  test.identical( got, [ 1, [ 1 ] ] );

  test.description = 'equalizer 2 args';

  var dst = [ { num : 1 },{ num : 2 },{ num : 3 } ];
  var onEqualize = function( a, b )
  {
    return a.num === b.num;
  }
  var got = _.__arrayAppendOnce( dst, { num : 4 }, onEqualize );
  test.identical( got, [ { num : 1 },{ num : 2 },{ num : 3 },{ num : 4 } ] );

  var dst = [ { num : 1 },{ num : 2 },{ num : 3 } ];
  var onEqualize = function( a, b )
  {
    return a.num === b.num;
  }
  var got = _.__arrayAppendOnce( dst, { num : 1 }, onEqualize );
  test.identical( got, [ { num : 1 },{ num : 2 },{ num : 3 } ] );

  test.description = 'equalizer 1 arg';

  var dst = [ { num : 1 },{ num : 2 },{ num : 3 } ];
  var onEqualize = function( a )
  {
    return a.num;
  }
  var got = _.__arrayAppendOnce( dst, 4, onEqualize );
  test.identical( got, [ { num : 1 },{ num : 2 },{ num : 3 }, 4 ] );

  var dst = [ { num : 1 },{ num : 2 },{ num : 3 } ];
  var onEqualize = function( a )
  {
    return a.num;
  }
  var got = _.__arrayAppendOnce( dst, 1, onEqualize );
  test.identical( got, [ { num : 1 },{ num : 2 },{ num : 3 } ] );

  //

  if( Config.debug )
  {
    test.description = 'no args';
    test.shouldThrowError( function()
    {
      _.__arrayAppendOnce();
    })

    test.description = 'dst is not an array';
    test.shouldThrowError( function()
    {
      _.__arrayAppendOnce( 1, 1 );
    })

    test.description = 'onEqualize is not a function';
    test.shouldThrowError( function()
    {
      _.__arrayAppendOnce( 1, 1, 1 );
    })
  }
}

//

function __arrayAppendedOnce( test )
{
  test.description = 'simple';

  var dst = [];
  var got = _.__arrayAppendedOnce( dst, 1 );
  test.identical( dst, [ 1 ] );
  test.identical( got, 0 );

  var dst = [ 1 ];
  var got = _.__arrayAppendedOnce( dst, 1 );
  test.identical( dst, [ 1 ] );
  test.identical( got, -1 );

  var dst = [ 1 ];
  var got = _.__arrayAppendedOnce( dst, 2 );
  test.identical( dst, [ 1, 2 ] );
  test.identical( got, 1 );

  var dst = [ 1,2,3 ];
  var got = _.__arrayAppendedOnce( dst, 3 );
  test.identical( dst, [ 1,2,3 ] );
  test.identical( got, -1 );

  var dst = [ 1 ];
  var got = _.__arrayAppendedOnce( dst, '1' );
  test.identical( dst, [ 1,'1' ] );
  test.identical( got, 1 );

  var dst = [ 1 ];
  var got = _.__arrayAppendedOnce( dst, -1 );
  test.identical( dst, [ 1,-1 ] );
  test.identical( got, 1 );

  var dst = [ 1 ];
  var got = _.__arrayAppendedOnce( dst, [ 1 ] );
  test.identical( dst, [ 1,[ 1 ] ] );
  test.identical( got, 1 );

  test.description = 'equalizer 2 args';

  var dst = [ { num : 1 },{ num : 2 },{ num : 3 } ];
  var onEqualize = function( a, b )
  {
    return a.num === b.num;
  }
  var got = _.__arrayAppendedOnce( dst, { num : 4 }, onEqualize );
  test.identical( dst, [ { num : 1 },{ num : 2 },{ num : 3 },{ num : 4 } ] );
  test.identical( got, 3 );

  var dst = [ { num : 1 },{ num : 2 },{ num : 3 } ];
  var onEqualize = function( a, b )
  {
    return a.num === b.num;
  }
  var got = _.__arrayAppendedOnce( dst, { num : 1 }, onEqualize );
  test.identical( dst, [ { num : 1 },{ num : 2 },{ num : 3 } ] );
  test.identical( got, -1 );

  test.description = 'equalizer 1 arg';

  var dst = [ { num : 1 },{ num : 2 },{ num : 3 } ];
  var onEqualize = function( a )
  {
    return a.num;
  }
  var got = _.__arrayAppendedOnce( dst, 4, onEqualize );
  test.identical( dst, [ { num : 1 },{ num : 2 },{ num : 3 }, 4 ] );
  test.identical( got, 3 );

  var dst = [ { num : 1 },{ num : 2 },{ num : 3 } ];
  var onEqualize = function( a )
  {
    return a.num;
  }
  var got = _.__arrayAppendedOnce( dst, 1, onEqualize );
  test.identical( dst, [ { num : 1 },{ num : 2 },{ num : 3 } ] );
  test.identical( got, -1 );

  //

  if( Config.debug )
  {
    test.description = 'no args';
    test.shouldThrowError( function()
    {
      _.__arrayAppendedOnce();
    })

    test.description = 'third is not a routine';
    test.shouldThrowError( function()
    {
      _.__arrayAppendedOnce( [], 1, 1 );
    })

    test.description = 'dst is not an array';
    test.shouldThrowError( function()
    {
      _.__arrayAppendedOnce( 1, 1 );
    })

    test.description = 'onEqualize is not a function';
    test.shouldThrowError( function()
    {
      _.__arrayAppendedOnce( 1, 1, 1 );
    })
  }
}

//

function __arrayAppendOnceStrictly( test )
{
  test.description = 'simple';

  var dst = [];
  var got = _.__arrayAppendOnceStrictly( dst , 1 );
  test.identical( got, [ 1 ] );
  test.identical( got, dst );

  var dst = [ 1 ];
  var got = _.__arrayAppendOnceStrictly( dst, 2 );
  test.identical( got, [ 1,2 ] );
  test.identical( got, dst );

  var dst = [ 1 ];
  var got = _.__arrayAppendOnceStrictly( dst, '1' );
  test.identical( got, [ 1,'1' ] );
  test.identical( got, dst );

  var dst = [ 1 ];
  var got = _.__arrayAppendOnceStrictly( dst, -1 );
  test.identical( got, [ 1, -1 ] );
  test.identical( got, dst );

  var dst = [ 1 ];
  var got = _.__arrayAppendOnceStrictly( dst, [ 1 ] );
  test.identical( got, [ 1, [ 1 ] ] );

  test.description = 'equalizer 2 args';

  var dst = [ { num : 1 },{ num : 2 },{ num : 3 } ];
  var onEqualize = function( a, b )
  {
    return a.num === b.num;
  }
  var got = _.__arrayAppendOnceStrictly( dst,{ num : 4 }, onEqualize );
  test.identical( got, [ { num : 1 },{ num : 2 },{ num : 3 },{ num : 4 } ] );
  test.identical( got, dst );

  test.description = 'equalizer 1 arg';

  var dst = [ { num : 1 },{ num : 2 },{ num : 3 } ];
  var onEqualize = function( a )
  {
    return a.num;
  }
  var got = _.__arrayAppendOnceStrictly( dst, 4, onEqualize );
  test.identical( got, [ { num : 1 },{ num : 2 },{ num : 3 }, 4 ] );
  test.identical( got, dst );

  //

  if( Config.debug )
  {
    test.description = 'no args';
    test.shouldThrowError( function()
    {
      _.__arrayAppendOnceStrictly();
    })

    test.description = 'dst is not an array';
    test.shouldThrowError( function()
    {
      _.__arrayAppendOnceStrictly( 1, 1 );
    })

    test.description = 'ins already exists ion dst';

    test.shouldThrowError( function()
    {
      _.__arrayAppendOnceStrictly( [ 1 ], 1 );
    });

    test.shouldThrowError( function()
    {
       _.__arrayAppendOnceStrictly( [ 1,2,3 ], 3 );
    });

    test.description = 'onEqualize is not a routine';

    test.shouldThrowError( function()
    {
       _.__arrayAppendOnceStrictly( [ 1,2,3 ], 3, 3 );
    });

    test.shouldThrowError( function()
    {
      var dst = [ { num : 1 },{ num : 2 },{ num : 3 } ];
      var onEqualize = function( a, b )
      {
        return a.num === b.num;
      }
      _.__arrayAppendOnceStrictly( dst, { num : 1 }, onEqualize );
    });

    test.shouldThrowError( function()
    {
      var dst = [ { num : 1 },{ num : 2 },{ num : 3 } ];
      var onEqualize = function( a )
      {
        return a.num;
      }
      _.__arrayAppendOnceStrictly( dst, 1, onEqualize );
    });
  }
}

//

//

function __arrayAppendArray( test )
{

  test.description = 'nothing';
  var got = _.__arrayAppendArray( [], [] );
  var expected = [];
  test.identical( got, expected );

  test.description = 'simple';
  var dst = [];
  var got = _.__arrayAppendArray( dst, [ 1, 2, 3 ] );
  test.identical( dst, [ 1, 2, 3 ] );
  test.identical( got, dst );

  var dst = [ 1, 2, 3 ];
  var got = _.__arrayAppendArray( dst,[ 4, 5 ] );
  test.identical( dst, [ 1, 2, 3, 4, 5 ] );
  test.identical( got, dst );

  var dst = [ 1, 1, 1 ];
  var got = _.__arrayAppendArray( dst, [ 1, 1 ] );
  test.identical( dst, [ 1, 1, 1, 1, 1 ] );
  test.identical( got, dst );

  test.description = 'mixed arguments types';
  var dst = [ 1 ];
  var got = _.__arrayAppendArray( dst, [ 'a', 1, [ { a : 1 } ], { b : 2 } ] );
  test.identical( dst, [  1, 'a', 1, [ { a : 1 } ], { b : 2 } ] );
  test.identical( got, dst );

  test.description = 'argument is undefined';
  var dst = [ 1 ];
  test.shouldThrowError( function ()
  {
    _.__arrayAppendArray( dst, undefined );
  });
  test.identical( dst, [ 1 ] );

  test.description = 'array has undefined';
  var dst = [ 1 ];
  var got;
  test.mustNotThrowError( function ()
  {
    got = _.__arrayAppendArray( dst, [ undefined, 2 ] );
  });
  test.identical( dst, [ 1,undefined, 2 ] );
  test.identical( got, dst );

  /**/

  if( Config.debug )
  {

    test.description = 'no arguments';
    test.shouldThrowError( function()
    {
      _.__arrayAppendArray();
    });

    test.description = 'too many args';
    test.shouldThrowError( function()
    {
      _.__arrayAppendArray( [ 1, 2 ],[ 1 ], [ 2 ] );
    });

    test.description = 'second args is not arrayLike';
    test.shouldThrowError( function()
    {
      _.__arrayAppendArray( [ 1, 2 ], 2 );
    });
  }
};

//

function __arrayAppendArrayOnce( test )
{
  test.description = 'nothing';

  var got = _.__arrayAppendArrayOnce( [], [] );
  var expected = [];
  test.identical( got, expected );

  test.description = 'simple';

  var dst = [];
  var got = _.__arrayAppendArrayOnce( dst, [ 1, 2, 3 ] );
  test.identical( dst, [ 1, 2, 3 ] );
  test.identical( got, dst );

  test.description = 'appends only unique elements';

  var dst = [ 1,2,3 ];
  var got = _.__arrayAppendArrayOnce( dst, [ 2, 4, 5 ] );
  test.identical( dst, [ 1, 2, 3, 4, 5 ] );
  test.identical( got, dst );

  var dst = [ 1, 1, 1 ];
  var got = _.__arrayAppendArrayOnce( dst, [ 1 ] );
  test.identical( dst, [ 1, 1, 1 ] );
  test.identical( got, dst );

  test.description = 'mixed arguments types';
  var dst = [ 1 ];
  var got = _.__arrayAppendArrayOnce( dst, [ 'a', 1, [ { a : 1 } ], { b : 2 } ] );
  test.identical( dst, [ 1, 'a', [ { a : 1 } ], { b : 2 } ] );
  test.identical( got, dst );

  test.description = 'argument is undefined';
  var dst = [ 1 ];
  test.shouldThrowError( function ()
  {
    _.__arrayAppendArrayOnce( dst, undefined );
  });
  test.identical( dst, [ 1 ] );

  test.description = 'array has undefined';
  var dst = [ 1 ];
  test.mustNotThrowError( function ()
  {
    _.__arrayAppendArrayOnce( dst, [ undefined, 2 ] );
  });
  test.identical( dst, [ 1,undefined, 2 ] );

  /**/

  if( Config.debug )
  {

    test.description = 'no arguments';
    test.shouldThrowError( function()
    {
      _.__arrayAppendArrayOnce();
    });

    test.description = 'too many args';
    test.shouldThrowError( function()
    {
      _.__arrayAppendArrayOnce( [ 1, 2 ],[ 1 ], [ 2 ] );
    });

    test.description = 'second args is not arrayLike';
    test.shouldThrowError( function()
    {
      _.__arrayAppendArrayOnce( [ 1, 2 ], 2 );
    });

    test.description = 'onEqualize is not a routine';
    test.shouldThrowError( function()
    {
      _.__arrayAppendArrayOnce( [ 1, 2 ], [ 2 ], 3 );
    });
  }

}

//

function __arrayAppendedArrayOnce( test )
{
  test.description = 'nothing';

  var dst = [];
  var got = _.__arrayAppendedArrayOnce( dst, [] );
  test.identical( dst, [] );
  test.identical( got, 0 );

  test.description = 'simple';

  var dst = [];
  var got = _.__arrayAppendedArrayOnce( dst, [ 1, 2, 3 ] );
  test.identical( dst, [ 1, 2, 3 ] );
  test.identical( got, 3 );

  test.description = 'prepends only unique elements';

  var dst = [ 1,2,3 ];
  var got = _.__arrayAppendedArrayOnce( dst, [ 2, 4, 5 ] );
  test.identical( dst, [ 1, 2, 3, 4, 5 ] );
  test.identical( got, 2 );

  var dst = [ 1, 1, 1 ];
  var got = _.__arrayAppendedArrayOnce( dst, [ 1 ] );
  test.identical( dst, [ 1, 1, 1 ] );
  test.identical( got, 0 );

  test.description = 'mixed arguments types';
  var dst = [ 1 ];
  var got = _.__arrayAppendedArrayOnce( dst, [ 'a', 1, [ { a : 1 } ], { b : 2 } ] );
  test.identical( dst, [ 1, 'a', [ { a : 1 } ], { b : 2 } ] );
  test.identical( got, 3 );

  test.description = 'argument is undefined';
  var dst = [ 1 ];
  test.shouldThrowError( function ()
  {
    _.__arrayAppendedArrayOnce( dst, undefined );
  });
  test.identical( dst, [ 1 ] );

  test.description = 'array has undefined';
  var dst = [ 1 ];
  test.mustNotThrowError( function ()
  {
    _.__arrayAppendedArrayOnce( dst, [ undefined, 2 ] );
  });
  test.identical( dst, [ 1, undefined, 2 ] );

  /**/

  if( Config.debug )
  {

    test.description = 'no arguments';
    test.shouldThrowError( function()
    {
      _.__arrayAppendedArrayOnce();
    });

    test.description = 'too many args';
    test.shouldThrowError( function()
    {
      _.__arrayAppendedArrayOnce( [ 1, 2 ],[ 1 ], [ 2 ] );
    });

    test.description = 'second args is not arrayLike';
    test.shouldThrowError( function()
    {
      _.__arrayAppendedArrayOnce( [ 1, 2 ], 2 );
    });

    test.description = 'onEqualize is not a routine';
    test.shouldThrowError( function()
    {
      _.__arrayAppendedArrayOnce( [ 1, 2 ], [ 2 ], 3 );
    });
  }

}

//

function __arrayAppendArrayOnceStrictly( test )
{
  test.description = 'nothing';

  var got = _.__arrayAppendArrayOnceStrictly( [], [] );
  var expected = [];
  test.identical( got, expected );

  test.description = 'simple';

  var dst = [];
  var got = _.__arrayAppendArrayOnceStrictly( dst, [ 1, 2, 3 ] );
  test.identical( dst, [ 1, 2, 3 ] );
  test.identical( got, dst );

  var dst = [ 1, 2, 3 ];
  var got = _.__arrayAppendArrayOnceStrictly( dst, [ 4, 5 ] );
  test.identical( dst, [ 1, 2, 3, 4, 5 ] );
  test.identical( got, dst );

  test.description = 'argument is undefined';
  var dst = [ 1 ];
  test.shouldThrowError( function ()
  {
    _.__arrayAppendArrayOnceStrictly( dst, undefined );
  });
  test.identical( dst, [ 1 ] );

  test.description = 'array has undefined';
  var dst = [ 1 ];
  test.mustNotThrowError( function ()
  {
    _.__arrayAppendArrayOnceStrictly( dst, [ undefined, 2 ] );
  });
  test.identical( dst, [ 1, undefined, 2 ] );

  /**/

  if( Config.debug )
  {

    test.description = 'no arguments';
    test.shouldThrowError( function()
    {
      _.__arrayAppendArrayOnceStrictly();
    });

    test.description = 'too many args';
    test.shouldThrowError( function()
    {
      _.__arrayAppendArrayOnceStrictly( [ 1, 2 ],[ 1 ], [ 2 ] );
    });

    test.description = 'second args is not arrayLike';
    test.shouldThrowError( function()
    {
      _.__arrayAppendArrayOnceStrictly( [ 1, 2 ], 2 );
    });

    test.description = 'one of elements is not unique';

    var dst = [ 1,2,3 ];
    test.shouldThrowError( function ()
    {
      _.__arrayAppendArrayOnceStrictly( dst, [ 4, 5, 2 ] );
    })
    test.identical( dst, [ 1, 2, 3, 4, 5 ] );

    var dst = [ 1, 1, 1 ];
    test.shouldThrowError( function ()
    {
      _.__arrayAppendArrayOnceStrictly( dst, [ 1 ] );
    })
    test.identical( dst, [ 1, 1, 1 ] );

    test.description = 'onEqualize is not a routine';
    test.shouldThrowError( function()
    {
      _.__arrayAppendArrayOnceStrictly( [ 1, 2 ], [ 2 ], 3 );
    });
  }
}

//


function __arrayAppendArrays( test )
{

  test.description = 'nothing';
  var got = _.__arrayAppendArrays( [], [] );
  var expected = [  ];
  test.identical( got, expected );

  test.description = 'simple';
  var dst = [];
  var got = _.__arrayAppendArrays( dst, [ 1, 2, 3 ] );
  test.identical( dst, [ 1, 2, 3 ] );
  test.identical( got, dst );

  var dst = [ 1, 2, 3 ];
  var got = _.__arrayAppendArrays( dst,[ 4, 5 ] );
  test.identical( dst, [ 1, 2, 3, 4, 5 ] );
  test.identical( got, dst );

  var dst = [ 1, 1, 1 ];
  var got = _.__arrayAppendArrays( dst, [ 1, 1 ] );
  test.identical( dst, [ 1, 1, 1, 1, 1 ] );
  test.identical( got, dst );

  var dst = [ 1, 2, 3 ];
  var got = _.__arrayAppendArrays( dst, [ 1 ], [ 2 ], [ 3, [ 4, [ 5 ] ] ] );
  test.identical( dst, [ 1, 2, 3, 1, 2, 3, 4, [ 5 ] ] );
  test.identical( got, dst );

  test.description = 'arguments are not arrays';
  var dst = [];
  var got = _.__arrayAppendArrays( dst, 1, 2, 3 );
  test.identical( dst, [ 1, 2, 3 ] );
  test.identical( got, dst );

  test.description = 'mixed arguments types';
  var dst = [ 1 ];
  var got = _.__arrayAppendArrays( dst, [ 'a', 1, [ { a : 1 } ], { b : 2 } ] );
  test.identical( dst, [  1, 'a', 1, { a : 1 }, { b : 2 } ] );
  test.identical( got, dst );

  test.description = 'argument is undefined';
  var dst = [ 1 ];
  test.shouldThrowError( function ()
  {
    _.__arrayAppendArrays( dst, undefined );
  });
  test.identical( dst, [ 1 ] );

  test.description = 'array has undefined';
  var dst = [ 1 ];
  var got;
  test.mustNotThrowError( function ()
  {
    got = _.__arrayAppendArrays( dst, [ undefined, 2 ] );
  });
  test.identical( dst, [ 1, undefined, 2 ] );
  test.identical( got, dst );

  /**/

  if( Config.debug )
  {

    test.description = 'no arguments';
    test.shouldThrowError( function()
    {
      _.__arrayAppendArrays();
    });

    test.description = 'dst is not a array';
    test.shouldThrowError( function()
    {
      _.__arrayAppendArrays( 1, [ 2 ] );
    });

  }
};

//

function __arrayAppendedArrays( test )
{
  test.description = 'nothing';
  var dst = [];
  var got = _.__arrayAppendedArrays( dst, [] );
  var expected = [ ];
  test.identical( dst, expected );
  test.identical( got, 0 );

  test.description = 'simple';
  var dst = [];
  var got = _.__arrayAppendedArrays( dst, [ 1, 2, 3 ] );
  test.identical( dst, [ 1, 2, 3 ] );
  test.identical( got, 3 );

  var dst = [ 1, 2, 3 ];
  var got = _.__arrayAppendedArrays( dst,[ 4, 5 ] );
  test.identical( dst, [ 1, 2, 3, 4, 5 ] );
  test.identical( got, 2 );

  var dst = [ 1, 1, 1 ];
  var got = _.__arrayAppendedArrays( dst, [ 1, 1 ] );
  test.identical( dst, [ 1, 1, 1, 1, 1 ] );
  test.identical( got, 2 );

  var dst = [ 1, 2, 3 ];
  var got = _.__arrayAppendedArrays( dst, [ 1 ], [ 2 ], [ 3, [ 4, [ 5 ] ] ] );
  test.identical( dst, [ 1, 2, 3, 1, 2, 3, 4, [ 5 ] ] );
  test.identical( got, 5 );

  test.description = 'arguments are not arrays';
  var dst = [];
  var got = _.__arrayAppendedArrays( dst, 1, 2, 3 );
  test.identical( dst, [ 1, 2, 3 ] );
  test.identical( got, 3 );

  test.description = 'mixed arguments types';
  var dst = [ 1 ];
  var got = _.__arrayAppendedArrays( dst, [ 'a', 1, [ { a : 1 } ], { b : 2 } ] );
  test.identical( dst, [  1, 'a', 1, { a : 1 }, { b : 2 } ] );
  test.identical( got, 4 );

  test.description = 'array has undefined';
  var dst = [ 1 ];
  var got;
  test.mustNotThrowError( function ()
  {
    got = _.__arrayAppendedArrays( dst, [ undefined, 2 ] );
  });
  test.identical( dst, [ 1, undefined, 2 ] );
  test.identical( got, 2 );

  /**/

  if( Config.debug )
  {

    test.description = 'no arguments';
    test.shouldThrowError( function()
    {
      _.__arrayAppendedArrays();
    });

    test.description = 'dst is not a array';
    test.shouldThrowError( function()
    {
      _.__arrayAppendedArrays( 1, [ 2 ] );
    });

    test.description = 'argument is undefined';
    var dst = [ 1 ];
    test.shouldThrowError( function ()
    {
      _.__arrayAppendedArrays( dst, undefined );
    });
    test.identical( dst, [ 1 ] );

  }
}

//

function __arrayAppendArraysOnce( test )
{
  test.description = 'nothing';

  var got = _.__arrayAppendArraysOnce( [], [] );
  var expected = [];
  test.identical( got, expected );

  test.description = 'simple';

  var dst = [];
  var got = _.__arrayAppendArraysOnce( dst, [ 1, 2, 3 ] );
  test.identical( dst, [ 1, 2, 3 ] );
  test.identical( got, dst );

  test.description = 'prepends only unique elements';

  var dst = [ 1,2,3 ];
  var got = _.__arrayAppendArraysOnce( dst, [ 2, 4, 5 ] );
  test.identical( dst, [ 1, 2, 3, 4, 5 ] );
  test.identical( got, dst );

  var dst = [ 1, 1, 1 ];
  var got = _.__arrayAppendArraysOnce( dst, [ 1 ] );
  test.identical( dst, [ 1, 1, 1 ] );
  test.identical( got, dst );

  test.description = 'mixed arguments types';
  var dst = [ 1 ];
  var got = _.__arrayAppendArraysOnce( dst, [ 'a', 1, [ { a : 1 } ], { b : 2 } ] );
  test.identical( dst, [ 1, 'a', { a : 1 }, { b : 2 } ] );
  test.identical( got, dst );

  var dst = [ 1, 2, 3, 5 ];
  var got = _.__arrayAppendArraysOnce( dst, [ 1 ], [ 2 ], [ 3, [ 4, [ 5 ] ] ] );
  test.identical( dst, [ 1, 2, 3, 5, 4, [ 5 ] ] );
  test.identical( got, dst );

  var dst = [ 1, 3 ];
  var got = _.__arrayAppendArraysOnce( dst, 1, 2, 3 );
  test.identical( got, [ 1, 3, 2 ] );
  test.identical( dst, got );

  test.description = 'onEqualize';

  var onEqualize = function onEqualize( a, b )
  {
    return a === b;
  }

  var o = { onEqualize : onEqualize };

  var dst = [ 1, 3 ];
  var got = _.__arrayAppendArraysOnce.apply( o,[ dst, 1, 2, 3 ] );
  test.identical( got, [ 1, 3, 2 ] );
  test.identical( dst, got );

  test.description = 'array has undefined';
  var dst = [ 1 ];
  test.mustNotThrowError( function ()
  {
    _.__arrayAppendArraysOnce( dst, [ undefined, 2 ] );
  });
  test.identical( dst, [ 1, undefined, 2 ] );

  /**/

  if( Config.debug )
  {

    test.description = 'no arguments';
    test.shouldThrowError( function()
    {
      _.__arrayAppendArraysOnce();
    });

    test.description = 'dst is not a array';
    test.shouldThrowError( function()
    {
      _.__arrayAppendArraysOnce( 1, [ 2 ] );
    });

    test.description = 'onEqualize is not a routine';
    test.shouldThrowError( function()
    {
      var o = { onEqualize : 1 };

      _.__arrayAppendArraysOnce.apply( o,[ [], 1, 2, 3 ] );
    });

    test.description = 'argument is undefined';
    var dst = [ 1 ];
    test.shouldThrowError( function ()
    {
      _.__arrayAppendArraysOnce( dst, undefined );
    });
    test.identical( dst, [ 1 ] );
  }

}

//

function __arrayAppendArraysOnceStrictly( test )
{
  test.description = 'nothing';

  var got = _.__arrayAppendArraysOnceStrictly( [], [] );
  var expected = [];
  test.identical( got, expected );

  test.description = 'simple';

  var dst = [];
  var got = _.__arrayAppendArraysOnceStrictly( dst, [ 1, 2, 3 ] );
  test.identical( dst, [ 1, 2, 3 ] );
  test.identical( got, dst );

  test.description = 'mixed arguments types';
  var dst = [ 1 ];
  var got = _.__arrayAppendArraysOnceStrictly( dst, [ 'a' ],[ { a : 1 } ], { b : 2 } );
  test.identical( dst, [ 1, 'a', { a : 1 }, { b : 2 } ] );
  test.identical( got, dst );

  var dst = [ 0 ];
  var got = _.__arrayAppendArraysOnceStrictly( dst, [ 1 ], [ 2 ], [ 3, [ 4, [ 5 ] ] ] );
  test.identical( dst, [ 0, 1, 2, 3, 4, [ 5 ] ] );
  test.identical( got, dst );

  test.description = 'onEqualize';

  var onEqualize = function onEqualize( a, b )
  {
    return a === b;
  }

  var o = { onEqualize : onEqualize };

  var dst = [ 4,5 ];
  var got = _.__arrayAppendArraysOnceStrictly.apply( o,[ dst, 1, 2, 3 ] );
  test.identical( got, [ 4, 5, 1, 2, 3 ] );
  test.identical( dst, got );

  test.description = 'ins has existing element';

  test.description = 'array has undefined';
  var dst = [ 1 ];
  test.mustNotThrowError( function ()
  {
    _.__arrayAppendArraysOnceStrictly( dst, [ undefined, 2 ] );
  });
  test.identical( dst, [ 1, undefined, 2 ] );

  /**/

  if( Config.debug )
  {

    test.description = 'no arguments';
    test.shouldThrowError( function()
    {
      _.__arrayAppendArraysOnceStrictly();
    });

    test.description = 'dst is not a array';
    test.shouldThrowError( function()
    {
      _.__arrayAppendArraysOnceStrictly( 1, [ 2 ] );
    });

    test.description = 'onEqualize is not a routine';
    test.shouldThrowError( function()
    {
      var o = { onEqualize : 1 };

      _.__arrayAppendArraysOnceStrictly.apply( o,[ [], 1, 2, 3 ] );
    });

    var dst = [ 1, 2, 3 ];
    test.shouldThrowError( function ()
    {
      _.__arrayAppendArraysOnceStrictly( dst, [ 4, 2, 5 ] );
    })
    test.identical( dst, [ 1, 2, 3, 4, 5 ] )

    var dst = [ 1, 1, 1 ];
    test.shouldThrowError( function ()
    {
      _.__arrayAppendArraysOnceStrictly( dst, [ 1 ] );
    })
    test.identical( dst, [ 1, 1, 1 ] );

    test.description = 'argument is undefined';
    var dst = [ 1 ];
    test.shouldThrowError( function ()
    {
      _.__arrayAppendArraysOnceStrictly( dst, undefined );
    });
    test.identical( dst, [ 1 ] );
  }

}

//

function __arrayAppendedArraysOnce( test )
{
  test.description = 'nothing';

  var dst = [];
  var got = _.__arrayAppendedArraysOnce( dst, [] );
  var expected = [];
  test.identical( dst, expected );
  test.identical( got, 0 );

  test.description = 'simple';

  var dst = [];
  var got = _.__arrayAppendedArraysOnce( dst, [ 1, 2, 3 ] );
  test.identical( dst, [ 1, 2, 3 ] );
  test.identical( got, 3 );

  test.description = 'prepends only unique elements';

  var dst = [ 1,2,3 ];
  var got = _.__arrayAppendedArraysOnce( dst, [ 2, 4, 5 ] );
  test.identical( dst, [ 1, 2, 3, 4, 5 ] );
  test.identical( got, 2 );

  var dst = [ 1, 1, 1 ];
  var got = _.__arrayAppendedArraysOnce( dst, [ 1 ] );
  test.identical( dst, [ 1, 1, 1 ] );
  test.identical( got, 0 );

  test.description = 'mixed arguments types';
  var dst = [ 1 ];
  var got = _.__arrayAppendedArraysOnce( dst, [ 'a', 1, [ { a : 1 } ], { b : 2 } ] );
  test.identical( dst, [  1, 'a', { a : 1 }, { b : 2 } ] );
  test.identical( got, 3 );

  var dst = [ 1, 2, 3, 5 ];
  var got = _.__arrayAppendedArraysOnce( dst, [ 1 ], [ 2 ], [ 3, [ 4, [ 5 ] ] ] );
  test.identical( dst, [ 1, 2, 3, 5, 4, [ 5 ] ] );
  test.identical( got, 2 );

  var dst = [ 1, 3 ];
  var got = _.__arrayAppendedArraysOnce( dst, 1, 2, 3 );
  test.identical( dst, [ 1, 3, 2 ] );
  test.identical( got, 1 );

  test.description = 'onEqualize';

  var onEqualize = function onEqualize( a, b )
  {
    return a === b;
  }

  var o = { onEqualize : onEqualize };

  var dst = [ 1, 3 ];
  var got = _.__arrayAppendedArraysOnce.apply( o,[ dst, 1, 2, 3 ] );
  test.identical( dst, [ 1, 3, 2 ] );
  test.identical( got, 1 );

  test.description = 'array has undefined';
  var dst = [ 1 ];
  test.mustNotThrowError( function ()
  {
    _.__arrayAppendedArraysOnce( dst, [ undefined, 2 ] );
  });
  test.identical( dst, [ 1, undefined, 2 ] );

  /**/

  if( Config.debug )
  {

    test.description = 'no arguments';
    test.shouldThrowError( function()
    {
      _.__arrayAppendedArraysOnce();
    });

    test.description = 'dst is not a array';
    test.shouldThrowError( function()
    {
      _.__arrayAppendedArraysOnce( 1, [ 2 ] );
    });

    test.description = 'onEqualize is not a routine';
    test.shouldThrowError( function()
    {
      var o = { onEqualize : 1 };

      _.__arrayAppendedArraysOnce.apply( o,[ [], 1, 2, 3 ] );
    });

    test.description = 'argument is undefined';
    var dst = [ 1 ];
    test.shouldThrowError( function ()
    {
      _.__arrayAppendedArraysOnce( dst, undefined );
    });
    test.identical( dst, [ 1 ] );
  }

}

//

function __arrayRemove( test )
{
  test.description = 'simple';

  var got = _.__arrayRemove( [], 1 );
  test.identical( got, [] );

  var got = _.__arrayRemove( [ 1 ], 1 );
  test.identical( got, [ ] );

  var got = _.__arrayRemove( [ 1,2,2,2 ], 2 );
  test.identical( got, [ 1 ] );

  var got = _.__arrayRemove( [ 1 ], '1' );
  test.identical( got, [ 1 ] );

  var got = _.__arrayRemove( [ 1 ], -1 );
  test.identical( got, [ 1 ] );

  var got = _.__arrayRemove( [ 1 ], [ 1 ] );
  test.identical( got, [ 1 ] );

  //

  if( Config.debug )
  {
    test.description = 'no args';
    test.shouldThrowError( function()
    {
      _.__arrayRemove();
    })

    test.description = 'too many args';
    test.shouldThrowError( function()
    {
      _.__arrayRemove( [], 1, 1 );
    })

    test.description = 'dst is not an array';
    test.shouldThrowError( function()
    {
      _.__arrayRemove( 1, 1 );
    })
  }
}

//

function __arrayRemoved( test )
{
  test.description = 'simple';

  var dst = [];
  var got = _.__arrayRemoved( dst, 1 );
  test.identical( dst, [] );
  test.identical( got, 0 );

  var dst = [ 1 ];
  var got = _.__arrayRemoved( dst, 1 );
  test.identical( dst, [] );
  test.identical( got, 1 );

  var dst = [ 1,2,2 ];
  var got = _.__arrayRemoved( dst, 2 );
  test.identical( dst, [ 1 ] );
  test.identical( got, 2 );

  var dst = [ 1 ];
  var got = _.__arrayRemoved( dst, '1' );
  test.identical( dst, [ 1 ] );
  test.identical( got, 0 );

  var dst = [ 1 ];
  var got = _.__arrayRemoved( dst, -1 );
  test.identical( dst, [ 1 ] );
  test.identical( got, 0 );

  var dst = [ 1 ];
  var got = _.__arrayRemoved( dst, [ 1 ] );
  test.identical( dst, [ 1 ] );
  test.identical( got, 0 );

  //

  if( Config.debug )
  {
    test.description = 'no args';
    test.shouldThrowError( function()
    {
      _.__arrayRemoved();
    })

    test.description = 'too many args';
    test.shouldThrowError( function()
    {
      _.__arrayRemoved( [], 1, 1 );
    })

    test.description = 'dst is not an array';
    test.shouldThrowError( function()
    {
      _.__arrayRemoved( 1, 1 );
    })
  }
}

//

function __arrayRemoveOnce( test )
{
  test.description = 'simple';

  var got = _.__arrayRemoveOnce( [], 1 );
  test.identical( got, [] );

  var got = _.__arrayRemoveOnce( [ 1 ], 1 );
  test.identical( got, [] );

  var got = _.__arrayRemoveOnce( [ 1,2,2 ], 2 );
  test.identical( got, [ 1,2 ] );

  var got = _.__arrayRemoveOnce( [ 1,3,2,3 ], 3 );
  test.identical( got, [ 1,2,3 ] );

  var got = _.__arrayRemoveOnce( [ 1 ], '1' );
  test.identical( got, [ 1 ] );

  var got = _.__arrayRemoveOnce( [ 1 ], -1 );
  test.identical( got, [ 1 ] );

  var got = _.__arrayRemoveOnce( [ 1 ], [ 1 ] );
  test.identical( got, [ 1 ] );

  test.description = 'equalizer 2 args';

  var dst = [ { num : 1 },{ num : 2 },{ num : 3 } ];
  var onEqualize = function( a, b )
  {
    return a.num === b.num;
  }
  var got = _.__arrayRemoveOnce( dst, { num : 4 }, onEqualize );
  test.identical( got, [ { num : 1 },{ num : 2 },{ num : 3 } ] );

  var dst = [ { num : 1 },{ num : 2 },{ num : 3 } ];
  var onEqualize = function( a, b )
  {
    return a.num === b.num;
  }
  var got = _.__arrayRemoveOnce( dst, { num : 1 }, onEqualize );
  test.identical( got, [ { num : 2 },{ num : 3 } ] );

  test.description = 'equalizer 1 arg';

  var dst = [ { num : 1 },{ num : 2 },{ num : 3 } ];
  var onEqualize = function( a )
  {
    return a.num;
  }
  var got = _.__arrayRemoveOnce( dst, 4, onEqualize );
  test.identical( got, [ { num : 1 },{ num : 2 },{ num : 3 } ] );

  var dst = [ { num : 1 },{ num : 2 },{ num : 3 } ];
  var onEqualize = function( a )
  {
    return a.num;
  }
  var got = _.__arrayRemoveOnce( dst, 1, onEqualize );
  test.identical( got, [ { num : 2 },{ num : 3 } ] );

  //

  if( Config.debug )
  {
    test.description = 'no args';
    test.shouldThrowError( function()
    {
      _.__arrayRemoveOnce();
    })

    test.description = 'dst is not an array';
    test.shouldThrowError( function()
    {
      _.__arrayRemoveOnce( 1, 1 );
    })

    test.description = 'onEqualize is not a function';
    test.shouldThrowError( function()
    {
      _.__arrayRemoveOnce( 1, 1, 1 );
    })
  }
}

//

function __arrayRemovedOnce( test )
{
  test.description = 'simple';

  var dst = [];
  var got = _.__arrayRemovedOnce( dst, 1 );
  test.identical( dst, [ 1 ] );
  test.identical( got, -1 );

  var dst = [ 1 ];
  var got = _.__arrayRemovedOnce( dst, 1 );
  test.identical( dst, [ 1 ] );
  test.identical( got, 0 );

  var dst = [ 2,2,1 ];
  var got = _.__arrayRemovedOnce( dst, 2 );
  test.identical( dst, [ 2,1 ] );
  test.identical( got, 0 );

  var dst = [ 1 ];
  var got = _.__arrayRemovedOnce( dst, '1' );
  test.identical( dst, [ 1 ] );
  test.identical( got, -1 );

  var dst = [ 1 ];
  var got = _.__arrayRemovedOnce( dst, -1 );
  test.identical( dst, [  1 ] );
  test.identical( got, -1 );

  var dst = [ 1 ];
  var got = _.__arrayRemovedOnce( dst, [ 1 ] );
  test.identical( dst, [  1 ] );
  test.identical( got, -1 );

  test.description = 'equalizer 2 args';

  var dst = [ { num : 1 },{ num : 2 },{ num : 3 } ];
  var onEqualize = function( a, b )
  {
    return a.num === b.num;
  }
  var got = _.__arrayRemovedOnce( dst, { num : 4 }, onEqualize );
  test.identical( dst, [ { num : 4 },{ num : 1 },{ num : 2 },{ num : 3 } ] );
  test.identical( got, -1 );

  var dst = [ { num : 1 },{ num : 2 },{ num : 3 } ];
  var onEqualize = function( a, b )
  {
    return a.num === b.num;
  }
  var got = _.__arrayRemovedOnce( dst, { num : 1 }, onEqualize );
  test.identical( dst, [ { num : 2 },{ num : 3 } ] );
  test.identical( got, 0 );

  test.description = 'equalizer 1 arg';

  var dst = [ { num : 1 },{ num : 2 },{ num : 3 } ];
  var onEqualize = function( a )
  {
    return a.num;
  }
  var got = _.__arrayRemovedOnce( dst, 4, onEqualize );
  test.identical( dst, [ { num : 1 },{ num : 2 },{ num : 3 } ] );
  test.identical( got, -1 );

  var dst = [ { num : 1 },{ num : 2 },{ num : 3 } ];
  var onEqualize = function( a )
  {
    return a.num;
  }
  var got = _.__arrayRemovedOnce( dst, 1, onEqualize );
  test.identical( dst, [ { num : 2 },{ num : 3 } ] );
  test.identical( got, 0 );

  //

  if( Config.debug )
  {
    test.description = 'no args';
    test.shouldThrowError( function()
    {
      _.__arrayRemovedOnce();
    })

    test.description = 'third is not a routine';
    test.shouldThrowError( function()
    {
      _.__arrayRemovedOnce( [], 1, 1 );
    })

    test.description = 'dst is not an array';
    test.shouldThrowError( function()
    {
      _.__arrayRemovedOnce( 1, 1 );
    })
  }
}

//

function __arrayRemoveOnceStrictly( test )
{
  test.description = 'simple';

  var dst = [ 1,2,2 ];
  var got = _.__arrayRemoveOnceStrictly( dst, 2 );
  test.identical( got, [ 1,2 ] );
  test.identical( got, dst );

  test.description = 'equalizer 2 args';

  var dst = [ { num : 1 },{ num : 2 },{ num : 3 } ];
  var onEqualize = function( a, b )
  {
    return a.num === b.num;
  }
  var got = _.__arrayRemoveOnceStrictly( dst, { num : 3 }, onEqualize );
  test.identical( got, [ { num : 1 },{ num : 2 } ] );
  test.identical( got, dst );

  test.description = 'equalizer 1 arg';

  var dst = [ { num : 1 },{ num : 2 },{ num : 3 } ];
  var onEqualize = function( a )
  {
    return a.num;
  }
  var got = _.__arrayRemoveOnceStrictly( dst, 3, onEqualize );
  test.identical( got, [ { num : 1 },{ num : 2 } ] );
  test.identical( got, dst );

  //

  if( Config.debug )
  {
    test.description = 'no args';
    test.shouldThrowError( function()
    {
      _.__arrayRemoveOnceStrictly();
    })

    test.description = 'dst is not an array';
    test.shouldThrowError( function()
    {
      _.__arrayRemoveOnceStrictly( 1, 1 );
    })

    test.description = 'ins not exists';

    test.shouldThrowError( function()
    {
      _.__arrayRemoveOnceStrictly( [ 1 ], 2 );
    });

    test.description = 'onEqualize is not a routine';

    test.shouldThrowError( function()
    {
      _.__arrayRemoveOnceStrictly( [ 1,2,3 ], 3, 3 );
    });

    test.description = 'onEqualize';
    var dst = [ { num : 1 },{ num : 2 },{ num : 3 } ];

    test.shouldThrowError( function()
    {
      var onEqualize = function( a, b )
      {
        return a.num === b.num;
      }
      _.__arrayRemoveOnceStrictly( dst, { num : 4 }, onEqualize );
    });
    test.identical( dst, [ { num : 1 },{ num : 2 },{ num : 3 } ] )


    test.shouldThrowError( function()
    {
      var onEqualize = function( a )
      {
        return a.num;
      }
      _.__arrayRemoveOnceStrictly( dst, 4, onEqualize );
    });
    test.identical( dst, [ { num : 1 },{ num : 2 },{ num : 3 } ] )
  }
}

//

function __arrayRemoveArray( test )
{

  test.description = 'nothing';
  var got = _.__arrayRemoveArray( [], [] );
  var expected = [];
  test.identical( got, expected );

  test.description = 'simple';
  var dst = [];
  var got = _.__arrayRemoveArray( dst, [ 1, 2, 3 ] );
  test.identical( dst, [] );
  test.identical( got, dst );

  var dst = [ 1, 2, 3 ];
  var got = _.__arrayRemoveArray( dst,[ 4, 5 ] );
  test.identical( dst, [ 1, 2, 3 ] );
  test.identical( got, dst );

  var dst = [ 1, 2, 3 ];
  var got = _.__arrayRemoveArray( dst,[ 1,3 ] );
  test.identical( dst, [ 2 ] );
  test.identical( got, dst );

  var dst = [ 1, 1, 1 ];
  var got = _.__arrayRemoveArray( dst, [ 1, 1 ] );
  test.identical( dst, [ ] );
  test.identical( got, dst );

  test.description = 'argument is undefined';
  var dst = [ 1 ];
  test.shouldThrowError( function ()
  {
    _.__arrayRemoveArray( dst, undefined );
  });
  test.identical( dst, [ 1 ] );

  test.description = 'array has undefined';
  var dst = [ 1 ];
  var got;
  test.mustNotThrowError( function ()
  {
    got = _.__arrayRemoveArray( dst, [ undefined, 2 ] );
  });
  test.identical( dst, [ 1 ] );
  test.identical( got, dst );

  /**/

  if( Config.debug )
  {

    test.description = 'no arguments';
    test.shouldThrowError( function()
    {
      _.__arrayRemoveArray();
    });

    test.description = 'too many args';
    test.shouldThrowError( function()
    {
      _.__arrayRemoveArray( [ 1, 2 ],[ 1 ], [ 2 ] );
    });

    test.description = 'second args is not arrayLike';
    test.shouldThrowError( function()
    {
      _.__arrayRemoveArray( [ 1, 2 ], 2 );
    });
  }
};

//

function __arrayRemovedArray( test )
{
  test.description = 'nothing';

  var dst = [];
  var got = _.__arrayRemovedArray( dst, [] );
  test.identical( dst, [] );
  test.identical( got, 0 );

  test.description = 'simple';

  var dst = [];
  var got = _.__arrayRemovedArray( dst, [ 1, 2, 3 ] );
  test.identical( dst, [] );
  test.identical( got, 0 );

  test.description = 'prepends only unique elements';

  var dst = [ 1,2,3 ];
  var got = _.__arrayRemovedArray( dst, [ 2, 4, 5 ] );
  test.identical( dst, [ 1,3] );
  test.identical( got, 1 );

  var dst = [ 1, 1, 1 ];
  var got = _.__arrayRemovedArray( dst, [ 1 ] );
  test.identical( dst, [] );
  test.identical( got, 3 );

  test.description = 'argument is undefined';
  var dst = [ 1 ];
  test.shouldThrowError( function ()
  {
    _.__arrayRemovedArray( dst, undefined );
  });
  test.identical( dst, [ 1 ] );

  test.description = 'array has undefined';
  var dst = [ 1 ];
  var got;
  test.mustNotThrowError( function ()
  {
    got = _.__arrayRemovedArray( dst, [ undefined, 2 ] );
  });
  test.identical( dst, [ 1 ] );
  test.identical( got, 0 );

  /**/

  if( Config.debug )
  {

    test.description = 'no arguments';
    test.shouldThrowError( function()
    {
      _.__arrayRemovedArray();
    });

    test.description = 'too many args';
    test.shouldThrowError( function()
    {
      _.__arrayRemovedArray( [ 1, 2 ],[ 1 ], [ 2 ] );
    });

    test.description = 'second args is not arrayLike';
    test.shouldThrowError( function()
    {
      _.__arrayRemovedArray( [ 1, 2 ], 2 );
    });
  }

}

//

function __arrayRemovedArrayOnce( test )
{
  test.description = 'nothing';

  var dst = [];
  var got = _.__arrayRemovedArrayOnce( dst, [] );
  test.identical( dst, [] );
  test.identical( got, 0 );

  test.description = 'simple';

  var dst = [];
  var got = _.__arrayRemovedArrayOnce( dst, [ 1, 2, 3 ] );
  test.identical( dst, [] );
  test.identical( got, 0 );

  test.description = 'prepends only unique elements';

  var dst = [ 1,2,3 ];
  var got = _.__arrayRemovedArrayOnce( dst, [ 2, 4, 5 ] );
  test.identical( dst, [ 1, 3] );
  test.identical( got, 1 );

  var dst = [ 1, 1, 1 ];
  var got = _.__arrayRemovedArrayOnce( dst, [ 1 ] );
  test.identical( dst, [ 1, 1 ] );
  test.identical( got, 1 );

  test.description = 'array has undefined';
  var dst = [ 1 ];
  test.mustNotThrowError( function ()
  {
    var got = _.__arrayRemovedArrayOnce( dst, [ undefined, 2 ] );
    test.identical( dst, [ 1 ] );
    test.identical( got, 0 );
  });

  /**/

  if( Config.debug )
  {

    test.description = 'no arguments';
    test.shouldThrowError( function()
    {
      _.__arrayRemovedArrayOnce();
    });

    test.description = 'too many args';
    test.shouldThrowError( function()
    {
      _.__arrayRemovedArrayOnce( [ 1, 2 ],[ 1 ], [ 2 ] );
    });

    test.description = 'second args is not arrayLike';
    test.shouldThrowError( function()
    {
      _.__arrayRemovedArrayOnce( [ 1, 2 ], 2 );
    });

    test.description = 'onEqualize is not a routine';
    test.shouldThrowError( function()
    {
      _.__arrayRemovedArrayOnce( [ 1, 2 ], [ 2 ], 3 );
    });
  }

}

//

function __arrayRemoveArrayOnce( test )
{
  test.description = 'nothing';

  var got = _.__arrayRemoveArrayOnce( [], [] );
  var expected = [];
  test.identical( got, expected );

  test.description = 'simple';

  var dst = [];
  var got = _.__arrayRemoveArrayOnce( dst, [ 1, 2, 3 ] );
  test.identical( dst, [] );
  test.identical( got, dst );

  test.description = 'prepends only unique elements';

  var dst = [ 1,2,3 ];
  var got = _.__arrayRemoveArrayOnce( dst, [ 2, 4, 5 ] );
  test.identical( dst, [ 1,3 ] );
  test.identical( got, dst );

  var dst = [ 1, 1, 1 ];
  var got = _.__arrayRemoveArrayOnce( dst, [ 1 ] );
  test.identical( dst, [ 1, 1 ] );
  test.identical( got, dst );

  test.description = 'array has undefined';
  var dst = [ 1 ];
  test.mustNotThrowError( function ()
  {
    var got = _.__arrayRemoveArrayOnce( dst, [ undefined, 2 ] );
    test.identical( dst, [ 1 ] );
    test.identical( got, dst );
  });

  /**/

  if( Config.debug )
  {

    test.description = 'no arguments';
    test.shouldThrowError( function()
    {
      _.__arrayRemoveArrayOnce();
    });

    test.description = 'too many args';
    test.shouldThrowError( function()
    {
      _.__arrayRemoveArrayOnce( [ 1, 2 ],[ 1 ], [ 2 ] );
    });

    test.description = 'second args is not arrayLike';
    test.shouldThrowError( function()
    {
      _.__arrayRemoveArrayOnce( [ 1, 2 ], 2 );
    });

    test.description = 'onEqualize is not a routine';
    test.shouldThrowError( function()
    {
      _.__arrayRemoveArrayOnce( [ 1, 2 ], [ 2 ], 3 );
    });
  }
}

//

function __arrayRemoveArrayOnceStrictly( test )
{
  test.description = 'simple';

  var dst = [ 1,2,2 ];
  var got = _.__arrayRemoveArrayOnceStrictly( dst, [ 2 ] );
  test.identical( got, [ 1,2 ] );
  test.identical( got, dst );

  test.description = 'equalizer 2 args';

  var dst = [ { num : 1 },{ num : 2 },{ num : 3 } ];
  var onEqualize = function( a, b )
  {
    return a.num === b.num;
  }
  var got = _.__arrayRemoveArrayOnceStrictly( dst, [ { num : 3 } ], onEqualize );
  test.identical( got, [ { num : 1 },{ num : 2 } ] );
  test.identical( got, dst );

  test.description = 'equalizer 1 arg';

  var dst = [ { num : 1 },{ num : 2 },{ num : 3 } ];
  var onEqualize = function( a )
  {
    return a.num;
  }
  var got = _.__arrayRemoveArrayOnceStrictly( dst, [ 3 ], onEqualize );
  test.identical( got, [ { num : 1 },{ num : 2 } ] );
  test.identical( got, dst );

  //

  if( Config.debug )
  {
    test.description = 'no args';
    test.shouldThrowError( function()
    {
      _.__arrayRemoveArrayOnceStrictly();
    })

    test.description = 'dst is not an array';
    test.shouldThrowError( function()
    {
      _.__arrayRemoveArrayOnceStrictly( 1, 1 );
    })

    test.description = 'ins not exists';

    test.shouldThrowError( function()
    {
      _.__arrayRemoveArrayOnceStrictly( [ 1 ], [ 2 ] );
    });

    test.description = 'onEqualize is not a routine';

    test.shouldThrowError( function()
    {
      _.__arrayRemoveArrayOnceStrictly( [ 1,2,3 ], 3, 3 );
    });

    test.description = 'onEqualize';
    var dst = [ { num : 1 },{ num : 2 },{ num : 3 } ];

    test.shouldThrowError( function()
    {
      var onEqualize = function( a, b )
      {
        return a.num === b.num;
      }
      _.__arrayRemoveArrayOnceStrictly( dst, [ { num : 4 } ], onEqualize );
    });
    test.identical( dst, [ { num : 1 },{ num : 2 },{ num : 3 } ] )


    test.shouldThrowError( function()
    {
      var onEqualize = function( a )
      {
        return a.num;
      }
      _.__arrayRemoveArrayOnceStrictly( dst, [ 4 ], onEqualize );
    });
    test.identical( dst, [ { num : 1 },{ num : 2 },{ num : 3 } ] )
  }
}

//

function __arrayRemoveArrays( test )
{
  test.description = 'nothing';
  var got = _.__arrayRemoveArrays( [], [] );
  var expected = [];
  test.identical( got, expected );

  test.description = 'simple';
  var dst = [];
  var got = _.__arrayRemoveArrays( dst, [ 1, 2, 3 ] );
  test.identical( dst, [] );
  test.identical( got, dst );

  var dst = [ 1, 2, 3 ];
  var got = _.__arrayRemoveArrays( dst,[ 4, 5 ] );
  test.identical( dst, [ 1, 2, 3 ] );
  test.identical( got, dst );

  var dst = [ 1, 2, 3 ];
  var got = _.__arrayRemoveArrays( dst,[ 1,3 ] );
  test.identical( dst, [ 2 ] );
  test.identical( got, dst );

  var dst = [ 1, 1, 1, 2, 2, 2 ];
  var got = _.__arrayRemoveArrays( dst, [ 1 ], [ 2 ] );
  test.identical( dst, [ ] );
  test.identical( got, dst );

  var dst = [ 1, 2, 3, 4, 5];
  var got = _.__arrayRemoveArrays( dst, [ 1 ], [ 2, [ 3 ] ], [ [ [ 4 ] ], 5 ] );
  test.identical( dst, [ 4 ] );
  test.identical( got, dst );

  var dst = [ 1, 2, 3, 4, 5];
  var got = _.__arrayRemoveArrays( dst, [ 1 ], 2 , [ 3 ], 4, [ 5 ] );
  test.identical( dst, [] );
  test.identical( got, dst );

  test.description = 'array has undefined';
  var dst = [ 1 ];
  var got;
  test.mustNotThrowError( function ()
  {
    got = _.__arrayRemoveArrays( dst, [ undefined, 2 ] );
  });
  test.identical( dst, [ 1 ] );
  test.identical( got, dst );

  /**/

  if( Config.debug )
  {

    test.description = 'no arguments';
    test.shouldThrowError( function()
    {
      _.__arrayRemoveArrays();
    });

    test.description = 'argument is undefined';
    var dst = [ 1 ];
    test.shouldThrowError( function ()
    {
      _.__arrayRemoveArrays( dst, undefined );
    });
    test.identical( dst, [ 1 ] );
  }
};

//

function __arrayRemovedArrays( test )
{
  test.description = 'nothing';

  var dst = [];
  var got = _.__arrayRemovedArrays( dst, [] );
  test.identical( dst, [] );
  test.identical( got, 0 );

  test.description = 'simple';

  var dst = [];
  var got = _.__arrayRemovedArrays( dst, [ 1, 2, 3 ] );
  test.identical( dst, [] );
  test.identical( got, 0 );

  test.description = 'prepends only unique elements';

  var dst = [ 1,2,3 ];
  var got = _.__arrayRemovedArrays( dst, [ 2, 4, 5 ] );
  test.identical( dst, [ 1,3 ] );
  test.identical( got, 1 );

  var dst = [ 1, 1, 1 ];
  var got = _.__arrayRemovedArrays( dst, [ 1 ] );
  test.identical( dst, [] );
  test.identical( got, 3 );

  var dst = [ 1, 2, 3, 4, 5];
  var got = _.__arrayRemovedArrays( dst, [ 1 ], [ 2, [ 3 ] ], [ [ [ 4 ] ], 5 ] );
  test.identical( dst, [ 4 ] );
  test.identical( got, 4 );

  var dst = [ 1, 2, 3, 4, 5];
  var got = _.__arrayRemovedArrays( dst, [ 1 ], 2 , [ 3 ], 4, [ 5 ] );
  test.identical( dst, [] );
  test.identical( got, 5 );

  test.description = 'array has undefined';
  var dst = [ 1 ];
  var got;
  test.mustNotThrowError( function ()
  {
    got = _.__arrayRemovedArrays( dst, [ undefined, 2 ] );
  });
  test.identical( dst, [ 1 ] );
  test.identical( got, 0 );

  /**/

  if( Config.debug )
  {

    test.description = 'no arguments';
    test.shouldThrowError( function()
    {
      _.__arrayRemovedArrays();
    });

    test.description = 'argument is undefined';
    var dst = [ 1 ];
    test.shouldThrowError( function ()
    {
      _.__arrayRemovedArrays( dst, undefined );
    });
    test.identical( dst, [ 1 ] );
  }
}

//

function __arrayRemovedArraysOnce( test )
{
  test.description = 'nothing';

  var dst = [];
  var got = _.__arrayRemovedArraysOnce( dst, [] );
  test.identical( dst, [] );
  test.identical( got, 0 );

  test.description = 'simple';

  var dst = [];
  var got = _.__arrayRemovedArraysOnce( dst, [ 1, 2, 3 ] );
  test.identical( dst, [] );
  test.identical( got, 0 );

  test.description = 'prepends only unique elements';

  var dst = [ 1,2,3 ];
  var got = _.__arrayRemovedArraysOnce( dst, [ 2, 4, 5 ] );
  test.identical( dst, [ 1, 3] );
  test.identical( got, 1 );

  var dst = [ 1, 1, 1 ];
  var got = _.__arrayRemovedArraysOnce( dst, [ 1 ] );
  test.identical( dst, [ 1, 1 ] );
  test.identical( got, 1 );

  var dst = [ 1, 1, 2, 3, 3, 4, 5, 5];
  var got = _.__arrayRemovedArraysOnce( dst, [ 1 ], [ 2, [ 3 ] ], [ [ [ 4 ] ], 5 ] );
  test.identical( dst, [ 1, 3, 4, 5 ] );
  test.identical( got, 4 );

  var dst = [ 1, 1, 2, 2, 3, 4, 4, 5];
  var got = _.__arrayRemovedArraysOnce( dst, [ 1, 1 ], 2 , [ 3 ], 4, 4, [ 5 ] );
  test.identical( dst, [ 2 ] );
  test.identical( got, 7 );

  test.description = 'array has undefined';
  var dst = [ 1 ];
  test.mustNotThrowError( function ()
  {
    var got = _.__arrayRemovedArraysOnce( dst, [ undefined, 2 ] );
    test.identical( dst, [ 1 ] );
    test.identical( got, 0 );
  });

  /**/

  if( Config.debug )
  {

    test.description = 'no arguments';
    test.shouldThrowError( function()
    {
      _.__arrayRemovedArraysOnce();
    });

    test.description = 'dst is not a array';
    test.shouldThrowError( function()
    {
      _.__arrayRemovedArraysOnce( 1, [ 2 ] );
    });

    test.description = 'onEqualize is not a routine';
    test.shouldThrowError( function()
    {
      var o = { onEqualize : 1 };

      _.__arrayRemovedArraysOnce.apply( o,[ [], 1, 2, 3 ] );
    });
  }
}

//

function __arrayRemoveArraysOnce( test )
{
  test.description = 'nothing';

  var got = _.__arrayRemoveArraysOnce( [], [] );
  var expected = [];
  test.identical( got, expected );

  test.description = 'simple';

  var dst = [];
  var got = _.__arrayRemoveArraysOnce( dst, [ 1, 2, 3 ] );
  test.identical( got, [] );
  test.identical( got, dst );

  test.description = 'prepends only unique elements';

  var dst = [ 1,2,3 ];
  var got = _.__arrayRemoveArraysOnce( dst, [ 2, 4, 5 ] );
  test.identical( dst, [ 1,3 ] );
  test.identical( got, dst );

  var dst = [ 1, 1, 1 ];
  var got = _.__arrayRemoveArraysOnce( dst, [ 1 ] );
  test.identical( dst, [ 1, 1 ] );
  test.identical( got, dst );

  var dst = [ 1, 1, 2, 3, 3, 4, 5, 5 ];
  var got = _.__arrayRemoveArraysOnce( dst, [ 1 ], [ 2, [ 3 ] ], [ [ [ 4 ] ], 5 ] );
  test.identical( got, [ 1, 3, 4, 5 ] );
  test.identical( got, dst );

  var dst = [ 1, 1, 2, 2, 3, 4, 4, 5 ];
  var got = _.__arrayRemoveArraysOnce( dst, [ 1, 1 ], 2 , [ 3 ], 4, 4, [ 5 ] );
  test.identical( dst, [ 2 ] );
  test.identical( got, dst );

  test.description = 'array has undefined';
  var dst = [ 1 ];
  test.mustNotThrowError( function ()
  {
    var got = _.__arrayRemoveArraysOnce( dst, [ undefined, 2 ] );
    test.identical( dst, [ 1 ] );
    test.identical( got, dst );
  });

  test.description = 'equalizer 2 args';

  var dst = [ { num : 1 },{ num : 2 },{ num : 3 } ];
  var onEqualize = function( a, b )
  {
    return a.num === b.num;
  }
  var o = { onEqualize : onEqualize }
  var got = _.__arrayRemoveArraysOnce.apply( o, [ dst, [ { num : 3 } ], { num : 1 }  ] );
  test.identical( got, [ { num : 2 } ] );
  test.identical( got, dst );

  test.description = 'equalizer 1 arg';

  var dst = [ { num : 1 },{ num : 2 },{ num : 3 } ];
  var onEqualize = function( a )
  {
    return a.num;
  }
  var o = { onEqualize : onEqualize }
  var got = _.__arrayRemoveArraysOnce.apply( o, [ dst, [ 3 ], 1 ] );
  test.identical( got, [ { num : 2 } ] );
  test.identical( got, dst );

  /**/

  if( Config.debug )
  {

    test.description = 'no arguments';
    test.shouldThrowError( function()
    {
      _.__arrayRemoveArraysOnce();
    });

    test.description = 'dst is not a array';
    test.shouldThrowError( function()
    {
      _.__arrayRemoveArraysOnce( 1, [ 2 ] );
    });

    test.description = 'onEqualize is not a routine';
    test.shouldThrowError( function()
    {
      var o = { onEqualize : 1 };

      _.__arrayRemoveArraysOnce.apply( o,[ [], 1, 2, 3 ] );
    });
  }
}

//

function __arrayRemoveArraysOnceStrictly( test )
{
  test.description = 'simple';

  var dst = [ 1, 2, 2 ];
  var got = _.__arrayRemoveArraysOnceStrictly( dst, [ 2 ] );
  test.identical( got, [ 1, 2 ] );
  test.identical( got, dst );

  var dst = [ 1, 2, 3 ];
  var got = _.__arrayRemoveArraysOnceStrictly( dst, 1, 2, 3 );
  test.identical( got, [ ] );
  test.identical( got, dst );

  var dst = [ 1, 2, 3, 4 ];
  var got = _.__arrayRemoveArraysOnceStrictly( dst, [ 1 ], [ 2 ], [ 3 ], [ [ 4 ] ] );
  test.identical( got, [ ] );
  test.identical( got, dst );

  test.description = 'equalizer 2 args';

  var dst = [ { num : 1 },{ num : 2 },{ num : 3 } ];
  var onEqualize = function( a, b )
  {
    return a.num === b.num;
  }
  var o = { onEqualize : onEqualize }
  var got = _.__arrayRemoveArraysOnceStrictly.apply( o, [ dst, [ { num : 3 } ], { num : 1 }  ] );
  test.identical( got, [ { num : 2 } ] );
  test.identical( got, dst );

  test.description = 'equalizer 1 arg';

  var dst = [ { num : 1 },{ num : 2 },{ num : 3 } ];
  var onEqualize = function( a )
  {
    return a.num;
  }
  var o = { onEqualize : onEqualize }
  var got = _.__arrayRemoveArraysOnceStrictly.apply( o, [ dst, [ 3 ], 1 ] );
  test.identical( got, [ { num : 2 } ] );
  test.identical( got, dst );

  //

  if( Config.debug )
  {
    test.description = 'no args';
    test.shouldThrowError( function()
    {
      _.__arrayRemoveArraysOnceStrictly();
    })

    test.description = 'dst is not an array';
    test.shouldThrowError( function()
    {
      _.__arrayRemoveArraysOnceStrictly( 1, 1 );
    })

    test.description = 'ins not exists';

    test.shouldThrowError( function()
    {
      _.__arrayRemoveArraysOnceStrictly( [ 1 ], [ 2 ] );
    });

    test.description = 'onEqualize is not a routine';

    var o = { onEqualize : 1 }
    test.shouldThrowError( function()
    {
      _.__arrayRemoveArraysOnceStrictly.apply( o, [ [ 1,2,3 ], 3, 3 ] );
    });

    test.description = 'onEqualize';
    var dst = [ { num : 1 },{ num : 2 },{ num : 3 } ];

    test.shouldThrowError( function()
    {
      var onEqualize = function( a, b )
      {
        return a.num === b.num;
      }
      var o = { onEqualize : onEqualize }
      _.__arrayRemoveArraysOnceStrictly.apply( o, [ dst, [ { num : 4 } ] ] );
    });
    test.identical( dst, [ { num : 1 },{ num : 2 },{ num : 3 } ] )


    test.shouldThrowError( function()
    {
      var onEqualize = function( a )
      {
        return a.num;
      }
      var o = { onEqualize : onEqualize }
      _.__arrayRemoveArraysOnceStrictly.apply( o, [ dst, [ 4 ] ] );
    });
    test.identical( dst, [ { num : 1 },{ num : 2 },{ num : 3 } ] )
  }
}

//

function __arrayFlatten( test )
{
  test.description = 'make array flat, dst is empty';

  var got  = _.__arrayFlatten( [], [] );
  test.identical( got, [] );

  var got  = _.__arrayFlatten( [], [ 1, 2, 3 ] )
  test.identical( got, [ 1, 2, 3 ] );

  var got  = _.__arrayFlatten( [], [ [ 1 ], [ 2 ], [ 3 ]  ] )
  test.identical( got, [ 1, 2, 3 ] );

  var got  = _.__arrayFlatten( [], [ [ 1, [ 2, [ 3 ] ] ]  ] )
  test.identical( got, [ 1, 2, 3 ] );

  var got  = _.__arrayFlatten( [], [ [ [ [ [ 1 ] ] ] ] ]  )
  test.identical( got, [ 1 ] );

  test.description = 'make array flat, dst is not empty';

  var got  = _.__arrayFlatten( [ 1, 2, 3 ], [ 4 ] );
  test.identical( got, [ 1, 2, 3, 4 ] );

  var got  = _.__arrayFlatten( [ 1, 2, 3 ], [ 1, 2, 3 ] )
  test.identical( got, [ 1, 2, 3, 1, 2, 3 ] );

  var got  = _.__arrayFlatten( [ 1, 2, 3 ],[ [ 1 ], [ 2 ], [ 3 ]  ] )
  test.identical( got, [ 1, 2, 3, 1, 2, 3 ] );

  var got  = _.__arrayFlatten( [ 1, 2, 3 ],[ [ 1, [ 2, [ 3 ] ] ]  ] )
  test.identical( got, [ 1, 2, 3, 1, 2, 3 ] );

  var got  = _.__arrayFlatten( [ 1 ],[ [ [ [ [ 1 ] ] ] ] ]  )
  test.identical( got, [ 1, 1 ] );

  test.description = 'make array flat from multiple arrays as one arg';

  var got  = _.__arrayFlatten
  (
    [],
    [
      [ 1 ],
      [ [ 2 ] ],
      [ 3, [ [ [ 4 ] ] ] ]
    ]
  );
  test.identical( got, [ 1, 2, 3, 4 ] );

  if( Config.debug )
  {
    test.description = 'not enough arguments';
    test.shouldThrowError( function()
    {
      _.__arrayFlatten();
    });

    test.description = 'first is not arrayLike';
    test.shouldThrowError( function()
    {
      _.__arrayFlatten( 1, [ 1 ] );
    });

    test.description = 'second is not arrayLike';
    test.shouldThrowError( function()
    {
      _.__arrayFlatten( [], 1 );
    });
  }
}

//

function __arrayFlattenOnce( test )
{
  test.description = 'make array flat, dst is empty';

  var got  = _.__arrayFlattenOnce( [], [] );
  test.identical( got, [] );

  var got  = _.__arrayFlattenOnce( [], [ 1, 1, 2, 2, 3 , 3 ] )
  test.identical( got, [ 1, 2, 3 ] );

  var got  = _.__arrayFlattenOnce( [], [ [ 1 ], [ 1 ], [ 2 ], [ 2 ], [ 3 ], [ 3 ]  ] )
  test.identical( got, [ 1, 2, 3 ] );

  var got  = _.__arrayFlattenOnce( [], [ [ 1, 1, [ 2, 2, [ 3, 3 ] ] ]  ] )
  test.identical( got, [ 1, 2, 3 ] );

  var got  = _.__arrayFlattenOnce( [], [ [ [ [ [ 1, 1, 1 ] ] ] ] ]  )
  test.identical( got, [ 1 ] );

  test.description = 'make array flat, dst is not empty';

  var got  = _.__arrayFlattenOnce( [ 1, 2, 3, 4 ], [ 4 ] );
  test.identical( got, [ 1, 2, 3, 4 ] );

  var got  = _.__arrayFlattenOnce( [ 1, 2, 3 ], [ 1, 2, 3, [ [ 4 ] ] ] );
  test.identical( got, [ 1, 2, 3, 4 ] );

  var got  = _.__arrayFlattenOnce( [ 1, 2, 3 ],[ [ 1 ], [ 2 ], [ 3 ], [ 4 ] ] );
  test.identical( got, [ 1, 2, 3, 4 ] );

  var got  = _.__arrayFlattenOnce( [ 1, 2, 3 ],[ [ 1, [ 2, [ 3 ] ] ], 4 ] );
  test.identical( got, [ 1, 2, 3, 4 ] );

  var got  = _.__arrayFlattenOnce( [ 1 ],[ [ [ [ [ 1, 1, 1 ] ] ] ] ]  );
  test.identical( got, [ 1 ] );

  test.description = 'make array flat from multiple arrays as one arg';

  var got  = _.__arrayFlattenOnce
  (
    [ 1, 4 ],
    [
      [ 1 ],
      [ [ 2 ] ],
      [ 3, [ [ [ 4 ] ] ] ]
    ]
  );
  test.identical( got, [ 1, 4, 2, 3 ] );

  test.description = 'onEqualize';
  var got  = _.__arrayFlattenOnce( [ 1, 2, 3, 4 ], [ 1, 4, 2, 5 ], function( a, b )
  {
    return  a === b;
  });
  test.identical( got, [ 1, 2, 3, 4, 5 ] );

  if( Config.debug )
  {
    test.description = 'not enough arguments';
    test.shouldThrowError( function()
    {
      _.__arrayFlattenOnce();
    });

    test.description = 'first is not arrayLike';
    test.shouldThrowError( function()
    {
      _.__arrayFlattenOnce( 1, [ 1 ] );
    });

    test.description = 'second is not arrayLike';
    test.shouldThrowError( function()
    {
      _.__arrayFlattenOnce( [], 1 );

    });

    test.description = 'onEqualize is not a routine';
    test.shouldThrowError( function()
    {
      _.__arrayFlattenOnce( [], [ 1 ], [] );
    });
  }
}

//

function __arrayFlattenOnceStrictly( test )
{
  test.description = 'make array flat, dst is empty';

  var got  = _.__arrayFlattenOnceStrictly( [], [] );
  test.identical( got, [] );

  var dst = [];
  var got = _.__arrayFlattenOnceStrictly( dst, [ 1, 2, 3, 4 ] )
  test.identical( got, [ 1, 2, 3, 4 ] );
  test.identical( dst, got );

  var dst = [];
  var got = _.__arrayFlattenOnceStrictly( dst, [ [ 1 ], [ 2 ], [ 3 ], [ 4 ]  ] );
  test.identical( got, [ 1, 2, 3, 4 ] );
  test.identical( dst, got );

  var dst = [];
  var got = _.__arrayFlattenOnceStrictly( dst, [ [ 1, [ 2, [ 3 ], 4 ] ]  ] );
  test.identical( got, [ 1, 2, 3, 4 ] );
  test.identical( dst, got );

  var dst = [];
  var got = _.__arrayFlattenOnceStrictly( dst, [ 1, [ 2, [ [ 3, [ 4 ] ] ] ] ] );
  test.identical( got, [ 1, 2, 3, 4 ] );
  test.identical( dst, got );

  test.description = 'make array flat, dst is not empty';

  var got  = _.__arrayFlattenOnceStrictly( [ 1, 2, 3, 4 ], [ 5 ] );
  test.identical( got, [ 1, 2, 3, 4, 5 ] );

  var got  = _.__arrayFlattenOnceStrictly( [ 1, 2, 3 ], [ [ [ 4 ] ] ] );
  test.identical( got, [ 1, 2, 3, 4 ] );

  var got  = _.__arrayFlattenOnceStrictly( [ 1 ], [ [ [ [ [ 0, 2, 3 ] ] ] ] ]  );
  test.identical( got, [ 1, 0, 2, 3 ] );

  test.description = 'make array flat from multiple arrays as one arg';

  var got  = _.__arrayFlattenOnceStrictly
  (
    [ 1, 4 ],
    [
      [ [ 2 ] ],
      [ 3, [ [ [ 5 ] ] ] ]
    ]
  );
  test.identical( got, [ 1, 4, 2, 3, 5 ] );

  test.description = 'onEqualize';
  var got  = _.__arrayFlattenOnceStrictly( [ 1, 2, 3, 4 ], [ 5 ], function( a, b )
  {
    return  a === b;
  });
  test.identical( got, [ 1, 2, 3, 4, 5 ] );

  if( Config.debug )
  {
    test.description = 'not enough arguments';
    test.shouldThrowError( function()
    {
      _.__arrayFlattenOnceStrictly();
    });

    test.description = 'first is not arrayLike';
    test.shouldThrowError( function()
    {
      _.__arrayFlattenOnceStrictly( 1, [ 1 ] );
    });

    test.description = 'second is not arrayLike';
    test.shouldThrowError( function()
    {
      _.__arrayFlattenOnceStrictly( [], 1 );

    });

    test.description = 'onEqualize is not a routine';
    test.shouldThrowError( function()
    {
      _.__arrayFlattenOnceStrictly( [], [ 1 ], [] );
    });

    var dst = [];
    test.shouldThrowError( function()
    {
      _.__arrayFlattenOnceStrictly( dst, [ 1, 1, 2, 2, 3, 3 ] )
    });
    test.identical( dst, [ 1, 2, 3 ] );

    var dst = [];
    test.shouldThrowError( function()
    {
      _.__arrayFlattenOnceStrictly( dst, [ [ 1 ], [ 1 ], [ 2 ], [ 2 ], [ 3 ], [ 3 ]  ] )
    });
    test.identical( dst, [ 1, 2, 3 ] );

    var dst = [];
    test.shouldThrowError( function()
    {
      _.__arrayFlattenOnceStrictly( dst, [ [ 1, 1, [ 2, 2, [ 3, 3 ] ] ]  ] )
    });
    test.identical( dst, [ 1, 2, 3 ] );

    var dst = [];
    test.shouldThrowError( function()
    {
      _.__arrayFlattenOnceStrictly( dst, [ [ [ [ [ 1, 1, 1 ] ] ] ] ]  )
    });
    test.identical( dst, [ 1 ] );
  }
}

//

function __arrayFlattened( test )
{
  test.description = 'make array flat, dst is empty';

  var dst = [];
  var got  = _.__arrayFlattened( dst, [] );
  test.identical( dst, [] );
  test.identical( got, 0 );

  var dst = [];
  var got  = _.__arrayFlattened( dst, [ 1, 2, 3 ] )
  test.identical( dst, [ 1, 2, 3 ] );
  test.identical( got, 3 );

  var dst = [];
  var got  = _.__arrayFlattened( dst, [ [ 1 ], [ 2 ], [ 3 ]  ] )
  test.identical( dst, [ 1, 2, 3 ] );
  test.identical( got, 3 );

  var dst = [];
  var got  = _.__arrayFlattened( dst, [ [ 1, [ 2, [ 3 ] ] ]  ] )
  test.identical( dst, [ 1, 2, 3 ] );
  test.identical( got, 3 );

  var dst = [];
  var got  = _.__arrayFlattened( dst, [ [ [ [ [ 1 ] ] ] ] ]  )
  test.identical( dst, [ 1 ] );
  test.identical( got, 1 );

  test.description = 'make array flat, dst is not empty';

  var dst = [ 1, 2, 3 ];
  var got  = _.__arrayFlattened( dst, [ 4 ] );
  test.identical( dst, [ 1, 2, 3, 4 ] );
  test.identical( got, 1 );

  var dst = [ 1, 2, 3 ];
  var got  = _.__arrayFlattened( dst, [ 1, 2, 3 ] )
  test.identical( dst, [ 1, 2, 3, 1, 2, 3 ] );
  test.identical( got, 3 );

  var dst = [ 1, 2, 3 ];
  var got = _.__arrayFlattened( dst, [ [ 1 ], [ 2 ], [ 3 ]  ] )
  test.identical( dst, [ 1, 2, 3, 1, 2, 3 ] );
  test.identical( got, 3 );

  var dst = [ 1, 2, 3 ];
  var got = _.__arrayFlattened( dst, [ [ 1, [ 2, [ 3 ] ] ]  ] )
  test.identical( dst, [ 1, 2, 3, 1, 2, 3 ] );
  test.identical( got, 3 );

  var dst = [ 1 ];
  var got = _.__arrayFlattened( dst, [ [ [ [ [ 1 ] ] ] ] ]  )
  test.identical( dst, [ 1, 1 ] );
  test.identical( got, 1 );

  test.description = 'make array flat from multiple arrays as one arg';

  var dst = [];
  var got = _.__arrayFlattened
  (
    dst,
    [
      [ 1 ],
      [ [ 2 ] ],
      [ 3, [ [ [ 4 ] ] ] ]
    ]
  );
  test.identical( dst, [ 1, 2, 3, 4 ] );
  test.identical( got, 4 );

  if( Config.debug )
  {
    test.description = 'not enough arguments';
    test.shouldThrowError( function()
    {
      _.__arrayFlattened();
    });

    test.description = 'first is not arrayLike';
    test.shouldThrowError( function()
    {
      _.__arrayFlattened( 1, [ 1 ] );
    });

    test.description = 'second is not arrayLike';
    test.shouldThrowError( function()
    {
      _.__arrayFlattened( [], 1 );
    });
  }
}

//

function __arrayFlattenedOnce( test )
{
  test.description = 'make array flat, dst is empty';

  var dst = [];
  var got = _.__arrayFlattenedOnce( dst, [] );
  test.identical( dst, [] );
  test.identical( got, 0 );

  var dst = [];
  var got = _.__arrayFlattenedOnce( dst, [ 1, 1, 2, 2, 3 , 3 ] )
  test.identical( dst, [ 1, 2, 3 ] );
  test.identical( got, 3 );

  var dst = [];
  var got = _.__arrayFlattenedOnce( dst, [ [ 1 ], [ 1 ], [ 2 ], [ 2 ], [ 3 ], [ 3 ]  ] )
  test.identical( dst, [ 1, 2, 3 ] );
  test.identical( got, 3 );

  var dst = [];
  var got = _.__arrayFlattenedOnce( dst, [ [ 1, 1, [ 2, 2, [ 3, 3 ] ] ]  ] )
  test.identical( dst, [ 1, 2, 3 ] );
  test.identical( got, 3 );

  var dst = [];
  var got = _.__arrayFlattenedOnce( dst, [ [ [ [ [ 1, 1, 1 ] ] ] ] ]  )
  test.identical( dst, [ 1 ] );
  test.identical( got, 1 );

  test.description = 'make array flat, dst is not empty';

  var dst = [ 1, 2, 3, 4 ];
  var got = _.__arrayFlattenedOnce( dst, [ 4 ] );
  test.identical( dst, [ 1, 2, 3, 4 ] );
  test.identical( got, 0 );

  var dst = [ 1, 2, 3 ];
  var got = _.__arrayFlattenedOnce( dst, [ 1, 2, 3, [ [ 4 ] ] ] );
  test.identical( dst, [ 1, 2, 3, 4 ] );
  test.identical( got, 1 );

  var dst = [ 1, 2, 3 ];
  var got = _.__arrayFlattenedOnce( dst, [ [ 1 ], [ 2 ], [ 3 ], [ 4 ] ] );
  test.identical( dst, [ 1, 2, 3, 4 ] );
  test.identical( got, 1 );

  var dst = [ 1, 2, 3 ];
  var got = _.__arrayFlattenedOnce( dst, [ [ 1, [ 2, [ 3 ] ] ], 4 ] );
  test.identical( dst, [ 1, 2, 3, 4 ] );
  test.identical( got, 1 );

  var dst = [ 1 ];
  var got = _.__arrayFlattenedOnce( dst, [ [ [ [ [ 1, 1, 1 ] ] ] ] ]  );
  test.identical( dst, [ 1 ] );
  test.identical( got, 0 );

  test.description = 'dst contains some inner arrays';

  var dst = [ [ 1 ], [ 2 ], [ 3 ] ];
  var got = _.__arrayFlattenedOnce( dst, [ 1, 2, 3 ]  );
  test.identical( dst, [ [ 1 ], [ 2 ], [ 3 ], 1, 2, 3 ] );
  test.identical( got, 3 );

  test.description = 'make array flat from multiple arrays as one arg';

  var dst = [ 1, 4 ];
  var got  = _.__arrayFlattenedOnce
  (
    dst,
    [
      [ 1 ],
      [ [ 2 ] ],
      [ 3, [ [ [ 4 ] ] ] ]
    ]
  );
  test.identical( dst, [ 1, 4, 2, 3 ] );
  test.identical( got, 2 );

  test.description = 'onEqualize';
  var dst = [ 1, 2, 3, 4 ];
  var got = _.__arrayFlattenedOnce( dst, [ 1, 4, 2, 5 ], function( a, b )
  {
    return  a === b;
  });
  test.identical( dst, [ 1, 2, 3, 4, 5 ] );
  test.identical( got, 1 );

  if( Config.debug )
  {
    test.description = 'not enough arguments';
    test.shouldThrowError( function()
    {
      _.__arrayFlattenedOnce();
    });

    test.description = 'first is not arrayLike';
    test.shouldThrowError( function()
    {
      _.__arrayFlattenedOnce( 1, [ 1 ] );
    });

    test.description = 'second is not arrayLike';
    test.shouldThrowError( function()
    {
      _.__arrayFlattenedOnce( [], 1 );

    });

    test.description = 'onEqualize is not a routine';
    test.shouldThrowError( function()
    {
      _.__arrayFlattenedOnce( [], [ 1 ], [] );
    });
  }
}

//

/*function _arrayPrependArrayOnce( test )
{

  test.description = 'array';
  var got = _._arrayPrependArrayOnce([ 0,1 ], [ 2,3 ]);
  var expected = [ 2,3,0,1 ];
  test.identical( got,expected );

  test.description = 'nothing';
  var got = _._arrayPrependArrayOnce([ 1,1 ]);
  var expected = [ 1,1 ];
  test.identical( got,expected );

  test.description = 'number';
  var got = _._arrayPrependArrayOnce([ 1,2 ], 3, 5);
  var expected = [ 3,5,1,2 ];
  test.identical( got,expected );

  test.description = 'string';
  var got = _._arrayPrependArrayOnce([ 1,2 ], 'str1', 'str2');
  var expected = [ 'str1','str2',1,2 ];
  test.identical( got,expected );

  test.description = 'object';
  var got = _._arrayPrependArrayOnce( [ 1,2 ], { a: 1 }, { b: 2 } );
  var expected = [ { a: 1 },{ b: 2 },1,2 ];
  test.identical( got,expected );

  test.description = 'null';
  var got = _._arrayPrependArrayOnce([ 3,9 ], null);
  var expected = [ null,3,9 ];
  test.identical( got,expected );


  if( Config.debug )
  {

    test.description = 'first argument is not array';
    test.shouldThrowError( function()
    {
      _._arrayPrependArrayOnce( 4,5 );
    });

    test.description = 'type of the argument is equal undefined';
    test.shouldThrowError( function()
    {
      _._arrayPrependArrayOnce( [ 1,3 ], undefined );
    });


    test.description = 'no arguments';
    test.shouldThrowError( function()
    {
      _._arrayPrependArrayOnce();
    });

  }

}*/

//

function arrayElementsSwap( test )
{

  test.description = 'an element';
  var got = _.arrayElementsSwap( [ 7 ], 0, 0 );
  var expected = [ 7 ];
  test.identical( got, expected );

  test.description = 'reverses first index and last index';
  var got = _.arrayElementsSwap( [ 1, 2, 3, 4, 5 ], 0, 4  );
  var expected = [ 5, 2, 3, 4, 1 ];
  test.identical( got, expected );

  /**/

  if( Config.debug )
  {

    test.description = 'no arguments';
    test.shouldThrowError( function()
    {
      _.arrayElementsSwap();
    });

    test.description = 'not enough arguments';
    test.shouldThrowError( function()
    {
      _.arrayElementsSwap( [ 1, 2, 3, 4, 5 ] );
    });

    test.description = 'wrong type of arguments';
    test.shouldThrowError( function()
    {
      _.arrayElementsSwap('wrong argument', 'wrong argument', 'wrong argument');
    });

    test.description = 'arguments[1] and arguments[2] are out of bound';
    test.shouldThrowError( function()
    {
      _.arrayElementsSwap( [ 1, 2, 3, 4, 5 ], -1, -4 );
    });

    test.description = 'first five arguments are not wrapped into array';
    test.shouldThrowError( function()
    {
      _.arrayElementsSwap( 1, 2, 3, 4, 5, 0, 4 );
    });

  }

};


function arrayFrom( test )
{

  test.description = 'an array';
  var got = _.arrayFrom( [ 3, 7, 13, 'abc', false, undefined, null, {} ] );
  var expected = [ 3, 7, 13, 'abc', false, undefined, null, {} ];
  test.identical( got, expected );

  test.description = 'an object';
  var got = _.arrayFrom( { a : 3, b : 7, c : 13 } );
  var expected = [ [ 'a', 3 ], [ 'b', 7 ], [ 'c', 13 ] ];
  test.identical( got, expected );

  test.description = 'a string';
  var got = _.arrayFrom( "3, 7, 13, 3.5abc, 5def, 7.5ghi, 13jkl" );
  var expected = [ 3, 7, 13, 3.5, 5, 7.5, 13 ];
  test.identical( got, expected );

  test.description = 'arguments[...]';
  var args = ( function() {
    return arguments;
  } )( 3, 7, 13, 'abc', false, undefined, null, { greeting: 'Hello there!' } );
  var got = _.arrayFrom( args );
  var expected = [ 3, 7, 13, 'abc', false, undefined, null, { greeting: 'Hello there!' } ];
  test.identical( got, expected );

  /**/

  if( Config.debug )
  {

    test.description = 'no argument';
    test.shouldThrowError( function()
    {
      _.arrayFrom();
    });

    test.description = 'wrong type of argument';
    test.shouldThrowError( function()
    {
      _.arrayFrom( 6 );
    });

    test.description = 'wrong type of argument';
    test.shouldThrowError( function()
    {
      _.arrayFrom( true );
    });

  }

};


function arrayToMap( test )
{

  test.description = 'an empty object';
  var got = _.arrayToMap( [  ] );
  var expected = {  };
  test.identical( got, expected );

  test.description = 'an object';
  var got = _.arrayToMap( [ 3, [ 1, 2, 3 ], 'abc', false, undefined, null, {} ] );
  var expected = { '0' : 3, '1' : [ 1, 2, 3 ], '2' : 'abc', '3' : false, '4' : undefined, '5' : null, '6' : {} };
  test.identical( got, expected );

  test.description = 'arguments[...]';
  var args = ( function() {
    return arguments;
  } )( 3, 'abc', false, undefined, null, { greeting: 'Hello there!' } );
  var got = _.arrayToMap( args );
  var expected = { '0' : 3, '1' : 'abc', '2' : false, '3' : undefined, '4' : null, '5' : { greeting: 'Hello there!' } };
  test.identical( got, expected );

  /**/

  if( Config.debug )
  {

    test.description = 'no argument';
    test.shouldThrowError( function()
    {
      _.arrayToMap();
    });

    test.description = 'wrong type of argument';
    test.shouldThrowError( function()
    {
      _.arrayToMap( 'wrong argument' );
    });

  }

};


// function __arrayRemoveArrayOnce( test )
// {
//
//   test.description = 'nothing';
//   var got = _.__arrayRemoveArrayOnce( [  ], [  ] );
//   var expected = 0;
//   test.identical( got, expected );
//
//   test.description = 'three elements left';
//   var got = _.__arrayRemoveArrayOnce( [ 1, 2, 3, 4, 5 ], [ 6, 2, 7, 5, 8 ] );
//   var expected = 2;
//   test.identical( got, expected );
//
//   test.description = 'one elements left';
//   var got = _.__arrayRemoveArrayOnce( [ 1, 2, 3, 4, 5 ], [ 6, 2, 7, 5, 8 ], function( a, b ) {
//     return a < b;
//   } );
//   var expected = 4;
//   test.identical( got, expected );
//
//   /**/
//
//   if( Config.debug )
//   {
//
//     test.description = 'no arguments';
//     test.shouldThrowError( function()
//     {
//       _.__arrayRemoveArrayOnce();
//     });
//
//     test.description = 'not enough arguments';
//     test.shouldThrowError( function()
//     {
//       _.__arrayRemoveArrayOnce( [ 1, 2, 3, 4, 5 ] );
//     });
//
//     test.description = 'wrong type of arguments';
//     test.shouldThrowError( function()
//     {
//       _.__arrayRemoveArrayOnce('wrong argument', 'wrong argument', 'wrong argument');
//     });
//
//     test.description = 'extra argument';
//     test.shouldThrowError( function()
//     {
//       _.__arrayRemoveArrayOnce( [ 1, 2, 3, 4, 5 ], [ 6, 2, 7, 5, 8 ], function( a, b ) { return a < b }, 'redundant argument' );
//     });
//
//   }
//
// };


function __arrayRemovedOnce( test )
{

  test.description = 'nothing';
  var got = _.__arrayRemovedOnce( [  ], 2 );
  var expected = -1;
  test.identical( got, expected );

  test.description = 'second element removed';
  var got = _.__arrayRemovedOnce( [ 2, 4, 6 ], 4 );
  var expected = 1;
  test.identical( got, expected );

  test.description = 'first element removed';
  var got = _.__arrayRemovedOnce( [ true, false, 6 ], true );
  var expected = 0;
  test.identical( got, expected );

  /**/

  if( Config.debug )
  {

    test.description = 'no arguments';
    test.shouldThrowError( function()
    {
      _.__arrayRemovedOnce();
    });

    test.description = 'not enough arguments';
    test.shouldThrowError( function()
    {
      _.__arrayRemovedOnce( [ 2, 4, 6 ] );
    });

    test.description = 'extra argument';
    test.shouldThrowError( function()
    {
      _.__arrayRemovedOnce( [ 2, 4, 6 ], 2, function( el ) { return el; }, 'redundant argument' );
    });

    test.description = 'arguments[0] is wrong';
    test.shouldThrowError( function()
    {
      _.__arrayRemovedOnce( 'wrong argument', 2 );
    });

    test.description = 'arguments[2] is wrong';
    test.shouldThrowError( function()
    {
      _.__arrayRemovedOnce( [ 2, 4, 6 ], 2, 'wrong argument' );
    });

  }

};


function __arrayRemoveOnce( test ) {

  test.description = 'nothing';
  var got = _.__arrayRemoveOnce( [  ], 2 );
  var expected = [  ];
  test.identical( got, expected );

  test.description = 'one element left';
  var got = _.__arrayRemoveOnce( [ 2, 4 ], 4 );
  var expected = [ 2 ];
  test.identical( got, expected );

  test.description = 'two elements left';
  var got = _.__arrayRemoveOnce( [ true, false, 6 ], true );
  var expected = [ false, 6 ];
  test.identical( got, expected );

  /**/

  if( Config.debug )
  {

    test.description = 'no arguments';
    test.shouldThrowError( function()
    {
      _.__arrayRemoveOnce();
    });

    test.description = 'not enough arguments';
    test.shouldThrowError( function()
    {
      _.__arrayRemoveOnce( [ 2, 4, 6 ] );
    });

    test.description = 'extra argument';
    test.shouldThrowError( function()
    {
      _.__arrayRemoveOnce( [ 2, 4, 6 ], 2, function( el, ins ) { return el > ins }, 'redundant argument' );
    });

    test.description = 'arguments[0] is wrong';
    test.shouldThrowError( function()
    {
      _.__arrayRemoveOnce( 'wrong argument', 2 );
    });

    test.description = 'arguments[2] is wrong';
    test.shouldThrowError( function()
    {
      _.__arrayRemoveOnce( [ 2, 4, 6 ], 2, 'wrong argument' );
    });

  }

};


// function arrayRemovedAll( test )
// {
//
//   test.description = 'nothing';
//   var got = _.arrayRemovedAll( [  ], 2 );
//   var expected = 0;
//   test.identical( got, expected );
//
//   test.description = 'one element removed';
//   var got = _.arrayRemovedAll( [ 2, 4, 6 ], 4 );
//   var expected = 1;
//   test.identical( got, expected );
//
//   test.description = 'two elements removed';
//   var got = _.arrayRemovedAll( [ true, false, 6, true ], true );
//   var expected = 2;
//   test.identical( got, expected );
//
//   test.description = 'three elements removed';
//   var got = _.arrayRemovedAll( [ 2, 4, 6, 7 ], 2, function ( el, ins ) {
//     return el > ins;
//   });
//   var expected = 3;
//   test.identical( got, expected );
//
//   /**/
//
//   if( Config.debug )
//   {
//
//     test.description = 'no arguments';
//     test.shouldThrowError( function()
//     {
//       _.arrayRemovedAll();
//     });
//
//     test.description = 'not enough arguments';
//     test.shouldThrowError( function()
//     {
//       _.arrayRemovedAll( [ 2, 4, 6 ] );
//     });
//
//     test.description = 'extra argument';
//     test.shouldThrowError( function()
//     {
//       _.arrayRemovedAll( [ 2, 4, 6 ], 2, function( el, ins ) { return el > ins }, 'redundant argument' );
//     });
//
//     test.description = 'arguments[0] is wrong';
//     test.shouldThrowError( function()
//     {
//       _.arrayRemovedAll( 'wrong argument', 2 );
//     });
//
//     test.description = 'arguments[2] is wrong';
//     test.shouldThrowError( function()
//     {
//       _.arrayRemovedAll( [ 2, 4, 6 ], 2, 'wrong argument' );
//     });
//
//   }
//
// };
//
//
// function arrayRemoveAll( test ) {
//
//   test.description = 'nothing';
//   var got = _.arrayRemoveAll( [  ], 2 );
//   var expected = [  ];
//   test.identical( got, expected );
//
//   test.description = 'one element left';
//   var got = _.arrayRemoveAll( [ 2, 4 ], 4 );
//   var expected = [ 2 ];
//   test.identical( got, expected );
//
//   test.description = 'two elements left';
//   var got = _.arrayRemoveAll( [ true, false, 6 ], true );
//   var expected = [ false, 6 ];
//   test.identical( got, expected );
//
//   test.description = 'two elements left';
//   var got = _.arrayRemoveAll( [ 2, 1, 4, 6 ], 2, function ( el, ins ) {
//     return el > ins;
//   });
//   var expected = [ 2, 1 ];
//   test.identical( got, expected );
//
//   /**/
//
//   if( Config.debug )
//   {
//
//     test.description = 'no arguments';
//     test.shouldThrowError( function()
//     {
//       _.arrayRemoveAll();
//     });
//
//     test.description = 'not enough arguments';
//     test.shouldThrowError( function()
//     {
//       _.arrayRemoveAll( [ 2, 4, 6 ] );
//     });
//
//     test.description = 'extra argument';
//     test.shouldThrowError( function()
//     {
//       _.arrayRemoveAll( [ 2, 4, 6 ], 2, function( el, ins ) { return el > ins }, 'redundant argument' );
//     });
//
//     test.description = 'arguments[0] is wrong';
//     test.shouldThrowError( function()
//     {
//       _.arrayRemoveAll( 'wrong argument', 2 );
//     });
//
//     test.description = 'arguments[2] is wrong';
//     test.shouldThrowError( function()
//     {
//       _.arrayRemoveAll( [ 2, 4, 6 ], 2, 'wrong argument' );
//     });
//
//   }
//
// }

//

function arrayReplaceOnce( test )
{

  test.description = 'nothing';
  var got = _.arrayReplaceOnce( [  ], 0, 0 );
  var expected = -1;
  test.identical( got, expected );

  test.description = 'second element';
  var got = _.arrayReplaceOnce( [ 1, undefined, 3, 4, 5 ], undefined, 2 );
  var expected = 1;
  test.identical( got, expected );

  test.description = 'third element';
  var got = _.arrayReplaceOnce( [ 'Petre', 'Mikle', 'Oleg', 'Dmitry' ], 'Dmitry', 'Bob' );
  var expected = 3;
  test.identical( got, expected );

  test.description = 'fourth element';
  var got = _.arrayReplaceOnce( [ true, true, true, true, false ], false, true );
  var expected = 4;
  test.identical( got, expected );

  /**/

  if( Config.debug )
  {

    test.description = 'no arguments';
    test.shouldThrowError( function()
    {
      _.arrayReplaceOnce();
    });

    test.description = 'not enough arguments';
    test.shouldThrowError( function()
    {
      _.arrayReplaceOnce( [ 1, 2, undefined, 4, 5 ] );
    });

    test.description = 'extra argument';
    test.shouldThrowError( function()
    {
      _.arrayReplaceOnce( [ 1, 2, undefined, 4, 5 ], undefined, 3, 'redundant argument' );
    });

    test.description = 'arguments[0] is wrong';
    test.shouldThrowError( function()
    {
      _.arrayReplaceOnce( 'wrong argument', undefined, 3 );
    });

  }

}

//

function arrayUpdate( test )
{

  test.description = 'add a new element';
  var got = _.arrayUpdate( [  ], 1, 1 );
  var expected = 0;
  test.identical( got, expected );

  test.description = 'add a new element';
  var got = _.arrayUpdate( [ 1, 2, 3, 4, 5 ], 6, 6 );
  var expected = 5;
  test.identical( got, expected );

  test.description = 'add a new element';
  var got = _.arrayUpdate( [ 'Petre', 'Mikle', 'Oleg' ], 'Dmitry', 'Dmitry' );
  var expected = 3;
  test.identical( got, expected );

  test.description = 'change the fourth element';
  var got = _.arrayUpdate( [ true, true, true, true, false ], false, true );
  var expected = 4;
  test.identical( got, expected );

  /**/

  if( Config.debug )
  {

    test.description = 'no arguments';
    test.shouldThrowError( function()
    {
      _.arrayUpdate();
    });

    test.description = 'not enough arguments';
    test.shouldThrowError( function()
    {
      _.arrayUpdate( [ 1, 2, 3, 4, 5 ] );
    });

    test.description = 'extra argument';
    test.shouldThrowError( function()
    {
      _.arrayUpdate( [ 1, 2, 3, 4, 5 ], 6, 6, 'redundant argument' );
    });

    test.description = 'arguments[0] is wrong';
    test.shouldThrowError( function()
    {
      _.arrayUpdate( 'wrong argument', 6, 6 );
    });

  }

}

// //
//
// function _arrayAppendOnce( test )
// {
//
//   test.description = 'add a new element';
//   var got = _._arrayAppendOnce( [  ], 1 );
//   var expected = [ 1 ];
//   test.identical( got, expected );
//
//   test.description = 'add a new element';
//   var got = _._arrayAppendOnce( [ 1, 2, 3, 4 ], 5 );
//   var expected = [ 1, 2, 3, 4, 5 ];
//   test.identical( got, expected );
//
//   test.description = 'nothing to add';
//   var got = _._arrayAppendOnce( [ 1, 2, 3, 4, 5 ], 5 );
//   var expected = [ 1, 2, 3, 4, 5 ];
//   test.identical( got, expected );
//
//   test.description = 'add a new element';
//   var got = _._arrayAppendOnce( [ 'Petre', 'Mikle', 'Oleg' ], 'Dmitry' );
//   var expected = [ 'Petre', 'Mikle', 'Oleg', 'Dmitry' ];
//   test.identical( got, expected );
//
//   test.description = 'nothing add';
//   var got = _._arrayAppendOnce( [ 'Petre', 'Mikle', 'Oleg', 'Dmitry' ], 'Dmitry' );
//   var expected = [ 'Petre', 'Mikle', 'Oleg', 'Dmitry' ];
//   test.identical( got, expected );
//
//   /**/
//
//   if( Config.debug )
//   {
//
//     test.description = 'no arguments';
//     test.shouldThrowError( function()
//     {
//       _._arrayAppendOnce();
//     });
//
//     test.description = 'not enough arguments';
//     test.shouldThrowError( function()
//     {
//       _._arrayAppendOnce( [ 1, 2, 3, 4, 5 ] );
//     });
//
//     test.description = 'extra argument';
//     test.shouldThrowError( function()
//     {
//       _._arrayAppendOnce( [ 1, 2, 3, 4, 5 ], 6, 'redundant argument' );
//     });
//
//     test.description = 'arguments[0] is wrong';
//     test.shouldThrowError( function()
//     {
//       _._arrayAppendOnce( 'wrong argument', 5 );
//     });
//
//   }
//
// }
//
// //
//
// function _arrayPrependOnce( test )
// {
//
//   test.description = 'add a new element';
//   var got = _._arrayPrependOnce( [  ], 1 );
//   var expected = [ 1 ];
//   test.identical( got, expected );
//
//   test.description = 'add a new element';
//   var got = _._arrayPrependOnce( [ 1, 2, 3, 4 ], 5 );
//   var expected = [ 5, 1, 2, 3, 4 ];
//   test.identical( got, expected );
//
//   test.description = 'nothing add';
//   var got = _._arrayPrependOnce( [ 1, 2, 3, 4, 5 ], 5 );
//   var expected = [ 1, 2, 3, 4, 5 ];
//   test.identical( got, expected );
//
//   test.description = 'add a new element';
//   var got = _._arrayPrependOnce( [ 'Petre', 'Mikle', 'Oleg' ], 'Dmitry' );
//   var expected = [ 'Dmitry', 'Petre', 'Mikle', 'Oleg' ];
//   test.identical( got, expected );
//
//   test.description = 'nothing add';
//   var got = _._arrayPrependOnce( [ 'Petre', 'Mikle', 'Oleg', 'Dmitry' ], 'Dmitry' );
//   var expected = [ 'Petre', 'Mikle', 'Oleg', 'Dmitry' ];
//   test.identical( got, expected );
//
//   /**/
//
//   if( Config.debug )
//   {
//
//     test.description = 'no arguments';
//     test.shouldThrowError( function()
//     {
//       _._arrayPrependOnce();
//     });
//
//     test.description = 'not enough arguments';
//     test.shouldThrowError( function()
//     {
//       _._arrayPrependOnce( [ 1, 2, 3, 4, 5 ] );
//     });
//
//     test.description = 'extra argument';
//     test.shouldThrowError( function()
//     {
//       _._arrayPrependOnce( [ 1, 2, 3, 4, 5 ], 6, 'redundant argument' );
//     });
//
//     test.description = 'arguments[0] is wrong';
//     test.shouldThrowError( function()
//     {
//       _._arrayPrependOnce( 'wrong argument', 5 );
//     });
//
//   }
//
// };

//

function arrayCutin( test )
{

  debugger;

  test.description = 'range as single number';

  /* */

  var dst = [ 1, 2, 3, 4 ];
  var got = _.arrayCutin( dst, 2 );
  var expected = [ 3 ];
  test.identical( got, expected );
  test.identical( dst, [ 1, 2, 4 ] )

  /* */

  var dst = [ 1, 2, 3, 4 ];
  var got = _.arrayCutin( dst, -1 );
  var expected = [];
  test.identical( got, expected );
  test.identical( dst, [ 1, 2, 3, 4 ] )

  /* */

  var dst = [ 1, 2, 3, 4 ];
  var got = _.arrayCutin( dst, 0, [ 0 ] );
  var expected = [ 1 ];
  test.identical( got, expected );
  test.identical( dst, [ 0, 2, 3, 4 ] )

  /* */

  var dst = [ 1, 2, 3, 4 ];
  var got = _.arrayCutin( dst, 0, [] );
  var expected = [ 1 ];
  test.identical( got, expected );
  test.identical( dst, [ 2, 3, 4 ] )



  test.description = 'empth';
  var dst = [];
  var cut = _.arrayCutin( [],[],[] );
  test.identical( cut, [] );
  test.identical( dst, [] );

  /* */

  test.description = 'remove two elements';
  var dst = [ 1, 2, 3, 4, 5 ];
  var cut = _.arrayCutin( dst, [ 1, 3 ], [] );
  var expected = [ 1, 4, 5 ];
  test.identical( dst, expected );
  var expected = [ 2, 3 ];
  test.identical( cut, expected );

  /* */

  test.description = 'remove two elements and incut three';
  var dst = [ 1, 2, 3, 4, 5 ];
  var cut = _.arrayCutin( dst, [ 1, 3 ], [ 11, 22, 33 ] );
  var expected = [ 1, 11, 22, 33, 4, 5 ];
  test.identical( dst, expected );
  var expected = [ 2, 3 ];
  test.identical( cut, expected );

  /* */

  test.description = 'pass only begin of range';
  var dst = [ 1, 2, 3, 4, 5 ];
  var cut = _.arrayCutin( dst, [ 1 ], [ 11, 22, 33 ] );
  var expected = [ 1, 11, 22, 33, 2, 3, 4, 5 ];
  test.identical( dst, expected );
  var expected = [];
  test.identical( cut, expected );

  /* */

  test.description = 'pass empty range';
  var dst = [ 1, 2, 3, 4, 5 ];
  var cut = _.arrayCutin( dst, [], [ 11, 22, 33 ] );
  var expected = [ 11, 22, 33, 1, 2, 3, 4, 5 ];
  test.identical( dst, expected );
  var expected = [];
  test.identical( cut, expected );

  /* */

  test.description = 'pass number instead of range';
  var dst = [ 1, 2, 3, 4, 5 ];
  var cut = _.arrayCutin( dst, 1, [ 11, 22, 33 ] );
  var expected = [ 1, 11, 22, 33, 3, 4, 5 ];
  test.identical( dst, expected );
  var expected = [ 2 ];
  test.identical( cut, expected );

  /* */

  test.description = 'no source, number istead of range';
  var dst = [ 1, 2, 3, 4, 5 ];
  var cut = _.arrayCutin( dst, 1 );
  var expected = [ 1, 3, 4, 5 ];
  test.identical( dst, expected );
  var expected = [ 2 ];
  test.identical( cut, expected );

  /* */

  test.description = 'no source';
  var dst = [ 1, 2, 3, 4, 5 ];
  var cut = _.arrayCutin( dst, [ 1, 3 ] );
  var expected = [ 1, 4, 5 ];
  test.identical( dst, expected );
  var expected = [ 2, 3 ];
  test.identical( cut, expected );

  /* */

  test.description = 'out of bound, begin';
  var dst = [ 1, 2, 3, 4, 5 ];
  var cut = _.arrayCutin( dst, [ -10,2 ],[ 11, 22, 33 ] );
  var expected = [ 11, 22, 33, 3, 4, 5 ];
  test.identical( dst, expected );
  var expected = [ 1, 2 ];
  test.identical( cut, expected );

  /* */

  test.description = 'out of bound, end';
  var dst = [ 1, 2, 3, 4, 5 ];
  var cut = _.arrayCutin( dst, [ 3,10 ],[ 11, 22, 33 ] );
  var expected = [ 1, 2, 3, 11, 22, 33 ];
  test.identical( dst, expected );
  var expected = [ 4, 5 ];
  test.identical( cut, expected );

  /* */

  test.description = 'out of bound, both sides';
  var dst = [ 1, 2, 3, 4, 5 ];
  var cut = _.arrayCutin( dst, [ -10,10 ],[ 11, 22, 33 ] );
  var expected = [ 11, 22, 33 ];
  test.identical( dst, expected );
  var expected = [ 1, 2, 3, 4, 5 ];
  test.identical( cut, expected );

  /* */

  test.description = 'negative, both sides';
  var dst = [ 1, 2, 3, 4, 5 ];
  var cut = _.arrayCutin( dst, [ -1, -1 ],[ 11, 22, 33 ] );
  var expected = dst;
  test.identical( dst, expected );
  var expected = [ ];
  test.identical( cut, expected );

  /* */

  test.description = 'zero, both sides';
  var dst = [ 1, 2, 3, 4, 5 ];
  var cut = _.arrayCutin( dst, [ 0, 0 ],[ 11, 22, 33 ] );
  var expected = dst;
  test.identical( dst, expected );
  var expected = [ ];
  test.identical( cut, expected );

  /* first > last */

  test.description = 'first > last';
  var dst = [ 1, 2, 3, 4, 5 ];
  var cut = _.arrayCutin( dst, [ 9, 0 ],[ 11, 22, 33 ] );
  var expected = dst;
  test.identical( dst, expected );
  var expected = [ ];
  test.identical( cut, expected );

  /* Buffers */

  var list =
  [
    Int8Array,
    Uint8Array,
    Uint8ClampedArray,
    Int16Array,
    Uint16Array,
    Int32Array,
    Uint32Array,
    Float32Array,
    Float64Array,
    ArrayBuffer
  ];

  if( !isBrowser )
  list.push( Buffer );

  for( var i = 0; i < list.length; i++ )
  {
    test.description = 'buffers: ' + list[ i ].name;

    var array = new list[ i ]( 5 );
    for( var j = 0; j < 5; j++ )
    array[ j ] = j + 1;

    //array [ 1,2,3,4,5 ]

    /* simple cut */

    var got = _.arrayCutin( array, 0 );
    var expected = [ 2, 3, 4, 5 ];
    expected = _.arrayCutin( new list[ i ]( 1 ), 0, expected );
    test.identical( got,expected );

    /* simple cut, add one element to begin */

    var got = _.arrayCutin( array, 0, [ 9 ] );
    var expected = [ 9, 2, 3, 4, 5 ];
    expected = _.arrayCutin( new list[ i ]( 1 ), 0, expected );
    test.identical( got,expected );

    /* simple cut */

    var got = _.arrayCutin( array, 4 );
    var expected = [ 1, 2, 3, 4 ];
    expected = _.arrayCutin( new list[ i ]( 1 ), 0, expected );
    test.identical( got,expected );

    /* range */

    var got = _.arrayCutin( array, [ 0, 1 ] );
    var expected = [ 2, 3, 4, 5 ];
    expected = _.arrayCutin( new list[ i ]( 1 ), 0, expected );
    test.identical( got,expected );

    /* range */

    var got = _.arrayCutin( array, [ 2, 5 ] );
    var expected = [ 1, 2 ];
    expected = _.arrayCutin( new list[ i ]( 1 ), 0, expected );
    test.identical( got,expected );

    /* single, add new elements to end */

    var got = _.arrayCutin( array, 4, [ 6, 7 ] );
    var expected = [ 1, 2, 3, 4, 6, 7 ];
    expected = _.arrayCutin( new list[ i ]( 1 ), 0, expected );
    test.identical( got,expected );

    /* range, add new elements to end */

    var got = _.arrayCutin( array, [ 4, 5 ], [ 6, 7 ] );
    var expected = [ 1, 2, 3, 4, 6, 7 ];
    expected = _.arrayCutin( new list[ i ]( 1 ), 0, expected );
    test.identical( got,expected );

    /* out of range, returns original */

    var got = _.arrayCutin( array, 10, [ 6, 7 ] );
    var expected = array;
    test.identical( got,expected );

    /* remove all, last index is out of range */

    var got = _.arrayCutin( array, [ 0, 99 ] );
    var expected = new list[ i ]( 0 );
    test.identical( got.byteLength,expected.byteLength );

    /* remove all and fill with new values */

    var got = _.arrayCutin( array, [ 0, 99 ], [ 1, 2, 3, 4, 5 ] );
    var expected = array;
    test.identical( got,expected );

    /* negative */

    var got = _.arrayCutin( array, [ 0, -1 ] );
    var expected = array;
    test.identical( got,expected );

    /* negative */

    var got = _.arrayCutin( array, [ -1, -1 ] );
    var expected = array;
    test.identical( got,expected );

    /* zero, returns original */

    var got = _.arrayCutin( array, [ 0, 0 ], [ 1 ] );
    var expected = array;
    test.identical( got,expected );

    /* empty */

    var got = _.arrayCutin( array, [], [] );
    var expected = array;
    test.identical( got, expected );

  }



  if( Config.debug )
  {

    test.description = 'no arguments';
    test.shouldThrowError( function()
    {
      _.arrayCutin();
    });

    test.description = 'not enough arguments';
    test.shouldThrowError( function()
    {
      _.arrayCutin( [ 1, 2, 3, 4, 5 ] );
    });

    test.description = 'redundant argument';
    test.shouldThrowError( function()
    {
      _.arrayCutin( [ 1, 'a', 'b', 'c', 5 ], [ 2, 3, 4 ], 1, 3, 'redundant argument' );
    });

    test.description = 'wrong type of arguments';
    test.shouldThrowError( function()
    {
      _.arrayCutin( 'wrong argument', 'wrong argument', 'wrong argument', 'wrong argument' );
    });

    test.description = 'wrong type of argument';
    test.shouldThrowError( function()
    {
      _.arrayCutin( [],[ 'x' ],3 );
    });

  }

};

//

function arraySlice( test )
{
  var got,expected;

  //

  test.description = 'defaults';
  var array = [ 1, 2, 3, 4, 5, 6, 7 ];

  /*nothing*/

  got = _.arraySlice( [  ] );
  expected = [  ];
  test.identical( got, expected );

  /*just pass array*/

  got = _.arraySlice( array );
  expected = array;
  test.identical( got, expected );

  //

  test.description = 'make copy of source';

  /* third argument is not provided */

  got = _.arraySlice( array, 2 );
  expected = [ 3, 4, 5, 6, 7 ];
  test.identical( got, expected );

  /* second argument is undefined */

  got = _.arraySlice( array, undefined, 4  );
  expected = [ 1, 2, 3, 4 ];
  test.identical( got, expected );

  /* from two to six */

  test.description = 'from two to six';
  got = _.arraySlice( array, 2, 6 );
  expected = [ 3, 4, 5, 6 ];
  test.identical( got, expected );

  /* indexes are out of bound */

  got = _.arraySlice( [ 1,2,3 ], 5, 8 );
  expected = [];
  test.identical( got, expected );

  /* left bound is negative */

  got = _.arraySlice( array, -1, array.length );
  expected = array;
  test.identical( got, expected );

  /* rigth bound is negative */

  got = _.arraySlice( array, 0, -1 );
  expected = [];
  test.identical( got, expected );

  /* rigth bound is out of range */

  got = _.arraySlice( array, 0, array.length + 2 );
  expected = array;
  test.identical( got, expected );

  /**/

  if( Config.debug )
  {
    test.description = 'buffer';

    /**/

    got = _.arraySlice( new Buffer( '123' ), 0, 1 );
    expected = [ 49 ];
    test.identical( got, expected );

    //

    test.description = 'no arguments';
    test.shouldThrowError( function()
    {
      _.arraySlice();
    });

    //

    test.description = 'wrong type of argument';
    test.shouldThrowError( function()
    {
      _.arraySlice( 'wrong argument', 'wrong argument', 'wrong argument' );
    });

  }

};

//

function arrayGrow( test )
{
  var got,expected;
  var array = [ 1,2,3,4,5 ];

  test.description = 'defaults';

  /* default call returns copy */

  got = _.arrayGrow( array );
  expected = array;
  test.identical( got, expected );

  test.description = 'increase size of array';

  /* without setting value */

  got = _.arrayGrow( array, 0, array.length + 2 );
  expected = array.length + 2;
  test.identical( got.length, expected );

  /* by setting value */

  got = _.arrayGrow( array, 0, array.length + 2, 0 );
  expected = [ 1,2,3,4,5,0,0 ];
  test.identical( got, expected );

  /* by taking only last element of source array */

  got = _.arrayGrow( array, array.length - 1, array.length * 2, 0 );
  expected = [ 5,0,0,0,0,0 ];
  test.identical( got, expected );

  test.description = 'decrease size of array';

  /**/

  got = _.arrayGrow( array, 0, 3 );
  expected = [ 1,2,3 ];
  test.identical( got, expected );

  /* setting value not affects on array */

  got = _.arrayGrow( array, 0, 3, 0 );
  expected = [ 1,2,3 ];
  test.identical( got, expected );

  /* begin index is negative */

  got = _.arrayGrow( array, -1, 3 );
  expected = [ undefined,1,2,3 ];
  test.identical( got, expected );

  /* end index is negative */

  got = _.arrayGrow( array, 0, -1 );
  expected = [];
  test.identical( got, expected );

  /* begin index negative, set value */

  got = _.arrayGrow( array, -1, 3, 0 );
  expected = [ 0, 1,2,3 ];
  test.identical( got, expected );

  //

  if( Config.debug )
  {
    test.description = 'buffer';

    /**/

    got = _.arrayGrow( new Buffer( '123' ), 0, 5, 0 );
    expected = [ 49, 50, 51, 0, 0 ];
    test.identical( got, expected );

    //

    test.description = 'invalid arguments type';

    /**/

    test.shouldThrowErrorSync( function()
    {
      _.arrayGrow( 1 );
    })

    /**/

    test.shouldThrowErrorSync( function()
    {
      _.arrayGrow( array, '1', array.length )
    })

    /**/

    test.shouldThrowErrorSync( function()
    {
      _.arrayGrow( array, 0, '1' )
    })

  }

}

//

function arrayAs( test )
{

  test.description = 'nothing';
  var got = _.arrayAs();
  var expected = [  ];
  test.identical( got, expected );

  test.description = 'an empty array';
  var got = _.arrayAs( [  ] );
  var expected = [  ];
  test.identical( got, expected );

  test.description = 'undefined';
  var got = _.arrayAs( undefined );
  var expected = [  ];
  test.identical( got, expected );

  test.description = 'null';
  var got = _.arrayAs( null );
  var expected = [  ];
  test.identical( got, expected );

  test.description = 'array contains an object';
  var got = _.arrayAs( { a : 1, b : 2 } );
  var expected = [ { a : 1, b : 2 } ];
  test.identical( got, expected );

  test.description = 'array contains boolean';
  var got = _.arrayAs( true );
  var expected = [ true ];
  test.identical( got, expected );

  /**/

  if( Config.debug )
  {



  }

};

function arrayToStr( test )
{

  test.description = 'nothing';
  var got = _.arrayToStr( [  ] );
  var expected = "";
  test.identical( got, expected );

  test.description = 'returns the string';
  var got = _.arrayToStr( 'abcdefghijklmnopqrstuvwxyz', { type : 'int' } );
  var expected = "a b c d e f g h i j k l m n o p q r s t u v w x y z ";
  test.identical( got, expected );

  test.description = 'returns a single string representing the integer values';
  var got = _.arrayToStr( [ 1, 2, 3 ], { type : 'int' } );
  var expected = "1 2 3 ";
  test.identical( got, expected );

  test.description = 'returns a single string representing the float values';
  var got = _.arrayToStr( [ 3.5, 13.77, 7.33 ], { type : 'float', precission : 4 } );
  var expected = "3.500 13.77 7.330";
  test.identical( got, expected );

  /**/

  if( Config.debug )
  {

    test.description = 'no arguments';
    test.shouldThrowError( function()
    {
      _.arrayToStr();
    });

    test.description = 'in second argument property (type) is wrong';
    test.shouldThrowError( function()
    {
      _.arrayToStr( [ 1, 2, 3 ], { type : 'wrong type' } );
    });

    test.description = 'in second argument property (type) is not provided';
    test.shouldThrowError( function()
    {
      _.arrayToStr( [ 1, 2, 3 ], { precission : 4 } );
    });

    test.description = 'first argument is string';
    test.shouldThrowError( function()
    {
      _.arrayToStr( 'wrong argument', {  type : 'float' } );
    });

  }

};


function arrayPut( test )
{

  test.description = 'adds after second element';
  var got = _.arrayPut( [ 1, 2, 3, 4, 5, 6, 9 ], 2, 'str', true, [ 7, 8 ] );
  var expected = [ 1, 2, 'str', true, 7, 8, 9 ];
  test.identical( got, expected );

  test.description = 'adds at the beginning';
  var got = _.arrayPut( [ 1, 2, 3, 4, 5, 6, 9 ], 0, 'str', true, [ 7, 8 ] );
  var expected = [ 'str', true, 7, 8, 5, 6, 9 ];
  test.identical( got, expected );

  /**/

  if( Config.debug )
  {

    test.description = 'no arguments';
    test.shouldThrowError( function()
    {
      _.arrayPut();
    });

    test.description = 'wrong type of arguments';
    test.shouldThrowError( function()
    {
      _.arrayPut( 'wrong argument', 'wrong argument', 'str', true, [ 7, 8 ] );
    });

  }

};


function arrayMask( test )
{

  test.description = 'nothing';
  var got = _.arrayMask( [ 1, 2, 3, 4 ], [ undefined, null, 0, '' ] );
  var expected = [  ];
  test.identical( got, expected );

  test.description = 'adds last three values';
  var got = _.arrayMask( [ 'a', 'b', 'c', 4, 5 ], [ 0, '', 1, 2, 3 ] );
  var expected = [ "c", 4, 5 ];
  test.identical( got, expected );

  test.description = 'adds the certain values';
  var got = _.arrayMask( [ 'a', 'b', 'c', 4, 5, 'd' ], [ 3, 7, 0, '', 13, 33 ] );
  var expected = [ "a", 'b', 5, 'd' ];
  test.identical( got, expected );

  /**/


  if( Config.debug )
  {

    test.description = 'no arguments';
    test.shouldThrowError( function()
    {
      _.arrayMask();
    });

    test.description = 'not enough arguments';
    test.shouldThrowError( function()
    {
      _.arrayMask( [ 1, 2, 3, 4 ] );
    });

    test.description = 'extra argument';
    test.shouldThrowError( function()
    {
      _.arrayMask( [ 'a', 'b', 'c', 4, 5 ], [ 0, '', 1, 2, 3 ], 'redundant argument' );
    });

    test.description = 'wrong type of arguments';
    test.shouldThrowError( function()
    {
      _.arrayMask( 'wrong argument', 'wrong argument' );
    });

    test.description = 'both arrays are empty';
    test.shouldThrowError( function()
    {
      _.arrayMask( [  ], [  ] );
    });

    test.description = 'length of the first array is not equal to the second array';
    test.shouldThrowError( function()
    {
      _.arrayMask( [ 1, 2, 3 ], [ undefined, null, 0, '' ] );
    });

    test.description = 'length of the second array is not equal to the first array';
    test.shouldThrowError( function()
    {
      _.arrayMask( [ 1, 2, 3, 4 ], [ undefined, null, 0 ] );
    });

  }

};


function arrayDuplicate( test )
{

  test.description = 'couple of repeats';
  var got = _.arrayDuplicate( [ 'a', 'b', 'c' ] );
  var expected = [ 'a', 'a', 'b', 'b', 'c', 'c' ];
  test.identical( got, expected );

  test.description = 'different options';
  var options = {
    src : [ 'abc', 'def' ],
    result : [  ],
    numberOfAtomsPerElement : 2,
    numberOfDuplicatesPerElement : 3
  };
  var got = _.arrayDuplicate( options );
  var expected = [ 'abc', 'def', 'abc', 'def', 'abc', 'def' ];
  test.identical( got, expected );

  test.description = 'second argument is replaced and non-existent elements from options.src is replaced undefined';
  var options = {
    src : [ 'abc', 'def' ],
    result : [  ],
    numberOfAtomsPerElement : 3,
    numberOfDuplicatesPerElement : 3
  };
  var got = _.arrayDuplicate( options, { a : 7, b : 13 } );
  var expected = [ 'abc', 'def', undefined, 'abc', 'def', undefined, 'abc', 'def', undefined ];
  test.identical( got, expected );

  /**/

  if( Config.debug )
  {

    test.description = 'no arguments';
    test.shouldThrowError( function()
    {
      _.arrayDuplicate();
    });

    test.description = 'second argument is wrong';
    test.shouldThrowError( function()
    {
      _.arrayDuplicate( [ 'a', 'b', 'c' ], 'wrong argument' );
    });

    test.description = 'options.src is not provided or "undefined"';
    var options = {
      src : undefined,
      result : [  ],
      numberOfAtomsPerElement : 3,
      numberOfDuplicatesPerElement : 3
    };
    test.shouldThrowError( function()
    {
      _.arrayDuplicate( options, { a : 13 } );
    });

  }

};


function arrayFill( test )
{

  test.description = 'an element';
  var got = _.arrayFill( [ 7 ] );
  var expected = [ 0 ];
  test.identical( got, expected );

  test.description = 'an object';
  var got = _.arrayFill( { times : 5, value : 3 } );
  var expected = [ 3, 3, 3, 3, 3 ];
  test.identical( got, expected );

  test.description = 'an array';
  var got = _.arrayFill( [ 1, 2, 3 ] );
  var expected = [ 0, 0, 0 ];
  test.identical( got, expected );

  test.description = 'a number';
  var got = _.arrayFill( 3 );
  var expected = [ 0, 0, 0 ];
  test.identical( got, expected );

  /**/

  if( Config.debug )
  {

    test.description = 'no arguments';
    test.shouldThrowError( function()
    {
      _.arrayFill();
    });

    test.description = 'array is empty';
    test.shouldThrowError( function()
    {
      _.arrayFill( [  ] );
    });

    test.description = 'wrong argument';
    test.shouldThrowError( function()
    {
      _.arrayFill( 'wrong argument' );
    });

  }

};


function arrayCompare( test )
{

  test.description = 'empty arrays';
  var got = _.arrayCompare( [  ], [  ] );
  var expected = 0;
  test.identical( got, expected );

  test.description = 'first array is empty';
  var got = _.arrayCompare( [  ], [ 1, 2 ] );
  var expected = 0;
  test.identical( got, expected );

  test.description = 'length of the first array is less than second';
  var got = _.arrayCompare( [ 4 ], [ 1, 2 ] );
  var expected = 3;
  test.identical( got, expected );

  test.description = 'arrays are equal';
  var got = _.arrayCompare( [ 1, 5 ], [ 1, 5 ] );
  var expected = 0;
  test.identical( got, expected );

  test.description = 'a difference';
  var got = _.arrayCompare( [ 1, 5 ], [ 1, 2 ] );
  var expected = 3;
  test.identical( got, expected );

  test.description = 'a negative difference';
  var got = _.arrayCompare( [ 1, 5 ], [ 1, 6 ] );
  var expected = -1;
  test.identical( got, expected );

  test.description = 'array-like arguments';
  function src1() {
    return arguments;
  }( 1, 5 );
  function src2() {
    return arguments;
  }( 1, 2 );
  var got = _.arrayCompare( src1, src2 );
  var expected = 3;
  test.identical( got, expected );

  /**/

  if( Config.debug )
  {

    test.description = 'no arguments';
    test.shouldThrowError( function()
    {
      _.arrayCompare();
    });

    test.description = 'not enough arguments';
    test.shouldThrowError( function()
    {
      _.arrayCompare( [ 1, 5 ] );
    });

    test.description = 'extra argument';
    test.shouldThrowError( function()
    {
      _.arrayCompare( [ 1, 5 ], [ 1, 2 ], 'redundant argument' );
    });

    test.description = 'wrong type of arguments';
    test.shouldThrowError( function()
    {
      _.arrayCompare( 'wrong argument', 'wrong argument' );
    });

    test.description = 'second array is empty';
    test.shouldThrowError( function()
    {
      _.arrayCompare( [ 1, 5 ], [  ] );
    });

    test.description = 'length of the second array is less than first';
    test.shouldThrowError( function()
    {
      _.arrayCompare( [ 1, 5 ], [ 1 ] );
    });

  }

};


function arraySame( test )
{

  test.description = 'empty arrays';
  var got = _.arraySame( [  ], [  ] );
  var expected = true;
  test.identical( got, expected );

  test.description = 'arrays are equal';
  var got = _.arraySame( [ 1, 2, 3 ], [ 1, 2, 3 ] );
  var expected = true;
  test.identical( got, expected );

  test.description = 'array-like arguments';
  function src1() {
    return arguments;
  }( 3, 7, 13 );
  function src2() {
    return arguments;
  }( 3, 7, 33 );
  var got = _.arraySame( src1, src2 );
  var expected = false;
  test.identical( got, expected );

  test.description = 'arrays are not equal';
  var got = _.arraySame( [ 1, 2, 3, 'Hi!' ], [ 1, 2, 3, 'Hello there!' ] );
  var expected = false;
  test.identical( got, expected );

  test.description = 'arrays length are not equal';
  var got = _.arraySame( [ 1, 2, 3 ], [ 1, 2 ] );
  var expected = false;
  test.identical( got, expected );

  /**/

  if( Config.debug )
  {

    test.description = 'no arguments';
    test.shouldThrowError( function()
    {
      _.arraySame();
    });

    test.description = 'not enough arguments';
    test.shouldThrowError( function()
    {
      _.arraySame( [ 1, 2, 3 ] );
    });

    test.description = 'extra argument';
    test.shouldThrowError( function()
    {
      _.arraySame( [ 1, 2, 3 ], [ 1, 2 ], 'redundant argument' );
    });

  }

};


function arrayLeftIndexOf( test )
{

  test.description = 'nothing';
  var got = _.arrayLeftIndexOf( [  ], 3 );
  var expected = -1;
  test.identical( got, expected );

  test.description = 'second index';
  var got = _.arrayLeftIndexOf( [ 1, 2, 3 ], 3 );
  var expected = 2;
  test.identical( got, expected );

  test.description = 'zero index';
  var got = _.arrayLeftIndexOf( [ 1, 2, 3 ], 3, function( el, ins ) { return el < ins } );
  var expected = 0;
  test.identical( got, expected );

  test.description = 'nothing';
  var got = _.arrayLeftIndexOf( [ 1, 2, 3 ], 4 );
  var expected = -1;
  test.identical( got, expected );

  test.description = 'nothing';
  var got = _.arrayLeftIndexOf( [ 1, 2, 3 ], 3, function( el, ins ) { return el > ins } );
  var expected = -1;
  test.identical( got, expected );

  test.description = 'array-like arguments';
  function arr() {
    return arguments;
  }( 3, 7, 13 );
  var got = _.arrayLeftIndexOf( arr, 13 );
  var expected = 2;
  test.identical( got, expected );

  test.description = 'fifth index';
  var got = _.arrayLeftIndexOf( 'abcdef', 'e', function( el, ins ) { return el > ins } );
  var expected = 5;
  test.identical( got, expected );

  test.description = 'third index';
  var got = _.arrayLeftIndexOf( 'abcdef', 'd' );
  var expected = 3;
  test.identical( got, expected );

  test.description = 'second index';
  var got = _.arrayLeftIndexOf( 'abcdef', 'c', function( el ) { return el; } );
  var expected = 2;
  test.identical( got, expected );

  /**/

  if( Config.debug )
  {

    test.description = 'no arguments';
    test.shouldThrowError( function()
    {
      _.arrayLeftIndexOf();
    });

    test.description = 'not enough arguments';
    test.shouldThrowError( function()
    {
      _.arrayLeftIndexOf( [ 1, 2, 3 ] );
    });

    test.description = 'third argument is wrong';
    test.shouldThrowError( function()
    {
      _.arrayLeftIndexOf( [ 1, 2, 3 ], 2, 'wrong argument' );
    });

  }

};


function arrayLeft( test )
{

  test.description = 'nothing';
  var got = _.arrayLeft( [  ] );
  var expected = {  };
  test.identical( got, expected );

  test.description = 'returns an object';
  var got = _.arrayLeft( [ 1, 2, 3, 4, 5 ], 3 );
  var expected = { index : 2, element : 3 };
  test.identical( got, expected );

  test.description = 'returns an object';
  var got = _.arrayLeft( [ 1, 2, false, 'str', 5 ], 'str', function( a, b ) { return a === b } );
  var expected = { index : 3, element : 'str' };
  test.identical( got, expected );

  test.description = 'returns an object';
  var got = _.arrayLeft( [ 1, 2, false, 'str', 5 ], 5, function( a ) { return a; } );
  var expected = { index : 4, element : 5 };
  test.identical( got, expected );

  /**/

  if( Config.debug )
  {

    test.description = 'no arguments';
    test.shouldThrowError( function()
    {
      _.arrayLeft();
    });

    test.description = 'third argument is wrong';
    test.shouldThrowError( function()
    {
      _.arrayLeft( [ 1, 2, 3 ], 2, 'wrong argument' );
    });

  }

};


function arrayHasAny( test )
{

  test.description = 'false';
  var got = _.arrayHasAny( [  ] );
  var expected = false;
  test.identical( got, expected );

  test.description = 'false';
  var got = _.arrayHasAny( [  ], false, 7 );
  var expected = false;
  test.identical( got, expected );

  test.description = 'true';
  var got = _.arrayHasAny( [ 5, 'str', 42, false ], false, 7 );
  var expected = true;
  test.identical( got, expected );

  /**/

  if( Config.debug )
  {

    test.description = 'no arguments';
    test.shouldThrowError( function()
    {
      _.arrayHasAny();
    });

    test.description = 'first argument is wrong';
    test.shouldThrowError( function()
    {
      _.arrayHasAny( 'wrong argument', false, 7 );
    });

  }

};


function arrayCount( test )
{

  test.description = 'nothing';
  var got = _.arrayCount( [  ], 3 );
  var expected = 0;
  test.identical( got, expected );

  test.description = 'two matching';
  var got = _.arrayCount( [ 1, 2, 'str', 10, 10, true ], 10 );
  var expected = 2;
  test.identical( got, expected );

  /**/

  if( Config.debug )
  {

    test.description = 'no arguments';
    test.shouldThrowError( function()
    {
      _.arrayCount();
    });

    test.description = 'not enough arguments';
    test.shouldThrowError( function()
    {
      _.arrayCount( [ 1, 2, 3, 'abc', 13 ] );
    });

    test.description = 'extra argument';
    test.shouldThrowError( function()
    {
      _.arrayCount( [ 1, 2, 3, true ], true, 'redundant argument' );
    });

    test.description = 'first argument is wrong';
    test.shouldThrowError( function()
    {
      _.arrayCount( 'wrong argument', true );
    });

  }

};


function arrayCountSame( test )
{

  test.description = 'nothing';
  var got = _.arrayCountSame( [  ] );
  var expected = 0;
  test.identical( got, expected );

  test.description = 'nothing';
  var got = _.arrayCountSame( [ 1, 2, 3, 4, 5 ] );
  var expected = 0;
  test.identical( got, expected );

  test.description = 'three pairs';
  var got = _.arrayCountSame( [ 1, 1, 2, 'abc', 'abc', 4, true, true ] );
  var expected = 3;
  test.identical( got, expected );

  /**/

  if( Config.debug )
  {

    test.description = 'no arguments';
    test.shouldThrowError( function()
    {
      _.arrayCountSame();
    });

    test.description = 'extra argument';
    test.shouldThrowError( function()
    {
      _.arrayCountSame( [ 1, 1, 2, 'abc', 'abc', 4, true, true ], function( e ) { return e }, 'redundant argument' );
    });

    test.description = 'first argument is wrong';
    test.shouldThrowError( function()
    {
      _.arrayCountSame( 'wrong argument', function( e ) { return e } );
    });

    test.description = 'second argument is wrong';
    test.shouldThrowError( function()
    {
      _.arrayCountSame( [ 1, 1, 2, 'abc', 'abc', 4, true, true ], 'wrong argument' );
    });

  }

};


function arraySum( test )
{

  test.description = 'nothing';
  var got = _.arraySum( [  ] );
  var expected = 0;
  test.identical( got, expected );

  test.description = 'returns sum';
  var got = _.arraySum( [ 1, 2, 3, 4, 5 ] );
  var expected = 15;
  test.identical( got, expected );

  test.description = 'returns sum';
  var got = _.arraySum( [ true, false, 13, '33' ], function( e ) { return e * 2 } );
  var expected = 94;
  test.identical( got, expected );

  test.description = 'converts and returns sum';
  var got = _.arraySum( [ 1, 2, 3, 4, 5 ], function( e ) { return e * 2 } );
  var expected = 30;
  test.identical( got, expected );

  /**/

  if( Config.debug )
  {

    test.description = 'no arguments';
    test.shouldThrowError( function()
    {
      _.arraySum();
    });

    test.description = 'extra argument';
    test.shouldThrowError( function()
    {
      _.arraySum( [ 1, 2, 3, 4, 5 ], function( e ) { return e * 2 }, 'redundant argument' );
    });

    test.description = 'first argument is wrong';
    test.shouldThrowError( function()
    {
      _.arraySum( 'wrong argument', function( e ) { return e / 2 } );
    });

    test.description = 'second argument is wrong';
    test.shouldThrowError( function()
    {
      _.arraySum( [ 1, 2, 3, 4, 5 ], 'wrong argument' );
    });

  }

};


function arrayExtendScreening( test )
{

  test.description = 'returns an empty array';
  var got = _.arrayExtendScreening( [  ], [  ], [ 0, 1, 2 ], [ 3, 4 ], [ 5, 6 ] );
  var expected = [  ];
  test.identical( got, expected );

  test.description = 'returns the corresponding values by indexes of the first argument';
  var got = _.arrayExtendScreening( [ 1, 2, 3 ], [  ], [ 0, 1, 2 ], [ 3, 4 ], [ 5, 6 ] );
  var expected = [ 5, 6, 2 ];
  test.identical( got, expected );

  test.description = 'creates a new array and returns the corresponding values by indexes of the first argument';
  var got = _.arrayExtendScreening( [ 1, 2, 3 ], null, [ 0, 1, 2 ], [ 3, 4 ], [ 5, 6 ] );
  var expected = [ 5, 6, 2 ];
  test.identical( got, expected );

  test.description = 'returns the corresponding values by indexes of the first argument';
  var got = _.arrayExtendScreening( [ 1, 2, 3 ], [ 3, 'abc', 7, 13 ], [ 0, 1, 2 ], [ 3, 4 ], [ 'a', 6 ] );
  var expected = [ 'a', 6, 2, 13 ];
  test.identical( got, expected );

  test.description = 'returns the second argument';
  var got = _.arrayExtendScreening( [  ], [ 3, 'abc', 7, 13 ], [ 0, 1, 2 ], [ 3, 4 ], [ 'a', 6 ] );
  var expected = [ 3, 'abc', 7, 13 ];
  test.identical( got, expected );

  /**/

  if( Config.debug )
  {

    test.description = 'no arguments';
    test.shouldThrowError( function()
    {
      _.arrayExtendScreening();
    });

    test.description = 'not enough arguments';
    test.shouldThrowError( function()
    {
      _.arrayExtendScreening( [ 1, 2, 3, 'abc', 13 ] );
    });

    test.description = 'next arguments are wrong';
    test.shouldThrowError( function()
    {
      _.arrayExtendScreening( [ 1, 2, 3 ], [ 3, 'abc', 7, 13 ], [ 3, 7 ], 'wrong arguments' );
    });

    test.description = 'arguments are wrong';
    test.shouldThrowError( function()
    {
      _.arrayExtendScreening( 'wrong argument', 'wrong argument', 'wrong arguments' );
    });

  }

};


function arrayRandom( test )
{

  test.description = 'an array';
  var got = _.arrayRandom( [  ] );
  var expected = [  ];
  test.identical( got, expected );

  test.description = 'an empty object';
  var got = _.arrayRandom( {  } );
  var expected = [  ];
  test.identical( got, expected );

  test.description = 'a function';
  var got = _.arrayRandom( function() {  } );
  var expected = [  ];
  test.identical( got, expected );

  test.description = 'a number';
  var got = _.arrayRandom( 5 );
  var expected = got;
  test.identical( got, expected );

  test.description = 'an object';
  var got = _.arrayRandom( {
    length : 5,
    range : [ 1, 9 ],
    int : true
  } );
  var expected = got;
  test.identical( got, expected );

  /**/

  if( Config.debug )
  {

    test.description = 'no arguments';
    test.shouldThrowError( function()
    {
      _.arrayRandom();
    });

    test.description = 'wrong argument';
    test.shouldThrowError( function()
    {
      _.arrayRandom( 'wrong argument' );
    });

  }

};


function arraySetContainAll( test )
{

  test.description = 'returns true';
  var got = _.arraySetContainAll( [ 1, 'b', 'c', 4 ], [ 1, 2, 3, 4, 5, 'b', 'c' ] );
  var expected = true;
  test.identical( got, expected );

  test.description = 'length of the first argument is more than second argument';
  var got = _.arraySetContainAll( [ 1, 2, 3, 4, 5 ], [ 1, 2, 3, 4 ] );
  var expected = false;
  test.identical( got, expected );

  test.description = 'length of the first argument is more than second argument';
  var got = _.arraySetContainAll( [ 'abc', 'def', true, 26 ], [ 1, 2, 3, 4 ], [ 26, 'abc', 'def', true ] );
  var expected = false;
  test.identical( got, expected );

  /**/

  if( Config.debug )
  {

    test.description = 'no arguments';
    test.shouldThrowError( function()
    {
      _.arraySetContainAll();
    });

    test.description = 'wrong arguments';
    test.shouldThrowError( function()
    {
      _.arraySetContainAll( [ 1, 2, 3, 4 ], 'wrong arguments' );
    });

  }

};


function arraySetContainSomething( test )
{

  test.description = 'returns false';
  var got = _.arraySetContainSomething( [  ], [ 3, 5, 'd', 'e' ], [ 'abc', 33, 7 ] );
  var expected = false;
  test.identical( got, expected );

  test.description = 'returns false';
  var got = _.arraySetContainSomething( [  ] );
  var expected = false;
  test.identical( got, expected );

  test.description = 'returns false';
  var got = _.arraySetContainSomething( [ 1, 'b', 'c', 4 ], [ 3, 5, 'd', 'e' ], [ 'abc', 33, 7 ] );
  var expected = false;
  test.identical( got, expected );

  test.description = 'matching from arguments[1]';
  var got = _.arraySetContainSomething( [ 33, 4, 5, 'b', 'c' ], [ 1, 'b', 'c', 4 ], [ 33, 13, 3 ] );
  var expected = true;
  test.identical( got, expected );

  test.description = 'matching from arguments[2]';
  var got = _.arraySetContainSomething( [ 'abc', 'def', true, 26 ], [ 1, 2, 3, 4 ], [ 26, 'abc', 'def', true ] );
  var expected = true;
  test.identical( got, expected );

  /**/

  if( Config.debug )
  {

    test.description = 'no arguments';
    test.shouldThrowError( function()
    {
      _.arraySetContainSomething();
    });

    test.description = 'wrong arguments';
    test.shouldThrowError( function()
    {
      _.arraySetContainSomething( [ 1, 2, 3, 4 ], 'wrong arguments' );
    });

  }

};


function _arraySortedLookUpAct( test )
{

  test.description = 'first argument is empty, so it returns the index from which it ended search at';
  var got = _._arraySortedLookUpAct( [  ], 55, function( a, b ){ return a - b }, 0, 5 );
  var expected = 3;
  test.identical( got, expected );

  test.description = 'returns the last index of the first argument';
  var got = _._arraySortedLookUpAct( [ 1, 2, 3, 4, 5 ], 5, function( a, b ){ return a - b }, 0, 5 );
  var expected = 4;
  test.identical( got, expected );

  test.description = 'second argument was not found, so it returns the length of the first argument';
  var got = _._arraySortedLookUpAct( [ 1, 2, 3, 4, 5 ], 55, function( a, b ){ return a - b }, 0, 5 );
  var expected = 5;
  test.identical( got, expected );

  /**/

  if( Config.debug )
  {

    test.description = 'no arguments';
    test.shouldThrowError( function()
    {
      _._arraySortedLookUpAct();
    });

  }

};


function arraySortedLookUp( test )
{

  test.description = 'returns an object that containing the found value';
  var got = _.arraySortedLookUp( [ 1, 2, 3, 4, 5 ], 5, function( a, b ) { return a - b } );
  var expected = { value : 5, index : 4 };
  test.identical( got, expected );

  test.description = 'returns undefined';
  var got = _.arraySortedLookUp( [ 1, 2, 3, 4, 5 ], 55, function( a, b ) { return a - b } );
  var expected = undefined;
  test.identical( got, expected );

  test.description = 'call without a callback function';
  var got = _.arraySortedLookUp( [ 1, 2, 3, 4, 5 ], 3 );
  var expected = { value : 3, index : 2 };
  test.identical( got, expected );


  if( Config.debug )
  {

    test.description = 'no arguments';
    test.shouldThrowError( function()
    {
      _.arraySortedLookUp();
    });

    test.description = 'first argument is wrong';
    test.shouldThrowError( function()
    {
      _.arraySortedLookUp( 'wrong argument', 5, function( a, b ) { return a - b } );
    });

    test.description = 'not enough arguments';
    test.shouldThrowError( function()
    {
      _.arraySortedLookUp( [ 1, 2, 3, 4, 5 ] );
    });

    test.description = 'extra argument';
    test.shouldThrowError( function()
    {
      _.arraySortedLookUp( [ 1, 2, 3, 4, 5 ], 5, function( a, b ) { return a - b }, 'extra argument' );
    });

  }

};


function arraySortedRemove( test )
{

  test.description = 'nothing to remove';
  var got = _.arraySortedRemove( [  ], 55 );
  var expected = false;
  test.identical( got, expected );

  test.description = 'nothing to remove';
  var got = _.arraySortedRemove( [ 1, 2, 3, 4, 5 ], 55, function( a, b ) { return a - b } );
  var expected = false;
  test.identical( got, expected );

  test.description = 'remove last index from first argument';
  var got = _.arraySortedRemove( [ 1, 2, 3, 4, 5 ], 5, function( a, b ) { return a - b } );
  var expected = true;
  test.identical( got, expected );

  /**/

  if( Config.debug )
  {

    test.description = 'no arguments';
    test.shouldThrowError( function()
    {
      _.arraySortedRemove();
    });

    test.description = 'first argument is wrong';
    test.shouldThrowError( function()
    {
      _.arraySortedRemove( 'wrong argument', 5, function( a, b ) { return a - b } );
    });

    test.description = 'not enough arguments';
    test.shouldThrowError( function()
    {
      _.arraySortedRemove( [ 1, 2, 3, 4, 5 ] );
    });

    test.description = 'extra argument';
    test.shouldThrowError( function()
    {
      _.arraySortedRemove( [ 1, 2, 3, 4, 5 ], 5, function( a, b ) { return a - b }, 'extra argument' );
    });

  }

};


function arraySortedAddOnce( test )
{

  test.description = 'add an element';
  var got = _.arraySortedAddOnce( [  ], 55 );
  var expected = true;
  test.identical( got, expected );

  test.description = 'add a new element';
  var got = _.arraySortedAddOnce( [ 1, 2, 3, 4, 5 ], 55, function( a, b ) { return a - b } );
  var expected = true;
  test.identical( got, expected );

  test.description = 'do not add, because the second element already has in the first argument';
  var got = _.arraySortedAddOnce( [ 1, 2, 3, 4, 5 ], 5, function( a, b ) { return a - b } );
  var expected = false;
  test.identical( got, expected );

  /**/

  if( Config.debug )
  {

    test.description = 'no arguments';
    test.shouldThrowError( function()
    {
      _.arraySortedAddOnce();
    });

    test.description = 'first argument is wrong';
    test.shouldThrowError( function()
    {
      _.arraySortedAddOnce( 'wrong argument', 5, function( a, b ) { return a - b } );
    });

    test.description = 'not enough arguments';
    test.shouldThrowError( function()
    {
      _.arraySortedAddOnce( [ 1, 2, 3, 4, 5 ] );
    });

    test.description = 'extra argument';
    test.shouldThrowError( function()
    {
      _.arraySortedAddOnce( [ 1, 2, 3, 4, 5 ], 5, function( a, b ) { return a - b }, 'extra argument' );
    });

  }

};


function arraySortedAdd( test )
{

  test.description = 'add an element';
  var got = _.arraySortedAdd( [  ], 55 );
  var expected = 0;
  test.identical( got, expected );

  test.description = 'add a new element';
  var got = _.arraySortedAdd( [ 1, 2, 3, 4, 5 ], 55, function( a, b ) { return a - b } );
  var expected = 5;
  test.identical( got, expected );

  test.description = 'offsets arguments[0][1]';
  var got = _.arraySortedAdd( [ 1, 2, 3, 4 ], 2, function( a, b ) { return a - b } );
  var expected = 1;
  test.identical( got, expected );

  /**/

  if( Config.debug )
  {

    test.description = 'no arguments';
    test.shouldThrowError( function()
    {
      _.arraySortedAdd();
    });

    test.description = 'first argument is wrong';
    test.shouldThrowError( function()
    {
      _.arraySortedAdd( 'wrong argument', 5, function( a, b ) { return a - b } );
    });

    test.description = 'not enough arguments';
    test.shouldThrowError( function()
    {
      _.arraySortedAdd( [ 1, 2, 3, 4, 5 ] );
    });

    test.description = 'extra argument';
    test.shouldThrowError( function()
    {
      _.arraySortedAdd( [ 1, 2, 3, 4, 5 ], 5, function( a, b ) { return a - b }, 'extra argument' );
    });

  }

};


function arraySortedAddArray( test )
{

  test.description = 'returns sum equal to the 3';
  var got = _.arraySortedAddArray( [  ], [ 1, 2, 3 ], function( a, b ) { return a - b } );
  var expected = 3;
  test.identical( got, expected );

  test.description = 'returns sum equal to the 19';
  var got = _.arraySortedAddArray( [ 1, 2, 3, 4, 5 ], [ 6, 7, 8, 2 ], function( a, b ) { return a - b } );
  var expected = 19;
  test.identical( got, expected );

  /**/

  if( Config.debug )
  {

    test.description = 'no arguments';
    test.shouldThrowError( function()
    {
      _.arraySortedAddArray();
    });

    test.description = 'first argument is wrong';
    test.shouldThrowError( function()
    {
      _.arraySortedAddArray( 'wrong argument', [ 6, 7, 8, 2 ], function( a, b ) { return a - b } );
    });

    test.description = 'second argument is wrong';
    test.shouldThrowError( function()
    {
      _.arraySortedAddArray( [ 1, 2, 3, 4, 5 ], 'wrong argument', function( a, b ) { return a - b } );
    });

    test.description = 'not enough arguments';
    test.shouldThrowError( function()
    {
      _.arraySortedAddArray( [ 1, 2, 3, 4, 5 ] );
    });

    test.description = 'extra argument';
    test.shouldThrowError( function()
    {
      _.arraySortedAddArray( [ 1, 2, 3, 4, 5 ], [ 6, 7, 8, 2 ], function( a, b ) { return a - b }, 'extra argument' );
    });

  }

};


function arrayForRange( test )
{

  test.description = 'single zero';
  var got = _.arrayForRange( [ 0, 1 ] );
  var expected = [ 0 ];
  test.identical( got,expected );

  test.description = 'nothing';
  var got = _.arrayForRange( [ 1, 1 ] );
  var expected = [  ];
  test.identical( got,expected );

  test.description = 'single not zero';
  var got = _.arrayForRange( [ 1, 2 ] );
  var expected = [ 1 ];
  test.identical( got,expected );

  test.description = 'couple of elements';
  var got = _.arrayForRange( [ 1, 3 ] );
  var expected = [ 1, 2 ];
  test.identical( got,expected );

  test.description = 'single number as argument';
  var got = _.arrayForRange( 3 );
  var expected = [ 0, 1, 2 ];
  test.identical( got,expected );

  test.description = 'complex case';
  var got = _.arrayForRange( [ 3, 9 ] );
  var expected = [ 3, 4, 5, 6, 7, 8 ];
  test.identical( got,expected );

  /**/

  if( Config.debug )
  {

    test.description = 'extra argument';
    test.shouldThrowError( function()
    {
      _.arrayForRange( [ 1, 3 ],'wrong arguments' );
    });

    test.description = 'argument not wrapped into array';
    test.shouldThrowError( function()
    {
      _.arrayForRange( 1, 3 );
    });

    test.description = 'wrong type of argument';
    test.shouldThrowError( function()
    {
      _.arrayForRange( 'wrong arguments' );
    });

    test.description = 'no arguments'
    test.shouldThrowError( function()
    {
      _.arrayForRange();
    });

  }

};

//

function arraySupplement( test )
{

  test.description = 'nothing';
  var got = _.arraySupplement( [  ] );
  var expected = [  ];
  test.identical( got, expected );

  test.description = 'only numbers';
  var got = _.arraySupplement( [ 4, 5 ], [ 1, 2, 3 ], [ 6, 7, 8, true, 9 ], [ 'a', 'b', 33, 13, 'e', 7 ] );
  var expected = [ 4, 5, 33, 13, 9, 7 ];
  test.identical( got, expected );

  test.description = 'only numbers and undefined';
  var got = _.arraySupplement( [ 4, 5 ], [ 1, 2, 3 ], [ 6, 7, true, 9 ], [ 'a', 'b', 33, 13, 'e', 7 ] );
  var expected = [ 4, 5, 33, 13, undefined, 7 ];
  test.identical( got, expected );

  test.description = 'only numbers';
  var got = _.arraySupplement( [ 'a', 'b' ], [ 1, 2, 3 ], [ 6, 7, 8, true, 9 ], [ 'a', 'b', 33, 13, 'e', 7 ] );
  var expected = [ 6, 7, 33, 13, 9, 7 ];
  test.identical( got, expected );

  /**/

  if( Config.debug )
  {

    test.description = 'no arguments';
    test.shouldThrowError( function()
    {
      _.arraySupplement();
    });

    test.description = 'arguments are wrong';
    test.shouldThrowError( function()
    {
      _.arraySupplement( 'wrong argument', 'wrong arguments' );
    });

  }

};




function bufferRelen( test )
{

  test.description = 'second argument is more than ints.length';
  var ints = new Int8Array( [ 3, 7, 13 ] );
  var got = _.bufferRelen( ints, 4 );
  var expected = got; // [ 3, 7, 13, 0 ];
  test.identical( got, expected );

  test.description = 'second argument is less than ints2.length';
  var ints2 = new Int16Array( [ 3, 7, 13, 33, 77 ] );
  var got = _.bufferRelen( ints2, 3 );
  var expected = got; // [ 3, 7, 13 ];
  test.identical( got, expected );

  test.description = 'invalid values are replaced by zero';
  var ints3 = new Int32Array( [ 3, 'a', 13, 'b', 77 ] );
  var got = _.bufferRelen( ints3, 6 );
  var expected = got; // [ 3, 0, 13, 0, 77, 0 ];
  test.identical( got, expected );

  test.description = 'returns the initial typed array';
  var floats = new Float32Array( [ 3.35, 7.5, 13.35, 33.75, 77.25 ] );
  var got = _.bufferRelen( floats, 5 );
  var expected = got; // [ 3.3499999046325684, 7.5, 13.350000381469727, 33.75, 77.25 ];
  test.identical( got, expected );

  /**/

  if( Config.debug )
  {

    test.description = 'no arguments';
    test.shouldThrowError( function()
    {
      _.bufferRelen();
    });

  }

};


function bufferRetype( test )
{

  test.desscription = 'converts and returns the new type of Int16Array';
  var view1 = new Int8Array( [ 1, 2, 3, 4, 5, 6 ] );
  var got = _.bufferRetype(view1, Int16Array);
  var expected = got; // [ 513, 1027, 1541 ];
  test.identical( got, expected );

  test.desscription = 'converts and returns the new type of Int8Array';
  var view1 = new Int16Array( [ 513, 1027, 1541 ] );
  var got = _.bufferRetype(view1, Int8Array);
  var expected = got; // [ 1, 2, 3, 4, 5, 6 ];
  test.identical( got, expected );

  /**/

  if( Config.debug )
  {

    test.description = 'no arguments';
    test.shouldThrowError( function()
    {
      _.bufferRetype();
    });

    test.description = 'arguments are wrong';
    test.shouldThrowError( function()
    {
      _.bufferRetype( 'wrong argument', 'wrong argument' );
    });

  }

};

//

function bufferRawFromBuffer( test )
{

  var buffer1 = new ArrayBuffer(10);
  var view1 = new Int8Array( buffer1 );
  test.description = 'returns the same length of typed array';
  var got = _.bufferRawFromBuffer( view1 );
  var expected = got; // [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ]
  test.identical( got, expected );

  var buffer2 = new ArrayBuffer(10);
  var view2 = new Int8Array( buffer2, 2 );
  test.description = 'returns the new sub typed array';
  var got = _.bufferRawFromBuffer( view2 );
  var expected = got; // [ 0, 0, 0, 0, 0, 0 ]
  test.identical( got, expected );

  /**/

  if( Config.debug )
  {

    test.description = 'no arguments';
    test.shouldThrowError( function()
    {
      _.bufferRawFromBuffer();
    });

    test.description = 'arguments are wrong';
    test.shouldThrowError( function()
    {
      _.bufferRawFromBuffer( 'wrong argument' );
    });

  }

}

//

var Self =
{

  name : 'wTools.array',
  // verbosity : 9,
  // barringConsole : 0,

  tests :
  {
    arrayIs : arrayIs,
    arrayLike : arrayLike,
    hasLength : hasLength,
    arraySub : arraySub,
    arrayMakeSimilar : arrayMakeSimilar,
    arrayNewOfSameLength : arrayNewOfSameLength,
    arrayOrNumber : arrayOrNumber,
    arraySelect : arraySelect,
    arrayIron : arrayIron,

    __arrayPrepend : __arrayPrepend,
    __arrayPrepended : __arrayPrepended,
    __arrayPrependOnce : __arrayPrependOnce,
    __arrayPrependedOnce : __arrayPrependedOnce,
    __arrayPrependOnceStrictly : __arrayPrependOnceStrictly,

    __arrayPrependArray : __arrayPrependArray,
    __arrayPrependedArray : __arrayPrependedArray,
    __arrayPrependArrayOnce : __arrayPrependArrayOnce,
    __arrayPrependedArrayOnce : __arrayPrependedArrayOnce,
    __arrayPrependArrayOnceStrictly : __arrayPrependArrayOnceStrictly,

    __arrayPrependArrays : __arrayPrependArrays,
    __arrayPrependArraysOnce : __arrayPrependArraysOnce,
    __arrayPrependArraysOnceStrictly : __arrayPrependArraysOnceStrictly,
    __arrayPrependedArrays : __arrayPrependedArrays,
    __arrayPrependedArraysOnce : __arrayPrependedArraysOnce,

    __arrayAppend : __arrayAppend,
    __arrayAppended : __arrayAppended,
    __arrayAppendOnce : __arrayAppendOnce,
    __arrayAppendedOnce : __arrayAppendedOnce,
    __arrayAppendOnceStrictly : __arrayAppendOnceStrictly,

    __arrayAppendArray : __arrayAppendArray,
    __arrayAppendedArray : __arrayAppendedArray,
    __arrayAppendArrayOnce : __arrayAppendArrayOnce,
    __arrayAppendedArrayOnce : __arrayAppendedArrayOnce,
    __arrayAppendArrayOnceStrictly : __arrayAppendArrayOnceStrictly,

    __arrayAppendArrays : __arrayAppendArrays,
    __arrayAppendArraysOnce : __arrayAppendArraysOnce,
    __arrayAppendArraysOnceStrictly : __arrayAppendArraysOnceStrictly,
    __arrayAppendedArrays : __arrayAppendedArrays,
    __arrayAppendedArraysOnce : __arrayAppendedArraysOnce,

    __arrayRemove : __arrayRemove,
    __arrayRemoved : __arrayRemoved,
    __arrayRemoveOnce : __arrayRemoveOnce,
    __arrayRemovedOnce : __arrayRemovedOnce,
    __arrayRemoveOnceStrictly : __arrayRemoveOnceStrictly,

    __arrayRemoveArray : __arrayRemoveArray,
    __arrayRemovedArray : __arrayRemovedArray,
    __arrayRemoveArrayOnce : __arrayRemoveArrayOnce,
    __arrayRemovedArrayOnce : __arrayRemovedArrayOnce,
    __arrayRemoveArrayOnceStrictly : __arrayRemoveArrayOnceStrictly,

    __arrayRemoveArrays : __arrayRemoveArrays,
    __arrayRemovedArrays : __arrayRemovedArrays,
    __arrayRemoveArraysOnce : __arrayRemoveArraysOnce,
    __arrayRemovedArraysOnce : __arrayRemovedArraysOnce,
    __arrayRemoveArraysOnceStrictly : __arrayRemoveArraysOnceStrictly,

    __arrayFlatten : __arrayFlatten,
    __arrayFlattenOnce : __arrayFlattenOnce,
    __arrayFlattenOnceStrictly : __arrayFlattenOnceStrictly,
    __arrayFlattened : __arrayFlattened,
    __arrayFlattenedOnce : __arrayFlattenedOnce,

    // arrayRemovedAll : arrayRemovedAll,
    // arrayRemoveAll : arrayRemoveAll,

    // _arrayPrependOnceArrayOnce : _arrayPrependOnceArrayOnce,
    // _arrayAppendArrayOnce : _arrayAppendArrayOnce,

    arrayElementsSwap : arrayElementsSwap,
    arrayFrom : arrayFrom,
    arrayToMap : arrayToMap,

    arrayReplaceOnce : arrayReplaceOnce,

    arrayUpdate : arrayUpdate,

    // _arrayAppendOnce : _arrayAppendOnce,
    // _arrayPrependOnce : _arrayPrependOnce,

    arrayCutin : arrayCutin,
    arraySlice : arraySlice,
    arrayGrow : arrayGrow,

    arrayAs : arrayAs,
    arrayToStr : arrayToStr,
    arrayPut : arrayPut,
    arrayMask : arrayMask,
    arrayDuplicate : arrayDuplicate,

    arrayFill : arrayFill,
    arrayCompare : arrayCompare,
    arraySame : arraySame,

    arrayLeftIndexOf : arrayLeftIndexOf,
    arrayLeft : arrayLeft,
    arrayHasAny : arrayHasAny,
    arrayCount : arrayCount,
    arrayCountSame : arrayCountSame,
    arraySum : arraySum,
    arrayExtendScreening : arrayExtendScreening,
    arrayRandom : arrayRandom,

    arraySetContainAll: arraySetContainAll,
    arraySetContainSomething : arraySetContainSomething,
    _arraySortedLookUpAct : _arraySortedLookUpAct,
    arraySortedLookUp : arraySortedLookUp,
    arraySortedRemove : arraySortedRemove,
    arraySortedAddOnce : arraySortedAddOnce,
    arraySortedAdd : arraySortedAdd,

    arraySortedAddArray : arraySortedAddArray,
    arrayForRange : arrayForRange,
    arraySupplement : arraySupplement,

    bufferRelen : bufferRelen,
    bufferRetype : bufferRetype,
    bufferRawFromBuffer : bufferRawFromBuffer,

  }

}

Self = wTestSuite( Self );
if( typeof module !== 'undefined' && !module.parent )
_.Testing.test( Self.name );

} )( );
