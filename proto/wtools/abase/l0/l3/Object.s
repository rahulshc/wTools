( function _l3_Object_s_()
{

'use strict';

const _global = _global_;
const _ = _global_.wTools;
const Self = _global_.wTools.object = _global_.wTools.object || Object.create( null );

// --
// typing
// --

/**
 * Function is checks incoming param whether it is object.
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
 * @function is
 * @namespace Tools
 */

function is( src )
{
  return Object.prototype.toString.call( src ) === '[object Object]';
}

//

function like( src ) /* xxx : qqq : for Yevhen : optimize */
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

function likeStandard( src ) /* xxx : qqq : for Yevhen : optimize */
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

function exportStringShallowDiagnostic( src )
{
  _.assert( arguments.length === 1, 'Expects exactly one argument' );
  _.assert( _.object.like( src ) );

  let result = '';
  let method = _.class.methodExportStringOf( src );

  // if( _.routineIs( src.exportString ) )
  if( method )
  {
    result = method.call( src, { verbosity : 1 } );
    result = _.strShort_( result ).result;
  }
  else
  {
    if( _.countable.is( src ) )
    result = _.countable.exportStringShallowDiagnostic( src );
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

  objectIs : is, /* qqq : optimize */
  objectLike : like, /* qqq : optimize */
  objectLikeStandard : likeStandard, /* qqq : optimize */

  //

  objectForTesting,

}

let Extension =
{

  // typing

  is,
  like,
  likeStandard,

  // export string

  exportString : exportStringShallowDiagnostic,
  exportStringShallow : exportStringShallowDiagnostic,
  exportStringShallowDiagnostic,
  exportStringShallowCode : exportStringShallowDiagnostic,
  exportStringDiagnostic : exportStringShallowDiagnostic,
  exportStringCode : exportStringShallowDiagnostic,

  //

  forTesting : objectForTesting,

}

//

Object.assign( _, ToolsExtension );
Object.assign( Self, Extension );

})();
