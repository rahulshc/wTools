( function _l0_l1_BufferTyped_test_s_()
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
// buffer
// --

function makeCommon( test )
{

  methodEach({ tools : 'default', type : 'Array' });
  methodEach({ tools : 'Array', type : 'Array' });
  methodEach({ tools : 'F32x', type : 'F32x' });

  /* - */

  function methodEach( env )
  {

    env.method = 'makeEmpty';
    act( env );
    env.method = 'makeUndefined';
    act( env );
    env.method = 'make';
    act( env );
    // env.method = 'cloneShallow';
    // act( env );

  }

  /* - */

  function act( env )
  {
    const _tools = tools( env );

    /* */

    if( env.method !== 'cloneShallow' && env.method !== 'makeUndefined' )
    {
      test.case = `${__.entity.exportStringSolo( env )}, no args`;
      var got = _tools.bufferTyped[ env.method ]();
      test.true( got instanceof F32x );
      test.identical( got.length, 0 );
    }

    /* */

    if( env.method !== 'makeEmpty' && env.method !== 'cloneShallow' )
    {
      test.case = `${__.entity.exportStringSolo( env )}, length`;
      var got = _tools.bufferTyped[ env.method ]( 3 );
      test.true( got instanceof F32x );
      test.true( got.length === 3 );
    }

    /* */

    test.case = `${__.entity.exportStringSolo( env )}, empty typed buffer`;
    var got = _tools.bufferTyped[ env.method ]( new U8x() );
    test.true( got instanceof U8x );
    test.identical( got.length, 0 );

    /* */

    test.case = `${__.entity.exportStringSolo( env )}, 1 element`;
    var got = _tools.bufferTyped[ env.method ]( new U16x([ 2 ]) );
    test.true( got instanceof U16x );
    if( env.method === 'makeEmpty' )
    test.identical( got.length, 0 );
    else
    test.identical( got.length, 1 );
    if( env.method === 'make' || env.method === 'cloneShallow' )
    test.identical( got, new U16x([ 2 ]) );

    /* */

    test.case = `${__.entity.exportStringSolo( env )}, 2 elements`;
    var got = _tools.bufferTyped[ env.method ]( new F32x([ 2, 3 ]) );
    test.true( got instanceof F32x );
    if( env.method === 'makeEmpty' )
    test.identical( got.length, 0 );
    else
    test.identical( got.length, 2 );
    if( env.method === 'make' || env.method === 'cloneShallow' )
    test.identical( got, new F32x([ 2, 3 ]) );

    /* */

    if( env.method !== 'makeEmpty' && env.method !== 'cloneShallow' )
    {
      test.case = `${__.entity.exportStringSolo( env )}, empty and length`;
      var got = _tools.bufferTyped[ env.method ]( [], 2 );
      test.true( got instanceof Array );
      test.identical( got.length, 2 );

      test.case = `${__.entity.exportStringSolo( env )}, non-empty and length longer`;
      var got = _tools.bufferTyped[ env.method ]( [ 3, 4 ], 3 );
      test.true( got instanceof Array );
      test.identical( got.length, 3 );
      if( env.method === 'make' )
      test.identical( got, [ 3, 4, undefined ] );

      test.case = `${__.entity.exportStringSolo( env )}, non-empty and length shorter`;
      var got = _tools.bufferTyped[ env.method ]( [ 3, 4 ], 1 );
      test.true( got instanceof Array );
      test.identical( got.length, 1 );
      if( env.method === 'make' )
      test.identical( got, [ 3 ] );

      test.case = `${__.entity.exportStringSolo( env )}, non-empty and ins longer`;
      var got = _tools.bufferTyped[ env.method ]( [ 3, 4 ], [ 2, 3, 4 ] );
      test.true( got instanceof Array );
      test.identical( got.length, 3 );
      if( env.method === 'make' )
      test.identical( got, [ 2, 3, 4 ] );

      test.case = `${__.entity.exportStringSolo( env )}, non-empty and ins shorter`;
      var got = _tools.bufferTyped[ env.method ]( [ 3, 4 ], [ 2 ] );
      test.true( got instanceof Array );
      test.identical( got.length, 1 );
      if( env.method === 'make' )
      test.identical( got, [ 2 ] );
    }
  }

  /* */

  function tools( env )
  {
    if( env.tools === 'default' )
    return _;
    // return _[ env.tools ].asDefault.long;
    return _.withLong[ env.tools ];
  }
}

// --
// declaration
// --

const Proto =
{

  name : 'Tools.BufferTyped.l0.l1',
  silencing : 1,
  enabled : 1,

  tests :
  {

    makeCommon,

  }

}

const Self = wTestSuite( Proto );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

})();
