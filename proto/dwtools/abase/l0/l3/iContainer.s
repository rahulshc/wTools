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

}

//

// if( _.container !== undefined )
// throw Error( 'wTools.container is already defined!' );
// _.container = Self;
_.container = _.container || Object.create( null );

Object.assign( Self, Extension );

// --
// export
// --

if( typeof module !== 'undefined' && module !== null )
module[ 'exports' ] = Self;

})();
