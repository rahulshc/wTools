( function _l3_Stringer_s_()
{

'use strict';

const _global = _global_;
const _ = _global_.wTools;

// --
// implementation
// --

function head( o )
{

  if( _.prototype.has( o, _.stringer.Stringer ) )
  return o;

  if( !o.Looker )
  o.Looker = Stringer;

  let it = o.Looker.optionsToIteration( null, o );

  _.assert( _.number.is( it.verbosity ) );
  _.assert( _.routine.is( it.levelDown ) );

  return it;
}

/* xxx : add to the list of types */

//

function itUp()
{
  let it = this;
  let it2 = it.iterationMake();
  it2.levelUp();
  it2.verbosity -= 1;
  return it2;
}

//

function itDown()
{
  let it = this;
  return it;
}

//

function levelUp()
{
  let it = this;
  it.tab += it.dtab;
  it.tabLevel += 1;
  return it;
}

//

function levelDown()
{
  let it = this;
  it.tab = it.tab.slice( 0, it.tab.length - it.dtab.length );
  it.tabLevel -= 1;
  return it;
}

//

function lineWrite( src )
{
  let it = this;
  _.assert( arguments.length === 1 );
  it.iterator.result += `\n${it.tab}${src}`;
  return it;
}

//

function write( src )
{
  let it = this;
  _.assert( arguments.length === 1 );
  it.iterator.result += src;
  return it;
}

//

function nlWrite()
{
  let it = this;
  _.assert( arguments.length === 0 );
  it.iterator.result += '\n';
  return it;
}

//

function tabWrite()
{
  let it = this;
  _.assert( arguments.length === 0 );
  it.iterator.result += it.tab;
  return it;
}

// --
//
// --

const StringerClassExtension = Object.create( null );

StringerClassExtension.constructor = function Stringer(){};
StringerClassExtension.head = head;
StringerClassExtension.itUp = itUp;
StringerClassExtension.itDown = itDown;
StringerClassExtension.levelUp = levelUp;
StringerClassExtension.levelDown = levelDown;
StringerClassExtension.write = write;
StringerClassExtension.nlWrite = nlWrite;
StringerClassExtension.tabWrite = tabWrite;
StringerClassExtension.lineWrite = lineWrite;

const Iterator = StringerClassExtension.Iterator = Object.create( null );
Iterator.result = '';
Iterator.dtab = '  ';

const Iteration = StringerClassExtension.Iteration = Object.create( null );
Iteration.tab = '';
Iteration.verbosity = 2;
Iteration.tabLevel = 0;

const IterationPreserve = StringerClassExtension.IterationPreserve = Object.create( null );
IterationPreserve.tab = null;
IterationPreserve.verbosity = null;
IterationPreserve.tabLevel = null;

const Prime = {};
const Stringer = _.looker.classDefine
({
  name : 'Stringer',
  parent : _.looker.Looker,
  prime : Prime,
  looker : StringerClassExtension,
  iterator : Iterator,
  iteration : Iteration,
  iterationPreserve : IterationPreserve,
  // exec : { head : exec_head, body : exec_body },
});

_.assert( Stringer.constructor.name === 'Stringer' );

// --
// stringer extension
// --

let StringerExtension =
{

  Stringer,
  it : head,

}

Object.assign( _.stringer, StringerExtension );

// --
// tools extension
// --

let ToolsExtension =
{
}

Object.assign( _, ToolsExtension );

})();
