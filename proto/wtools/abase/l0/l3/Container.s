( function _l3_Container_s_()
{

'use strict';

const _global = _global_;
const _ = _global_.wTools;

// --
//
// --

function is( src )
{
  if( _.longLike( src ) )
  return true;
  if( _.aux.is( src ) )
  return true;
  if( _.hashMap.like( src ) )
  return true;
  if( _.set.like( src ) )
  return true;
  return false;
}

//

function like( src )
{
  if( _.longLike( src ) )
  return true;
  if( _.object.like( src ) )
  return true;
  if( _.hashMap.like( src ) )
  return true;
  if( _.set.like( src ) )
  return true;
  return false;
}

//

function lengthOf( container )
{

  _.assert( arguments.length === 1 );

  // yyy
  // let type = _.container.typeOf( container );
  // if( type && type._lengthGet )
  // return type._lengthGet( container );

  // if( _.class.methodIteratorOf( container ) )
  // return [ ... container ].length;

  /* qqq : find optimal solution. write performance test */
  return _.entity.lengthOf( container );
}

// --
// declare type
// --

let types;
if( _realGlobal_.wTools && _realGlobal_.wTools.container && _realGlobal_.wTools.container.types )
types = _realGlobal_.wTools.container.types;
else
types = Object.create( null );

if( !_realGlobal_.wTools )
_realGlobal_.wTools = Object.create( null );
if( !_realGlobal_.wTools.container )
_realGlobal_.wTools.container = Object.create( null );
_realGlobal_.wTools.container.types = types;

class Container
{
  static[ Symbol.hasInstance ]( instance )
  {
    return is( instance );
  }
}

let Handler =
{
  construct( original, args )
  {
    return Container.make( ... args );
  }
};

const Self = new Proxy( Container, Handler );
Self.original = Container;

// --
// extend container
// --

let ContainerExtension =
{

  is, /* qqq : cover please */
  like, /* qqq : cover please | aaa : Done. Yevhen S. */
  lengthOf, /* qqq : cover please | aaa : Done. Yevhen S. */

  //

  types,

}

//

_.container = Self;

Object.assign( Self, ContainerExtension );

// --
// extend tools
// --

let ToolsExtension =
{

  containerIs : is,
  containerLike : like,
  containerLengthOf : lengthOf,

}

//

Object.assign( _, ToolsExtension );

})();
