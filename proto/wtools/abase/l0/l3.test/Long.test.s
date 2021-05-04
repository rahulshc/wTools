( function _l0_l3_Long_test_s_()
{

'use strict';

if( typeof module !== 'undefined' )
{
  const _ = require( '../Include3.s' );
  require( 'wTesting' );
}

const _global = _global_;
const _ = _global_.wTools;
const __ = _globals_.testing.wTools;

//--
// long
//--

function identical( test )
{
  test.case = 'empty arrays';
  var got = _.long.identical( [], [] );
  var expected = true;
  test.identical( got, expected );

  test.case = 'arrays are equal';
  var got = _.long.identical( [ 1, 2, 3 ], [ 1, 2, 3 ] );
  var expected = true;
  test.identical( got, expected );

  test.case = 'array-like arguments';
  function src1()
  {
    return arguments;
  };
  function src2()
  {
    return arguments;
  };
  var got = _.long.identical( src1( 3, 7, 33 ), src2( 3, 7, 13 ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'arrays are not equal';
  var got = _.long.identical( [ 1, 2, 3, 'Hi!' ], [ 1, 2, 3, 'Hello there!' ] );
  var expected = false;
  test.identical( got, expected );

  test.case = 'arrays length are not equal';
  var got = _.long.identical( [ 1, 2, 3 ], [ 1, 2 ] );
  var expected = false;
  test.identical( got, expected );

  /**/

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.long.identical() );

  test.case = 'not enough arguments';
  test.shouldThrowErrorSync( () => _.long.identical( [ 1, 2, 3 ] ) );

  test.case = 'extra argument';
  test.shouldThrowErrorSync( () => _.long.identical( [ 1, 2, 3 ], [ 1, 2 ], {}, 'extra' ) );
};

//

function filterMapCommonPass( test )
{
  let ops = [];
  let env;

  namespaceEach({ method : 'filterWithoutEscapeLeft', left : 1 });
  namespaceEach({ method : 'filterWithoutEscapeRight', left : 0 });
  namespaceEach({ method : 'filterWithoutEscape', left : 1 });
  namespaceEach({ method : 'filterWithEscapeLeft', left : 1 });
  namespaceEach({ method : 'filterWithEscapeRight', left : 0 });
  namespaceEach({ method : 'filterWithEscape', left : 1 });
  namespaceEach({ method : 'filter', left : 1 });

  namespaceEach({ method : 'mapWithoutEscapeLeft', left : 1 });
  namespaceEach({ method : 'mapWithoutEscapeRight', left : 0 });
  namespaceEach({ method : 'mapWithoutEscape', left : 1 });
  namespaceEach({ method : 'mapWithEscapeLeft', left : 1 });
  namespaceEach({ method : 'mapWithEscapeRight', left : 0 });
  namespaceEach({ method : 'mapWithEscape', left : 1 });
  namespaceEach({ method : 'map', left : 1 });

  /* - */

  function namespaceEach( env )
  {
    env.namespace = 'props';
    caseEach( env );
    env.namespace = 'map';
    caseEach( env );
    env.namespace = 'aux';
    caseEach( env );
    env.namespace = 'object';
    caseEach( env );
    env.namespace = 'container';
    caseEach( env );
  }

  /* - */

  function caseEach( _env )
  {
    env = _env;

    /* */

    test.case = `${__.entity.exportStringSolo( env )}, pass, dst <> src`;
    clean();
    var src = [ 1, 2, 3 ];
    var dst = [ 4 ];
    var got = _[ env.namespace ][ env.method ]( dst, src, f1 );
    test.true( got === dst );
    var exp = [ 11, 12, 13 ];
    test.identical( got, exp );
    var exp = [ 1, 2, 3 ];
    test.identical( src, exp );
    var exp = order([ 1, 2, 3 ]);
    test.identical( __.select( ops, '*/#0' ), exp );
    var exp = order([ 0, 1, 2 ]);
    test.identical( __.select( ops, '*/#1' ), exp );
    var exp = order([ 0, 1, 2 ]);
    test.identical( __.select( ops, '*/#2' ), exp );
    var exp = order([ src, src, src ]);
    test.identical( __.select( ops, '*/#3' ), exp );

    /* */

    test.case = `${__.entity.exportStringSolo( env )}, pass, dst === null`;
    clean();
    var src = [ 1, 2, 3 ];
    var got = _[ env.namespace ][ env.method ]( null, src, f1 );
    test.true( got !== src );
    var exp = { a : 11, b : 12, c : 13 }
    test.identical( got, exp );
    var exp = [ 1, 2, 3 ]
    test.identical( src, exp );
    var exp = order([ 1, 2, 3 ]);
    test.identical( __.select( ops, '*/#0' ), exp );
    var exp = order([ 'a', 'b', 'c' ]);
    test.identical( __.select( ops, '*/#1' ), exp );
    var exp = order([ 0, 1, 2 ]);
    test.identical( __.select( ops, '*/#2' ), exp );
    var exp = order([ src, src, src ]);
    test.identical( __.select( ops, '*/#3' ), exp );

    /* */

    test.case = `${__.entity.exportStringSolo( env )}, pass, dst === src`;
    clean();
    var src = [ 1, 2, 3 ];
    var got = _[ env.namespace ][ env.method ]( src, src, f1 );
    test.true( got === src );
    var exp = { a : 11, b : 12, c : 13 }
    test.identical( got, exp );
    var exp = order([ 1, 2, 3 ]);
    test.identical( __.select( ops, '*/#0' ), exp );
    var exp = order([ 'a', 'b', 'c' ]);
    test.identical( __.select( ops, '*/#1' ), exp );
    var exp = order([ 0, 1, 2 ]);
    test.identical( __.select( ops, '*/#2' ), exp );
    var exp = order([ src, src, src ]);
    test.identical( __.select( ops, '*/#3' ), exp );

    /* */

    test.case = `${__.entity.exportStringSolo( env )}, pass, dst === self`;
    clean();
    var src = [ 1, 2, 3 ];
    var got = _[ env.namespace ][ env.method ]( _.self, src, f1 );
    test.true( got === src );
    var exp = { a : 11, b : 12, c : 13 }
    test.identical( got, exp );
    var exp = order([ 1, 2, 3 ]);
    test.identical( __.select( ops, '*/#0' ), exp );
    var exp = order([ 'a', 'b', 'c' ]);
    test.identical( __.select( ops, '*/#1' ), exp );
    var exp = order([ 0, 1, 2 ]);
    test.identical( __.select( ops, '*/#2' ), exp );
    var exp = order([ src, src, src ]);
    test.identical( __.select( ops, '*/#3' ), exp );

    /* */

  }

  /* - */

  function order( dst )
  {
    if( !env.left )
    dst.reverse();
    return dst;
  }

  /* - */

  function clean()
  {
    ops = [];
  }

  /* - */

  function f1( e, k, c, src )
  {
    ops.push([ ... arguments ]);
    return e + 10;
  }

  /* - */

}

filterMapCommonPass.timeOut = 60000;

//

function filterCommonDropping( test )
{
  let env;

  namespaceEach({ method : 'filterWithoutEscapeLeft', left : 1 });
  namespaceEach({ method : 'filterWithoutEscapeRight', left : 0 });
  namespaceEach({ method : 'filterWithoutEscape', left : 1 });
  namespaceEach({ method : 'filterWithEscapeLeft', left : 1 });
  namespaceEach({ method : 'filterWithEscapeRight', left : 0 });
  namespaceEach({ method : 'filterWithEscape', left : 1 });
  namespaceEach({ method : 'filter', left : 1 });

  /* - */

  function namespaceEach( env )
  {
    env.namespace = 'props';
    caseEach( env );
    env.namespace = 'map';
    caseEach( env );
    env.namespace = 'aux';
    caseEach( env );
    env.namespace = 'object';
    caseEach( env );
    env.namespace = 'container';
    caseEach( env );
  }

  /* - */

  function caseEach( _env )
  {
    env = _env;

    /* */

    test.case = `${__.entity.exportStringSolo( env )}, pass, dst <> src`;
    var src = [ 1, 2, 3 ];
    var dst = [ 4 ]
    var got = _[ env.namespace ][ env.method ]( dst, src, f1 );
    test.true( got === dst );
    var exp = { d : 4, a : 11, c : 13 }
    test.identical( got, exp );
    var exp = [ 1, 2, 3 ];
    test.identical( src, exp );

    /* */

    test.case = `${__.entity.exportStringSolo( env )}, pass, dst === null`;
    var src = [ 1, 2, 3 ];
    var got = _[ env.namespace ][ env.method ]( null, src, f1 );
    test.true( got !== src );
    var exp = { a : 11, c : 13 }
    test.identical( got, exp );
    var exp = [ 1, 2, 3 ]
    test.identical( src, exp );

    /* */

    test.case = `${__.entity.exportStringSolo( env )}, pass, dst === src`;
    var src = [ 1, 2, 3 ];
    var got = _[ env.namespace ][ env.method ]( src, src, f1 );
    test.true( got === src );
    var exp = { a : 11, c : 13 }
    test.identical( got, exp );

    /* */

    test.case = `${__.entity.exportStringSolo( env )}, pass, dst === self`;
    var src = [ 1, 2, 3 ];
    var got = _[ env.namespace ][ env.method ]( _.self, src, f1 );
    test.true( got === src );
    var exp = { a : 11, c : 13 }
    test.identical( got, exp );

    /* */

  }

  /* - */

  function f1( e, k, c, src )
  {
    if( e === 2 )
    return undefined;
    return e + 10;
  }

  /* - */

}

filterCommonDropping.timeOut = 60000;

//

function mapCommonReturningUndefined( test )
{
  let env;

  namespaceEach({ method : 'mapWithoutEscapeLeft', left : 1 });
  namespaceEach({ method : 'mapWithoutEscapeRight', left : 0 });
  namespaceEach({ method : 'mapWithoutEscape', left : 1 });
  namespaceEach({ method : 'mapWithEscapeLeft', left : 1 });
  namespaceEach({ method : 'mapWithEscapeRight', left : 0 });
  namespaceEach({ method : 'mapWithEscape', left : 1 });
  namespaceEach({ method : 'map', left : 1 });

  /* - */

  function namespaceEach( env )
  {
    env.namespace = 'props';
    caseEach( env );
    env.namespace = 'map';
    caseEach( env );
    env.namespace = 'aux';
    caseEach( env );
    env.namespace = 'object';
    caseEach( env );
    env.namespace = 'container';
    caseEach( env );
  }

  /* - */

  function caseEach( _env )
  {
    env = _env;

    /* */

    test.case = `${__.entity.exportStringSolo( env )}, pass, dst <> src`;
    var src = [ 1, 2, 3 ];
    var dst = [ 4 ]
    var got = _[ env.namespace ][ env.method ]( dst, src, f1 );
    test.true( got === dst );
    var exp = { d : 4, a : 11, b : 2, c : 13 }
    test.identical( got, exp );
    var exp = [ 1, 2, 3 ];
    test.identical( src, exp );

    /* */

    test.case = `${__.entity.exportStringSolo( env )}, pass, dst === null`;
    var src = [ 1, 2, 3 ];
    var got = _[ env.namespace ][ env.method ]( null, src, f1 );
    test.true( got !== src );
    var exp = { a : 11, b : 2, c : 13 }
    test.identical( got, exp );
    var exp = [ 1, 2, 3 ]
    test.identical( src, exp );

    /* */

    test.case = `${__.entity.exportStringSolo( env )}, pass, dst === src`;
    var src = [ 1, 2, 3 ];
    var got = _[ env.namespace ][ env.method ]( src, src, f1 );
    test.true( got === src );
    var exp = { a : 11, b : 2, c : 13 }
    test.identical( got, exp );

    /* */

    test.case = `${__.entity.exportStringSolo( env )}, pass, dst === self`;
    var src = [ 1, 2, 3 ];
    var got = _[ env.namespace ][ env.method ]( _.self, src, f1 );
    test.true( got === src );
    var exp = { a : 11, b : 2, c : 13 }
    test.identical( got, exp );

    /* */

  }

  /* - */

  function f1( e, k, c, src )
  {
    if( e === 2 )
    return undefined;
    return e + 10;
  }

  /* - */

}

mapCommonReturningUndefined.timeOut = 60000;

//

function filterMapCommonEscaping( test )
{
  let env;

  namespaceEach({ method : 'filterWithoutEscapeLeft', left : 1, escaping : 0 });
  namespaceEach({ method : 'filterWithoutEscapeRight', left : 0, escaping : 0 });
  namespaceEach({ method : 'filterWithoutEscape', left : 1, escaping : 0 });
  namespaceEach({ method : 'filterWithEscapeLeft', left : 1, escaping : 1 });
  namespaceEach({ method : 'filterWithEscapeRight', left : 0, escaping : 1 });
  namespaceEach({ method : 'filterWithEscape', left : 1, escaping : 1 });
  namespaceEach({ method : 'filter', left : 1, escaping : 0 });

  namespaceEach({ method : 'mapWithoutEscapeLeft', left : 1, escaping : 0 });
  namespaceEach({ method : 'mapWithoutEscapeRight', left : 0, escaping : 0 });
  namespaceEach({ method : 'mapWithoutEscape', left : 1, escaping : 0 });
  namespaceEach({ method : 'mapWithEscapeLeft', left : 1, escaping : 1 });
  namespaceEach({ method : 'mapWithEscapeRight', left : 0, escaping : 1 });
  namespaceEach({ method : 'mapWithEscape', left : 1, escaping : 1 });
  namespaceEach({ method : 'map', left : 1, escaping : 0 });

  /* - */

  function namespaceEach( env )
  {
    env.namespace = 'props';
    caseEach( env );
    env.namespace = 'map';
    caseEach( env );
    env.namespace = 'aux';
    caseEach( env );
    env.namespace = 'object';
    caseEach( env );
    env.namespace = 'container';
    caseEach( env );
  }

  /* - */

  function caseEach( _env )
  {
    env = _env;

    /* */

    test.case = `${__.entity.exportStringSolo( env )}, pass, dst <> src`;
    var src = [ 1, 2, 3 ];
    var dst = [ 4 ]
    var got = _[ env.namespace ][ env.method ]( dst, src, f1 );
    test.true( got === dst );
    var exp = { d : 4, a : 11, b : escape( undefined ), c : 13 }
    test.identical( got, exp );
    var exp = [ 1, 2, 3 ];
    test.identical( src, exp );

    /* */

    test.case = `${__.entity.exportStringSolo( env )}, pass, dst === null`;
    var src = [ 1, 2, 3 ];
    var got = _[ env.namespace ][ env.method ]( null, src, f1 );
    test.true( got !== src );
    var exp = { a : 11, b : escape( undefined ), c : 13 }
    test.identical( got, exp );
    var exp = [ 1, 2, 3 ]
    test.identical( src, exp );

    /* */

    test.case = `${__.entity.exportStringSolo( env )}, pass, dst === src`;
    var src = [ 1, 2, 3 ];
    var got = _[ env.namespace ][ env.method ]( src, src, f1 );
    test.true( got === src );
    var exp = { a : 11, b : escape( undefined ), c : 13 }
    test.identical( got, exp );

    /* */

    test.case = `${__.entity.exportStringSolo( env )}, pass, dst === self`;
    var src = [ 1, 2, 3 ];
    var got = _[ env.namespace ][ env.method ]( _.self, src, f1 );
    test.true( got === src );
    var exp = { a : 11, b : escape( undefined ), c : 13 }
    test.identical( got, exp );

    /* */

  }

  /* - */

  function escape( src )
  {
    if( env.escaping )
    return src;
    return _.escape.left( src );
  }

  /* - */

  function f1( e, k, c, src )
  {
    if( e === 2 )
    return _.escape.left( undefined );
    return e + 10;
  }

  /* - */

}

filterMapCommonEscaping.timeOut = 60000;

// --
//
// --

const Proto =
{

  name : 'Tools.Long.l0.l3',
  silencing : 1,
  enabled : 1,

  tests :
  {

    // long l0/l3

    identical,

    // filterMapCommonPass,
    // filterCommonDropping,
    // mapCommonReturningUndefined,
    // filterMapCommonEscaping,

  }

}

const Self = wTestSuite( Proto );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

})();
