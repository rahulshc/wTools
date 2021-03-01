( function _l3_Constructible_s_()
{

'use strict';

let _global = _global_;
let _ = _global_.wTools;
let Self = _global_.wTools.constructible = _global_.wTools.constructible || Object.create( null );

// --
// typing
// --

function constructibleIs( src ) /* xxx qqq : optimize */
{
  if( _.primitive.is( src ) )
  return false;

  let proto = Object.getPrototypeOf( src );
  if( proto === null )
  return false;

  if( !Reflect.has( proto, 'constructor' ) )
  return false;
  if( proto.constructor === Object )
  return false;

  if( _.aux.is( src ) ) /* xxx : remove? */
  return false;
  if( _.vector.is( src ) )
  return false;
  if( _.set.is( src ) )
  return false;
  if( _.hashMap.is( src ) )
  return false;

  return true;
}

//

function constructibleLike( src )
{
  return _.constructibleIs( src );
}

// --
// extension
// --

let ToolsExtension =
{

  // typing

  constructibleIs, /* qqq : cover and move */
  constructibleLike, /* qqq : cover and move */

}

//

let Extension =
{

  // typing

  is : constructibleIs, /* qqq : cover and move */
  like : constructibleLike, /* qqq : cover and move */

}

//

Object.assign( _, ToolsExtension );
Object.assign( Self, Extension );

// --
// export
// --

if( typeof module !== 'undefined' )
module[ 'exports' ] = _;

})();
