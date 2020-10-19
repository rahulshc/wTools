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

let soon = typeof process === 'undefined' ? function( h ){ return setTimeout( h, 0 ) } : process.nextTick;

//

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

function cancel( timer )
{
  return _.time._cancel( ... arguments );
}

//

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
    let time = Date.parse( time );
    if( !isNaN( time ) )
    return time;
    else
    _.assert( 0, 'Wrong time format' );
  }
  _.assert( 0, 'Not clear how to coerce to time', _.strType( time ) );
}

//

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

function spentFormat( spent )
{
  let now = _.time.now();

  _.assert( 1 === arguments.length );
  _.assert( _.numberIs( spent ) );

  let result = ( 0.001*( spent ) ).toFixed( 3 ) + 's';

  return result;
}

//

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
