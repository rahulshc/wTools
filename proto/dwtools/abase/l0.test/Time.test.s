( function _Time_test_s_( ) {

'use strict';

if( typeof module !== 'undefined' )
{
  let _ = require( '../Layer2.s' );
  _.include( 'wTesting' );
  _.include( 'wConsequence' );
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
  var src = _.time._periodic( 1000, ( t ) => t.original );
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
  var onTime = () => 0;
  var onCancel = () => -1;
  var con = new _.Consequence().take( null );

  /* - */

  con.finally( () =>
  {
    test.open( 'delay - undefined' );
    return null;
  })

  .then( function()
  {
    test.case = 'without callbacks';
    var timer = _.time._begin( undefined );
    return _.time.out( 10, () => timer )
    .finally( function( err, got )
    {
      test.identical( got.onTime, undefined );
      test.identical( got.onCancel, undefined );
      test.identical( got.state, 0 );
      test.identical( got.result, undefined );
      clearTimeout( got.original );

      return null;
    });
  })

  .then( function()
  {
    test.case = 'onTime';
    var timer = _.time._begin( undefined, onTime );
    return _.time.out( 10, () => timer )
    .finally( function( err, got )
    {
      test.identical( got.onTime, onTime );
      test.identical( got.onCancel, undefined );
      test.identical( got.state, 0 );
      test.identical( got.result, undefined );
      clearTimeout( got.original );

      return null;
    });
  })

  .then( function()
  {
    test.case = 'onTime, execute onTime';
    var timer = _.time._begin( undefined, onTime );
    timer.time();
    return _.time.out( 10, () => timer )
    .finally( function( err, got )
    {
      test.identical( got.onTime, onTime );
      test.identical( got.onCancel, undefined );
      test.identical( got.state, 2 );
      test.identical( got.result, 0 );
      clearTimeout( got.original );

      return null;
    });
  })

  .then( function()
  {
    test.case = 'onCancel';
    var timer = _.time._begin( undefined, undefined, onCancel );
    return _.time.out( 10, () => timer )
    .finally( function( err, got )
    {
      test.identical( got.onTime, undefined );
      test.identical( got.onCancel, onCancel );
      test.identical( got.state, 0 );
      test.identical( got.result, undefined );
      clearTimeout( got.original );

      return null;
    });
  })

  .then( function()
  {
    test.case = 'onCancel, execute onCancel';
    var timer = _.time._begin( undefined, undefined, onCancel );
    _.time.cancel( timer );
    return _.time.out( 10, () => timer )
    .finally( function( err, got )
    {
      test.identical( got.onTime, undefined );
      test.identical( got.onCancel, onCancel );
      test.identical( got.state, -2 );
      test.identical( got.result, -1 );
      clearTimeout( got.original );

      return null;
    });
  })

  .then( function()
  {
    test.case = 'onTime, onCancel';
    var timer = _.time._begin( undefined, onTime, onCancel );
    return _.time.out( 10, () => timer )
    .finally( function( err, got )
    {
      test.identical( got.onTime, onTime );
      test.identical( got.onCancel, onCancel );
      test.identical( got.state, 0 );
      test.identical( got.result, undefined );
      clearTimeout( got.original );

      return null;
    });
  })

  .then( function()
  {
    test.case = 'onTime, onCancel, execution of callbacks';
    var timer = _.time._begin( undefined, onTime, onCancel );
    timer.time(); /* qqq2 : user should not call methods of timer | Dmytro : direct call of callbacks used only in test cases delay === undefined, it has no variants to change state of timer because delay === Infinity */
    return _.time.out( 10, () => timer )
    .finally( function( err, got )
    {
      test.identical( got.onTime, onTime );
      test.identical( got.onCancel, onCancel );
      test.identical( got.state, 2 );
      test.identical( got.result, 0 );

      _.time.cancel( got ); /* qqq2 : test should ensure that there is no transitions from final states -2 either +2 to any another state. ask | Dmytro : timer not change state from state 2 to -2. State -2 changes to 2 if user call callback timer.time() */

      test.identical( got.onTime, onTime );
      test.identical( got.onCancel, onCancel );
      test.identical( got.state, 2 );
      test.identical( got.result, 0 );
      clearTimeout( got.original );

      return null;
    });
  })

  con.finally( () =>
  {
    test.close( 'delay - undefined' );
    return null;
  });

  /* - */

  con.finally( () =>
  {
    test.open( 'delay - 0' );
    return null;
  })

  .then( function()
  {
    test.case = 'without callbacks';
    var timer = _.time._begin( 0 );
    return _.time.out( 10, () => timer )
    .finally( function( err, got )
    {
      test.identical( got.onTime, undefined );
      test.identical( got.onCancel, undefined );
      test.identical( got.state, 2 );
      test.identical( got.result, undefined );
      clearTimeout( got.original );

      return null;
    });
  })

  .then( function()
  {
    test.case = 'onTime';
    var timer = _.time._begin( 0, onTime );
    return _.time.out( 10, () => timer )
    .finally( function( err, got )
    {
      test.identical( got.onTime, onTime );
      test.identical( got.onCancel, undefined );
      test.identical( got.state, 2 );
      test.identical( got.result, 0 );
      clearTimeout( got.original );

      return null;
    });
  })

  .then( function()
  {
    test.case = 'onTime, execute onTime';
    var timer = _.time._begin( 0, onTime );
    timer.time()
    return _.time.out( 10, () => timer )
    .finally( function( err, got )
    {
      test.identical( got.onTime, onTime );
      test.identical( got.onCancel, undefined );
      test.identical( got.state, 2 );
      test.identical( got.result, 0 );
      clearTimeout( got.original );

      return null;
    });
  })

  .then( function()
  {
    test.case = 'onCancel';
    var timer = _.time._begin( 0, undefined, onCancel );
    return _.time.out( 10, () => timer )
    .finally( function( err, got )
    {
      test.identical( got.onTime, undefined );
      test.identical( got.onCancel, onCancel );
      test.identical( got.state, 2 );
      test.identical( got.result, undefined );
      clearTimeout( got.original );

      return null;
    });
  })

  .then( function()
  {
    test.case = 'onCancel, execute onCancel';
    var timer = _.time._begin( 0, undefined, onCancel );
    _.time.cancel( timer )
    return _.time.out( 10, () => timer )
    .finally( function( err, got )
    {
      test.identical( got.onTime, undefined );
      test.identical( got.onCancel, onCancel );
      test.identical( got.state, -2 );
      test.identical( got.result, -1 );
      clearTimeout( got.original );

      return null;
    });
  })

  .then( function()
  {
    test.case = 'onTime, onCancel';
    var timer = _.time._begin( 0, onTime, onCancel );
    return _.time.out( 10, () => timer )
    .finally( function( err, got )
    {
      test.identical( got.onTime, onTime );
      test.identical( got.onCancel, onCancel );
      test.identical( got.state, 2 );
      test.identical( got.result, 0 );
      clearTimeout( got.original );

      return null;
    });
  })

  .then( function()
  {
    test.case = 'onTime, onCancel, execution of callbacks';
    var timer = _.time._begin( 0, onTime, onCancel );
    return _.time.out( 10, () => timer )
    .finally( function( err, got )
    {
      test.identical( got.onTime, onTime );
      test.identical( got.onCancel, onCancel );
      test.identical( got.state, 2 );
      test.identical( got.result, 0 );

      _.time.cancel( got );

      test.identical( got.onTime, onTime );
      test.identical( got.onCancel, onCancel );
      test.identical( got.state, 2 );
      test.identical( got.result, 0 );
      clearTimeout( got.original );

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
    return _.time.out( 100, () => timer )
    .finally( function( err, got )
    {
      test.identical( got.onTime, onTime );
      test.identical( got.onCancel, undefined );
      test.identical( got.state, 2 );
      test.identical( got.result, undefined );
      test.identical( times, 4 );
      test.identical( result, [ 1 ] );
      clearTimeout( got.original );

      return null;
    });
  })

  .finally( () =>
  {
    test.close( 'delay - 0' );
    return null;
  });

  /* - */

  con.finally( () =>
  {
    test.open( 'delay > 0' );
    return null;
  })

  .then( function()
  {
    test.case = 'without callbacks, timeout < check time';
    var timer = _.time._begin( 5 );
    return _.time.out( 10, () => timer )
    .finally( function( err, got )
    {
      test.identical( got.onTime, undefined );
      test.identical( got.onCancel, undefined );
      test.identical( got.state, 2 );
      test.identical( got.result, undefined );
      clearTimeout( got.original );

      return null;
    });
  })

  .then( function()
  {
    test.case = 'without callbacks, timeout > check time';
    var timer = _.time._begin( 100 );
    return _.time.out( 10, () => timer )
    .finally( function( err, got )
    {
      test.identical( got.onTime, undefined );
      test.identical( got.onCancel, undefined );
      test.identical( got.state, 0 );
      test.identical( got.result, undefined );
      clearTimeout( got.original );

      return null;
    });
  })

  .then( function()
  {
    test.case = 'onTime, timeout < check time';
    var timer = _.time._begin( 5, onTime );
    return _.time.out( 10, () => timer )
    .finally( function( err, got )
    {
      test.identical( got.onTime, onTime );
      test.identical( got.onCancel, undefined );
      test.identical( got.state, 2 );
      test.identical( got.result, 0 );
      clearTimeout( got.original );

      return null;
    });
  })

  .then( function()
  {
    test.case = 'onTime, timeout > check time';
    var timer = _.time._begin( 100, onTime );
    return _.time.out( 10, () => timer )
    .finally( function( err, got )
    {
      test.identical( got.onTime, onTime );
      test.identical( got.onCancel, undefined );
      test.identical( got.state, 0 );
      test.identical( got.result, undefined );
      clearTimeout( got.original );

      return null;
    });
  })

  .then( function()
  {
    test.case = 'onTime, timeout > check time, execute onTime';
    var timer = _.time._begin( 100, onTime );
    timer.time()
    return _.time.out( 10, () => timer )
    .finally( function( err, got )
    {
      test.identical( got.onTime, onTime );
      test.identical( got.onCancel, undefined );
      test.identical( got.state, 2 );
      test.identical( got.result, 0 );
      clearTimeout( got.original );

      return null;
    });
  })

  .then( function()
  {
    test.case = 'onCancel, timeout < check time';
    var timer = _.time._begin( 5, undefined, onCancel );
    return _.time.out( 10, () => timer )
    .finally( function( err, got )
    {
      test.identical( got.onTime, undefined );
      test.identical( got.onCancel, onCancel );
      test.identical( got.state, 2 );
      test.identical( got.result, undefined );
      clearTimeout( got.original );

      return null;
    });
  })

  .then( function()
  {
    test.case = 'onCancel, timeout < check time, execute onCancel';
    var timer = _.time._begin( 5, undefined, onCancel );
    _.time.cancel( timer )
    return _.time.out( 10, () => timer )
    .finally( function( err, got )
    {
      test.identical( got.onTime, undefined );
      test.identical( got.onCancel, onCancel );
      test.identical( got.state, -2 );
      test.identical( got.result, -1 );
      clearTimeout( got.original );

      return null;
    });
  })

  .then( function()
  {
    test.case = 'onTime, onCancel, timeout < check time';
    var timer = _.time._begin( 5, onTime, onCancel );
    return _.time.out( 10, () => timer )
    .finally( function( err, got )
    {
      test.identical( got.onTime, onTime );
      test.identical( got.onCancel, onCancel );
      test.identical( got.state, 2 );
      test.identical( got.result, 0 );
      clearTimeout( got.original );

      return null;
    });
  })

  .then( function()
  {
    test.case = 'onTime, onCancel, timeout > check time';
    var timer = _.time._begin( 100, onTime, onCancel );
    return _.time.out( 10, () => timer )
    .finally( function( err, got )
    {
      test.identical( got.onTime, onTime );
      test.identical( got.onCancel, onCancel );
      test.identical( got.state, 0 );
      test.identical( got.result, undefined );
      clearTimeout( got.original );

      return null;
    });
  })

  .then( function()
  {
    test.case = 'onTime, onCancel, execution of callbacks';
    var timer = _.time._begin( 10, onTime, onCancel );
    return _.time.out( 100, () => timer )
    .finally( function( err, got )
    {
      test.identical( got.onTime, onTime );
      test.identical( got.onCancel, onCancel );
      test.identical( got.state, 2 );
      test.identical( got.result, 0 );

      _.time.cancel( got );

      test.identical( got.onTime, onTime );
      test.identical( got.onCancel, onCancel );
      test.identical( got.state, 2 );
      test.identical( got.result, 0 );
      clearTimeout( got.original );

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

    var timer = _.time._begin( 5, onTime );
    return _.time.out( 100, () => timer )
    .finally( function( err, got )
    {
      test.identical( got.onTime, onTime );
      test.identical( got.onCancel, undefined );
      test.identical( got.state, 2 );
      test.identical( got.result, undefined );
      test.identical( times, 4 );
      test.identical( result, [ 1 ] );
      clearTimeout( got.original );

      return null;
    });
  })

  con.finally( ( err, arg ) =>
  {
    test.close( 'delay > 0' );

    if( err )
    throw err;
    return arg;
  });

  /* */

  return con;
}

//

function _finally( test )
{
  var onTime = () => 0;
  var con = new _.Consequence().take( null );

  /* - */

  con.finally( () =>
  {
    test.open( 'delay - undefined' );
    return null;
  })

  .then( function()
  {
    test.case = 'without callbacks';
    var timer = _.time._finally( undefined, undefined );
    return _.time.out( 10, () => timer )
    .finally( function( err, got )
    {
      test.identical( got.onTime, undefined );
      test.identical( got.onCancel, undefined );
      test.identical( got.state, 0 );
      test.identical( got.result, undefined );
      clearTimeout( got.original );

      return null;
    });
  })

  .then( function()
  {
    test.case = 'onTime';
    var timer = _.time._finally( undefined, onTime );
    return _.time.out( 10, () => timer )
    .finally( function( err, got )
    {
      test.identical( got.onTime, onTime );
      test.identical( got.onCancel, onTime );
      test.identical( got.state, 0 );
      test.identical( got.result, undefined );
      clearTimeout( got.original );

      return null;
    });
  })

  .then( function()
  {
    test.case = 'onTime, execute onTime';
    var timer = _.time._finally( undefined, onTime );
    timer.time()
    return _.time.out( 10, () => timer )
    .finally( function( err, got )
    {
      test.identical( got.onTime, onTime );
      test.identical( got.onCancel, onTime );
      test.identical( got.state, 2 );
      test.identical( got.result, 0 );
      clearTimeout( got.original );

      return null;
    });
  })

  .then( function()
  {
    test.case = 'onTime, execute onCancel';
    var timer = _.time._finally( undefined, onTime );
    _.time.cancel( timer )
    return _.time.out( 10, () => timer )
    .finally( function( err, got )
    {
      test.identical( got.onTime, onTime );
      test.identical( got.onCancel, onTime );
      test.identical( got.state, -2 );
      test.identical( got.result, 0 );
      clearTimeout( got.original )

      return null;
    });
  })

  .then( function()
  {
    test.case = 'onTime, execution of callbacks';
    var timer = _.time._finally( undefined, onTime );
    timer.time();
    return _.time.out( 10, () => timer )
    .finally( function( err, got )
    {
      test.identical( got.onTime, onTime );
      test.identical( got.onCancel, onTime );
      test.identical( got.state, 2 );
      test.identical( got.result, 0 );

      _.time.cancel( got )

      test.identical( got.onTime, onTime );
      test.identical( got.onCancel, onTime );
      test.identical( got.state, 2 );
      test.identical( got.result, 0 );
      clearTimeout( got.original );

      return null;
    });
  })


  con.finally( () =>
  {
    test.close( 'delay - undefined' );
    return null;
  });

  /* - */

  con.finally( () =>
  {
    test.open( 'delay - 0' );
    return null;
  })

  .then( function()
  {
    test.case = 'without callbacks';
    var timer = _.time._finally( 0, undefined );
    return _.time.out( 10, () => timer )
    .finally( function( err, got )
    {
      test.identical( got.onTime, undefined );
      test.identical( got.onCancel, undefined );
      test.identical( got.state, 2 );
      test.identical( got.result, undefined );
      clearTimeout( got.original )

      return null;
    });
  })

  .then( function()
  {
    test.case = 'onTime';
    var timer = _.time._finally( 0, onTime );
    return _.time.out( 10, () => timer )
    .finally( function( err, got )
    {
      test.identical( got.onTime, onTime );
      test.identical( got.onCancel, onTime );
      test.identical( got.state, 2 );
      test.identical( got.result, 0 );
      clearTimeout( got.original )

      return null;
    });
  })

  .then( function()
  {
    test.case = 'onTime';
    var timer = _.time._finally( 0, onTime );
    return _.time.out( 10, () => timer )
    .finally( function( err, got )
    {
      test.identical( got.onTime, onTime );
      test.identical( got.onCancel, onTime );
      test.identical( got.state, 2 );
      test.identical( got.result, 0 );
      clearTimeout( got.original )

      return null;
    });
  })

  .then( function()
  {
    test.case = 'onTime, execute onCancel';
    var timer = _.time._finally( 0, onTime );
    _.time.cancel( timer )
    return _.time.out( 10, () => timer )
    .finally( function( err, got )
    {
      test.identical( got.onTime, onTime );
      test.identical( got.onCancel, onTime );
      test.identical( got.state, -2 );
      test.identical( got.result, 0 );
      clearTimeout( got.original )

      return null;
    });
  })

  .then( function()
  {
    test.case = 'onTime, onCancel, execution of callbacks';
    var timer = _.time._finally( 0, onTime );
    return _.time.out( 10, () => timer )
    .finally( function( err, got )
    {
      test.identical( got.onTime, onTime );
      test.identical( got.onCancel, onTime );
      test.identical( got.state, 2 );
      test.identical( got.result, 0 );

      _.time.cancel( got );

      test.identical( got.onTime, onTime );
      test.identical( got.onCancel, onTime );
      test.identical( got.state, 2 );
      test.identical( got.result, 0 );
      clearTimeout( got.original );

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
    return _.time.out( 100, () => timer )
    .finally( function( err, got )
    {
      test.identical( got.onTime, onTime );
      test.identical( got.onCancel, onTime );
      test.identical( got.state, 2 );
      test.identical( got.result, undefined );
      test.identical( times, 4 );
      test.identical( result, [ 1 ] );
      clearTimeout( got.original )

      return null;
    });
  })


  .finally( () =>
  {
    test.close( 'delay - 0' );
    return null;
  });

  /* - */

  con.finally( () =>
  {
    test.open( 'delay > 0' );
    return null;
  })

  .then( function()
  {
    test.case = 'without callbacks, timeout < check time';
    var timer = _.time._finally( 5, undefined );
    return _.time.out( 10, () => timer )
    .finally( function( err, got )
    {
      test.identical( got.onTime, undefined );
      test.identical( got.onCancel, undefined );
      test.identical( got.state, 2 );
      test.identical( got.result, undefined );
      clearTimeout( got.original )

      return null;
    });
  })

  .then( function()
  {
    test.case = 'without callbacks, timeout > check time';
    var timer = _.time._finally( 100, undefined );
    return _.time.out( 10, () => timer )
    .finally( function( err, got )
    {
      test.identical( got.onTime, undefined );
      test.identical( got.onCancel, undefined );
      test.identical( got.state, 0 );
      test.identical( got.result, undefined );
      clearTimeout( got.original )

      return null;
    });
  })

  .then( function()
  {
    test.case = 'onTime, timeout < check time';
    var timer = _.time._finally( 5, onTime );
    return _.time.out( 10, () => timer )
    .finally( function( err, got )
    {
      test.identical( got.onTime, onTime );
      test.identical( got.onCancel, onTime );
      test.identical( got.state, 2 );
      test.identical( got.result, 0 );
      clearTimeout( got.original )

      return null;
    });
  })

  .then( function()
  {
    test.case = 'onTime, timeout > check time';
    var timer = _.time._finally( 100, onTime );
    return _.time.out( 10, () => timer )
    .finally( function( err, got )
    {
      test.identical( got.onTime, onTime );
      test.identical( got.onCancel, onTime );
      test.identical( got.state, 0 );
      test.identical( got.result, undefined );
      clearTimeout( got.original )

      return null;
    });
  })

  .then( function()
  {
    test.case = 'onTime, timeout > check time, execute onCancel';
    var timer = _.time._finally( 100, onTime );
    _.time.cancel( timer );
    return _.time.out( 10, () => timer )
    .finally( function( err, got )
    {
      test.identical( got.onTime, onTime );
      test.identical( got.onCancel, onTime );
      test.identical( got.state, -2 );
      test.identical( got.result, 0 );
      clearTimeout( got.original )

      return null;
    });
  })

  .then( function()
  {
    test.case = 'onTime, timeout > check time';
    var timer = _.time._finally( 100, onTime );
    return _.time.out( 10, () => timer )
    .finally( function( err, got )
    {
      test.identical( got.onTime, onTime );
      test.identical( got.onCancel, onTime );
      test.identical( got.state, 0 );
      test.identical( got.result, undefined );
      clearTimeout( got.original )

      return null;
    });
  })

  .then( function()
  {
    test.case = 'onTime, timeout > check time, execute onTime';
    var timer = _.time._finally( 100, onTime );
    timer.time()
    return _.time.out( 10, () => timer )
    .finally( function( err, got )
    {
      test.identical( got.onTime, onTime );
      test.identical( got.onCancel, onTime );
      test.identical( got.state, 2 );
      test.identical( got.result, 0 );
      clearTimeout( got.original )

      return null;
    });
  })

  .then( function()
  {
    test.case = 'onTime, onCancel, execution of callbacks';
    var timer = _.time._finally( 10, onTime );
    return _.time.out( 100, () => timer )
    .finally( function( err, got )
    {
      test.identical( got.onTime, onTime );
      test.identical( got.onCancel, onTime );
      test.identical( got.state, 2 );
      test.identical( got.result, 0 );

      _.time.cancel( got );

      test.identical( got.onTime, onTime );
      test.identical( got.onCancel, onTime );
      test.identical( got.state, 2 );
      test.identical( got.result, 0 );
      clearTimeout( got.original );

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
    return _.time.out( 100, () => timer )
    .finally( function( err, got )
    {
      test.identical( got.onTime, onTime );
      test.identical( got.onCancel, onTime );
      test.identical( got.state, 2 );
      test.identical( got.result, undefined );
      test.identical( times, 4 );
      test.identical( result, [ 1 ] );
      clearTimeout( got.original )

      return null;
    });
  });


  con.finally( ( err, arg ) =>
  {
    test.close( 'delay > 0' );

    if( err )
    throw err;
    return arg;
  });

  /* */

  return con;
}

//

function _periodic( test )
{
  var onCancel = () => -1;
  var con = new _.Consequence().take( null );

  /* - */

  con.finally( () =>
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
      }
    };

    var timer = _.time._periodic( 0, onTime );
    return _.time.out( 100, () => timer )
    .finally( function( err, got )
    {
      test.identical( got.onTime, onTime );
      test.identical( got.onCancel, undefined );
      test.identical( got.state, 2 );
      test.identical( got.result, undefined );
      test.identical( times, 0 );
      test.identical( result, [ 1, 1, 1, 1, 1 ] );
      clearTimeout( got.original )

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
      }
    };

    var timer = _.time._periodic( 0, onTime );
    return _.time.out( 100, () => timer )
    .finally( function( err, got )
    {
      test.identical( got.onTime, onTime );
      test.identical( got.onCancel, undefined );
      test.identical( got.state, 2 );
      test.identical( got.result, undefined );
      test.identical( times, 0 );
      test.identical( result, [ 1, 1, 1, 1, 1 ] );
      clearTimeout( got.original )

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
      }
    };

    var timer = _.time._periodic( 0, onTime, onCancel );
    return _.time.out( 100, () => timer )
    .finally( function( err, got )
    {
      test.identical( got.onTime, onTime );
      test.identical( got.onCancel, onCancel );
      test.identical( got.state, 2 );
      test.identical( got.result, undefined );
      test.identical( times, 0 );
      test.identical( result, [ 1, 1, 1, 1, 1 ] );
      clearTimeout( got.original )

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
      }
    };

    var timer = _.time._periodic( 0, onTime, onCancel );
    return _.time.out( 100, () => timer )
    .finally( function( err, got )
    {
      test.identical( got.onTime, onTime );
      test.identical( got.onCancel, onCancel );
      test.identical( got.state, 2 );
      test.identical( got.result, undefined );
      test.identical( times, 0 );
      test.identical( result, [ 1, 1, 1, 1, 1 ] );

      _.time.cancel( got );

      test.identical( got.onTime, onTime );
      test.identical( got.onCancel, onCancel );
      test.identical( got.state, -2 );
      test.identical( got.result, -1 );
      test.identical( times, 0 );
      test.identical( result, [ 1, 1, 1, 1, 1 ] );
      clearTimeout( got.original );

      return null;
    });
  })

  .finally( () =>
  {
    test.close( 'delay - 0' );
    return null;
  });
  /* - */

  con.finally( () =>
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
      }
    };

    var timer = _.time._periodic( 5, onTime );
    return _.time.out( 200, () => timer )
    .finally( function( err, got )
    {
      test.identical( got.onTime, onTime );
      test.identical( got.onCancel, undefined );
      test.is( got.state === 2 || got.state === 1 );
      test.identical( got.result, undefined );
      test.identical( times, 0 );
      test.identical( result, [ 1, 1, 1, 1, 1 ] );
      clearTimeout( got.original )

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
      }
    };

    var timer = _.time._periodic( 5, onTime );
    return _.time.out( 100, () => timer )
    .finally( function( err, got )
    {
      test.identical( got.onTime, onTime );
      test.identical( got.onCancel, undefined );
      test.identical( got.state, 2 );
      test.identical( got.result, undefined );
      test.identical( times, 0 );
      test.identical( result, [ 1, 1, 1, 1, 1 ] );
      clearTimeout( got.original )

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
      }
    };

    var timer = _.time._periodic( 5, onTime, onCancel );
    return _.time.out( 200, () => timer )
    .finally( function( err, got )
    {
      test.identical( got.onTime, onTime );
      test.identical( got.onCancel, onCancel );
      test.is( got.state === 2 || got.state === 1 );
      test.identical( got.result, undefined );
      test.identical( times, 0 );
      test.identical( result, [ 1, 1, 1, 1, 1 ] );
      clearTimeout( got.original )

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
      }
    };

    var timer = _.time._periodic( 5, onTime, onCancel );
    return _.time.out( 100, () => timer )
    .finally( function( err, got )
    {
      test.identical( got.onTime, onTime );
      test.identical( got.onCancel, onCancel );
      test.identical( got.state, 2 );
      test.identical( got.result, undefined );
      test.identical( times, 0 );
      test.identical( result, [ 1, 1, 1, 1, 1 ] );

      _.time.cancel( got );

      test.identical( got.onTime, onTime );
      test.identical( got.onCancel, onCancel );
      test.identical( got.state, -2 );
      test.identical( got.result, -1 );
      test.identical( times, 0 );
      test.identical( result, [ 1, 1, 1, 1, 1 ] );
      clearTimeout( got.original );

      return null;
    });
  })

  /* - */

  con.finally( ( err, arg ) =>
  {
    test.close( 'delay > 0' );

    if( err )
    throw err;
    return arg;
  });

  /* */

  return con;
}

//

function _cancel( test )
{
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
  var timer = _.time._periodic( 1000, onTime ) ;
  var got = _.time._cancel( timer );
  test.identical( got.onTime, onTime );
  test.identical( got.onCancel, undefined );
  test.identical( got.state, -2 );
  test.identical( got.result, undefined );

  test.case = 'delay - 0, onTime, onCancel';
  var onTime = () => 0;
  var onCancel = () => -1;
  var timer = _.time._periodic( 1000, onTime, onCancel ) ;
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

  return _testerGlobal_.wTools.time.out( context.dt*5 ).then( () =>
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

  var timer = _.time.begin( context.dt*1, () =>
  {
    visited.push( 'v1' );
  });

  _.time.cancel( timer );
  visited.push( 'v0' );

  return _testerGlobal_.wTools.time.out( context.dt*5 ).then( () =>
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

  return _testerGlobal_.wTools.time.out( context.dt*5 ).then( () =>
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

  return _testerGlobal_.wTools.time.out( context.dt*5 ).then( () =>
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

  name : 'Tools.base.Time',
  silencing : 1,

  context :
  {
    dt : 25,
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
