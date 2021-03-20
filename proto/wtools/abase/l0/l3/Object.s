( function _l3_Object_s_()
{

'use strict';

let _global = _global_;
const _ = _global_.wTools;
let Self = _global_.wTools.object = _global_.wTools.object || Object.create( null );

// --
// typing
// --

/**
 * Function objectIs checks incoming param whether it is object.
 * Returns "true" if incoming param is object. Othervise "false" returned.
 *
 * @example
 * let obj = { x : 100 };
 * _.object.is(obj);
 * // returns true
 *
 * @example
 * _.object.is( 10 );
 * // returns false
 *
 * @param { * } src.
 * @return { Boolean }.
 * @function objectIs
 * @namespace Tools
 */

function objectIs( src )
{
  return Object.prototype.toString.call( src ) === '[object Object]';
}

//

function objectLike( src ) /* xxx qqq : optimize */
{

  if( _.object.is( src ) )
  return true;

  if( _.primitive.is( src ) )
  return false;

  // if( _.longIs( src ) ) /* yyy */
  // return false;
  if( _.vector.is( src ) )
  return false;

  if( _.routine.isTrivial( src ) )
  return false;

  if( _.set.is( src ) )
  return false;

  if( _.hashMap.is( src ) )
  return false;

  // yyy
  // for( let k in src )
  // return true;
  // return false;

  return true;
}

//

function objectLikeStandard( src ) /* xxx qqq : optimize */
{

  // if( _.object.is( src ) )
  // return true;

  if( _.primitive.is( src ) )
  return false;
  if( _.vector.is( src ) )
  return false;
  if( _.routine.isTrivial( src ) )
  return false;
  if( _.set.is( src ) )
  return false;
  if( _.hashMap.is( src ) )
  return false;

  if( _.date.is( src ) )
  return true
  if( _.regexpIs( src ) )
  return true
  if( _.bufferAnyIs( src ) )
  return true

  return false;
}

//

function exportStringShortDiagnostic( src )
{
  _.assert( arguments.length === 1, 'Expects exactly one argument' );
  _.assert( _.object.like( src ) );

  let result = '';

  if( _.routineIs( src.exportString ) )
  {
    result = src.exportString({ verbosity : 1, /*, ... o */ });
    result = _.strShort( result );
  }
  else
  {
    if( _.countable.is( src ) )
    result = _.countable.exportStringShortDiagnostic( src );
    else
    result = `{- ${_.entity.strType( src )} -}`;
  }

  return result;
}

//

function objectForTesting( o )
{
  let result;

  _.assert( arguments.length === 1 );
  countableConstructorPure.prototype = Object.create( null );
  if( o.withConstructor )
  countableConstructorPure.prototype.constructor = countableConstructorPure;

  /* xxx : replace countableMake */

  if( o.new )
  {
    if( o.pure )
    result = new countableConstructorPure( o );
    else
    result = new countableConstructorPolluted( o );
  }
  else
  {
    result = _objectMake( null, o );
  }

  if( o.withOwnConstructor )
  result.constructor = function ownConstructor(){}

  return result;

  /* - */

  function _iterate()
  {

    let iterator = Object.create( null );
    iterator.next = next;
    iterator.index = 0;
    iterator.instance = this;
    return iterator;

    function next()
    {
      let result = Object.create( null );
      result.done = this.index === this.instance.elements.length;
      if( result.done )
      return result;
      result.value = this.instance.elements[ this.index ];
      this.index += 1;
      return result;
    }

  }

  /* */

  function countableConstructorPure( o )
  {
    return _objectMake( this, o );
  }

  /* */

  function countableConstructorPolluted( o )
  {
    let result = _objectMake( this, o );
    if( !o.withConstructor )
    delete Object.getPrototypeOf( result ).constructor;
    return result
  }

  /* */

  function _objectMake( dst, o )
  {
    if( dst === null )
    if( o.pure )
    dst = Object.create( null );
    else
    dst = {};
    _.mapExtend( dst, o );
    if( o.withIterator )
    dst[ Symbol.iterator ] = _iterate;
    return dst;
  }

  /* */

}

objectForTesting.defaults =
{
  new : 0,
  pure : 0,
  withIterator : 0,
  withOwnConstructor : 0,
  withConstructor : 0,
  elements : null,
}

// --
// extension
// --

let ToolsExtension =
{

  // typing

  objectIs, /* qqq : optimize */
  objectLike, /* qqq : optimize */
  objectLikeStandard, /* qqq : optimize */

  //

  objectForTesting,

}

let Extension =
{

  // typing

  is : objectIs,
  like : objectLike,
  likeStandard : objectLikeStandard,

  // export string

  exportString : exportStringShortDiagnostic,
  exportStringShort : exportStringShortDiagnostic,
  exportStringShortDiagnostic,
  exportStringShortCode : exportStringShortDiagnostic,
  exportStringDiagnostic : exportStringShortDiagnostic,
  exportStringCode : exportStringShortDiagnostic,

  //

  forTesting : objectForTesting,

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
