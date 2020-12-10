( function _l8_Routine_s_()
{

'use strict';

let _global = _global_;
let _ = _global_.wTools;
let Self = _global_.wTools;

// --
// routine
// --

function routineCallButOnly( /* context, routine, o, but, only */ )
{
  let context = arguments[ 0 ];
  let routine = arguments[ 1 ];
  let o = arguments[ 2 ];
  let but = arguments[ 3 ];
  let only = arguments[ 4 ];

  if( _.routineIs( routine ) || _.strIs( routine ) )
  {

    _.assert( arguments.length === 3 || arguments.length === 4 || arguments.length === 5 );
    _.assert( _.mapIs( o ) );

    if( _.strIs( routine ) )
    routine = context[ routine ];

  }
  else
  {

    routine = arguments[ 0 ];
    o = arguments[ 1 ];
    but = arguments[ 2 ];
    only = arguments[ 3 ];

    _.assert( arguments.length === 2 || arguments.length === 3 || arguments.length === 4 );
    _.assert( _.mapIs( o ) );

  }

  _.assert( _.routineIs( routine ) );

  if( !only )
  only = routine.defaults

  if( but )
  o = _.mapBut( o, but )
  if( only )
  o = _.mapOnly( o, only )

  return routine.call( context, o );
}

//

function _routinesComposeWithSingleArgument_head( routine, args )
{
  let o = _.routinesCompose.head.call( this, routine, args );

  _.assert( args.length === 1 );
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );

  return o;
}

//

function routinesComposeReturningLast()
{
  let o = _.routinesComposeReturningLast.head( routinesComposeReturningLast, arguments );
  let result = _.routinesComposeReturningLast.body( o );
  return result;
}

routinesComposeReturningLast.head = _.routinesCompose.head;
routinesComposeReturningLast.body = _.routinesCompose.body;
routinesComposeReturningLast.defaults = Object.create( _.routinesCompose.defaults );

routinesComposeReturningLast.defaults.supervisor = _.compose.supervisor.returningLast;

function routinesComposeAll()
{
  let o = _.routinesComposeAll.head( routinesComposeAll, arguments );
  let result = _.routinesComposeAll.body( o );
  return result;
}

routinesComposeAll.head = _routinesComposeWithSingleArgument_head;
routinesComposeAll.body = _.routinesCompose.body;

var defaults = routinesComposeAll.defaults = Object.create( _.routinesCompose.defaults );
defaults.chainer = _.compose.chainer.composeAll;
defaults.supervisor = _.compose.supervisor.composeAll;

_.assert( _.routineIs( _.compose.chainer.originalWithDont ) );
_.assert( _.routineIs( _.compose.supervisor.composeAll ) );

//

function routinesComposeAllReturningLast()
{
  let o = _.routinesComposeAllReturningLast.head( routinesComposeAllReturningLast, arguments );
  let result = _.routinesComposeAllReturningLast.body( o );
  return result;
}

routinesComposeAllReturningLast.head = _routinesComposeWithSingleArgument_head;
routinesComposeAllReturningLast.body = _.routinesCompose.body;

var defaults = routinesComposeAllReturningLast.defaults = Object.create( _.routinesCompose.defaults );
defaults.chainer = _.compose.chainer.originalWithDont;
defaults.supervisor = _.compose.supervisor.returningLast;

//

function routinesChain()
{
  let o = _.routinesChain.head( routinesChain, arguments );
  let result = _.routinesChain.body( o );
  return result;
}

routinesChain.head = _routinesComposeWithSingleArgument_head;
routinesChain.body = _.routinesCompose.body;

var defaults = routinesChain.defaults = Object.create( _.routinesCompose.defaults );
defaults.chainer = _.compose.chainer.chaining;
defaults.supervisor = _.compose.supervisor.chaining;

//

function _equalizerFromMapper( mapper )
{

  if( mapper === undefined )
  mapper = function mapper( a, b ){ return a === b };

  _.assert( 0, 'not tested' )
  _.assert( arguments.length === 1, 'Expects single argument' );
  _.assert( mapper.length === 1 || mapper.length === 2 );

  if( mapper.length === 1 )
  {
    let equalizer = equalizerFromMapper;
    return equalizer;
  }

  return mapper;

  function equalizerFromMapper( a, b )
  {
    return mapper( a ) === mapper( b );
  }
}

//

function _comparatorFromEvaluator( evaluator )
{

  if( evaluator === undefined )
  evaluator = function comparator( a, b ){ return a-b };

  _.assert( arguments.length === 1, 'Expects single argument' );
  _.assert( evaluator.length === 1 || evaluator.length === 2 );

  if( evaluator.length === 1 )
  {
    let comparator = comparatorFromEvaluator;
    return comparator;
  }

  return evaluator;

  function comparatorFromEvaluator( a, b )
  {
    return evaluator( a ) - evaluator( b );
  }
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

  routineCallButOnly, /* qqq : cover please */

  routinesComposeReturningLast,
  routinesComposeAll,
  routinesComposeAllReturningLast, /* xxx */
  routinesChain,

  _equalizerFromMapper,
  _comparatorFromEvaluator, /* xxx : move out */

}

//

Object.assign( Self, Routines );
Object.assign( Self, Fields );

// --
// export
// --

if( typeof module !== 'undefined' )
module[ 'exports' ] = _;

})();
