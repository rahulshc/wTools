( function _fTime_s_() {

'use strict';

let _global = _global_;
let _ = _global_.wTools;
let Self = _global_.wTools.time = _global_.wTools.time || Object.create( null );

// --
// implementation
// --

let _TimeInfinity = Math.pow( 2, 31 )-1;
function _begin( delay, onEnd )
{
  let timer = null;

  if( delay === undefined )
  delay = Infinity;
  if( delay >= _TimeInfinity )
  delay = _TimeInfinity;

  _.assert( arguments.length <= 4 );
  _.assert( _.numberIs( delay ) );
  _.assert( onEnd === null || onEnd === undefined || _.routineIs( onEnd ) )

  if( arguments[ 2 ] !== undefined || arguments[ 3 ] !== undefined )
  onEnd = _.routineJoin.call( _, arguments[ 1 ], arguments[ 2 ], arguments[ 3 ] );

  if( delay > 0 )
  timer = setTimeout( out, delay );
  else
  timer = soon( out ) || null;

  return timer;

  /* */

  function out()
  {
    if( onEnd )
    onEnd( timer );
  }

}

//

function _cancel( timer )
{
  clearTimeout( timer );
  return timer;
}

//

function begin( delay, procedure, onEnd )
{
  if( arguments.length === 2 )
  if( !_.procedureIs( procedure ) )
  onEnd = arguments[ 1 ];
  _.assert( arguments.length === 2 || arguments.length === 3 );
  return this._begin( delay, onEnd );
}

//

let soon = typeof process === 'undefined' ? function( h ){ return setTimeout( h, 0 ) } : process.nextTick;

//

function cancel( timer )
{
  debugger;
  return _.time._cancel( ... arguments );
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

function rarely_functor( perTime, routine )
{
  let lastTime = _.time.now() - perTime;

  _.assert( arguments.length === 2 );
  _.assert( _.numberIs( perTime ) );
  _.assert( _.routineIs( routine ) );

  return function fewer()
  {
    let now = _.time.now();
    let elapsed = now - lastTime;
    if( elapsed < perTime )
    return;
    lastTime = now;
    return routine.apply( this, arguments );
  }

}

//

function from( time )
{

  /* qqq : implement from string */

  _.assert( arguments.length === 1 );

  if( _.numberIs( time ) )
  return time;
  if( _.dateIs( time ) )
  return time.getTime()
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
// fields
// --

let Fields =
{
}

// --
// routines
// --

let Routines =
{

  _begin, /* qqq : cover */
  _cancel, /* qqq : cover */

  begin,
  cancel,
  soon,

  now_functor,
  now : now_functor(),

  rarely_functor,

  from,
  spent,
  spentFormat,

  dateToStr,

}

//

_.mapSupplement( Self, Fields );
_.mapSupplement( Self, Routines );

// Object.assign( Self, Routines );
// Object.assign( Self, Fields );

// --
// export
// --

if( typeof module !== 'undefined' && module !== null )
module[ 'exports' ] = _;

})();
