( function _fTime_s_()
{

'use strict';

let _global = _global_;
let _ = _global_.wTools;
let Self = _global_.wTools.time = _global_.wTools.time || Object.create( null );

// --
// implementation
// --

let _TimeInfinity = Math.pow( 2, 31 )-1;

//

function _begin( delay, onTime, onCancel )
{
  let native;

  // if( delay === undefined ) /* Dmytro : it is deprecated feature, feature is not consistent with module Procedure */
  // delay = Infinity;
  if( delay >= _TimeInfinity )
  delay = _TimeInfinity;

  _.assert( arguments.length === 1 || arguments.length === 2 || arguments.length === 3 );

  if( delay > 0 )
  native = setTimeout( time, delay );
  else
  native = soon( timeNonCancelable ) || null;

  let timer = Object.create( null );
  timer.onTime = onTime;
  timer.onCancel = onCancel;
  timer._time = _time;
  timer._cancel = _cancel;
  timer.time = native === null ? timeNonCancelable : time;
  timer.cancel = cancel;
  timer.state = 0;
  // timer.kind = _begin;
  timer.type = 'timer';
  timer.native = native;
  return timer;

  /* */

  function _time()
  {
    if( timer.state === 1 || timer.state === -1 )
    return;

    _.assert( timer.state !== -2, 'Cannot change state of timer.' );
    _.assert( timer.state !== 2, 'Timer can be executed only one time.' );

    timer.state = 1;
    try
    {
      if( onTime )
      timer.result = onTime( timer );
    }
    finally
    {
      _.assert( timer.state === 1 );
      timer.state = 2;
    }
  }

  /* */

  function _cancel()
  {
    if( timer.state === 1 || timer.state === -1 )
    return;

    _.assert( timer.state !== 2, 'Cannot change state of timer.' );
    _.assert( timer.state !== -2, 'Timer can be canceled only one time.' );

    timer.state = -1;
    clearTimeout( timer.native );
    try
    {
      if( onCancel )
      timer.result = onCancel( timer );
    }
    finally
    {
      _.assert( timer.state === -1 );
      timer.state = -2;
    }
  }

  /* */

  function timeNonCancelable()
  {
    if( timer.state !== 0 )
    return;
    return time.call( this, arguments );
  }

  /* */

  function time()
  {
    timer._time();
    clearTimeout( timer.native );
    return timer;
  }

  /* */

  function cancel()
  {
    return timer._cancel();
  }

}

//

function _finally( delay, onTime )
{
  _.assert( arguments.length === 2 );
  let timer = _.time._begin( delay, onTime, onTime );
  return timer;
}

//

function _periodic( delay, onTime, onCancel )
{

  _.assert( arguments.length === 2 || arguments.length === 3, 'Expects exactly two or three arguments' );
  // _.assert( _.numberIs( delay ) );
  // _.assert( _.routineIs( onTime ) );
  // _.assert( _.routineIs( onCancel ) || onCancel === undefined || onCancel === null );

  let native = setInterval( time, delay );

  let timer = Object.create( null );
  timer.onTime = onTime;
  timer.onCancel = onCancel;
  timer._time = _time;
  timer._cancel = _cancel;
  timer.time = time;
  timer.cancel = cancel;
  timer.state = 0;
  // timer.type = 'timer';
  timer.type = 'periodic';
  // timer.kind = _periodic;
  timer.native = native;
  return timer;

  /* */

  function _time()
  {
    _.assert( timer.state !== -1 && timer.state !== -2, 'Illegal call, timer is canceled. Please, use new timer.' );

    timer.state = 1;
    // if( r === _.dont )
    // _.time.cancel( timer );
    try
    {
      if( onTime )
      timer.result = onTime( timer );
    }
    finally
    {
      if( timer.result === undefined || timer.result === _.dont ) /* Dmytro : if it needs, change to any other stop value */
      timer.cancel();
      else
      timer.state = 2;
    }
  }

  /* */

  function _cancel()
  {
    // if( timer.state === 1 )
    // logger.log( 'Timer is canceled when callback {-onTime-} was executing.' );

    _.assert( timer.state !== -1 && timer.state !== -2, 'Illegal call, timer is canceled.' );

    timer.state = -1;
    clearInterval( timer.native );
    try
    {
      if( onCancel )
      timer.result = onCancel( timer );
    }
    finally
    {
      timer.state = -2;
    }
  }

  /* */

  function time()
  {
    return timer._time();
  }

  /* */

  function cancel()
  {
    return timer._cancel();
  }

  /* */

  // function time()
  // {
  //   let r = onTime( r );
  //   if( r === _.dont )
  //   _.time.cancel( timer );
  // }
  //
  // function cancel()
  // {
  //   timer.state = -1;
  //   clearInterval( timer.native );
  //   if( onCancel )
  //   onCancel( r );
  // }

}

//

function _cancel( timer )
{
  _.assert( _.timerIs( timer ) );

  // if( timer.kind === 'finallable' || timer.kind === 'cancelable' )
  // clearTimeout( timer.native );
  // else
  // clearInterval( timer.native );

  timer.cancel();

  // if( timer && timer.state === 0 )
  // {
  //   if( timer.kind === 'finallable' )
  //   {
  //     timer.state = 2;
  //     timer.result = timer.onTime();
  //   }
  //   else
  //   {
  //     timer.state = -1;
  //   }
  // }

  return timer;
}

//

/**
 * The routine timerIsBegun() checks the state of timer {-timer-}. If {-timer-} is created and
 * timer methods is not executed, then routine returns true. Otherwise, false is returned.
 *
 * @example
 * let timer = _.time.begin( 500, () => 'executed', () => 'canceled' );
 * _.time.timerIsBegun( timer );
 * // returns : true
 *
 * @example
 * let timer = _.time.begin( 500, () => 'executed', () => 'canceled' );
 * _.time.cancel( timer );
 * _.time.timerIsBegun( timer );
 * // returns : false
 *
 * @example
 * let timer = _.time.begin( 500, () => 'executed', () => 'canceled' );
 * _.time.out( 2000, () => _.time.timerIsBegun( timer ) );
 * // returns : false
 *
 * @param { Timer } timer - The timer to check.
 * @returns { Boolean } - Returns true if timer methods is not executed. Otherwise, false is returned.
 * @function timerIsBegun
 * @throws { Error } If arguments is not provided.
 * @throws { Error } If {-timer-} is not a Timer.
 * @namespace wTools.time
 * @extends Tools
 */

function timerIsBegun( timer )
{
  _.assert( _.timerIs( timer ) );
  return timer.state === 0;
}

//

/**
 * The routine timerIsCancelBegun() checks the state of timer {-timer-}. If {-timer-} starts executing of callback
 * {-onCancel-} and not finished it, then routine returns true. Otherwise, false is returned.
 *
 * @example
 * let timer = _.time.begin( 500, () => 'executed', () => 'canceled' );
 * _.time.timerIsCancelBegun( timer );
 * // returns : false
 *
 * @example
 * let timer = _.time.begin( 500, () => 'executed', onCancel );
 * _.time.cancel( timer );
 * function onCancel()
 * {
 *   _.time.timerIsCancelBegun( timer );
 *   // returns : true
 *   return 'canceled';
 * }
 *
 * @example
 * let timer = _.time.begin( 500, () => 'executed', () => 'canceled' );
 * _.time.out( 2000, () => _.time.timerIsCancelBegun( timer ) );
 * // returns : false
 *
 * @param { Timer } timer - The timer to check.
 * @returns { Boolean } - Returns true if timer starts canceling and not finished it.
 * Otherwise, false is returned.
 * @function timerIsCancelBegun
 * @throws { Error } If arguments is not provided.
 * @throws { Error } If {-timer-} is not a Timer.
 * @namespace wTools.time
 * @extends Tools
 */

function timerIsCancelBegun( timer )
{
  _.assert( _.timerIs( timer ) );
  return timer.state === -1;
}

//

/**
 * The routine timerIsCancelEnded() checks the state of timer {-timer-}. If {-timer-} finished executing of
 * callback {-onCancel-}, then routine returns true. Otherwise, false is returned.
 *
 * @example
 * let timer = _.time.begin( 500, () => 'executed', () => 'canceled' );
 * _.time.timerIsCancelEnded( timer );
 * // returns : false
 *
 * @example
 * let timer = _.time.begin( 500, () => 'executed', onCancel );
 * _.time.cancel( timer );
 * function onCancel()
 * {
 *   _.time.timerIsCancelEnded( timer );
 *   // returns : false
 *   return 'canceled';
 * }
 *
 * @example
 * let timer = _.time.begin( 500, () => 'executed', () => 'canceled' );
 * _.time.out( 2000, () => _.time.timerIsCancelEnded( timer ) );
 * // returns : false
 *
 * @example
 * let timer = _.time.begin( 500, () => 'executed', () => 'canceled' );
 * _.time.cancel( timer );
 * // returns : true
 *
 * @param { Timer } timer - The timer to check.
 * @returns { Boolean } - Returns true if timer starts canceling and finished it.
 * Otherwise, false is returned.
 * @function timerIsCancelEnded
 * @throws { Error } If arguments is not provided.
 * @throws { Error } If {-timer-} is not a Timer.
 * @namespace wTools.time
 * @extends Tools
 */

function timerIsCancelEnded( timer )
{
  _.assert( _.timerIs( timer ) );
  return timer.state === -2;
}

//

/**
 * The routine timerIsUpBegun() checks the state of timer {-timer-}. If {-timer-} starts executing of callback
 * {-onTime-} and not finished it, then routine returns true. Otherwise, false is returned.
 *
 * @example
 * let timer = _.time.begin( 500, () => 'executed', () => 'canceled' );
 * _.time.timerIsUpBegun( timer );
 * // returns : false
 *
 * @example
 * let timer = _.time.begin( 500, () => 'executed', onCancel );
 * _.time.cancel( timer );
 * function onCancel()
 * {
 *   _.time.timerIsUpBegun( timer );
 *   // returns : false
 *   return 'canceled';
 * }
 *
 * @example
 * let timer = _.time.begin( 500, onTime, () => 'canceled' );
 * function onTime()
 * {
 *  _.time.timerIsUpBegun( timer );
 *  // returns : true
 *  return 'executed';
 * }
 *
 * @param { Timer } timer - The timer to check.
 * @returns { Boolean } - Returns true if timer starts executing of callback {-onTime-} and not finished it.
 * Otherwise, false is returned.
 * @function timerIsUpBegun
 * @throws { Error } If arguments is not provided.
 * @throws { Error } If {-timer-} is not a Timer.
 * @namespace wTools.time
 * @extends Tools
 */

function timerIsUpBegun( timer )
{
  _.assert( _.timerIs( timer ) );
  return timer.state === 1;
}

//

/**
 * The routine timerIsUpEnded() checks the state of timer {-timer-}. If {-timer-} finished executing of callback
 * {-onTime-}, then routine returns true. Otherwise, false is returned.
 *
 * @example
 * let timer = _.time.begin( 500, () => 'executed', () => 'canceled' );
 * _.time.timerIsUpEnded( timer );
 * // returns : false
 *
 * @example
 * let timer = _.time.begin( 500, () => 'executed', onCancel );
 * _.time.cancel( timer );
 * function onCancel()
 * {
 *   _.time.timerIsUpEnded( timer );
 *   // returns : false
 *   return 'canceled';
 * }
 *
 * @example
 * let timer = _.time.begin( 500, () => 'executed', () => 'canceled' );
 * _.time.out( 2000, () => _.time.timerIsUpEnded( timer ) );
 * // returns : true
 *
 * @param { Timer } timer - The timer to check.
 * @returns { Boolean } - Returns true if timer finished executing of callback {-onTime-}.
 * Otherwise, false is returned.
 * @function timerIsUpEnded
 * @throws { Error } If arguments is not provided.
 * @throws { Error } If {-timer-} is not a Timer.
 * @namespace wTools.time
 * @extends Tools
 */

function timerIsUpEnded( timer )
{
  _.assert( _.timerIs( timer ) );
  return timer.state === 2;
}

//

/**
 * The routine soon() execute routine {-h-} asynchronously as soon as possible. In NodeJS interpreter it
 * executes on nextTick, in another interpreters in async queue.
 *
 * @example
 * let result = [ _.time.now() ];
 * _.time.soon( () => result.push( _.time.now() ) );
 * // the delta ( result[ 1 ] - result[ 0 ] ) is small as possible
 *
 * @param { Function } h - The routine to execute.
 * @returns { Undefined } - Returns undefined, executes routine {-h-}.
 * @function soon
 * @throws { Error } If arguments is not provided.
 * @throws { Error } If {-h-} is not a Function.
 * @namespace wTools.time
 * @extends Tools
 */

let soon = typeof process === 'undefined' ? function( h ){ return setTimeout( h, 0 ) } : process.nextTick;

//

/**
 * The routine begin() make new timer for procedure {-procedure-}. The timer executes callback {-onTime-} only once.
 * Callback {-onTime-} executes when time delay {-delay-} is elapsed. If the timer is canceled, then the callback
 * {-onCancel-} is executed.
 *
 * @example
 * let timer = _.time.begin( 500, () => 'executed', () => 'canceled' );
 * _.time.out( 1000, () =>
 * {
 *  console.log( timer.result );
 *  // log : 'executed'
 *  return null;
 * });
 * console.log( timer.result );
 * // log : undefined
 *
 * @example
 * let timer = _.time.begin( 500, () => 'executed', () => 'canceled' );
 * _.time.cancel( timer );
 * console.log( timer.result );
 * // log : 'canceled'
 *
 * @param { Number } delay - The time delay.
 * @param { Procedure|Undefined } procedure - The procedure for timer.
 * @param { Function|Undefined|Null } onTime - The callback to execute when time is elapsed.
 * @param { Function|Undefined|Null } onCancel - The callback to execute when timer is canceled.
 * @returns { Timer } - Returns timer.
 * @function begin
 * @throws { Error } If arguments.length is less than 2 or great than 4.
 * @throws { Error } If {-delay-} is not a Number.
 * @throws { Error } If {-onTime-} neither is a Function, nor undefined, nor null.
 * @throws { Error } If {-onCancel-} neither is a Function, nor undefined, nor null.
 * @namespace wTools.time
 * @extends Tools
 */

function begin( /* delay, procedure, onTime, onCancel */ )
{
  let delay = arguments[ 0 ];
  let procedure = arguments[ 1 ];
  let onTime = arguments[ 2 ];
  let onCancel = arguments[ 3 ];

  if( !_.procedureIs( procedure ) )
  {
    onTime = arguments[ 1 ];
    onCancel = arguments[ 2 ]
  }

  _.assert( arguments.length === 2 || arguments.length === 3 || arguments.length === 4 );
  _.assert( _.numberIs( delay ) );
  _.assert( _.routineIs( onTime ) || onTime === undefined || onTime === null );
  _.assert( _.routineIs( onCancel ) || onCancel === undefined || onCancel === null );

  return this._begin( delay, onTime, onCancel );
}

//

/**
 * The routine finally() make new timer for procedure {-procedure-}. The timer executes callback {-onTime-} only once.
 * Callback {-onTime-} executes when time delay {-delay-} is elapsed or if the timer is canceled.
 *
 * @example
 * let timer = _.time.finally( 500, () => 'executed' );
 * _.time.out( 1000, () =>
 * {
 *  console.log( timer.result );
 *  // log : 'executed'
 *  return null;
 * });
 * console.log( timer.result );
 * // log : undefined
 *
 * @example
 * let timer = _.time.finally( 500, () => 'executed', () => 'canceled' );
 * _.time.cancel( timer );
 * console.log( timer.result );
 * // log : 'executed'
 *
 * @param { Number } delay - The time delay.
 * @param { Procedure|Undefined } procedure - The procedure for timer.
 * @param { Function|Undefined|Null } onTime - The callback to execute when time is elapsed.
 * @param { Function|Undefined|Null } onCancel - The callback to execute when timer is canceled.
 * @returns { Timer } - Returns timer.
 * @function finally
 * @throws { Error } If arguments.length is less than 2 or great than 3.
 * @throws { Error } If {-delay-} is not a Number.
 * @throws { Error } If {-onTime-} neither is a Function, nor undefined, nor null.
 * @namespace wTools.time
 * @extends Tools
 */

function finally_( delay, procedure, onTime )
{
  if( arguments.length === 2 )
  if( !_.procedureIs( procedure ) )
  onTime = arguments[ 1 ];

  _.assert( arguments.length === 2 || arguments.length === 3 );
  _.assert( _.numberIs( delay ) );
  _.assert( _.routineIs( onTime ) || onTime === undefined || onTime === null );

  return this._finally( delay, onTime );
}

//

/**
 * The routine periodic() make new periodic timer for procedure {-procedure-}. The timer executes callback {-onTime-}
 * periodically with time interval {-delay-}. If callback {-onTime-} returns undefined or Symbol _.dont, then the
 * callback {-onCancel-} executes and timer stops.
 * If the times is canceled, then the callback {-onCancel-} is executed.
 *
 * @example
 * let result = [];
 * function onTime()
 * {
 *   if( result.length < 3 )
 *   return result.push( 1 );
 *   else
 *   return undefined;
 * }
 * let timer = _.time.periodic( 500, onTime, () => 'canceled' );
 * _.time.out( 3000, () =>
 * {
 *   console.log( result );
 *   // log : [ 1, 1, 1 ]
 *   console.log( timer.result );
 *   // log : 'canceled'
 *   return null;
 * });
 * console.log( timer.result );
 * // log : undefined
 *
 * @example
 * let result = [];
 * function onTime()
 * {
 *   if( result.length < 3 )
 *   return result.push( 1 );
 *   else
 *   return undefined;
 * }
 * let timer = _.time.periodic( 500, onTime, () => 'canceled' );
 * _.time.cancel( timer );
 * console.log( result );
 * // log : []
 * console.log( timer.result );
 * // log : 'canceled'
 *
 * @param { Number } delay - The time delay.
 * @param { Procedure|Undefined } procedure - The procedure for timer.
 * @param { Function } onTime - The callback to execute when time is elapsed.
 * @param { Function|Undefined|Null } onCancel - The callback to execute when timer is canceled.
 * @returns { Timer } - Returns periodic timer.
 * @function begin
 * @throws { Error } If arguments.length is less than 2 or great than 4.
 * @throws { Error } If {-delay-} is not a Number.
 * @throws { Error } If {-onTime-} is not a Function.
 * @throws { Error } If {-onCancel-} neither is a Function, nor undefined, nor null.
 * @namespace wTools.time
 * @extends Tools
 */

function periodic( /* delay, procedure, onTime, onCancel */ )
{
  let delay = arguments[ 0 ];
  let procedure = arguments[ 1 ];
  let onTime = arguments[ 2 ];
  let onCancel = arguments[ 3 ];

  if( !_.procedureIs( procedure ) )
  {
    onTime = arguments[ 1 ];
    onCancel = arguments[ 2 ]
  }

  _.assert( arguments.length === 2 || arguments.length === 3 || arguments.length === 4 );
  _.assert( _.numberIs( delay ) );
  _.assert( _.routineIs( onTime ) );
  _.assert( _.routineIs( onCancel ) || onCancel === undefined || onCancel === null );

  return this._periodic( delay, onTime, onCancel );
}

//

/**
 * The routine cancel() cancels timer {-timer-}.
 *
 * @example
 * let timer = _.time.begin( 500, () => 'executed', () => 'canceled' );
 * let canceled = _.time.cancel( timer );
 * console.log( timer.result );
 * // log : 'canceled'
 * console.log( timer === canceled );
 * // log : true
 *
 * @example
 * let timer = _.time.periodic( 500, () => 'executed', () => 'canceled' );
 * let canceled = _.time.cancel( timer );
 * console.log( timer.result );
 * // log : 'canceled'
 * console.log( timer === canceled );
 * // log : true
 *
 * @param { Timer } timer - The timer to cancel.
 * @returns { Timer } - Returns canceled timer.
 * @function cancel
 * @throws { Error } If {-timer-} is not a Timer.
 * @namespace wTools.time
 * @extends Tools
 */

function cancel( timer )
{
  return _.time._cancel( ... arguments );
}

//

/**
 * The routine sleep() suspends program execution on time delay {-delay-}.
 *
 * @example
 * let result = [];
 * let periodic = _.time.periodic( 100, () => result.length < 10 ? result.push( 1 ) : undefined );
 * let before = _.time.now();
 *  _.time.sleep( 500 );
 * console.log( result.length <= 1 );
 * // log : true
 * let after = _.time.now();
 * let delta = after - before;
 * console.log( delta <= 550 );
 * // log : true
 *
 * @param { Number } delay - The delay to suspend program.
 * @returns { Undefined } - Returns not a value, suspends program.
 * @function sleep
 * @throws { Error } If arguments.length is less then 1 or great then 2.
 * @throws { Error } If {-delay-} is not a Number.
 * @throws { Error } If {-delay-} is less then zero.
 * @throws { Error } If {-delay-} has not finite value.
 * @namespace wTools.time
 * @extends Tools
 */

function sleep( delay )
{
  _.assert( arguments.length === 1 || arguments.length === 2 );
  _.assert( _.numberIs( delay ) && delay >= 0, 'Specify valid value {-delay-}.' );
  _.assert( _.numberIsFinite( delay ), 'Delay should have finite value.' );

  let now = _.time.now();

  while( ( _.time.now() - now ) < delay )
  {
  }
}

//

/**
 * The routine now_functor() make the better function to get current time in ms.
 * The returned function depends on environment.
 *
 * @example
 * let now = _.time.now_functor();
 * console.log( _.routineIs( now ) );
 * // log : true
 * console.log( now() );
 * // log : 1603172830154
 *
 * @returns { Function } - Returns function to get current time in ms.
 * @function now_functor
 * @namespace wTools.time
 * @extends Tools
 */

function now_functor()
{
  let now;

  if( typeof performance !== 'undefined' && performance.now !== undefined )
  now = _.routineJoin( performance, performance.now );
  else if( Date.now )
  now = _.routineJoin( Date, Date.now );
  else
  now = function(){ return Date().getTime() };

  return now;
}

//

/**
 * The routine from() returns the time since 01.01.1970 in ms.
 *
 * @example
 * let date = new Date();
 * console.log( _.time.from( date ) );
 * // log : 1603174830154
 *
 * @param { Number|Date|String } time - The time to convert.
 * @returns { Number } - Returns time since 01.01.1970.
 * @function from
 * @throws { Error } If arguments.length is not equal to 1.
 * @throws { Error } If {-time-} neither is a Number, nor a Date, nor a valid time String.
 * @namespace wTools.time
 * @extends Tools
 */

function from( time )
{

  _.assert( arguments.length === 1 );

  if( _.numberIs( time ) )
  {
    return time;
  }
  if( _.dateIs( time ) )
  {
    return time.getTime();
  }
  if( _.strIs( time ) )
  {
    time = Date.parse( time );
    if( !isNaN( time ) )
    return time;
    else
    _.assert( 0, 'Wrong time format' );
  }
  _.assert( 0, 'Not clear how to coerce to time', _.strType( time ) );
}

//

/**
 * The routine spent() calculate spent time from time {-time-} and converts
 * the value to formatted string with seconds. If the description {-description-}
 * is provided, then routine prepend description to resulted string.
 *
 * @example
 * let now = _time.now();
 * _.time.sleep( 500 );
 * let spent = _.time.spent( 'Spent : ', now );
 * console.log( spent );
 * // log : 'Spent : 0.5s'
 *
 * @param { String } description - The description for spent time. Optional parameter.
 * @param { Number } time - The start time.
 * @returns { Number } - Returns string with spent seconds.
 * @function spent
 * @throws { Error } If arguments.length is less than 1 or greater than 2.
 * @throws { Error } If {-description-} is not a String.
 * @throws { Error } If {-time-} is not a Number.
 * @namespace wTools.time
 * @extends Tools
 */

function spent( description, time )
{
  let now = _.time.now();

  if( arguments.length === 1 )
  {
    time = arguments[ 0 ];
    description = '';
  }

  _.assert( 1 <= arguments.length && arguments.length <= 2 );
  _.assert( _.numberIs( time ) );
  _.assert( _.strIs( description ) );

  // if( description && description !== ' ' )
  // description = description;

  let result = description + _.time.spentFormat( now-time );

  return result;
}

//

/**
 * The routine spentFormat() converts spent time in milliseconds to seconds.
 * Routine returns string with seconds.
 *
 * @example
 * let now = _time.now();
 * _.time.sleep( 500 );
 * let spent = _.time.now() - now;
 * console.log( _.time.spentFormat( spent ) );
 * // log : '0.5s'
 *
 * @param { Number } spent - The time to convert, in ms.
 * @returns { Number } - Returns string with spent seconds.
 * @function spentFormat
 * @throws { Error } If arguments.length is not equal to 1.
 * @throws { Error } If {-spent-} is not a Number.
 * @namespace wTools.time
 * @extends Tools
 */

function spentFormat( spent )
{

  _.assert( 1 === arguments.length );
  _.assert( _.numberIs( spent ) );

  let result = ( 0.001*( spent ) ).toFixed( 3 ) + 's';

  return result;
}

//

/**
 * The routine dateToStr() converts Date object {-date-} to formatted string.
 * The format is : YYYY.MM.DD
 *
 * @example
 * let date = new Date();
 * console.log( _.time.dateToStr( date ) );
 * // log : '2020.10.20'
 *
 * @param { Date } date - The date to convert.
 * @returns { String } - Returns date in string format.
 * @function dateToStr
 * @namespace wTools.time
 * @extends Tools
 */

function dateToStr( date )
{
  let y = date.getFullYear();
  let m = date.getMonth() + 1;
  let d = date.getDate();
  if( m < 10 ) m = '0' + m;
  if( d < 10 ) d = '0' + d;
  let result = [ y, m, d ].join( '.' );
  return result;
}

// --
// extension
// --

let Extension =
{

  _begin,
  _finally,
  _periodic,
  _cancel,

  timerIsBegun, /* aaa : cover */ /* Dmytro : covered, documented */
  timerIsCancelBegun, /* aaa : cover */ /* Dmytro : covered, documented */
  timerIsCancelEnded, /* aaa : cover */ /* Dmytro : covered, documented */
  timerIsUpBegun, /* aaa : cover */ /* Dmytro : covered, documented */
  timerIsUpEnded, /* aaa : cover */ /* Dmytro : covered, documented */

  soon,
  begin,
  finally : finally_,
  periodic,
  cancel,
  sleep,

  now_functor,
  now : now_functor(),

  from,
  spent,
  spentFormat,

  dateToStr,

}

//

_.mapSupplement( Self, Extension );

// --
// export
// --

if( typeof module !== 'undefined' )
module[ 'exports' ] = _;

})();
