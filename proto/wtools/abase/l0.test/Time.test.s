( function _Time_test_s_( ) {

'use strict';

if( typeof module !== 'undefined' )
{
  let _ = require( '../Layer1.s' );
  _.include( 'wTesting' );
  // _.include( 'wConsequence' );
}

let _global = _global_;
let _ = _global_.wTools;

// --
// tests
// --

function timerIs( test )
{
  test.case = 'without argument';
  var got = _.timerIs();
  test.identical( got, false );

  test.case = 'check null';
  var got = _.timerIs( null );
  test.identical( got, false );

  test.case = 'check undefined';
  var got = _.timerIs( undefined );
  test.identical( got, false );

  test.case = 'check _.nothing';
  var got = _.timerIs( _.nothing );
  test.identical( got, false );

  test.case = 'check zero';
  var got = _.timerIs( 0 );
  test.identical( got, false );

  test.case = 'check empty string';
  var got = _.timerIs( '' );
  test.identical( got, false );

  test.case = 'check false';
  var got = _.timerIs( false );
  test.identical( got, false );

  test.case = 'check NaN';
  var got = _.timerIs( NaN );
  test.identical( got, false );

  test.case = 'check Symbol';
  var got = _.timerIs( Symbol() );
  test.identical( got, false );

  test.case = 'check empty array';
  var got = _.timerIs( [] );
  test.identical( got, false );

  test.case = 'check empty arguments array';
  var got = _.timerIs( _.argumentsArrayMake( [] ) );
  test.identical( got, false );

  test.case = 'check empty unroll';
  var got = _.timerIs( _.unrollMake( [] ) );
  test.identical( got, false );

  test.case = 'check empty map';
  var got = _.timerIs( {} );
  test.identical( got, false );

  test.case = 'check empty pure map';
  var got = _.timerIs( Object.create( null ) );
  test.identical( got, false );

  test.case = 'check empty Set';
  var got = _.timerIs( new Set( [] ) );
  test.identical( got, false );

  test.case = 'check empty Map';
  var got = _.timerIs( new Map( [] ) );
  test.identical( got, false );

  test.case = 'check empty BufferRaw';
  var got = _.timerIs( new BufferRaw() );
  test.identical( got, false );

  test.case = 'check empty BufferTyped';
  var got = _.timerIs( new U8x() );
  test.identical( got, false );

  test.case = 'check number';
  var got = _.timerIs( 3 );
  test.identical( got, false );

  test.case = 'check bigInt';
  var got = _.timerIs( 1n );
  test.identical( got, false );

  test.case = 'check object Number';
  var got = _.timerIs( new Number( 2 ) );
  test.identical( got, false );

  test.case = 'check string';
  var got = _.timerIs( 'str' );
  test.identical( got, false );

  test.case = 'check not empty array';
  var got = _.timerIs( [ null ] );
  test.identical( got, false );

  test.case = 'check not empty map';
  var got = _.timerIs( { '' : null } );
  test.identical( got, false );

  test.case = 'check instance of constructor';
  var Constr = function(){ this.x = 1; return this };
  var src = new Constr();
  var got = _.timerIs( src );
  test.identical( got, false );

  test.case = 'check _begin timer';
  var src = _.time._begin( undefined );
  var got = _.timerIs( src );
  test.identical( got, true );
  _.time.cancel( src );

  test.case = 'check _finally timer';
  var src = _.time._finally( undefined, undefined );
  var got = _.timerIs( src );
  test.identical( got, true );
  _.time.cancel( src );

  test.case = 'check _periodic timer';
  var src = _.time._periodic( 0, ( t ) => t.original );
  var got = _.timerIs( src );
  test.identical( got, true );
  _.time.cancel( src );

  test.case = 'check imitation of timer';
  var src = { type : 'timer', time : true, cancel : true, original : true  };
  var got = _.timerIs( src );
  test.identical( got, true );
}

//

function _begin( test )
{
  let context = this;

  var onTime = () => 0;
  var onCancel = () => -1;
  var ready = new _testerGlobal_.wTools.Consequence().take( null );

  /* - */

  ready.finally( () =>
  {
    test.open( 'delay - undefined' );
    return null;
  })

  .then( function()
  {
    test.case = 'without callbacks';
    var timer = _.time._begin( undefined );
    return _testerGlobal_.wTools.time.out( context.dt1, () => timer )
    .finally( function( err, got )
    {
      test.identical( got.onTime, undefined );
      test.identical( got.onCancel, undefined );
      test.identical( got.state, 0 );
      test.identical( got.result, undefined );
      _.time.cancel( timer );

      return null;
    });
  })

  .then( function()
  {
    test.case = 'onTime';
    var timer = _.time._begin( undefined, onTime );
    return _testerGlobal_.wTools.time.out( context.dt1, () => timer )
    .finally( function( err, got )
    {
      test.identical( got.onTime, onTime );
      test.identical( got.onCancel, undefined );
      test.identical( got.state, 0 );
      test.identical( got.result, undefined );
      _.time.cancel( timer );

      return null;
    });
  })

  .then( function()
  {
    test.case = 'onTime, execute method time';
    var timer = _.time._begin( undefined, onTime );
    timer.time();
    return _testerGlobal_.wTools.time.out( context.dt1, () => timer )
    .finally( function( err, got )
    {
      test.identical( got.onTime, onTime );
      test.identical( got.onCancel, undefined );
      test.identical( got.state, 2 );
      test.identical( got.result, 0 );

      return null;
    });
  })

  .then( function()
  {
    test.case = 'onCancel';
    var timer = _.time._begin( undefined, undefined, onCancel );
    return _testerGlobal_.wTools.time.out( context.dt1, () => timer )
    .finally( function( err, got )
    {
      test.identical( got.onTime, undefined );
      test.identical( got.onCancel, onCancel );
      test.identical( got.state, 0 );
      test.identical( got.result, undefined );
      _.time.cancel( timer );

      return null;
    });
  })

  .then( function()
  {
    test.case = 'onCancel, execute method cancel';
    var timer = _.time._begin( undefined, undefined, onCancel );
    timer.cancel();
    return _testerGlobal_.wTools.time.out( context.dt1, () => timer ) /* aaa : parametrize all time outs in the test suite */ /* Dmytro : add parametrized variables */
    .finally( function( err, got )
    {
      test.identical( got.onTime, undefined );
      test.identical( got.onCancel, onCancel );
      test.identical( got.state, -2 );
      test.identical( got.result, -1 );

      return null;
    });
  })

  .then( function()
  {
    test.case = 'onTime, onCancel';
    var timer = _.time._begin( undefined, onTime, onCancel );
    return _testerGlobal_.wTools.time.out( context.dt1, () => timer )
    .finally( function( err, got )
    {
      test.identical( got.onTime, onTime );
      test.identical( got.onCancel, onCancel );
      test.identical( got.state, 0 );
      test.identical( got.result, undefined );
      _.time.cancel( timer );

      return null;
    });
  })

  ready.finally( () =>
  {
    test.close( 'delay - undefined' );
    return null;
  });

  /* - */

  ready.finally( () =>
  {
    test.open( 'delay - 0' );
    return null;
  })

  .then( function()
  {
    test.case = 'without callbacks';
    var timer = _.time._begin( 0 );
    return _testerGlobal_.wTools.time.out( context.dt1, () => timer )
    .finally( function( err, got )
    {
      test.identical( got.onTime, undefined );
      test.identical( got.onCancel, undefined );
      test.identical( got.state, 2 );
      test.identical( got.result, undefined );

      return null;
    });
  })

  .then( function()
  {
    test.case = 'onTime';
    var timer = _.time._begin( 0, onTime );
    return _testerGlobal_.wTools.time.out( context.dt1, () => timer )
    .finally( function( err, got )
    {
      test.identical( got.onTime, onTime );
      test.identical( got.onCancel, undefined );
      test.identical( got.state, 2 );
      test.identical( got.result, 0 );

      return null;
    });
  })

  .then( function()
  {
    test.case = 'onTime, execute method time';
    var timer = _.time._begin( 0, onTime );
    timer.time()
    return _testerGlobal_.wTools.time.out( context.dt1, () => timer )
    .finally( function( err, got )
    {
      test.identical( got.onTime, onTime );
      test.identical( got.onCancel, undefined );
      test.identical( got.state, 2 );
      test.identical( got.result, 0 );

      return null;
    });
  })

  .then( function()
  {
    test.case = 'onCancel';
    var timer = _.time._begin( 0, undefined, onCancel );
    return _testerGlobal_.wTools.time.out( context.dt1, () => timer )
    .finally( function( err, got )
    {
      test.identical( got.onTime, undefined );
      test.identical( got.onCancel, onCancel );
      test.identical( got.state, 2 );
      test.identical( got.result, undefined );

      return null;
    });
  })

  .then( function()
  {
    test.case = 'onCancel, execute method cancel';
    var timer = _.time._begin( 0, undefined, onCancel );
    timer.cancel();
    return _testerGlobal_.wTools.time.out( context.dt1, () => timer )
    .finally( function( err, got )
    {
      test.identical( got.onTime, undefined );
      test.identical( got.onCancel, onCancel );
      test.identical( got.state, -2 );
      test.identical( got.result, -1 );

      return null;
    });
  })

  .then( function()
  {
    test.case = 'onTime, onCancel';
    var timer = _.time._begin( 0, onTime, onCancel );
    return _testerGlobal_.wTools.time.out( context.dt1, () => timer )
    .finally( function( err, got )
    {
      test.identical( got.onTime, onTime );
      test.identical( got.onCancel, onCancel );
      test.identical( got.state, 2 );
      test.identical( got.result, 0 );

      return null;
    });
  })

  .then( function()
  {
    test.case = 'only one execution';
    var times = 5;
    var result = [];
    var onTime = function()
    {
      if( times > 0 )
      {
        result.push( 1 );
        times--;
      }
    };

    var timer = _.time._begin( 0, onTime );
    return _testerGlobal_.wTools.time.out( context.dt3, () => timer )
    .finally( function( err, got )
    {
      test.identical( got.onTime, onTime );
      test.identical( got.onCancel, undefined );
      test.identical( got.state, 2 );
      test.identical( got.result, undefined );
      test.identical( times, 4 );
      test.identical( result, [ 1 ] );

      return null;
    });
  })

  .finally( () =>
  {
    test.close( 'delay - 0' );
    return null;
  });

  /* - */

  ready.finally( () =>
  {
    test.open( 'delay > 0' );
    return null;
  })

  .then( function()
  {
    test.case = 'without callbacks, timeout < check time';
    var timer = _.time._begin( context.dt1/2 );
    return _testerGlobal_.wTools.time.out( context.dt1, () => timer )
    .finally( function( err, got )
    {
      test.identical( got.onTime, undefined );
      test.identical( got.onCancel, undefined );
      test.identical( got.state, 2 );
      test.identical( got.result, undefined );

      return null;
    });
  })

  .then( function()
  {
    test.case = 'without callbacks, timeout > check time';
    var timer = _.time._begin( context.dt3 );
    return _testerGlobal_.wTools.time.out( context.dt1, () => timer )
    .finally( function( err, got )
    {
      test.identical( got.onTime, undefined );
      test.identical( got.onCancel, undefined );
      test.identical( got.state, 0 );
      test.identical( got.result, undefined );
      _.time.cancel( timer );

      return null;
    });
  })

  .then( function()
  {
    test.case = 'onTime, timeout < check time';
    var timer = _.time._begin( context.dt1/2, onTime );
    return _testerGlobal_.wTools.time.out( context.dt1, () => timer )
    .finally( function( err, got )
    {
      test.identical( got.onTime, onTime );
      test.identical( got.onCancel, undefined );
      test.identical( got.state, 2 );
      test.identical( got.result, 0 );

      return null;
    });
  })

  .then( function()
  {
    test.case = 'onTime, timeout > check time';
    var timer = _.time._begin( context.dt3, onTime );
    return _testerGlobal_.wTools.time.out( context.dt1, () => timer )
    .finally( function( err, got )
    {
      test.identical( got.onTime, onTime );
      test.identical( got.onCancel, undefined );
      test.identical( got.state, 0 );
      test.identical( got.result, undefined );
      _.time.cancel( timer );

      return null;
    });
  })

  .then( function()
  {
    test.case = 'onTime, timeout > check time, execute method time';
    var timer = _.time._begin( context.dt3, onTime );
    timer.time()
    return _testerGlobal_.wTools.time.out( context.dt1, () => timer )
    .finally( function( err, got )
    {
      test.identical( got.onTime, onTime );
      test.identical( got.onCancel, undefined );
      test.identical( got.state, 2 );
      test.identical( got.result, 0 );

      return null;
    });
  })

  .then( function()
  {
    test.case = 'onCancel, timeout < check time';
    var timer = _.time._begin( context.dt1/2, undefined, onCancel );
    return _testerGlobal_.wTools.time.out( context.dt1, () => timer )
    .finally( function( err, got )
    {
      test.identical( got.onTime, undefined );
      test.identical( got.onCancel, onCancel );
      test.identical( got.state, 2 );
      test.identical( got.result, undefined );

      return null;
    });
  })

  .then( function()
  {
    test.case = 'onCancel, timeout < check time, execute method cancel';
    var timer = _.time._begin( context.dt1/2, undefined, onCancel );
    timer.cancel();
    return _testerGlobal_.wTools.time.out( context.dt1, () => timer )
    .finally( function( err, got )
    {
      test.identical( got.onTime, undefined );
      test.identical( got.onCancel, onCancel );
      test.identical( got.state, -2 );
      test.identical( got.result, -1 );

      return null;
    });
  })

  .then( function()
  {
    test.case = 'onTime, onCancel, timeout < check time';
    var timer = _.time._begin( context.dt1/2, onTime, onCancel );
    return _testerGlobal_.wTools.time.out( context.dt1, () => timer )
    .finally( function( err, got )
    {
      test.identical( got.onTime, onTime );
      test.identical( got.onCancel, onCancel );
      test.identical( got.state, 2 );
      test.identical( got.result, 0 );

      return null;
    });
  })

  .then( function()
  {
    test.case = 'onTime, onCancel, timeout > check time';
    var timer = _.time._begin( context.dt3, onTime, onCancel );
    return _testerGlobal_.wTools.time.out( context.dt1, () => timer )
    .finally( function( err, got )
    {
      test.identical( got.onTime, onTime );
      test.identical( got.onCancel, onCancel );
      test.identical( got.state, 0 );
      test.identical( got.result, undefined );
      _.time.cancel( timer );

      return null;
    });
  })

  .then( function()
  {
    test.case = 'only one execution';
    var times = 5;
    var result = [];
    var onTime = function()
    {
      if( times > 0 )
      {
        result.push( 1 );
        times--;
      }
    };

    var timer = _.time._begin( context.dt1/2, onTime );
    return _testerGlobal_.wTools.time.out( context.dt3, () => timer )
    .finally( function( err, got )
    {
      test.identical( got.onTime, onTime );
      test.identical( got.onCancel, undefined );
      test.identical( got.state, 2 );
      test.identical( got.result, undefined );
      test.identical( times, 4 );
      test.identical( result, [ 1 ] );

      return null;
    });
  });

  ready.finally( ( err, arg ) =>
  {
    test.close( 'delay > 0' );

    if( err )
    throw err;
    return arg;
  });

  /* - */

  ready.then( () =>
  {
    test.case = 'executes method time twice, should throw error';
    var timer = _.time._begin( undefined, onTime, onCancel );
    timer.time();

    return _testerGlobal_.wTools.time.out( context.dt1, () => timer.time() )
    .finally( ( err, arg ) =>
    {
      if( arg )
      {
        test.is( false );
      }
      else
      {
        _.errAttend( err );
        test.is( true );
      }
      return null;
    });

    /* aaa2 : user should not call methods of timer | Dmytro : now the other concept is used, public methods can be used */

      /* aaa2 : test should ensure that there is no transitions from final states -2 either +2 to any another state. ask | Dmytro : timer not change state from state 2 to -2. State -2 changes to 2 if user call callback timer.time() */
  });

  ready.then( () =>
  {
    test.case = 'executes method cancel twice, should throw error';
    var timer = _.time._begin( undefined, onTime, onCancel );
    timer.cancel();

    return _testerGlobal_.wTools.time.out( context.dt1, () => timer.cancel() )
    .finally( ( err, arg ) =>
    {
      if( arg )
      {
        test.is( false );
      }
      else
      {
        _.errAttend( err );
        test.is( true );
      }
      return null;
    });
  });

  ready.then( () =>
  {
    test.case = 'executes method time and then method cancel, should throw error';
    var timer = _.time._begin( undefined, onTime, onCancel );
    timer.time();

    return _testerGlobal_.wTools.time.out( context.dt1, () => timer.cancel() )
    .finally( ( err, arg ) =>
    {
      if( arg )
      {
        test.is( false );
      }
      else
      {
        _.errAttend( err );
        test.is( true );
      }
      return null;
    });
  });

  ready.then( () =>
  {
    test.case = 'executes method time and then method cancel, should throw error';
    var timer = _.time._begin( undefined, onTime, onCancel );
    timer.cancel();

    return _testerGlobal_.wTools.time.out( context.dt1, () => timer.time() )
    .finally( ( err, arg ) =>
    {
      if( arg )
      {
        test.is( false );
      }
      else
      {
        _.errAttend( err );
        test.is( true );
      }
      return null;
    });
  });

  /* */

  return ready;
}

//

function _finally( test )
{
  let context = this;

  var onTime = () => 0;
  var ready = new _testerGlobal_.wTools.Consequence().take( null );

  /* - */

  ready.finally( () =>
  {
    test.open( 'delay - undefined' );
    return null;
  })

  .then( function()
  {
    test.case = 'without callbacks';
    var timer = _.time._finally( undefined, undefined );
    return _testerGlobal_.wTools.time.out( context.dt1, () => timer )
    .finally( function( err, got )
    {
      test.identical( got.onTime, undefined );
      test.identical( got.onCancel, undefined );
      test.identical( got.state, 0 );
      test.identical( got.result, undefined );
      _.time.cancel( timer );

      return null;
    });
  })

  .then( function()
  {
    test.case = 'onTime';
    var timer = _.time._finally( undefined, onTime );
    return _testerGlobal_.wTools.time.out( context.dt1, () => timer )
    .finally( function( err, got )
    {
      test.identical( got.onTime, onTime );
      test.identical( got.onCancel, onTime );
      test.identical( got.state, 0 );
      test.identical( got.result, undefined );
      _.time.cancel( timer );

      return null;
    });
  })

  .then( function()
  {
    test.case = 'onTime, execute method time';
    var timer = _.time._finally( undefined, onTime );
    timer.time()
    return _testerGlobal_.wTools.time.out( context.dt1, () => timer )
    .finally( function( err, got )
    {
      test.identical( got.onTime, onTime );
      test.identical( got.onCancel, onTime );
      test.identical( got.state, 2 );
      test.identical( got.result, 0 );

      return null;
    });
  })

  .then( function()
  {
    test.case = 'onTime, execute method cancel';
    var timer = _.time._finally( undefined, onTime );
    timer.cancel();
    return _testerGlobal_.wTools.time.out( context.dt1, () => timer )
    .finally( function( err, got )
    {
      test.identical( got.onTime, onTime );
      test.identical( got.onCancel, onTime );
      test.identical( got.state, -2 );
      test.identical( got.result, 0 );

      return null;
    });
  })

  ready.finally( () =>
  {
    test.close( 'delay - undefined' );
    return null;
  });

  /* - */

  ready.finally( () =>
  {
    test.open( 'delay - 0' );
    return null;
  })

  .then( function()
  {
    test.case = 'without callbacks';
    var timer = _.time._finally( 0, undefined );
    return _testerGlobal_.wTools.time.out( context.dt1, () => timer )
    .finally( function( err, got )
    {
      test.identical( got.onTime, undefined );
      test.identical( got.onCancel, undefined );
      test.identical( got.state, 2 );
      test.identical( got.result, undefined );

      return null;
    });
  })

  .then( function()
  {
    test.case = 'onTime';
    var timer = _.time._finally( 0, onTime );
    return _testerGlobal_.wTools.time.out( context.dt1, () => timer )
    .finally( function( err, got )
    {
      test.identical( got.onTime, onTime );
      test.identical( got.onCancel, onTime );
      test.identical( got.state, 2 );
      test.identical( got.result, 0 );

      return null;
    });
  })

  .then( function()
  {
    test.case = 'onTime, execute method time';
    var timer = _.time._finally( 0, onTime );
    timer.time();
    return _testerGlobal_.wTools.time.out( context.dt1, () => timer )
    .finally( function( err, got )
    {
      test.identical( got.onTime, onTime );
      test.identical( got.onCancel, onTime );
      test.identical( got.state, 2 );
      test.identical( got.result, 0 );

      return null;
    });
  })

  .then( function()
  {
    test.case = 'onTime, execute method cancel';
    var timer = _.time._finally( 0, onTime );
    timer.cancel();
    return _testerGlobal_.wTools.time.out( context.dt1, () => timer )
    .finally( function( err, got )
    {
      test.identical( got.onTime, onTime );
      test.identical( got.onCancel, onTime );
      test.identical( got.state, -2 );
      test.identical( got.result, 0 );

      return null;
    });
  })

  .then( function()
  {
    test.case = 'only one execution';
    var times = 5;
    var result = [];
    var onTime = function()
    {
      if( times > 0 )
      {
        result.push( 1 );
        times--;
      }
    };

    var timer = _.time._finally( 0, onTime );
    return _testerGlobal_.wTools.time.out( context.dt3, () => timer )
    .finally( function( err, got )
    {
      test.identical( got.onTime, onTime );
      test.identical( got.onCancel, onTime );
      test.identical( got.state, 2 );
      test.identical( got.result, undefined );
      test.identical( times, 4 );
      test.identical( result, [ 1 ] );

      return null;
    });
  })


  .finally( () =>
  {
    test.close( 'delay - 0' );
    return null;
  });

  /* - */

  ready.finally( () =>
  {
    test.open( 'delay > 0' );
    return null;
  })

  .then( function()
  {
    test.case = 'without callbacks, timeout < check time';
    var timer = _.time._finally( context.dt1/2, undefined );
    return _testerGlobal_.wTools.time.out( context.dt1, () => timer )
    .finally( function( err, got )
    {
      test.identical( got.onTime, undefined );
      test.identical( got.onCancel, undefined );
      test.identical( got.state, 2 );
      test.identical( got.result, undefined );

      return null;
    });
  })

  .then( function()
  {
    test.case = 'without callbacks, timeout > check time';
    var timer = _.time._finally( context.dt3, undefined );
    return _testerGlobal_.wTools.time.out( context.dt1, () => timer )
    .finally( function( err, got )
    {
      test.identical( got.onTime, undefined );
      test.identical( got.onCancel, undefined );
      test.identical( got.state, 0 );
      test.identical( got.result, undefined );
      _.time.cancel( timer );

      return null;
    });
  })

  .then( function()
  {
    test.case = 'onTime, timeout < check time';
    var timer = _.time._finally( context.dt1/2, onTime );
    return _testerGlobal_.wTools.time.out( context.dt1, () => timer )
    .finally( function( err, got )
    {
      test.identical( got.onTime, onTime );
      test.identical( got.onCancel, onTime );
      test.identical( got.state, 2 );
      test.identical( got.result, 0 );

      return null;
    });
  })

  .then( function()
  {
    test.case = 'onTime, timeout > check time';
    var timer = _.time._finally( context.dt3, onTime );
    return _testerGlobal_.wTools.time.out( context.dt1, () => timer )
    .finally( function( err, got )
    {
      test.identical( got.onTime, onTime );
      test.identical( got.onCancel, onTime );
      test.identical( got.state, 0 );
      test.identical( got.result, undefined );
      _.time.cancel( timer );

      return null;
    });
  })

  .then( function()
  {
    test.case = 'onTime, timeout > check time, execute method cancel';
    var timer = _.time._finally( context.dt3, onTime );
    timer.cancel();
    return _testerGlobal_.wTools.time.out( context.dt1, () => timer )
    .finally( function( err, got )
    {
      test.identical( got.onTime, onTime );
      test.identical( got.onCancel, onTime );
      test.identical( got.state, -2 );
      test.identical( got.result, 0 );

      return null;
    });
  })

  .then( function()
  {
    test.case = 'onTime, timeout > check time';
    var timer = _.time._finally( context.dt3, onTime );
    return _testerGlobal_.wTools.time.out( context.dt1, () => timer )
    .finally( function( err, got )
    {
      test.identical( got.onTime, onTime );
      test.identical( got.onCancel, onTime );
      test.identical( got.state, 0 );
      test.identical( got.result, undefined );
      _.time.cancel( timer );

      return null;
    });
  })

  .then( function()
  {
    test.case = 'onTime, timeout > check time, execute method time';
    var timer = _.time._finally( context.dt3, onTime );
    timer.time()
    return _testerGlobal_.wTools.time.out( context.dt1, () => timer )
    .finally( function( err, got )
    {
      test.identical( got.onTime, onTime );
      test.identical( got.onCancel, onTime );
      test.identical( got.state, 2 );
      test.identical( got.result, 0 );

      return null;
    });
  })

  .then( function()
  {
    test.case = 'only one execution';
    var times = 5;
    var result = [];
    var onTime = function()
    {
      if( times > 0 )
      {
        result.push( 1 );
        times--;
      }
    };

    var timer = _.time._finally( 0, onTime );
    return _testerGlobal_.wTools.time.out( context.dt3, () => timer )
    .finally( function( err, got )
    {
      test.identical( got.onTime, onTime );
      test.identical( got.onCancel, onTime );
      test.identical( got.state, 2 );
      test.identical( got.result, undefined );
      test.identical( times, 4 );
      test.identical( result, [ 1 ] );

      return null;
    });
  });

  ready.finally( ( err, arg ) =>
  {
    test.close( 'delay > 0' );

    if( err )
    throw err;
    return arg;
  });

  /* - */

  ready.then( () =>
  {
    test.case = 'executes method time twice, should throw error';
    var timer = _.time._finally( undefined, onTime );
    timer.time();

    return _testerGlobal_.wTools.time.out( context.dt1, () => timer.time() )
    .finally( ( err, arg ) =>
    {
      if( arg )
      {
        test.is( false );
      }
      else
      {
        _.errAttend( err );
        test.is( true );
      }
      return null;
    });
  });

  ready.then( () =>
  {
    test.case = 'executes method cancel twice, should throw error';
    var timer = _.time._finally( undefined, onTime );
    timer.cancel();

    return _testerGlobal_.wTools.time.out( context.dt1, () => timer.cancel() )
    .finally( ( err, arg ) =>
    {
      if( arg )
      {
        test.is( false );
      }
      else
      {
        _.errAttend( err );
        test.is( true );
      }
      return null;
    });
  });

  ready.then( () =>
  {
    test.case = 'executes method time and then method cancel, should throw error';
    var timer = _.time._finally( undefined, onTime );
    timer.time();

    return _testerGlobal_.wTools.time.out( context.dt1, () => timer.cancel() )
    .finally( ( err, arg ) =>
    {
      if( arg )
      {
        test.is( false );
      }
      else
      {
        _.errAttend( err );
        test.is( true );
      }
      return null;
    });
  });

  ready.then( () =>
  {
    test.case = 'executes method time and then method cancel, should throw error';
    var timer = _.time._finally( undefined, onTime );
    timer.cancel();

    return _testerGlobal_.wTools.time.out( context.dt1, () => timer.time() )
    .finally( ( err, arg ) =>
    {
      if( arg )
      {
        test.is( false );
      }
      else
      {
        _.errAttend( err );
        test.is( true );
      }
      return null;
    });
  });

  /* */

  return ready;
}

//

function _periodic( test )
{
  let context = this;

  var onCancel = () => -1;
  var ready = new _testerGlobal_.wTools.Consequence().take( null );

  /* - */

  ready.finally( () =>
  {
    test.open( 'delay - 0' );
    return null;
  })

  .then( function()
  {
    test.case = 'onTime';
    var times = 5;
    var result = [];
    var onTime = function()
    {
      if( times > 0 )
      {
        result.push( 1 );
        times--;
        return true;
      }
      return undefined;
    };

    var timer = _.time._periodic( 0, onTime );
    return _testerGlobal_.wTools.time.out( context.dt4, () => timer )
    .finally( function( err, got )
    {
      test.identical( got.onTime, onTime );
      test.identical( got.onCancel, undefined );
      test.identical( got.state, -2 );
      test.identical( got.result, undefined );
      test.identical( times, 0 );
      test.identical( result, [ 1, 1, 1, 1, 1 ] );
      _.time.cancel( timer );

      return null;
    });
  })

  .then( function()
  {
    test.case = 'onTime, execute onTime';
    var times = 5;
    var result = [];
    var onTime = function()
    {
      if( times > 0 )
      {
        result.push( 1 );
        times--;
        return true;
      }
      return _.dont;
    };

    var timer = _.time._periodic( 0, onTime );
    return _testerGlobal_.wTools.time.out( context.dt4, () => timer )
    .finally( function( err, got )
    {
      test.identical( got.onTime, onTime );
      test.identical( got.onCancel, undefined );
      test.identical( got.state, -2 );
      test.identical( got.result, _.dont );
      test.identical( times, 0 );
      test.identical( result, [ 1, 1, 1, 1, 1 ] );
      _.time.cancel( timer );

      return null;
    });
  })

  .then( function()
  {
    test.case = 'onTime, onCancel';
    var times = 5;
    var result = [];
    var onTime = function()
    {
      if( times > 0 )
      {
        result.push( 1 );
        times--;
        return true;
      }
      return undefined;
    };

    var timer = _.time._periodic( 0, onTime, onCancel );
    return _testerGlobal_.wTools.time.out( context.dt4, () => timer )
    .finally( function( err, got )
    {
      test.identical( got.onTime, onTime );
      test.identical( got.onCancel, onCancel );
      test.identical( got.state, -2 );
      test.identical( got.result, -1 );
      test.identical( times, 0 );
      test.identical( result, [ 1, 1, 1, 1, 1 ] );
      _.time.cancel( timer );

      return null;
    });
  })

  .then( function()
  {
    test.case = 'onTime, onCancel, execution of callbacks';
    var times = 5;
    var result = [];
    var onTime = function()
    {
      if( times > 0 )
      {
        result.push( 1 );
        times--;
        return true;
      }
    };

    var timer = _.time._periodic( 0, onTime, onCancel );
    return _testerGlobal_.wTools.time.out( context.dt4, () => timer )
    .finally( function( err, got )
    {
      test.identical( got.onTime, onTime );
      test.identical( got.onCancel, onCancel );
      test.identical( got.state, -2 );
      test.identical( got.result, -1 );
      test.identical( times, 0 );
      test.identical( result, [ 1, 1, 1, 1, 1 ] );

      _.time.cancel( got );

      test.identical( got.onTime, onTime );
      test.identical( got.onCancel, onCancel );
      test.identical( got.state, -2 );
      test.identical( got.result, -1 );
      test.identical( times, 0 );
      test.identical( result, [ 1, 1, 1, 1, 1 ] );
      _.time.cancel( timer );

      return null;
    });
  })

  .finally( () =>
  {
    test.close( 'delay - 0' );
    return null;
  });
  /* - */

  ready.finally( () =>
  {
    test.open( 'delay > 0' );
    return null;
  })

  .then( function()
  {
    test.case = 'onTime';
    var times = 5;
    var result = [];
    var onTime = function()
    {
      if( times > 0 )
      {
        result.push( 1 );
        times--;
        return true;
      }
    };

    var timer = _.time._periodic( context.dt1/2, onTime );
    return _testerGlobal_.wTools.time.out( context.dt4*2, () => timer )
    .finally( function( err, got )
    {
      test.identical( got.onTime, onTime );
      test.identical( got.onCancel, undefined );
      test.is( got.state === -2 );
      test.identical( got.result, undefined );
      test.identical( times, 0 );
      test.identical( result, [ 1, 1, 1, 1, 1 ] );
      _.time.cancel( timer );

      return null;
    });
  })

  .then( function()
  {
    test.case = 'onTime, execute onTime';
    var times = 5;
    var result = [];
    var onTime = function()
    {
      if( times > 0 )
      {
        result.push( 1 );
        times--;
        return true;
      }
      return _.dont;
    };

    var timer = _.time._periodic( context.dt1/2, onTime );
    return _testerGlobal_.wTools.time.out( context.dt4*2, () => timer )
    .finally( function( err, got )
    {
      test.identical( got.onTime, onTime );
      test.identical( got.onCancel, undefined );
      test.identical( got.state, -2 );
      test.identical( got.result, _.dont );
      test.identical( times, 0 );
      test.identical( result, [ 1, 1, 1, 1, 1 ] );
      _.time.cancel( timer );

      return null;
    });
  })

  .then( function()
  {
    test.case = 'onTime, onCancel';
    var times = 5;
    var result = [];
    var onTime = function()
    {
      if( times > 0 )
      {
        result.push( 1 );
        times--;
        return true;
      }
    };

    var timer = _.time._periodic( context.dt1/2, onTime, onCancel );
    return _testerGlobal_.wTools.time.out( context.dt4*2, () => timer )
    .finally( function( err, got )
    {
      test.identical( got.onTime, onTime );
      test.identical( got.onCancel, onCancel );
      test.is( got.state === -2 );
      test.identical( got.result, -1 );
      test.identical( times, 0 );
      test.identical( result, [ 1, 1, 1, 1, 1 ] );
      _.time.cancel( timer );

      return null;
    });
  })

  .then( function()
  {
    test.case = 'onTime, onCancel, execution of callbacks';
    var times = 5;
    var result = [];
    var onTime = function()
    {
      if( times > 0 )
      {
        result.push( 1 );
        times--;
        return true;
      }
    };

    var timer = _.time._periodic( context.dt1/2, onTime, onCancel );
    return _testerGlobal_.wTools.time.out( context.dt4*2, () => timer )
    .finally( function( err, got )
    {
      test.identical( got.onTime, onTime );
      test.identical( got.onCancel, onCancel );
      test.identical( got.state, -2 );
      test.identical( got.result, -1 );
      test.identical( times, 0 );
      test.identical( result, [ 1, 1, 1, 1, 1 ] );

      _.time.cancel( got );

      test.identical( got.onTime, onTime );
      test.identical( got.onCancel, onCancel );
      test.identical( got.state, -2 );
      test.identical( got.result, -1 );
      test.identical( times, 0 );
      test.identical( result, [ 1, 1, 1, 1, 1 ] );
      _.time.cancel( timer );

      return null;
    });
  })

  /* - */

  ready.finally( ( err, arg ) =>
  {
    test.close( 'delay > 0' );

    if( err )
    throw err;
    return arg;
  });

  /* */

  return ready;
}

//

function _cancel( test )
{
  let context = this;

  test.open( 'timer - _begin' );

  test.case = 'delay - undefined';
  var timer = _.time._begin( undefined );
  var got = _.time._cancel( timer );
  test.identical( got.onTime, undefined );
  test.identical( got.onCancel, undefined );
  test.identical( got.state, -2 );
  test.identical( got.result, undefined );

  test.case = 'delay - undefined, onTime';
  var onTime = () => 0;
  var timer = _.time._begin( undefined, onTime );
  var got = _.time._cancel( timer );
  test.identical( got.onTime, onTime );
  test.identical( got.onCancel, undefined );
  test.identical( got.state, -2 );
  test.identical( got.result, undefined );

  test.case = 'delay - undefined, onCancel';
  var onCancel = () => -1;
  var timer = _.time._begin( undefined, undefined, onCancel );
  var got = _.time._cancel( timer );
  test.identical( got.onTime, undefined );
  test.identical( got.onCancel, onCancel );
  test.identical( got.state, -2 );
  test.identical( got.result, -1 );

  test.case = 'delay - undefined, onTime, onCancel';
  var onTime = () => 0;
  var onCancel = () => -1;
  var timer = _.time._begin( undefined, onTime, onCancel );
  var got = _.time._cancel( timer );
  test.identical( got.onTime, onTime );
  test.identical( got.onCancel, onCancel );
  test.identical( got.state, -2 );
  test.identical( got.result, -1 );

  test.close( 'timer - _begin' );

  /* - */

  test.open( 'timer - _finally' );

  test.case = 'delay - undefined';
  var timer = _.time._finally( undefined, undefined );
  var got = _.time._cancel( timer );
  test.identical( got.onTime, undefined );
  test.identical( got.onCancel, undefined );
  test.identical( got.state, -2 );
  test.identical( got.result, undefined );

  test.case = 'delay - undefined, onTime';
  var onTime = () => 0;
  var timer = _.time._finally( undefined, onTime );
  var got = _.time._cancel( timer );
  test.identical( got.onTime, onTime );
  test.identical( got.onCancel, onTime );
  test.identical( got.state, -2 );
  test.identical( got.result, 0 );

  test.close( 'timer - _finally' );

  /* - */

  test.open( 'timer - _periodic' );

  test.case = 'delay - 0, onTime';
  var onTime = () => 0;
  var timer = _.time._periodic( context.dt5, onTime ) ;
  var got = _.time._cancel( timer );
  test.identical( got.onTime, onTime );
  test.identical( got.onCancel, undefined );
  test.identical( got.state, -2 );
  test.identical( got.result, undefined );

  test.case = 'delay - 0, onTime, onCancel';
  var onTime = () => 0;
  var onCancel = () => -1;
  var timer = _.time._periodic( context.dt5, onTime, onCancel ) ;
  var got = _.time._cancel( timer );
  test.identical( got.onTime, onTime );
  test.identical( got.onCancel, onCancel );
  test.identical( got.state, -2 );
  test.identical( got.result, -1 );

  test.close( 'timer - _periodic' );
}

//

function timeOutCancelInsideOfCallback( test )
{
  let context = this;
  let visited = [];

  var timer = _.time.begin( 1, () =>
  {
    visited.push( 'v1' );
    debugger;
    _.time.cancel( timer );
    visited.push( 'v2' );
  });

  visited.push( 'v0' );

  return _testerGlobal_.wTools.time.out( context.dt2*5 ).then( () =>
  {
    test.identical( visited, [ 'v0', 'v1', 'v2' ] );
    return null;
  });
}

//

function timeOutCancelOutsideOfCallback( test )
{
  let context = this;
  let visited = [];

  var timer = _.time.begin( context.dt2*1, () =>
  {
    visited.push( 'v1' );
  });

  _.time.cancel( timer );
  visited.push( 'v0' );

  return _testerGlobal_.wTools.time.out( context.dt2*5 ).then( () =>
  {
    test.identical( visited, [ 'v0' ] );
    return null;
  });
}

//

function timeOutCancelZeroDelayInsideOfCallback( test )
{
  let context = this;
  let visited = [];

  var timer = _.time.begin( 0, () =>
  {
    visited.push( 'v1' );
    _.time.cancel( timer );
    visited.push( 'v2' );
  });

  visited.push( 'v0' );

  return _testerGlobal_.wTools.time.out( context.dt2*5 ).then( () =>
  {
    test.identical( visited, [ 'v0', 'v1', 'v2' ] );
    return null;
  });
}

//

function timeOutCancelZeroDelayOutsideOfCallback( test )
{
  let context = this;
  let visited = [];

  debugger;
  var timer = _.time.begin( 0, () =>
  {
    visited.push( 'v1' );
  });

  _.time.cancel( timer );
  visited.push( 'v0' );

  return _testerGlobal_.wTools.time.out( context.dt2*5 ).then( () =>
  {
    test.identical( visited, [ 'v0' ] );
    return null;
  });
}

// --
// declaration
// --

var Self =
{

  name : 'Tools.Time',
  silencing : 1,

  context :
  {
    dt1 : 10,
    dt2 : 25,
    dt3 : 100,
    dt4 : 200,
    dt5 : 1000,
  },

  tests :
  {

    timerIs,

    _begin,
    _finally,
    _periodic,
    _cancel,

    timeOutCancelInsideOfCallback,
    timeOutCancelOutsideOfCallback,

    timeOutCancelZeroDelayInsideOfCallback,
    timeOutCancelZeroDelayOutsideOfCallback,

  }

}

//

Self = wTestSuite( Self );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

} )( );
