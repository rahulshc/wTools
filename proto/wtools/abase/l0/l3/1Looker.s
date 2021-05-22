( function _l3_1Looker_s_()
{

'use strict';

const _global = _global_;
const _ = _global_.wTools;

// --
// implementation
// --

function optionsToIteration( iterator, o )
{
  _.assert( o.it === undefined );
  _.assert( _.mapIs( o ) );
  _.assert( !_.props.ownEnumerable( o, 'constructor' ) );
  _.assert( arguments.length === 2 );
  if( iterator === null )
  iterator = o.Looker.iteratorRetype( o );
  else
  Object.assign( iterator, o );
  o.Looker.iteratorInit( iterator );
  let it = iterator.iteratorIterationMake();
  _.assert( it.Looker.iterationProper( it ) );
  return it;
}

//

function iteratorRetype( iterator )
{
  Object.setPrototypeOf( iterator, iterator.Looker );
  iterator.iterator = iterator;
  return iterator;
}

//

const _iteratorInitExcluding = new Set([ 'Looker', 'iterationPrototype', 'iterator' ]);
function iteratorInit( iterator )
{
  iterator.iterationPrototype = Object.create( iterator );
  Object.assign( iterator.iterationPrototype, iterator.Looker.Iteration );

  for( const [ key, val ] of Object.entries( iterator ) )
  {
    if( !_iteratorInitExcluding.has( key ) )
    if( _.props.has( iterator.iterationPrototype, key ) )
    {
      iterator.iterationPrototype[ key ] = val;
      console.log( ` ! ${key}` );
    }
  }

  Object.preventExtensions( iterator.iterationPrototype );
}

//

function iteratorIterationMake()
{
  let it = this;
  let newIt = it.iterationMakeCommon();
  return newIt;
}

//

function iterationMakeCommon()
{
  let it = this;
  let newIt = Object.create( it.iterationPrototype );
  return newIt;
}

//

function iterationMake()
{
  let it = this;
  let newIt = it.iterationMakeCommon();

  for( let k in it.Looker.IterationPreserve )
  newIt[ k ] = it[ k ];

  newIt.down = it; /* xxx */

  return newIt;
}

//

function iterationProper( it )
{
  if( !it )
  return false;
  if( !it.Looker )
  return false;
  if( !it.iterator )
  return false;
  if( it.iterator === it )
  return false;
  if( it.constructor !== this.constructor )
  return false;
  return true;
}

// --
// meta
// --

function classDefine( o )
{

  _.routine.options( classDefine, o );

  if( o.parent === null )
  o.parent = this.Looker;
  if( o.name === null )
  o.name = 'CustomLooker'

  _.assert( _.object.isBasic( o.parent ), `Parent should be object` );

  let looker = _.props.extend( null, o.parent );

  _.assert( !!o.looker && !!o.looker.constructor && o.looker.constructor !== Object );
  // if( !o.looker || !o.looker.constructor || o.looker.constructor === Object )
  // {
  //   let CustomLooker = (function()
  //   {
  //     return ({
  //       [ o.name ] : function(){},
  //     })[ o.name ];
  //   })();
  //   looker.constructor = CustomLooker;
  //   _.assert( looker.constructor.name === o.name );
  //   debugger;
  // }

  if( o.prime )
  _.props.extend( looker, o.prime );
  if( o.looker )
  _.props.extend( looker, o.looker );
  if( o.iterator )
  _.props.extend( looker, o.iterator );
  if( o.iterationPreserve )
  _.props.supplement( looker, o.iterationPreserve );

  looker.Looker = looker;
  looker.OriginalLooker = looker;
  looker.Prime = Object.create( looker.Prime || null );
  if( o.prime )
  _.props.extend( looker.Prime, o.prime );
  Object.preventExtensions( looker.Prime );

  if( o.exec || looker.exec )
  looker.exec = exec_functor( o.exec || looker.exec );
  if( o.execIt || looker.execIt )
  looker.execIt = exec_functor( o.execIt || looker.execIt );

  let iterator = looker.Iterator = Object.assign( Object.create( null ), looker.Iterator );
  if( o.iterator )
  _.props.extend( iterator, o.iterator );

  let iteration = looker.Iteration = Object.assign( Object.create( null ), looker.Iteration );
  let iterationPreserve = looker.IterationPreserve = Object.assign( Object.create( null ), looker.IterationPreserve );
  if( o.iterationPreserve )
  {
    _.props.extend( iterationPreserve, o.iterationPreserve );
  }
  if( o.iteration )
  _.props.extend( iteration, o.iteration );

  if( Config.debug )
  validate();

  return looker;

  /* - */

  function exec_functor( original )
  {
    _.assert( _.routineIs( original.head ) );
    _.assert( _.routineIs( original.body ) );
    if( !original.body.defaults )
    original.body.defaults = looker;
    let exec = _.routine._amend
    ({
      dst : null,
      srcs : [ original, { defaults : looker } ],
      strategy : 'replacing',
      amending : 'extending',
    });
    _.assert( exec.defaults === looker );
    _.assert( exec.body.defaults === looker );
    return exec;
  }

  /* - */

  function validate()
  {
    /* qqq : add explanation for each assert */
    _.assert( looker.Prime.Looker === undefined );
    // _.assert( _.routineIs( looker.iterableEval ) );
    _.assert( !_.props.has( looker.Iteration, 'src' ) && looker.Iteration.src === undefined );
    // _.assert( _.props.has( looker.IterationPreserve, 'src' ) && looker.IterationPreserve.src === undefined );
    // _.assert( _.props.has( looker, 'src' ) && looker.src === undefined );
    _.assert( !_.props.has( looker.Iteration, 'root' ) && looker.Iteration.root === undefined );
    // _.assert( _.props.has( looker, 'root' ) && looker.root === undefined );
    if( _.props.has( looker, 'dst' ) )
    {
      _.assert( _.props.has( looker.Iteration, 'dst' ) && looker.Iteration.dst === undefined );
      _.assert( _.props.has( looker, 'dst' ) && looker.dst === undefined );
    }
    // if( _.props.has( looker, 'result' ) )
    // {
    //   _.assert( _.props.has( looker.Iterator, 'result' ) && looker.Iterator.result === undefined );
    //   _.assert( _.props.has( looker, 'result' ) && looker.result === undefined );
    // }
  }

  /* - */

}

classDefine.defaults =
{
  name : null,
  parent : null,
  prime : null,
  looker : null,
  iterator : null,
  iteration : null,
  iterationPreserve : null,
  exec : null,
  execIt : null,
}

// --
//
// --

const Looker = Object.create( null );
Looker.OriginalLooker = Looker;
Looker.constructor = function Looker() /* xxx : implement */
{
  _.assert( 0, 'not implemented' );
  let prototype = _.prototype.of( this );
  _.assert( _.object.isBasic( prototype ) );
  _.assert( prototype.exec.defaults === prototype );
  let result = this.head( prototype.exec, arguments );
  _.assert( result === this );
  return this;
}

_.prototype.set( Looker.constructor, null );
Looker.constructor.prototype = Looker;

Looker.optionsToIteration = optionsToIteration;
Looker.iteratorRetype = iteratorRetype;
Looker.iteratorInit = iteratorInit;
Looker.iteratorIterationMake = iteratorIterationMake;
Looker.iterationMakeCommon = iterationMakeCommon;
Looker.iterationMake = iterationMake;
Looker.iterationProper = iterationProper;

const Iterator = Looker.Iterator = Object.create( null );

const Iteration = Looker.Iteration = Object.create( null );
Iteration.down = null;

// --
// looker extension
// --

let LookerExtension =
{

  Looker,
  classDefine,

}

Object.assign( _.looker, LookerExtension );

// --
// tools extension
// --

let ToolsExtension =
{
}

Object.assign( _, ToolsExtension );

})();
