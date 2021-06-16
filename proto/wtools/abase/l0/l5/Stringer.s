( function _l5_Stringer_s_()
{

'use strict';

const _global = _global_;
const _ = _global_.wTools;
const Parent = _.seeker.Seeker;

// --
// implementation
// --

/* xxx : add to the list of types */

function head( o )
{

  if( _.prototype.has( o, _.stringer.Stringer ) )
  return o;

  if( !o.Seeker )
  o.Seeker = Stringer;

  let it = o.Seeker.optionsToIteration( null, o );

  _.assert( _.number.is( it.verbosity ) );
  _.assert( _.routine.is( it.levelDown ) );

  return it;
}

//

function iteratorInitBegin( iterator )
{
  Parent.iteratorInitBegin.call( this, iterator );

  iterator.resultNode = [];

  return iterator;
}

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
  it.resultNode = [];
  it.iterator.resultNode.push( it.resultNode );
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
  if( it.iterator.result.length )
  it.iterator.result += `${it.eol}${it.tab}${src}`;
  else
  it.iterator.result += `${it.tab}${src}`;
  it.resultNode.push( `${it.tab}${src}` );
  return it;
}

//

function write( src )
{
  let it = this;
  _.assert( arguments.length === 1 );
  _.assert( _.str.is( src ) );
  it.iterator.result += src;
  if( it.resultNode.length )
  it.resultNode[ it.iterator.resultNode.length-1 ] += src;
  else
  it.resultNode.push( src );
  return it;
}

//

function eolWrite()
{
  let it = this;
  _.assert( arguments.length === 0 );
  it.write( it.eol );
  return it;
}

//

function tabWrite()
{
  let it = this;
  _.assert( arguments.length === 0 );
  it.write( it.tab );
  return it;
}

//

function nodesExportString( src, o )
{
  let result = '';

  o = _.routine.options( nodesExportString, o );

  act( src, o.tab );

  return result;

  function act( src, tab )
  {

    if( _.str.is( src ) )
    {
      if( result.length )
      result += '\n';
      result += tab + src;
      return;
    }

    if( _.array.is( src ) )
    {
      src.forEach( ( e ) => act( e, tab + o.dtab ) );
      return;
    }

    _.assert( 0 );
  }

}

nodesExportString.defaults =
{
  tab : '',
  dtab : '  ',
}

// --
//
// --

const StringerClassExtension = Object.create( null );
StringerClassExtension.constructor = function Stringer(){};
StringerClassExtension.head = head;
StringerClassExtension.iteratorInitBegin = iteratorInitBegin;
StringerClassExtension.itUp = itUp;
StringerClassExtension.itDown = itDown;
StringerClassExtension.levelUp = levelUp;
StringerClassExtension.levelDown = levelDown;
StringerClassExtension.write = write;
StringerClassExtension.eolWrite = eolWrite;
StringerClassExtension.tabWrite = tabWrite;
StringerClassExtension.lineWrite = lineWrite;

const Iterator = StringerClassExtension.Iterator = Object.create( null );
Iterator.result = '';
Iterator.resultNode = null;
Iterator.dtab = '  ';
Iterator.eol = _.str.lines.Eol.default;
Iterator.recursive = Infinity;
_.assert( !!Iterator.eol );

const Iteration = StringerClassExtension.Iteration = Object.create( null );
Iteration.resultNode = null;

const IterationPreserve = StringerClassExtension.IterationPreserve = Object.create( null );
IterationPreserve.tab = '';
IterationPreserve.verbosity = 2;
IterationPreserve.tabLevel = 0;
IterationPreserve.level = 0;

const Prime = {};
const Stringer = _.seeker.classDefine
({
  name : 'Stringer',
  parent : Parent,
  prime : Prime,
  seeker : StringerClassExtension,
  iterator : Iterator,
  iteration : Iteration,
  iterationPreserve : IterationPreserve,
});

_.assert( Stringer.constructor.name === 'Stringer' );
_.assert( Stringer.IterationPreserve.tab === '' );
_.assert( Stringer.Iteration.tab === '' );
_.assert( Stringer.Iterator.tab === undefined );
_.assert( Stringer.tab === undefined );

// --
// stringer extension
// --

let StringerExtension =
{

  Stringer,
  it : head,
  nodesExportString,

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
