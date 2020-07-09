( function _iContainer_s_() {

'use strict';

let _global = _global_;
let _ = _global_.wTools;

// --
//
// --

function is( src )
{
  return _.containerIs( src );
}

//

function like( src )
{
  return _.containerLike( src );
}

// --
// define
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
// _.assert( _realGlobal_.wTools.container.types === undefined || _realGlobal_.wTools.container.types === types );
_realGlobal_.wTools.container.types = types;

// let types = _realGlobal_.wTools.container.types;

class Container
{
  static [ Symbol.hasInstance ]( instance )
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

let Self = new Proxy( Container, Handler );
Self.original = Container;

//

let Extension =
{

  //

  is,
  like,

  //

  types

  //

}

//

// if( _.container !== undefined )
// throw Error( 'wTools.container is already defined!' );
// _.container = Self;
// _.container = _.container || Object.create( null );
// _.container = _.container || Self;
_.container = Self;

Object.assign( Self, Extension );

// --
// export
// --

if( typeof module !== 'undefined' )
module[ 'exports' ] = Self;

})();
