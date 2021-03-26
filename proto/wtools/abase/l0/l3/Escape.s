( function _l3_Escape_s_()
{

'use strict';

const _global = _global_;
const _ = _global_.wTools;

// --
// implement
// --

function is( src )
{
  if( !src )
  return false;
  return src instanceof _.Escape;
}

//

function make( src )
{
  if( arguments.length !== 1 )
  throw new Error( 'Expects exactly one argument' );
  return new Escape( src );
}

//

function from( src )
{
  if( arguments.length !== 1 )
  throw new Error( 'Expects exactly one argument' );
  if( _.escape.is( src ) )
  return src;
  return _.escape.make( src );
}

//

function cloneShallow()
{
  _.assert( !( this instanceof cloneShallow ) );
  return this;
}

//

function cloneDeep()
{
  debugger;
  _.assert( !( this instanceof cloneDeep ) );
  return this;
}

//

function equalAre( it )
{
  let self = this;

  _.assert( arguments.length === 1 );

  if( !it.src )
  return it.stop( false );
  if( !it.src2 )
  return it.stop( false );

  if( !it.src instanceof _.Escape )
  return it.stop( false );
  if( !it.src2 instanceof _.Escape )
  return it.stop( false );

  if( it.src.val === it.src2.val )
  return it.stop( true );

  if( !( it.src.val instanceof _.Escape ) )
  return it.stop( false );
  if( !( it.src2.val instanceof _.Escape ) )
  return it.stop( false );

  // if( !it.src )
  // return end( false );
  // if( !it.src2 )
  // return end( false );
  // if( !it.src instanceof _.Escape )
  // return end( false );
  // if( !it.src2 instanceof _.Escape )
  // return end( false );
  //
  // if( it.src.val === it.src2.val )
  // return end( true );
  //
  // if( !( it.src.val instanceof _.Escape ) )
  // return end( false );
  // if( !( it.src.val instanceof _.Escape ) )
  // return end( false );
  //
  // function end( result )
  // {
  //   it.result = result;
  //   it.continue = false;
  // }
}

//

function iterate()
{

  let iterator = Object.create( null );
  iterator.next = next;
  iterator.index = 0;
  iterator.instance = this;
  return iterator;

  function next()
  {
    let result = Object.create( null );
    result.done = this.index === 1;
    if( result.done )
    return result;
    result.value = this.instance.val;
    this.index += 1;
    return result;
  }

}

// //
//
// function TypeNameGet()
// {
//   return 'Escape';
// }

// //
//
// function exportStringIgnoringArgs()
// {
//   return this[ exportStringSymbol ]();
//   // return this.exportString();
// }

//

function exportString()
{
  if( _.symbol.is( this.val ) )
  return `Escape( Symbol( ${Symbol.keyFor( this.val )} ) )`;
  else
  return `Escape( ${String( this.val )} )`;
}

// --
// declare
// --

function Escape( val )
{
  if( arguments.length !== 1 )
  throw new Error( 'Expects exactly 1 argument' );
  this.val = val;
  Object.freeze( this );
  return this;
}

_.class.declareBasic
({
  constructor : Escape,
  iterate,
  equalAre,
  exportString,
  cloneShallow, /* xxx : implement */
  cloneDeep, /* xxx : implement */
});

//

var Extension =
{
  is,
  make,
  from,
}

//

_.assert( _.escape === undefined );
_.escape = Object.create( null );
_.assert( _.Escape === undefined );
_.Escape = Escape;
Object.assign( _.escape, Extension );

})();
