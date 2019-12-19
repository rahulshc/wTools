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
      got.cancel();

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
      got.cancel();

      return null;
    });
  })

  .then( function()
  {
    test.case = 'onTime, execute onTime';
    var timer = _.time._begin( undefined, onTime );
    timer.time()
    return _.time.out( 10, () => timer )
    .finally( function( err, got )
    {
      test.identical( got.onTime, onTime );
      test.identical( got.onCancel, undefined );
      test.identical( got.state, 2 );
      test.identical( got.result, 0 );
      got.cancel();

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
      got.cancel();

      return null;
    });
  })

  .then( function()
  {
    test.case = 'onCancel, execute onCancel';
    var timer = _.time._begin( undefined, undefined, onCancel );
    timer.cancel()
    return _.time.out( 10, () => timer )
    .finally( function( err, got )
    {
      test.identical( got.onTime, undefined );
      test.identical( got.onCancel, onCancel );
      test.identical( got.state, -2 );
      test.identical( got.result, -1 );
      got.cancel();

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
      got.cancel();

      return null;
    });
  })

  .then( function()
  {
    test.case = 'onTime, onCancel, execution of callbacks';
    var timer = _.time._begin( undefined, onTime, onCancel );
    timer.time();
    return _.time.out( 10, () => timer )
    .finally( function( err, got )
    {
      test.identical( got.onTime, onTime );
      test.identical( got.onCancel, onCancel );
      test.identical( got.state, 2 );
      test.identical( got.result, 0 );

      got.cancel();

      test.identical( got.onTime, onTime );
      test.identical( got.onCancel, onCancel );
      test.identical( got.state, -2 );
      test.identical( got.result, -1 );

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
      got.cancel();

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
      got.cancel();

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
      got.cancel();

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
      got.cancel();

      return null;
    });
  })

  .then( function()
  {
    test.case = 'onCancel, execute onCancel';
    var timer = _.time._begin( 0, undefined, onCancel );
    timer.cancel()
    return _.time.out( 10, () => timer )
    .finally( function( err, got )
    {
      test.identical( got.onTime, undefined );
      test.identical( got.onCancel, onCancel );
      test.identical( got.state, -2 );
      test.identical( got.result, -1 );
      got.cancel();

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
      got.cancel();

      return null;
    });
  })

  .then( function()
  {
    test.case = 'onTime, onCancel, execution of callbacks';
    var timer = _.time._begin( 0, onTime, onCancel );
    timer.time();
    return _.time.out( 10, () => timer )
    .finally( function( err, got )
    {
      test.identical( got.onTime, onTime );
      test.identical( got.onCancel, onCancel );
      test.identical( got.state, 2 );
      test.identical( got.result, 0 );

      got.cancel();

      test.identical( got.onTime, onTime );
      test.identical( got.onCancel, onCancel );
      test.identical( got.state, -2 );
      test.identical( got.result, -1 );

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
      got.cancel();

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
      got.cancel();

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
      got.cancel();

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
      got.cancel();

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
      got.cancel();

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
      got.cancel();

      return null;
    });
  })

  .then( function()
  {
    test.case = 'onCancel, timeout < check time, execute onCancel';
    var timer = _.time._begin( 5, undefined, onCancel );
    timer.cancel()
    return _.time.out( 10, () => timer )
    .finally( function( err, got )
    {
      test.identical( got.onTime, undefined );
      test.identical( got.onCancel, onCancel );
      test.identical( got.state, -2 );
      test.identical( got.result, -1 );
      got.cancel();

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
      got.cancel();

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
      got.cancel();

      return null;
    });
  })

  .then( function()
  {
    test.case = 'onTime, onCancel, timeout > check time, execution of callbacks';
    var timer = _.time._begin( 100, onTime, onCancel );
    timer.time();
    return _.time.out( 10, () => timer )
    .finally( function( err, got )
    {
      test.identical( got.onTime, onTime );
      test.identical( got.onCancel, onCancel );
      test.identical( got.state, 2 );
      test.identical( got.result, 0 );

      got.cancel();

      test.identical( got.onTime, onTime );
      test.identical( got.onCancel, onCancel );
      test.identical( got.state, -2 );
      test.identical( got.result, -1 );

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
      got.cancel();

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
      got.cancel();

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
      got.cancel();

      return null;
    });
  })

  .then( function()
  {
    test.case = 'onTime, execute onCancel';
    var timer = _.time._finally( undefined, onTime );
    timer.cancel()
    return _.time.out( 10, () => timer )
    .finally( function( err, got )
    {
      test.identical( got.onTime, onTime );
      test.identical( got.onCancel, onTime );
      test.identical( got.state, -2 );
      test.identical( got.result, 0 );
      got.cancel();

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

      got.cancel();

      test.identical( got.onTime, onTime );
      test.identical( got.onCancel, onTime );
      test.identical( got.state, -2 );
      test.identical( got.result, 0 );

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
      got.cancel();

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
      got.cancel();

      return null;
    });
  })

  .then( function()
  {
    test.case = 'onTime, execute onTime';
    var timer = _.time._finally( 0, onTime );
    timer.time()
    return _.time.out( 10, () => timer )
    .finally( function( err, got )
    {
      test.identical( got.onTime, onTime );
      test.identical( got.onCancel, onTime );
      test.identical( got.state, 2 );
      test.identical( got.result, 0 );
      got.cancel();

      return null;
    });
  })

  .then( function()
  {
    test.case = 'onTime, execute onCancel';
    var timer = _.time._finally( 0, onTime );
    timer.cancel()
    return _.time.out( 10, () => timer )
    .finally( function( err, got )
    {
      test.identical( got.onTime, onTime );
      test.identical( got.onCancel, onTime );
      test.identical( got.state, -2 );
      test.identical( got.result, 0 );
      got.cancel();

      return null;
    });
  })

  .then( function()
  {
    test.case = 'onTime, onCancel, execution of callbacks';
    var timer = _.time._finally( 0, onTime );
    timer.time();
    return _.time.out( 10, () => timer )
    .finally( function( err, got )
    {
      test.identical( got.onTime, onTime );
      test.identical( got.onCancel, onTime );
      test.identical( got.state, 2 );
      test.identical( got.result, 0 );

      got.cancel();

      test.identical( got.onTime, onTime );
      test.identical( got.onCancel, onTime );
      test.identical( got.state, -2 );
      test.identical( got.result, 0 );

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
      got.cancel();

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
      got.cancel();

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
      got.cancel();

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
      got.cancel();

      return null;
    });
  })

  .then( function()
  {
    test.case = 'onTime, timeout > check time, execute onCancel';
    var timer = _.time._finally( 100, onTime );
    timer.cancel();
    return _.time.out( 10, () => timer )
    .finally( function( err, got )
    {
      test.identical( got.onTime, onTime );
      test.identical( got.onCancel, onTime );
      test.identical( got.state, -2 );
      test.identical( got.result, 0 );
      got.cancel();

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
      got.cancel();

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
      got.cancel();

      return null;
    });
  })

  .then( function()
  {
    test.case = 'onTime, onCancel, timeout > check time, execution of callbacks';
    var timer = _.time._finally( 100, onTime );
    timer.time();
    return _.time.out( 10, () => timer )
    .finally( function( err, got )
    {
      test.identical( got.onTime, onTime );
      test.identical( got.onCancel, onTime );
      test.identical( got.state, 2 );
      test.identical( got.result, 0 );

      got.cancel();

      test.identical( got.onTime, onTime );
      test.identical( got.onCancel, onTime );
      test.identical( got.state, -2 );
      test.identical( got.result, 0 );

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
      got.cancel();

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
    timer.time()
    return _.time.out( 100, () => timer )
    .finally( function( err, got )
    {
      test.identical( got.onTime, onTime );
      test.identical( got.onCancel, undefined );
      test.identical( got.state, 2 );
      test.identical( got.result, undefined );
      test.identical( times, 0 );
      test.identical( result, [ 1, 1, 1, 1, 1 ] );
      got.cancel();

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
      got.cancel();

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
    timer.time();
    return _.time.out( 100, () => timer )
    .finally( function( err, got )
    {
      test.identical( got.onTime, onTime );
      test.identical( got.onCancel, onCancel );
      test.identical( got.state, 2 );
      test.identical( got.result, undefined );
      test.identical( times, 0 );
      test.identical( result, [ 1, 1, 1, 1, 1 ] );

      got.cancel();

      test.identical( got.onTime, onTime );
      test.identical( got.onCancel, onCancel );
      test.identical( got.state, -2 );
      test.identical( got.result, -1 );
      test.identical( times, 0 );
      test.identical( result, [ 1, 1, 1, 1, 1 ] );

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
    return _.time.out( 100, () => timer )
    .finally( function( err, got )
    {
      test.identical( got.onTime, onTime );
      test.identical( got.onCancel, undefined );
      test.identical( got.state, 2 );
      test.identical( got.result, undefined );
      test.identical( times, 0 );
      test.identical( result, [ 1, 1, 1, 1, 1 ] );
      got.cancel();

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
    timer.time()
    return _.time.out( 100, () => timer )
    .finally( function( err, got )
    {
      test.identical( got.onTime, onTime );
      test.identical( got.onCancel, undefined );
      test.identical( got.state, 2 );
      test.identical( got.result, undefined );
      test.identical( times, 0 );
      test.identical( result, [ 1, 1, 1, 1, 1 ] );
      got.cancel();

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
    return _.time.out( 100, () => timer )
    .finally( function( err, got )
    {
      test.identical( got.onTime, onTime );
      test.identical( got.onCancel, onCancel );
      test.identical( got.state, 2 );
      test.identical( got.result, undefined );
      test.identical( times, 0 );
      test.identical( result, [ 1, 1, 1, 1, 1 ] );
      got.cancel();

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
    timer.time();
    return _.time.out( 100, () => timer )
    .finally( function( err, got )
    {
      test.identical( got.onTime, onTime );
      test.identical( got.onCancel, onCancel );
      test.identical( got.state, 2 );
      test.identical( got.result, undefined );
      test.identical( times, 0 );
      test.identical( result, [ 1, 1, 1, 1, 1 ] );

      got.cancel();

      test.identical( got.onTime, onTime );
      test.identical( got.onCancel, onCancel );
      test.identical( got.state, -2 );
      test.identical( got.result, -1 );
      test.identical( times, 0 );
      test.identical( result, [ 1, 1, 1, 1, 1 ] );

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
