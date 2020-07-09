( function _fEntity_s_() {

'use strict';

let _global = _global_;
let _ = _global_.wTools;
let Self = _global_.wTools;

// --
//
// --

function entityMakeConstructing( src, length )
{

  _.assert( arguments.length === 1 || arguments.length === 2 );

  if( _.arrayIs( src ) )
  {
    return new Array( length !== undefined ? length : src.length );
  }
  else if( _.longIs( src ) )
  {
    return this.longMake( src, length );
    // if( _.bufferTypedIs( src ) || _.bufferNodeIs( src ) )
    // return new src.constructor( length !== undefined ? length : src.length );
    // else
    // return new Array( length !== undefined ? length : src.length );
  }
  else if( _.mapLike( src ) )
  {
    return Object.create( null );
  }
  else if( _.objectIs( src ) )
  {
    return new src.constructor();
  }
  else if( src === _.null )
  {
    return null;
  }
  else if( src === _.undefined )
  {
    return undefined;
  }
  else if( _.primitiveIs( src ) )
  {
    return src;
  }
  else _.assert( 0, 'Not clear how to make a object of ', _.strType( src ) );

}

//

function entityMakeEmpty( src )
{

  _.assert( arguments.length === 1 );

  if( _.arrayIs( src ) )
  {
    return new Array();
  }
  else if( _.longIs( src ) )
  {
    return this.longMakeEmpty( src );
  }
  else if( _.setIs( src ) )
  {
    return new src.constructor();
  }
  else if( _.hashMapIs( src ) )
  {
    return new src.constructor();
  }
  else if( _.mapLike( src ) )
  {
    return Object.create( null );
  }
  else if( src === _.null )
  {
    return null;
  }
  else if( src === _.undefined )
  {
    return undefined;
  }
  else if( _.primitiveIs( src ) )
  {
    return src;
  }
  else _.assert( 0, 'Not clear how to make a new object of ', _.strType( src ) );

}

//

function entityMakeUndefined( src, length )
{

  _.assert( arguments.length === 1 || arguments.length === 2 );

  if( _.arrayIs( src ) )
  {
    return new Array( length !== undefined ? length : src.length );
  }
  else if( _.longIs( src ) )
  {
    return this.longMakeUndefined( src, length );
    // return this.longMake( src, length ); /* Dmytro : incorrect usage of routine */
  }
  else if( _.setIs( src ) )
  {
    return new src.constructor();
  }
  else if( _.hashMapIs( src ) )
  {
    return new src.constructor();
  }
  else if( _.mapLike( src ) )
  {
    return Object.create( null );
  }
  else if( src === _.null )
  {
    return null;
  }
  else if( src === _.undefined )
  {
    return undefined;
  }
  else if( _.primitiveIs( src ) )
  {
    return src;
  }
  else _.assert( 0, 'Not clear how to make a new object of ', _.strType( src ) );

}

//

function entityMake( src )
{
  _.assert( arguments.length === 1, 'Expects single argument' );

  if( _.arrayIs( src ) )
  {
    return Array.from( src );
  }
  else if( _.longLike( src ) )
  {
    return this.longMake( src );
    // return _.longShallowClone( src ); /* Dmytro : longShallowClone not use longDescriptor for constructing of long
  }
  else if( _.hashMapLike( src ) || _.setLike( src ) )
  {
    return new src.constructor( src );
  }
  else if( _.mapLike( src ) )
  {
    return _.mapShallowClone( src )
  }
  else if( src === _.null )
  {
    return null;
  }
  else if( src === _.undefined )
  {
    return undefined;
  }
  else if( _.primitiveIs( src ) )
  {
    return src;
  }
  else _.assert( 0, 'Not clear how to make a new element of ', _.strType( src ) );

}

//

/**
 * The routine entityEntityEqualize() checks equality of two entities {-src1-} and {-src2-}.
 * Routine accepts callbacks {-onEvaluate1-} and {-onEvaluate2-}, which apply to
 * entities {-src1-} and {-src2-}. The values returned by callbacks are compared with each other.
 * If callbacks is not passed, then routine compares {-src1-} and {-src2-} directly.
 *
 * @param { * } src1 - First entity to compare.
 * @param { * } src2 - Second entity to compare.
 * @param { Function } onEvaluate - It's a callback. If the routine has two parameters,
 * it is used as an equalizer, and if it has only one, then routine is used as the evaluator.
 * @param { Function } onEvaluate2 - The second part of evaluator. Accepts the {-src2-} to search.
 *
 * @example
 * _.entityEntityEqualize( 1, 1 );
 * // returns true
 *
 * @example
 * _.entityEntityEqualize( 1, 'str' );
 * // returns false
 *
 * @example
 * _.entityEntityEqualize( [ 1, 2, 3 ], [ 1, 2, 3 ] );
 * // returns false
 *
 * @example
 * _.entityEntityEqualize( [ 1, 2, 3 ], [ 1, 2, 3 ], ( e ) => e[ 0 ] );
 * // returns true
 *
 * @example
 * _.entityEntityEqualize( [ 1, 2, 3 ], [ 1, 2, 3 ], ( e1, e2 ) => e1[ 0 ] > e2[ 2 ] );
 * // returns false
 *
 * @example
 * _.entityEntityEqualize( [ 1, 2, 3 ], [ 1, 2, 3 ], ( e1 ) => e1[ 2 ], ( e2 ) => e2[ 2 ] );
 * // returns true
 *
 * @returns { Boolean } - Returns boolean value of equality of two entities.
 * @function entityEntityEqualize
 * @throws { Error } If arguments.length is less then two or more then four.
 * @throws { Error } If {-onEvaluate1-} is not a routine.
 * @throws { Error } If {-onEvaluate1-} is undefines and onEvaluate2 provided.
 * @throws { Error } If {-onEvaluate1-} is evaluator and accepts less or more then one parameter.
 * @throws { Error } If {-onEvaluate1-} is equalizer and onEvaluate2 provided.
 * @throws { Error } If {-onEvaluate2-} is not a routine.
 * @throws { Error } If {-onEvaluate2-} accepts less or more then one parameter.
 * @namespace Tools
 */

function entityEntityEqualize( src1, src2, onEvaluate1, onEvaluate2 )
{

  _.assert( 2 <= arguments.length && arguments.length <= 4 );

  if( !onEvaluate1 )
  {
    _.assert( !onEvaluate2 );
    return Object.is( src1, src2 );
  }
  else if( onEvaluate1.length === 2 ) /* equalizer */
  {
    _.assert( !onEvaluate2 );
    return onEvaluate1( src1, src2 );
  }
  else /* evaluator */
  {
    if( !onEvaluate2 )
    onEvaluate2 = onEvaluate1;
    _.assert( onEvaluate1.length === 1 );
    _.assert( onEvaluate2.length === 1 );
    return onEvaluate1( src1 ) === onEvaluate2( src2 );
  }

}

//

/**
 * Copies entity( src ) into( dst ) or returns own copy of( src ).Result depends on several moments:
 * -If( src ) is a Object - returns clone of( src ) using ( onRecursive ) callback function if its provided;
 * -If( dst ) has own 'copy' routine - copies( src ) into( dst ) using this routine;
 * -If( dst ) has own 'set' routine - sets the fields of( dst ) using( src ) passed to( dst.set );
 * -If( src ) has own 'clone' routine - returns clone of( src ) using ( src.clone ) routine;
 * -If( src ) has own 'slice' routine - returns result of( src.slice ) call;
 * -Else returns a copy of entity( src ).
 *
 * @param {object} dst - Destination object.
 * @param {object} src - Source object.
 * @param {routine} onRecursive - The callback function to copy each [ key, value ].
 * @see {@link wTools.mapCloneAssigning} Check this function for more info about( onRecursive ) callback.
 * @returns {object} Returns result of entities copy operation.
 *
 * @example
 * let dst = { set : function( src ) { this.str = src.src } };
 * let src = { src : 'string' };
 *  _.entityAssign( dst, src );
 * console.log( dst.str )
 * // log "string"
 *
 * @example
 * let dst = { copy : function( src ) { for( let i in src ) this[ i ] = src[ i ] } }
 * let src = { src : 'string', num : 123 }
 *  _.entityAssign( dst, src );
 * console.log( dst )
 * // log Object { src: "string", num: 123 }
 *
 * @example
 *  _.entityAssign( null, new String( 'string' ) );
 * // returns 'string'
 *
 * @function entityAssign
 * @throws {exception} If( arguments.length ) is not equal to 3 or 2.
 * @throws {exception} If( onRecursive ) is not a Routine.
 * @namespace Tools
 *
 */

function entityAssign( dst, src, onRecursive )
{
  let result;

  _.assert( arguments.length === 2 || arguments.length === 3, 'Expects two or three arguments' );
  _.assert( arguments.length < 3 || _.routineIs( onRecursive ) );

  if( src === null )
  {

    result = src;

  }
  else if( dst && _.routineIs( dst.copy ) )
  {

    dst.copy( src );

  }
  else if( src && _.routineIs( src.clone ) )
  {

    if( dst instanceof src.constructor )
    {
      throw _.err( 'not tested' );
      result = src.clone( dst );
    }
    else if( _.primitiveIs( dst ) || _.longIs( dst ) )
    {
      result = src.clone();
    }
    else _.assert( 0, 'unknown' );

  }
  else if( src && _.routineIs( src.slice ) )
  {

    result = src.slice();

  }
  else if( dst && _.routineIs( dst.set ) )
  {

    dst.set( src );

  }
  else if( _.objectIs( src ) )
  {

    if( onRecursive )
    result = _.mapCloneAssigning({ srcMap : src, dstMap : _.primitiveIs( dst ) ? Object.create( null ) : dst, onField : onRecursive } );
    else
    result = _.mapCloneAssigning({ srcMap : src });

  }
  else
  {

    result = src;

  }

  return result;
}

//

/**
 * Short-cut for entityAssign function. Copies specified( name ) field from
 * source container( srcContainer ) into( dstContainer ).
 *
 * @param {object} dstContainer - Destination object.
 * @param {object} srcContainer - Source object.
 * @param {string} name - Field name.
 * @param {mapCloneAssigning.onField} onRecursive - The callback function to copy each [ key, value ].
 * @see {@link wTools.mapCloneAssigning} Check this function for more info about( onRecursive ) callback.
 * @returns {object} Returns result of entities copy operation.
 *
 * @example
 * let dst = {};
 * let src = { a : 'string' };
 * let name = 'a';
 * _.entityAssignFieldFromContainer(dst, src, name );
 * console.log( dst.a === src.a );
 * // log true
 *
 * @example
 * let dst = {};
 * let src = { a : 'string' };
 * let name = 'a';
 * function onRecursive( dstContainer, srcContainer, key )
 * {
 *   _.assert( _.strIs( key ) );
 *   dstContainer[ key ] = srcContainer[ key ];
 * };
 * _.entityAssignFieldFromContainer(dst, src, name, onRecursive );
 * console.log( dst.a === src.a );
 * // log true
 *
 * @function entityAssignFieldFromContainer
 * @throws {exception} If( arguments.length ) is not equal to 3 or 4.
 * @namespace Tools
 *
 */

function entityAssignFieldFromContainer( dstContainer, srcContainer, name, onRecursive )
{
  let result;

  _.assert( _.strIs( name ) || _.symbolIs( name ) );
  _.assert( arguments.length === 3 || arguments.length === 4 );

  let dstValue = Object.hasOwnProperty.call( dstContainer, name ) ? dstContainer[ name ] : undefined;
  let srcValue = srcContainer[ name ];

  if( onRecursive )
  result = entityAssign( dstValue, srcValue, onRecursive );
  else
  result = entityAssign( dstValue, srcValue );

  if( result !== undefined )
  dstContainer[ name ] = result;

  return result;
}

//

/**
 * Short-cut for entityAssign function. Assigns value of( srcValue ) to container( dstContainer ) field specified by( name ).
 *
 * @param {object} dstContainer - Destination object.
 * @param {object} srcValue - Source value.
 * @param {string} name - Field name.
 * @param {mapCloneAssigning.onField} onRecursive - The callback function to copy each [ key, value ].
 * @see {@link wTools.mapCloneAssigning} Check this function for more info about( onRecursive ) callback.
 * @returns {object} Returns result of entity field assignment operation.
 *
 * @example
 * let dstContainer = { a : 1 };
 * let srcValue = 15;
 * let name = 'a';
 * _.entityAssignField( dstContainer, srcValue, name );
 * console.log( dstContainer.a );
 * // log 15
 *
 * @function entityAssignField
 * @throws {exception} If( arguments.length ) is not equal to 3 or 4.
 * @namespace Tools
 *
 */

function entityAssignField( dstContainer, srcValue, name, onRecursive )
{
  let result;

  _.assert( _.strIs( name ) || _.symbolIs( name ) );
  _.assert( arguments.length === 3 || arguments.length === 4 );

  let dstValue = dstContainer[ name ];

  if( onRecursive )
  {
    throw _.err( 'not tested' );
    result = entityAssign( dstValue, srcValue, onRecursive );
  }
  else
  {
    result = entityAssign( dstValue, srcValue );
  }

  if( result !== undefined )
  dstContainer[ name ] = result;

  return result;
}

// --
// routines
// --

let Extension =
{

  entityMakeConstructing, /* aaa2 : should take into account long descriptor */ /* Dmytro : takes into account longDescriptor if src is long, but not an array. Covered */
  entityMakeEmpty, /* aaa2 : should take into account long descriptor, make perfect coverage, please */ /* Dmytro : takes into account longDescriptor, covered */
  makeEmpty : entityMakeEmpty,
  entityMakeUndefined, /* aaa2 : should take into account long descriptor, make perfect coverage, please */ /* Dmytro : takes into account longDescriptor, covered */
  makeUndefined : entityMakeUndefined,
  entityMake, /* aaa2 : should take into account long descriptor, make perfect coverage, please */ /* Dmytro : routine takes into account longDescriptor, covered */
  make : entityMake,

  entityEntityEqualize,

  entityAssign, /* refactor!!! */
  entityAssignFieldFromContainer, /* dubious */
  entityAssignField, /* dubious */

}

//

_.mapSupplement( Self, Extension );


// --
// export
// --

if( typeof module !== 'undefined' )
module[ 'exports' ] = Self;

})();
