( function _l3_Routine_s_()
{

'use strict';

const _global = _global_;
const _ = _global_.wTools;
const Self = _global_.wTools;
let Routine = _global_.wTools.routine = _global_.wTools.routine || Object.create( null );
let RoutineS = _global_.wTools.routine.s = _global_.wTools.routine.s || Object.create( null );

// --
// routine
// --

// function routineIs( src )
// {
//   let typeStr = Object.prototype.toString.call( src );
//   return typeStr === '[object Function]' || typeStr === '[object AsyncFunction]';
// }
//
//
// function routineLike( src )
// {
//   return _.routine.is( src );
// }

function is( src )
{
  let typeStr = Object.prototype.toString.call( src );
  return _.routine._is( src, typeStr );
}

//

function _is( src, typeStr )
{
  return typeStr === '[object Function]' || typeStr === '[object AsyncFunction]';
}

//

function like( src )
{
  let typeStr = Object.prototype.toString.call( src );
  return _.routine._like( src, typeStr );
}

//

function _like( src, typeStr )
{
  return typeStr === '[object Function]' || typeStr === '[object AsyncFunction]';
}

//

function routineIsTrivial_functor()
{

  const syncPrototype = Object.getPrototypeOf( Function );
  const asyncPrototype = Object.getPrototypeOf( _async );
  return routineIsTrivial;

  function routineIsTrivial( src )
  {
    if( !src )
    return false;
    let prototype = Object.getPrototypeOf( src );
    if( prototype === syncPrototype )
    return true;
    if( prototype === asyncPrototype )
    return true;
    return false;
  }

  async function _async()
  {
  }

}

let isTrivial = routineIsTrivial_functor();
isTrivial.functor = routineIsTrivial_functor;
// function routineIsTrivial( src )
// {
//   if( !src )
//   return false;
//   let proto = Object.getPrototypeOf( src );
//   if( proto === Object.getPrototypeOf( Function ) )
//   debugger;
//   if( proto === Object.getPrototypeOf( Function ) )
//   return true;
//   if( !proto )
//   return false;
//   if( !proto.constructor )
//   return false;
//   if( proto.constructor.name !== 'AsyncFunction' )
//   return false;
//   return true;
// }

//

function isSync( src )
{
  return Object.prototype.toString.call( src ) === '[object Function]'
}

//

function isAsync( src )
{
  return Object.prototype.toString.call( src ) === '[object AsyncFunction]'
}

//

function are( src )
{
  _.assert( arguments.length === 1, 'Expects single argument' );

  if( _.arrayLike( src ) )
  {
    for( let s = 0 ; s < src.length ; s++ )
    if( !_.routine.is( src[ s ] ) )
    return false;
    return true;
  }

  return _.routine.is( src );
}

//

function withName( src )
{
  if( !routine.is( src ) )
  return false;
  if( !src.name )
  return false;
  return true;
}

//

/**
 * Internal implementation.
 * @param {object} object - object to check.
 * @return {object} object - name in key/value format.
 * @function _routineJoin
 * @namespace Tools
 */

function _join( o )
{

  _.assert( arguments.length === 1, 'Expects single argument' );
  _.assert( _.bool.is( o.sealing ) );
  _.assert( _.bool.is( o.extending ) );
  _.assert( _.routine.is( o.routine ), 'Expects routine' );
  _.assert( _.longIs( o.args ) || o.args === undefined );

  let routine = o.routine;
  let args = o.args;
  let context = o.context;
  let result = act();

  if( o.extending )
  {
    _.mapExtend( result, routine );

    let o2 =
    {
      value : routine,
      enumerable : false,
    };
    Object.defineProperty( result, 'originalRoutine', o2 ); /* qqq : cover */

    if( context !== undefined )
    {
      let o3 =
      {
        value : context,
        enumerable : false,
      };
      Object.defineProperty( result, 'boundContext', o3 ); /* qqq : cover */
    }

    if( args !== undefined )
    {
      let o3 =
      {
        value : args,
        enumerable : false,
      };
      Object.defineProperty( result, 'boundArguments', o3 ); /* qqq : cover */
    }

  }

  return result;

  /* */

  function act()
  {

    if( context !== undefined && args !== undefined )
    {
      if( o.sealing === true )
      {
        let name = routine.name || '__sealedContextAndArguments';
        _.assert( _.strIs( name ) );
        let __sealedContextAndArguments =
        {
          [ name ] : function()
          {
            return routine.apply( context, args );
          }
        }
        return __sealedContextAndArguments[ name ];
      }
      else
      {
        let a = _.arrayAppendArray( [ context ], args );
        return Function.prototype.bind.apply( routine, a );
      }
    }
    else if( context !== undefined && args === undefined )
    {
      if( o.sealing === true )
      {
        let name = routine.name || '__sealedContext';
        let __sealedContext =
        {
          [ name ] : function()
          {
            return routine.call( context );
          }
        }
        return __sealedContext[ name ];
      }
      else
      {
        return Function.prototype.bind.call( routine, context );
      }
    }
    else if( context === undefined && args !== undefined )
    {
      if( o.sealing === true )
      {
        let name = routine.name || '__sealedArguments';
        _.assert( _.strIs( name ) );
        let __sealedContextAndArguments =
        {
          [ name ] : function()
          {
            return routine.apply( this, args );
          }
        }
        return __sealedContextAndArguments[ name ];
      }
      else
      {
        let name = routine.name || '__joinedArguments';
        let __joinedArguments =
        {
          [ name ] : function()
          {
            let args2 = _.arrayAppendArrays( null, [ args, arguments ] );
            return routine.apply( this, args2 );
          }
        }
        return __joinedArguments[ name ];
      }
    }
    else if( context === undefined && args === undefined ) /* zzz */
    {
      return routine;
    }
    else _.assert( 0 );
  }

}

//

function constructorJoin( routine, args )
{

  _.assert( arguments.length === 1 || arguments.length === 2 );

  return _.routine._join
  ({
    routine,
    context : routine,
    args : args || [],
    sealing : false,
    extending : false,
  });

}

//

/**
 * The join() routine creates a new function with its 'this' ( context ) set to the provided `context`
 * value. Argumetns `args` of target function which are passed before arguments of binded function during
 * calling of target function. Unlike bind routine, position of `context` parameter is more intuitive.
 *
 * @example
 * let o = { z: 5 };
 * let y = 4;
 * function sum( x, y )
 * {
 *   return x + y + this.z;
 * }
 * let newSum = _.routine.join( o, sum, [ 3 ] );
 * newSum( y );
 * // returns 12
 *
 * @example
 * function f1()
 * {
 *   console.log( this )
 * };
 * let f2 = f1.bind( undefined ); // context of new function sealed to undefined (or global object);
 * f2.call( o ); // try to call new function with context set to { z: 5 }
 * let f3 = _.routine.join( undefined, f1 ); // new function.
 * f3.call( o )
 * // log { z: 5 }
 *
 * @param {Object} context The value that will be set as 'this' keyword in new function
 * @param {Function} routine Function which will be used as base for result function.
 * @param {Array<*>} args Argumetns of target function which are passed before arguments of binded function during
 calling of target function. Must be wraped into array.
 * @returns {Function} New created function with preceding this, and args.
 * @throws {Error} When second argument is not callable throws error with text 'first argument must be a routine'
 * @thorws {Error} If passed arguments more than 3 throws error with text 'Expects 3 or less arguments'
 * @function join
 * @namespace Tools
 */

function join( context, routine, args )
{

  _.assert( arguments.length <= 3, 'Expects 3 or less arguments' );

  return _.routine._join
  ({
    routine,
    context,
    args,
    sealing : false,
    extending : true,
  });

}

//

/**
 * The join() routine creates a new function with its 'this' ( context ) set to the provided `context`
 * value. Argumetns `args` of target function which are passed before arguments of binded function during
 * calling of target function. Unlike bind routine, position of `context` parameter is more intuitive.
 *
 * @example
 * let o = { z: 5 };
 * let y = 4;
 * function sum( x, y )
 * {
 *   return x + y + this.z;
 * }
 * let newSum = _.routine.join( o, sum, [ 3 ] );
 * newSum( y );
 * // returns 12
 *
 * @example
 * function f1()
 * {
 *   console.log( this )
 * };
 * let f2 = f1.bind( undefined ); // context of new function sealed to undefined (or global object);
 * f2.call( o ); // try to call new function with context set to { z: 5 }
 * let f3 = _.routine.join( undefined, f1 ); // new function.
 * f3.call( o )
 * // log { z: 5 }
 *
 * @param {Object} context The value that will be set as 'this' keyword in new function
 * @param {Function} routine Function which will be used as base for result function.
 * @param {Array<*>} args Argumetns of target function which are passed before arguments of binded function during
 calling of target function. Must be wraped into array.
 * @returns {Function} New created function with preceding this, and args.
 * @throws {Error} When second argument is not callable throws error with text 'first argument must be a routine'
 * @thorws {Error} If passed arguments more than 3 throws error with text 'Expects 3 or less arguments'
 * @function routineJoin
 * @namespace Tools
 */

function join( context, routine, args )
{

  _.assert( arguments.length <= 3, 'Expects 3 or less arguments' );

  return _.routine._join
  ({
    routine,
    context,
    args,
    sealing : false,
    extending : true,
  });

}

//

/**
 * Return new function with sealed context and arguments.
 *
 * @example
 * let o = { z : 5 };
 * function sum( x, y )
 * {
 *   return x + y + this.z;
 * }
 * let newSum = _.routine.seal( o, sum, [ 3, 4 ] );
 * newSum();
 * // returns : 12
 *
 * @param { Object } context - The value that will be set as 'this' keyword in new function
 * @param { Function } routine - Function which will be used as base for result function.
 * @param { Array } args - Arguments wrapped into array. Will be used as argument to `routine` function
 * @returns { Function } - Result function with sealed context and arguments.
 * @function seal
 * @namespace Tools
 */

function seal( context, routine, args )
{

  _.assert( arguments.length <= 3, 'Expects 3 or less arguments' );

  return _.routine._join
  ({
    routine,
    context,
    args,
    sealing : true,
    extending : true,
  });

}

//

function options( routine, args, defaults )
{

  if( !_.arrayLike( args ) )
  args = [ args ];

  let options = args[ 0 ];
  if( options === undefined )
  options = Object.create( null );

  let name = routine ? routine.name : '';
  defaults = defaults || ( routine ? routine.defaults : null );

  _.assert( arguments.length === 2 || arguments.length === 3, 'Expects 2 or 3 arguments' );
  _.assert( _.routine.is( routine ) || routine === null, 'Expects routine' );
  _.assert( _.object.is( defaults ), 'Expects routine with defined defaults or defaults in third argument' );
  _.assert( _.object.is( options ), 'Expects object' );
  _.assert( args.length === 0 || args.length === 1, `Expects single options map, but got ${ args.length } arguments` );

  if( Config.debug )
  {
    let extraKeys = mapButKeys( options, defaults );
    _.assert( extraKeys.length === 0, () => `Routine ${ name } does not expect options: ${ keysQuote( extraKeys ) }` );
  }

  mapSupplementStructurelessMin( options, defaults );

  if( Config.debug )
  {
    let undefineKeys = mapUndefineKeys( options );
    _.assert
    (
      undefineKeys.length === 0,
      () => `Options map for routine ${ name } should have no undefined fields, but it does have ${ keysQuote( undefineKeys ) }`
    );
  }

  return options;

  /* */

  function mapButKeys( srcMap, butMap )
  {
    let result = [];

    for( let s in srcMap )
    if( !( s in butMap ) )
    result.push( s );

    return result;
  }

  /* */

  function mapUndefineKeys( srcMap )
  {
    let result = [];

    for( let s in srcMap )
    if( srcMap[ s ] === undefined )
    result.push( s );

    return result;
  }

  /* */

  function keysQuote( keys )
  {
    let result = `"${ keys[ 0 ] }"`;
    for( let i = 1 ; i < keys.length ; i++ )
    result += `, "${ keys[ i ] }"`;
    return result.trim();
  }

  /* */

  function mapSupplementStructurelessMin( dstMap, srcMap )
  {
    for( let s in srcMap )
    {
      if( dstMap[ s ] !== undefined )
      continue;

      if( Config.debug )
      if( _.object.like( srcMap[ s ] ) || _.arrayLike( srcMap[ s ] ) )
      if( !_.regexpIs( srcMap[ s ] ) && !_.date.is( srcMap[ s ] ) )
      throw Error( `Source map should have only primitive elements, but ${ s } is ${ srcMap[ s ] }` );

      dstMap[ s ] = srcMap[ s ];
    }
  }
}

//

/* qqq : for Dmytro : discuss
should be { defaults : {} } in the first argument
*/
function options_( defaults, options )
{

  _.assert( arguments.length === 2, 'Expects exactly 2 arguments' );
  _.assert( _.routineIs( defaults ) || _.aux.is( defaults ) || defaults === null, 'Expects an object with options' );

  if( _.arrayLike( options ) )
  {
    _.assert
    (
      options.length === 0 || options.length === 1,
      'routineOptionsPreservingUndefines : expects single options map, but got', options.length, 'arguments'
    );
    options = options[ 0 ];
  }

  if( options === undefined ) /* qqq : for Dmytro : should be error */
  options = Object.create( null );
  if( defaults === null )
  defaults = Object.create( null );

  let name = _.routineIs( defaults ) ? defaults.name : '';
  defaults = ( _.routineIs( defaults ) && defaults.defaults ) ? defaults.defaults : defaults;
  _.assert( _.aux.is( defaults ), 'Expects defined defaults' );

  /* */

  if( Config.debug )
  {
    let extraKeys = mapButKeys( options, defaults );
    _.assert( extraKeys.length === 0, () => `Routine ${ name } does not expect options: ${ keysQuote( extraKeys ) }` );
  }

  mapSupplementStructurelessMin( options, defaults );

  if( Config.debug )
  {
    let undefineKeys = mapUndefineKeys( options );
    _.assert
    (
      undefineKeys.length === 0,
      () => `Options map for routine ${ name } should have no undefined fields, but it does have ${ keysQuote( undefineKeys ) }`
    );
  }

  return options;

  /* */

  function mapButKeys( srcMap, butMap )
  {
    let result = [];

    for( let s in srcMap )
    if( !( s in butMap ) )
    result.push( s );

    return result;
  }

  /* */

  function mapUndefineKeys( srcMap )
  {
    let result = [];

    for( let s in srcMap )
    if( srcMap[ s ] === undefined )
    result.push( s );

    return result;
  }

  /* */

  function keysQuote( keys )
  {
    let result = `"${ keys[ 0 ] }"`;
    for( let i = 1 ; i < keys.length ; i++ )
    result += `, "${ keys[ i ] }"`;
    return result.trim();
  }

  /* */

  function mapSupplementStructurelessMin( dstMap, srcMap )
  {
    for( let s in srcMap )
    {
      if( dstMap[ s ] !== undefined )
      continue;

      if( Config.debug )
      if( _.object.like( srcMap[ s ] ) || _.arrayLike( srcMap[ s ] ) )
      if( !_.regexpIs( srcMap[ s ] ) && !_.date.is( srcMap[ s ] ) )
      throw Error( `Source map should have only primitive elements, but ${ s } is ${ srcMap[ s ] }` );

      dstMap[ s ] = srcMap[ s ];
    }
  }
}

//

function assertOptions( routine, args, defaults )
{

  if( !_.arrayLike( args ) )
  args = [ args ];

  let options = args[ 0 ];

  defaults = defaults || ( routine ? routine.defaults : null );

  _.assert( arguments.length === 2 || arguments.length === 3, 'Expects 2 or 3 arguments' );
  _.assert( _.routine.is( routine ) || routine === null, 'Expects routine' );
  _.assert( _.aux.is( defaults ), 'Expects routine with defined defaults or defaults in third argument' );
  _.assert( _.aux.is( options ), 'Expects object' );
  _.assert( args.length === 0 || args.length === 1, `Expects single options map, but got ${ args.length } arguments` );

  if( Config.debug )
  {
    let extraOptionsKeys = mapButKeys( options, defaults );
    _.assert( extraOptionsKeys.length === 0, () => `Object should have no fields : ${ keysQuote( extraOptionsKeys ) }` );
    let extraDefaultsKeys = mapButKeys( defaults, options );
    _.assert( extraDefaultsKeys.length === 0, () => `Object should have fields : ${ keysQuote( extraDefaultsKeys ) }` );
    let undefineKeys = mapUndefineKeys( options );
    _.assert( undefineKeys.length === 0, () => `Object should have no undefines, but has : ${ keysQuote( undefineKeys ) }`);
  }

  return options;

  /* */

  function mapButKeys( srcMap, butMap )
  {
    let result = [];

    for( let s in srcMap )
    if( !( s in butMap ) )
    result.push( s );

    return result;
  }

  /* */

  function mapUndefineKeys( srcMap )
  {
    let result = [];

    for( let s in srcMap )
    if( srcMap[ s ] === undefined )
    result.push( s );

    return result;
  }

  /* */

  function keysQuote( keys )
  {
    let result = `"${ keys[ 0 ] }"`;
    for( let i = 1 ; i < keys.length ; i++ )
    result += `, "${ keys[ i ] }"`;
    return result.trim();
  }
}

//

function assertOptions_( defaults, options )
{

  _.assert( arguments.length === 2, 'Expects exactly 2 arguments' );
  _.assert( _.routine.is( defaults ) || _.aux.is( defaults ) || defaults === null, 'Expects an object with options' );

  if( _.arrayLike( options ) )
  {
    _.assert
    (
      options.length === 0 || options.length === 1,
      'routineOptionsPreservingUndefines : expects single options map, but got', options.length, 'arguments'
    );
    options = options[ 0 ];
  }

  if( options === undefined )
  options = Object.create( null );
  if( defaults === null )
  defaults = Object.create( null );

  defaults = ( _.routine.is( defaults ) && defaults.defaults ) ? defaults.defaults : defaults;
  _.assert( _.aux.is( defaults ), 'Expects defined defaults' );

  /* */

  if( Config.debug )
  {
    let extraOptionsKeys = mapButKeys( options, defaults );
    _.assert( extraOptionsKeys.length === 0, () => `Object should have no fields : ${ keysQuote( extraOptionsKeys ) }` );
    let extraDefaultsKeys = mapButKeys( defaults, options );
    _.assert( extraDefaultsKeys.length === 0, () => `Object should have fields : ${ keysQuote( extraDefaultsKeys ) }` );
    let undefineKeys = mapUndefineKeys( options );
    _.assert( undefineKeys.length === 0, () => `Object should have no undefines, but has : ${ keysQuote( undefineKeys ) }`);
  }

  return options;

  /* */

  function mapButKeys( srcMap, butMap )
  {
    let result = [];

    for( let s in srcMap )
    if( !( s in butMap ) )
    result.push( s );

    return result;
  }

  /* */

  function mapUndefineKeys( srcMap )
  {
    let result = [];

    for( let s in srcMap )
    if( srcMap[ s ] === undefined )
    result.push( s );

    return result;
  }

  /* */

  function keysQuote( keys )
  {
    let result = `"${ keys[ 0 ] }"`;
    for( let i = 1 ; i < keys.length ; i++ )
    result += `, "${ keys[ i ] }"`;
    return result.trim();
  }
}

//

/* aaa for Dmytro : forbid 3rd argument */ /* Dmytro : forbidden */
/* aaa for Dmytro : inline implementation */ /* Dmytro : inlined */
/* aaa for Dmytro : make possible pass defaults-map instead of routine */ /* Dmytro : implemented and covered */
/* aaa for Dmytro : make sure _.routineOptions and routineOptionsPreservingUndefines are similar */ /* Dmytro : implemented similar routine */
/* xxx : make routineOptionsPreservingUndefines default routineOptions */
function optionsPreservingUndefines( routine, args, defaults )
{

  if( !_.arrayLike( args ) )
  args = [ args ];
  let options = args[ 0 ];
  if( options === undefined )
  options = Object.create( null );

  _.assert( arguments.length === 2 || arguments.length === 3, 'Expects 2 or 3 arguments' );
  _.assert( _.routine.is( routine ) || routine === null, 'Expects routine' );
  _.assert( _.aux.is( options ), 'Expects object' );
  _.assert( args.length === 0 || args.length === 1, 'routineOptions : expects single options map, but got', args.length, 'arguments' );

  defaults = defaults || routine.defaults;

  _.assert( _.aux.is( defaults ), 'Expects routine with defined defaults' );
  _.map.assertHasOnly( options, defaults );
  _.mapComplementPreservingUndefines( options, defaults );

  return options;
}

//

function optionsPreservingUndefines_( defaults, options )
{

  _.assert( arguments.length === 2, 'Expects exactly 2 arguments' );
  _.assert( _.routineIs( defaults ) || _.aux.is( defaults ) || defaults === null, 'Expects an object with options' );

  if( _.arrayLike( options ) )
  {
    _.assert
    (
      options.length === 0 || options.length === 1,
      'routineOptionsPreservingUndefines : expects single options map, but got', options.length, 'arguments'
    );
    options = options[ 0 ];
  }

  if( options === undefined )
  options = Object.create( null );
  if( defaults === null )
  defaults = Object.create( null );

  let name = _.routine.is( defaults ) ? defaults.name : '';
  defaults = ( _.routine.is( defaults ) && defaults.defaults ) ? defaults.defaults : defaults;
  _.assert( _.aux.is( defaults ), 'Expects defined defaults' );

  /* */

  if( Config.debug )
  {
    let extraKeys = mapButKeys( options, defaults );
    _.assert( extraKeys.length === 0, () => `Routine ${ name } does not expect options: ${ keysQuote( extraKeys ) }` );
  }

  mapComplementPreservingUndefinesMin( options, defaults );

  return options;

  /* */

  function mapButKeys( srcMap, butMap )
  {
    let result = [];

    for( let key in srcMap )
    if( !( key in butMap ) )
    result.push( key );

    return result;
  }

  /* */

  function keysQuote( keys )
  {
    let result = `"${ keys[ 0 ] }"`;
    for( let i = 1 ; i < keys.length ; i++ )
    result += `, "${ keys[ i ] }"`;
    return result.trim();
  }

  /* */

  function mapComplementPreservingUndefinesMin( dstMap, srcMap )
  {
    for( let key in srcMap )
    {
      if( Object.hasOwnProperty.call( dstMap, key ) )
      continue;

      if( _.arrayIs( srcMap[ key ] ) )
      dstMap[ key ] = srcMap[ key ].slice();
      else if( _.mapIs( srcMap[ key ] ) )
      dstMap[ key ] = getCopy( srcMap[ key ] );
      else
      dstMap[ key ] = srcMap[ key ];
    }
  }

  /* */

  function getCopy( src )
  {
    if( _.routineIs( src.clone ) )
    _.assert( 0, 'unknown' );

    let result = Object.create( null );
    for( let key in src )
    {
      _.assert( _.strIs( key ) );
      result[ key ] = src[ key ];
    }
    Object.setPrototypeOf( result, Object.getPrototypeOf( src ) );
    return result;
  }
}

//

function assertOptionsPreservingUndefines( routine, args, defaults )
{

  if( !_.arrayLike( args ) )
  args = [ args ];
  let options = args[ 0 ];
  defaults = defaults || routine.defaults;

  _.assert( arguments.length === 2 || arguments.length === 3, 'Expects 2 or 3 arguments' );
  _.assert( _.routine.is( routine ), 'Expects routine' );
  _.assert( _.object.is( defaults ), 'Expects routine with defined defaults or defaults in third argument' );
  _.assert( _.object.is( options ), 'Expects object' );
  _.assert( args.length === 0 || args.length === 1, 'Expects single options map, but got', args.length, 'arguments' );

  _.map.assertHasOnly( options, defaults );
  _.map.assertHasAll( options, defaults );

  return options;
}

//

function assertOptionsPreservingUndefines_( defaults, options )
{

  _.assert( arguments.length === 2, 'Expects exactly 2 arguments' );
  _.assert( _.routineIs( defaults ) || _.aux.is( defaults ) || defaults === null, 'Expects an object with options' );

  if( _.arrayLike( options ) )
  {
    _.assert
    (
      options.length === 0 || options.length === 1,
      'routineOptionsPreservingUndefines : expects single options map, but got', options.length, 'arguments'
    );
    options = options[ 0 ];
  }

  if( options === undefined )
  options = Object.create( null );
  if( defaults === null )
  defaults = Object.create( null );

  defaults = ( _.routineIs( defaults ) && defaults.defaults ) ? defaults.defaults : defaults;
  _.assert( _.aux.is( defaults ), 'Expects defined defaults' );

  /* */

  if( Config.debug )
  {
    let extraOptionsKeys = mapButKeys( options, defaults );
    _.assert( extraOptionsKeys.length === 0, () => `Object should have no fields : ${ keysQuote( extraOptionsKeys ) }` );

    let extraDefaultsKeys = mapButKeys( defaults, options );
    _.assert( extraDefaultsKeys.length === 0, () => `Object should have fields : ${ keysQuote( extraDefaultsKeys ) }` );
  }

  return options;

  /* */

  function mapButKeys( srcMap, butMap )
  {
    let result = [];

    for( let key in srcMap )
    if( !( key in butMap ) )
    result.push( key );

    return result;
  }

  /* */

  function keysQuote( keys )
  {
    let result = `"${ keys[ 0 ] }"`;
    for( let i = 1 ; i < keys.length ; i++ )
    result += `, "${ keys[ i ] }"`;
    return result.trim();
  }
}

//

function optionsFromThis( routine, _this, constructor )
{

  _.assert( arguments.length === 3, 'routineOptionsFromThis : expects 3 arguments' );

  let options = _this || Object.create( null );
  if( Object.isPrototypeOf.call( constructor, _this ) || constructor === _this )
  options = Object.create( null );

  return _.routine.options( routine, options );
}

//

function _routinesCompose_head( routine, args )
{
  let o = args[ 0 ];

  if( !_.mapIs( o ) )
  o = { elements : args[ 0 ] }
  if( args[ 1 ] !== undefined )
  o.chainer = args[ 1 ];

  o.elements = _.arrayAppendArrays( [], [ o.elements ] );
  o.elements = o.elements.filter( ( e ) => e === null ? false : e );

  _.routine.options( routine, o );
  _.assert( _.routine.s.are( o.elements ) );
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  _.assert( args.length === 1 || args.length === 2 );
  _.assert( args.length === 1 || !_.object.is( args[ 0 ] ) );
  _.assert( _.arrayIs( o.elements ) || _.routine.is( o.elements ) );
  _.assert( _.routine.is( args[ 1 ] ) || args[ 1 ] === undefined || args[ 1 ] === null );
  _.assert( o.chainer === null || _.routine.is( o.chainer ) );
  _.assert( o.supervisor === null || _.routine.is( o.supervisor ) );

  return o;
}

//

function _routinesCompose_body( o )
{

  if( o.chainer === null )
  o.chainer = _.compose.chainer.original;

  o.elements = _.arrayFlatten( o.elements );

  let elements = [];
  for( let s = 0 ; s < o.elements.length ; s++ )
  {
    let src = o.elements[ s ];
    _.assert( _.routine.is( src ) );
    if( src.composed )
    {
      if( src.composed.chainer === o.chainer && src.composed.supervisor === o.supervisor )
      {
        _.arrayAppendArray( elements, src.composed.elements );
      }
      else
      {
        _.arrayAppendElement( elements, src );
      }
    }
    else
    _.arrayAppendElement( elements, src );
  }

  o.elements = elements;

  let supervisor = o.supervisor;
  let chainer = o.chainer;
  let act;

  _.assert( _.routine.is( chainer ) );
  _.assert( supervisor === null || _.routine.is( supervisor ) );

  /* */

  if( elements.length === 0 )
  act = function empty()
  {
    return [];
  }
  // else if( elements.length === 1 ) /* zzz : optimize the case */
  // {
  //   act = elements[ 0 ];
  // }
  else act = function composition()
  {
    let result = [];
    // let args = _.unrollAppend( _.unrollFrom( null ), arguments );
    let args = _.unrollFrom( arguments );
    for( let k = 0 ; k < elements.length ; k++ )
    {
      _.assert( _.unrollIs( args ), () => 'Expects unroll, but got', _.entity.strType( args ) );
      let routine = elements[ k ];
      let r = routine.apply( this, args );
      _.assert( r !== false /* && r !== undefined */, 'Temporally forbidden type of result', r );
      _.assert( !_.argumentsArray.is( r ) );
      if( r !== undefined )
      _.unrollAppend( result, r );
      // args = chainer( r, k, args, o );
      args = chainer( args, r, o, k );
      _.assert( args !== undefined && args !== false );
      // if( args === undefined )
      if( args === _.dont )
      break;
      args = _.unrollFrom( args );
    }
    return result;
  }

  o.act = act;
  act.composed = o;

  if( supervisor )
  {
    _.routine.extend( compositionSupervise, act );
    return compositionSupervise;
  }

  return act;

  function compositionSupervise()
  {
    let result = supervisor( this, arguments, act, o );
    return result;
  }
}

_routinesCompose_body.defaults =
{
  elements : null,
  chainer : null,
  supervisor : null,
}

//

function compose()
{
  let o = _.routine.s.compose.head( compose, arguments );
  let result = _.routine.s.compose.body( o );
  return result;
}

compose.head = _routinesCompose_head;
compose.body = _routinesCompose_body;
compose.defaults = Object.assign( Object.create( null ), compose.body.defaults );

//

/* qqq : for Dmytro : cover and optimize */
function _amend( o )
{
  let dst = o.dst;
  let srcs = o.srcs;
  let srcIsVector = _.vectorIs( srcs );
  let extended = false;

  _.assertRoutineOptions( _amend, o );
  _.assert( arguments.length === 1 );
  _.assert( _.routine.is( dst ) || dst === null );
  _.assert( srcs === null || srcs === undefined || _.aux.is( srcs ) || _.routine.is( srcs ) || _.vector.is( srcs ) );
  _.assert( o.amending === 'extending', 'not implemented' );
  _.assert
  (
    o.strategy === 'cloning' || o.strategy === 'replacing' || o.strategy === 'inheriting',
    () => `Unknown strategy ${o.strategy}`
  );

  /* generate dst routine */

  if( dst === null ) /* qqq : for Dmytro : good coverage required */
  dst = _dstMake( srcs );

  // /* shallow clone properties of dst routine */
  //
  // if( o.strategy === 'cloning' )
  // _fieldsClone( dst );
  // else if( o.strategy === 'inheriting' )
  // _fieldsInherit( dst );

  /* extend dst routine */

  let _dstAmend;
  if( o.strategy === 'cloning' )
  _dstAmend = _dstAmendCloning;
  else if( o.strategy === 'replacing' )
  _dstAmend = _dstAmendReplacing;
  else if( o.strategy === 'inheriting' )
  _dstAmend = _dstAmendInheriting;
  else _.assert( 0, 'not implemented' );

  if( srcIsVector )
  for( let src of srcs )
  _dstAmend( dst, src );
  else
  _dstAmend( dst, srcs );

  /* qqq : for Dmytro : it should be optimal, no redundant cloning of body should happen
  check and cover it by good test, please
  */
  if( extended )
  // if( dst.body && dst.body.defaults )
  if( dst.body )
  dst.body = bodyFrom( dst.body );

  if( Config.debug )
  {
    /* qqq : for Dmytro : cover, please */
    if( _.strEnds( dst.name, '_body' ) )
    {
      _.assert( dst.body === undefined, 'Body of routine should not have its own body' );
      _.assert( dst.head === undefined, 'Body of routine should not have its own head' );
      _.assert( dst.tail === undefined, 'Body of routine should not have its own tail' );
    }
  }

  return dst;

  /* */

  function _dstMake( srcs )
  {
    let dstMap = Object.create( null );

    /* qqq : amendment influence on it */
    if( srcIsVector )
    for( let src of srcs )
    {
      if( src === null )
      continue;
      _.mapExtend( dstMap, src );
    }
    else
    {
      if( srcs !== null )
      _.mapExtend( dstMap, srcs );
    }

    if( dstMap.body )
    {
      // dst = _.routine.uniteCloning( dstMap.head, dstMap.body );
      dst = _.routine.unite
      ({
        head : dstMap.head,
        body : dstMap.body,
        tail : dstMap.tail,
        name : dstMap.name,
        strategy : o.strategy,
      });
    }
    else
    {
      if( srcIsVector )
      dst = dstFrom( srcs[ 0 ] );
      else
      dst = dstFrom( srcs );
    }

    _.assert( _.routineIs( dst ) );
    // _.mapExtend( dst, dstMap );

    return dst;
  }

  /* */

  // function _fieldsClone( dst )
  // {
  //
  //   for( let s in dst )
  //   {
  //     let property = dst[ s ];
  //     if( _.objectIs( property ) )
  //     {
  //       property = _.mapExtend( null, property );
  //       dst[ s ] = property;
  //     }
  //   }
  //
  // }
  //
  // /* */
  //
  // function _fieldsInherit( dst )
  // {
  //
  //   for( let s in dst )
  //   {
  //     let property = dst[ s ];
  //     if( _.objectIs( property ) )
  //     {
  //       property = Object.create( property );
  //       dst[ s ] = property;
  //     }
  //   }
  //
  // }

  /* */

  function _dstAmendCloning( dst, src )
  {
    _.assert( !!dst );
    _.assert( _.aux.is( src ) || _.routine.is( src ) );
    for( let s in src )
    {
      let property = src[ s ];
      if( dst[ s ] === property )
      continue;
      let d = Object.getOwnPropertyDescriptor( dst, s );
      if( d && !d.writable )
      continue;
      extended = true;
      if( _.object.is( property ) )
      {
        _.assert( !_.property.own( dst, s ) || _.objectIs( dst[ s ] ) );

        if( dst[ s ] )
        _.mapExtend( dst[ s ], property );
        else
        dst[ s ] = property = _.mapExtend( null, property );

        // property = _.mapExtend( null, property );
        // if( dst[ s ] )
        // _.mapSupplement( property, dst[ s ] );
      }
      else
      {
        dst[ s ] = property;
      }
    }
  }

  /* */

  function _dstAmendInheriting( dst, src )
  {
    _.assert( !!dst );
    _.assert( _.aux.is( src ) || _.routine.is( src ) );
    /* qqq : for Dmytro : on extending should inherit from the last one, on supplementing should inherit from the first one
    implement, and cover in separate test
    */
    for( let s in src )
    {
      let property = src[ s ];
      if( dst[ s ] === property )
      continue;
      let d = Object.getOwnPropertyDescriptor( dst, s );
      if( d && !d.writable )
      continue;
      extended = true;
      if( _.object.is( property ) )
      {
        property = Object.create( property );
        if( dst[ s ] )
        _.mapSupplement( property, dst[ s ] );
      }
      dst[ s ] = property;
    }
  }

  /* */

  function _dstAmendReplacing( dst, src )
  {
    _.assert( !!dst );
    _.assert( _.aux.is( src ) || _.routine.is( src ) );
    for( let s in src )
    {
      let property = src[ s ];
      if( dst[ s ] === property )
      continue;
      let d = Object.getOwnPropertyDescriptor( dst, s );
      if( d && !d.writable )
      continue;
      extended = true;
      dst[ s ] = property;
    }
  }

  /* */

  function bodyFrom()
  {
    const body = dst.body;
    let body2 = body;
    _.assert( body.head === undefined, 'Body should not have own head' );
    _.assert( body.tail === undefined, 'Body should not have own tail' );
    _.assert( body.body === undefined, 'Body should not have own body' );
    {
      let srcs = srcIsVector ? _.map_( null, o.srcs, ( src ) => propertiesBut( src ) ) : [ propertiesBut( o.srcs ) ];
      srcs.unshift( body );
      body2 = _.routine._amend
      ({
        dst : o.strategy === 'replacing' ? body2 : null,
        srcs,
        strategy : o.strategy,
        amending : o.amending,
      });
      _.assert( body2.head === undefined, 'Body should not have own head' );
      _.assert( body2.tail === undefined, 'Body should not have own tail' );
      _.assert( body2.body === undefined, 'Body should not have own body' );
    }
    return body2;
  }

  /* */

  function propertiesBut( src )
  {
    return src ? _.mapBut_( null, src, [ 'head', 'body', 'tail' ] ) : src;
  }

  /* */

  /* xxx : make routine? */
  function routineClone( routine )
  {
    _.assert( _.routine.is( routine ) );
    let name = routine.name;
    // const routine2 = routine.bind();
    // _.assert( routine2 !== routine );
    const routine2 =
    ({
      [ name ] : function()
      {
        return routine.apply( this, arguments );
      }
    })[ name ];

    let o2 =
    {
      value : routine,
      enumerable : false,
    };
    Object.defineProperty( routine2, 'originalRoutine', o2 ); /* qqq : for Dmytro : cover */

    return routine2;
  }

  /* */

  function dstFrom( routine )
  {
    return routineClone( routine );
  }

  /* */

}

_amend.defaults =
{
  dst : null,
  srcs : null,
  strategy : 'cloning', /* qqq : for Dmytro : cover */
  amending : 'extending', /* qqq : for Dmytro : implement and cover */
}

//

/**
 * The routine _.routine.extendCloning() is used to copy the values of all properties
 * from source routine to a target routine.
 *
 * It takes first routine (dst), and shallow clone each destination property of type map.
 * Then it checks properties of source routine (src) and extends dst by source properties.
 * The dst properties can be owerwriten by values of source routine
 * if descriptor (writable) of dst property is set.
 *
 * If the first routine (dst) is null then
 * routine _.routine.extendCloning() makes a routine from routines head and body
 * @see {@link wTools.routine.unite} - Automatic routine generating
 * from preparation routine and main routine (body).
 *
 * @param{ routine } dst - The target routine or null.
 * @param{ * } src - The source routine or object to copy.
 *
 * @example
 * var src =
 * {
 *   head : _.routine.s.compose.head,
 *   body : _.routine.s.compose.body,
 *   someOption : 1,
 * }
 * var got = _.routine.extendCloning( null, src );
 * // returns [ routine routinesCompose ], got.option === 1
 *
 * @example
 * _.routine.extendCloning( null, _.routine.s.compose );
 * // returns [ routine routinesCompose ]
 *
 * @example
 * _.routine.extendCloning( _.routine.s.compose, { someOption : 1 } );
 * // returns [ routine routinesCompose ], routinesCompose.someOption === 1
 *
 * @example
 * _.routine.s.composes.someOption = 22;
 * _.routine.extendCloning( _.routine.s.compose, { someOption : 1 } );
 * // returns [ routine routinesCompose ], routinesCompose.someOption === 1
 *
 * @returns { routine } It will return the target routine with extended properties.
 * @function extendCloning
 * @throws { Error } Throw an error if arguments.length < 1 or arguments.length > 2.
 * @throws { Error } Throw an error if dst is not routine or not null.
 * @throws { Error } Throw an error if dst is null and src has not head and body properties.
 * @throws { Error } Throw an error if src is primitive value.
 * @namespace Tools
 */

/* qqq : for Yevhen : bad : namespaces are not adjusted */

function extendCloning( dst, ... srcs )
{

  _.assert( arguments.length === 1 || arguments.length === 2 || arguments.length === 3 );
  return _.routine._amend
  ({
    dst,
    srcs : [ ... srcs ],
    strategy : 'cloning',
    amending : 'extending',
  });

}

// qqq : for Dmytro : implement and cover please
function extendInheriting( dst, ... srcs )
{

  _.assert( arguments.length === 1 || arguments.length === 2 || arguments.length === 3 );
  return _.routine._amend
  ({
    dst,
    srcs : [ ... srcs ],
    strategy : 'inheriting',
    amending : 'extending',
  });

}

//
/*qqq : for Dmytro : implement and cover please */
function extendReplacing( dst, ... srcs )
{

  _.assert( arguments.length === 1 || arguments.length === 2 || arguments.length === 3 );
  return _.routine._amend
  ({
    dst,
    srcs : [ ... srcs ],
    strategy : 'replacing',
    amending : 'extending',
  });

}

//

function defaults( dst, src, defaults )
{

  if( arguments.length === 2 )
  {
    defaults = arguments[ 1 ];
    _.assert( _.aux.is( defaults ) );
    return _.routine.extend( dst, { defaults } );
  }
  else
  {
    _.assert( arguments.length === 3 );
    _.assert( _.aux.is( defaults ) );
    return _.routine.extend( dst, src, { defaults } );
  }

  // _.assert( dst === null || src === null );
  // _.assert( _.aux.is( defaults ) );
  // return _.routine.extend( dst, src, { defaults } );
}

//

function unite_head( routine, args )
{
  let o = args[ 0 ];

  if( args[ 1 ] !== undefined )
  {
    o = { head : args[ 0 ], body : args[ 1 ], tail : args[ 2 ] };
  }

  _.routine.options( routine, o );
  _.assert( args.length === 1 || args.length === 2 || args.length === 3 );
  _.assert( arguments.length === 2 );
  _.assert
  (
    o.head === null || _.routine.is( o.head ) || _.routine.s.are( o.head )
    , 'Expects routine or routines {-o.head-}'
  );
  _.assert( _.routine.is( o.body ), 'Expects routine {-o.body-}' );
  _.assert( !o.tail || _.routine.is( o.tail ), () => `Expects routine {-o.tail-}, but got ${_.entity.strType( o.tail )}` );
  _.assert( o.body.defaults !== undefined, 'Body should have defaults' );

  return o;
}

//

function unite_body( o )
{

  if( !_.routine.is( o.head ) && o.head !== null )
  {
    /* xxx : deprecate compose */
    /* qqq : for Dmytro : implement without compose */
    let _head = _.routine.s.compose( o.head, function( /* args, result, op, k */ )
    {
      let args = arguments[ 0 ];
      let result = arguments[ 1 ];
      let op = arguments[ 2 ];
      let k = arguments[ 3 ];
      _.assert( arguments.length === 4 );
      _.assert( !_.unrollIs( result ) );
      _.assert( _.object.is( result ) );
      return _.unrollAppend([ unitedRoutine, [ result ] ]);
    });
    _.assert( _.routine.is( _head ) );
    o.head = function head()
    {
      let result = _head.apply( this, arguments );
      return result[ result.length-1 ];
    }
  }

  if( o.head === null )
  {
    /* qqq : for Dmytro : cover please */
    if( o.body.defaults )
    o.head = headWithDefaults;
    else
    o.head = headWithoutDefaults;
  }

  if( !o.name )
  {
    _.assert( _.strDefined( o.body.name ), 'Body routine should have name' );
    o.name = o.body.name;
    if( o.name.indexOf( '_body' ) === o.name.length-5 && o.name.length > 5 )
    o.name = o.name.substring( 0, o.name.length-5 );
  }

  /* generate body */

  /* qqq : for Dmytro : cover in separate test routine */
  let body;
  if( o.strategy === 'replacing' )
  body = o.body;
  else
  body = _.routine._amend
  ({
    dst : null,
    srcs : o.body,
    strategy : o.strategy,
    amending : 'extending',
  });

  /* make routine */

  let unitedRoutine = _unite_functor( o.name, o.head, body, o.tail );

  _.assert( _.strDefined( unitedRoutine.name ), 'Looks like your interpreter does not support dynamic naming of functions. Please use ES2015 or later interpreter.' );

  /* qqq : for Dmytro : implement and cover option::strategy */
  // _.routine._amend
  // ({
  //   dst : unitedRoutine,
  //   srcs : o.body,
  //   strategy : o.strategy,
  //   amending : 'extending',
  // });

  _.routine._amend
  ({
    dst : unitedRoutine,
    srcs : body,
    strategy : 'replacing',
    amending : 'extending',
  });

  unitedRoutine.head = o.head;
  unitedRoutine.body = body;
  if( o.tail )
  unitedRoutine.tail = o.tail;

  _.assert
  (
    unitedRoutine.defaults === body.defaults,
    'Something wrong, united routined should have same instance of defaults its body has'
  );

  return unitedRoutine;

  /* */

  function headWithoutDefaults( routine, args )
  {
    let o = args[ 0 ];
    _.assert( arguments.length === 2 );
    _.assert( args.length === 0 || args.length === 1 );
    _.assert( args.length === 0 || o === undefined || o === null || _.auxIs( o ) );
    return o || null;
  }

  /* */

  function headWithDefaults( routine, args )
  {
    let o = args[ 0 ];
    _.assert( arguments.length === 2 );
    _.assert( args.length === 0 || args.length === 1 );
    _.assert( args.length === 0 || o === undefined || o === null || _.auxIs( o ) );
    return _.routine.options( routine, o || Object.create( null ) );
  }

  /* */

  function _unite_functor()
  {
    const name = arguments[ 0 ];
    const head = arguments[ 1 ];
    const body = arguments[ 2 ];
    const tail = arguments[ 3 ];
    let r;

    if( tail === null )
    r =
    {
      [ name ] : function()
      {
        let result;
        let o = head.call( this, unitedRoutine, arguments );

        _.assert( !_.argumentsArray.is( o ), 'does not expect arguments array' );

        if( _.unrollIs( o ) )
        result = body.apply( this, o );
        else
        result = body.call( this, o );

        return result;
      }
    };
    else if( head === null )
    r =
    {
      [ name ] : function()
      {
        let result;
        let o = arguments[ 0 ];

        _.assert( arguments.length === 1, 'Expects single argument {-o-}.' );

        if( _.unrollIs( o ) )
        result = body.apply( this, o );
        else if( _.mapIs( o ) )
        result = body.call( this, o );
        else
        _.assert( 0, 'Unexpected type of {-o-}, expects options map or unroll.' );

        result = tail.call( this, result, o, unitedRoutine );

        return result;
      }
    };
    else
    r =
    {
      [ name ] : function()
      {
        let result;
        let o = head.call( this, unitedRoutine, arguments );

        _.assert( !_.argumentsArray.is( o ), 'does not expect arguments array' );

        if( _.unrollIs( o ) )
        result = body.apply( this, o );
        else
        result = body.call( this, o );

        result = tail.call( this, result, o );

        return result;
      }
    };

    return r[ name ]
  }
}

unite_body.defaults =
{
  head : null,
  body : null,
  tail : null,
  name : null,
  strategy : null,
};

//

/* qqq : for Dmytro : write the article. it should explain why, when, what for! */
function uniteCloning()
{
  let o = uniteCloning.head.call( this, uniteCloning, arguments );
  let result = uniteCloning.body.call( this, o );
  return result;
}

uniteCloning.head = unite_head;
uniteCloning.body = unite_body;
uniteCloning.defaults = { ... unite_body.defaults, strategy : 'cloning' };

//

function uniteInheriting()
{
  let o = uniteInheriting.head.call( this, uniteInheriting, arguments );
  let result = uniteInheriting.body.call( this, o );
  return result;
}

uniteInheriting.head = unite_head;
uniteInheriting.body = unite_body;
uniteInheriting.defaults = { ... unite_body.defaults, strategy : 'inheriting' };

//

function uniteReplacing()
{
  let o = uniteReplacing.head.call( this, uniteReplacing, arguments );
  let result = uniteReplacing.body.call( this, o );
  return result;
}

uniteReplacing.head = unite_head;
uniteReplacing.body = unite_body;
uniteReplacing.defaults = { ... unite_body.defaults, strategy : 'replacing' };

//

/* qqq : for Dmytro : update jsdoc, please */
/**
 * The routine er() extend mechanism of routines constructing of routine routine.unite().
 * The routine er() adds to routine {-routine-} field {-er-} that is a functor for generating
 * of new routine similar to original routine but with changed map {-defaults-}.
 *
 * @example
 * function test_head( routine, args )
 * {
 *   let o = args[ 0 ];
 *   if( !_.mapIs( o ) )
 *   {
 *     if( o !== undefined )
 *     o = { arg : 0 };
 *     else
 *     o = Object.create( null );
 *   }
 *
 *   _.routine.options( routine, o );
 *   return o;
 * }
 *
 * function test_body( o )
 * {
 *   return o;
 * }
 * test_body.defaults = { arg : null, arg2 : 'arg2' };
 *
 * let routine = _.routine.unite( test_head, test_body );
 * console.log( routine.er === undefined );
 * // log : true
 *
 * let erhead = ( routine, args ) =>
 * {
 *   if( _.mapIs( args[ 0 ] ) )
 *   return args[ 0 ];
 *   return { 'arg' : args[ 0 ] };
 * };
 * _.routine.er( routine, erhead );
 * console.log( _.routine.is( routine.er ) );
 * // log : true
 *
 * let newRoutine = routine.er( 'arg1' );
 * console.log( newRoutine.defaults );
 * // log : { arg : 'arg1', arg2 : 'arg2' }
 *
 * var resultOld = routine();
 * console.log( resultOld );
 * // log : { arg : null, arg2 : 'arg2' }
 * var resultNew = newRoutine();
 * console.log( resultNew );
 * // log : { arg : 'arg1', arg2 : 'arg2' }
 *
 * @param { Function } routine - The routine from which generates new routine.
 * Routine should be generated by routine.unite.
 * @param { Function } erhead - The routine to make map {-defaults-} for new routine.
 * @returns { Function } - Returns original routine with functor in field {-er-}.
 * @function er
 * @throws { Error } If arguments.length neither is 1, nor 2.
 * @throws { Error } If {-routine-} is not a Function.
 * @throws { Error } If {-erhead-} is not a Function.
 * @throws { Error } If {-routine-} has not fields {-head-} and {-body-}.
 * The fields should have type Function.
 * @namespace Tools
 */

function er( routine, erhead )
{
  if( routine.er )
  return routine.er; /* Dmytro : maybe before return should be assert like : _.assert( _.routine.is( routine.er ) ) */
  routine.er = _.routine.erFor( ... arguments );
  return routine;
}

//

/* qqq : for Dmytro : update jsdoc, please */
/**
 * The routine erFor() extend mechanism of routines constructing of routine routine.unite().
 * The routine erFor() returns functor for generating of new routine similar to original
 * routine {-routine-} but with changed map {-defaults-}.
 *
 * @example
 * function test_head( routine, args )
 * {
 *   let o = args[ 0 ];
 *   if( !_.mapIs( o ) )
 *   {
 *     if( o !== undefined )
 *     o = { arg : 0 };
 *     else
 *     o = Object.create( null );
 *   }
 *
 *   _.routine.options( routine, o );
 *   return o;
 * }
 *
 * function test_body( o )
 * {
 *   return o;
 * }
 * test_body.defaults = { arg : null, arg2 : 'arg2' };
 *
 * let routine = _.routine.unite( test_head, test_body );
 * let erhead = ( routine, args ) =>
 * {
 *   if( _.mapIs( args[ 0 ] ) )
 *   return args[ 0 ];
 *   return { 'arg' : args[ 0 ] };
 * };
 * let functor = _.routine.erFor( routine, erhead );
 * console.log( _.routine.is( functor ) );
 * // log : true
 *
 * let newRoutine = functor( 'arg1' );
 * console.log( newRoutine.defaults );
 * // log : { arg : 'arg1', arg2 : 'arg2' }
 *
 * var resultOld = routine();
 * console.log( resultOld );
 * // log : { arg : null, arg2 : 'arg2' }
 * var resultNew = newRoutine();
 * console.log( resultNew );
 * // log : { arg : 'arg1', arg2 : 'arg2' }
 *
 * @param { Function } routine - The routine from which generates new routine.
 * Routine should be generated by routine.unite.
 * @param { Function } erhead - The routine to make map {-defaults-} for new routine.
 * @returns { Function } - Returns functor to generate new routine with changed map {-defaults-}.
 * @function erFor
 * @throws { Error } If arguments.length neither is 1, nor 2.
 * @throws { Error } If {-routine-} is not a Function.
 * @throws { Error } If {-erhead-} is not a Function.
 * @throws { Error } If {-routine-} has not fields {-head-} and {-body-}.
 * The fields should have type Function.
 * @namespace Tools
 */

function erFor( routine, erhead )
{

  erhead = erhead || routine.erhead || routine.head;
  let head = routine.head;
  let body = routine.body;
  let defaults = routine.defaults;

  _.assert( arguments.length === 1 || arguments.length === 2 );
  _.assert( _.routine.is( routine ) );
  _.assert( _.routine.is( erhead ) );
  _.assert( _.routine.is( head ) );
  _.assert( _.routine.is( body ) );
  _.assert( _.object.is( defaults ) );

  return er_functor;

  function er_functor()
  {
    let self = this;
    let op = erhead.call( self, routine, arguments );

    _.assert( _.mapIs( op ) );
    _.map.assertHasOnly( op, defaults );

    er.defaults = _.mapSupplement( op, defaults );

    return er;

    function er()
    {
      let result;
      let op2 = head.call( self, er, arguments );
      if( _.unrollIs( op2 ) )
      result = body.apply( self, op2 );
      else if( _.mapIs( op2 ) )
      result = body.call( self, op2 );
      return result;
    }

  }

}

//

// function routineErJoin( routine, erhead ) /* aaa for Dmytro : cover please */ /* Dmytro : routine is commented because no clear requirements is available */
// {
//   let self = this;
//   let head = routine.head;
//   let body = routine.body;
//   let defaults = routine.defaults;
//   erhead = erhead || routine.erhead || routine.head;
//
//   _.assert( arguments.length === 1 || arguments.length === 2 );
//   _.assert( _.routine.is( routine ) );
//   _.assert( _.routine.is( erhead ) );
//   _.assert( _.routine.is( head ) );
//   _.assert( _.routine.is( body ) );
//   _.assert( _.object.is( defaults ) );
//
//   let op = erhead.call( self, routine, arguments );
//
//   _.assert( _.mapIs( op ) );
//   _.map.assertHasOnly( op, defaults );
//
//   er.defaults = _.mapSupplement( op, defaults );
//
//   return er;
//
//   function er()
//   {
//     let result;
//     let op2 = head.call( self, er, arguments );
//     if( _.unrollIs( op2 ) )
//     result = body.apply( self, op2 );
//     else if( _.mapIs( op2 ) )
//     result = body.call( self, op2 );
//     return result;
//   }
//
// }

//

function vectorize_head( routine, args )
{
  let o = args[ 0 ];

  if( args.length === 2 )
  o = { routine : args[ 0 ], select : args[ 1 ] }
  else if( _.routine.is( o ) || _.strIs( o ) )
  o = { routine : args[ 0 ] }

  _.routine.options( routine, o );
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  _.assert( _.routine.is( o.routine ) || _.strIs( o.routine ) || _.strsAreAll( o.routine ), () => 'Expects routine {-o.routine-}, but got ' + o.routine );
  _.assert( args.length === 1 || args.length === 2 );
  _.assert( o.select >= 1 || _.strIs( o.select ) || _.arrayLike( o.select ), () => 'Expects {-o.select-} as number >= 1, string or array, but got ' + o.select );

  return o;
}

//

/*
qqq : add support and coverage of Set and HashMap
*/

function vectorize_body( o )
{

  _.routine.assertOptions( vectorize_body, arguments );

  if( _.arrayLike( o.routine ) && o.routine.length === 1 )
  o.routine = o.routine[ 0 ];

  let routine = o.routine;
  let propertyFilter = o.propertyFilter;
  let bypassingFilteredOut = o.bypassingFilteredOut;
  let bypassingEmpty = o.bypassingEmpty;
  let vectorizingArray = o.vectorizingArray;
  let vectorizingMapVals = o.vectorizingMapVals;
  let vectorizingMapKeys = o.vectorizingMapKeys;
  let vectorizingContainerAdapter = o.vectorizingContainerAdapter;
  let unwrapingContainerAdapter = o.unwrapingContainerAdapter;
  let head = null;
  let select = o.select === null ? 1 : o.select;
  let selectAll = o.select === Infinity;
  let multiply = select > 1 ? multiplyReally : multiplyNo;

  routine = routineNormalize( routine );

  _.assert( _.routine.is( routine ), () => 'Expects routine {-o.routine-}, but got ' + routine );

  /* */

  let resultRoutine = vectorizeArray;

  if( _.number.is( select ) )
  {

    if( !vectorizingArray && !vectorizingMapVals && !vectorizingMapKeys )
    resultRoutine = routine;
    else if( propertyFilter )
    resultRoutine = vectorizeWithFilters;
    else if( vectorizingMapKeys )
    {
      // _.assert( !vectorizingMapVals, '{-o.vectorizingMapKeys-} and {-o.vectorizingMapVals-} should not be enabled at the same time' );

      if( vectorizingMapVals )
      {
        _.assert( select === 1, 'Only single argument is allowed if {-o.vectorizingMapKeys-} and {-o.vectorizingMapVals-} are enabled.' );
        resultRoutine = vectorizeMapWithKeysOrArray;
      }
      else
      {
        resultRoutine = vectorizeKeysOrArray;
      }

    }
    else if( !vectorizingArray || vectorizingMapVals )
    resultRoutine = vectorizeMapOrArray;
    else if( multiply === multiplyNo )
    resultRoutine = vectorizeArray;
    else
    resultRoutine = vectorizeArrayMultiplying;

  }
  else
  {
    _.assert( multiply === multiplyNo );
    if( routine.head )
    {
      head = routine.head;
      routine = routine.body;
    }
    if( propertyFilter )
    {
      _.assert( 0, 'not implemented' );
    }
    else if( vectorizingArray || !vectorizingMapVals )
    {
      if( _.strIs( select ) )
      resultRoutine = vectorizeForOptionsMap;
      else
      resultRoutine = vectorizeForOptionsMapForKeys;
    }
    else _.assert( 0, 'not implemented' );
  }

  /* */

  // if( vectorizingContainerAdapter )
  // {
  //   let vectorizeRoutine = resultRoutine;
  //   resultRoutine = function vectorizeContainerAdapters()
  //   {
  //     let args = originalsFromAdaptersInplace( arguments );
  //   }
  // }

  /* */

  resultRoutine.vectorized = o;

  /* */

  _.routine.extend( resultRoutine, routine );
  return resultRoutine;

  /*
    vectorizeWithFilters : multiply + array/map vectorizing + filter
    vectorizeArray : array vectorizing
    vectorizeArrayMultiplying :  multiply + array vectorizing
    vectorizeMapOrArray :  multiply +  array/map vectorizing
  */

  /* - */

  function routineNormalize( routine )
  {

    if( _.strIs( routine ) )
    {
      return function methodCall()
      {
        _.assert( _.routine.is( this[ routine ] ), () => 'Context ' + _.entity.exportStringShort( this ) + ' does not have routine ' + routine );
        return this[ routine ].apply( this, arguments );
      }
    }
    else if( _.arrayLike( routine ) )
    {
      _.assert( routine.length === 2 );
      return function methodCall()
      {
        let c = this[ routine[ 0 ] ];
        _.assert( _.routine.is( c[ routine[ 1 ] ] ), () => 'Context ' + _.entity.exportStringShort( c ) + ' does not have routine ' + routine );
        return c[ routine[ 1 ] ].apply( c, arguments );
      }
    }

    return routine;
  }

  /* - */

  function multiplyNo( args )
  {
    return args;
  }

  /* - */

  function multiplyReally( args )
  {
    let length, keys;

    args = [ ... args ];

    if( selectAll )
    select = args.length;

    _.assert( args.length === select, () => 'Expects ' + select + ' arguments, but got ' + args.length );

    for( let d = 0 ; d < select ; d++ )
    {
      if( vectorizingArray && _.arrayLike( args[ d ] ) )
      {
        length = args[ d ].length;
        break;
      }
      else if( vectorizingArray && _.set.like( args[ d ] ) )
      {
        length = args[ d ].size;
        break;
      }
      else if( vectorizingContainerAdapter && _.containerAdapter.is( args[ d ] ) )
      {
        length = args[ d ].length;
        break;
      }
      else if( vectorizingMapVals && _.aux.is( args[ d ] ) )
      {
        keys = _.mapOnlyOwnKeys( args[ d ] );
        break;
      }
    }

    if( length !== undefined )
    {
      for( let d = 0 ; d < select ; d++ )
      {
        if( vectorizingMapVals )
        _.assert( !_.mapIs( args[ d ] ), () => 'Arguments should have only arrays or only maps, but not both. Incorrect argument : ' + args[ d ] );
        else if( vectorizingMapKeys && _.mapIs( args[ d ] ) )
        continue;
        args[ d ] = _.multiple( args[ d ], length );
      }

    }
    else if( keys !== undefined )
    {
      for( let d = 0 ; d < select ; d++ )
      if( _.mapIs( args[ d ] ) )
      {
        _.assert( _.arraySet.identical( _.mapOnlyOwnKeys( args[ d ] ), keys ), () => 'Maps should have same keys : ' + keys );
      }
      else
      {
        if( vectorizingArray )
        _.assert( !_.arrayLike( args[ d ] ), () => 'Arguments should have only arrays or only maps, but not both. Incorrect argument : ' + args[ d ] );
        let arg = Object.create( null );
        _.mapSetWithKeys( arg, keys, args[ d ] );
        args[ d ] = arg;
      }
    }

    return args;
  }

  /* - */

  function vectorizeArray()
  {
    if( bypassingEmpty && !arguments.length )
    return [];

    let args = arguments;
    // args = _.originalsFromAdaptersInplace( args );
    let src = args[ 0 ];

    if( _.arrayIs( src ) ) /* Dmytro : arrayLike returns true for instances of containerAdapter */
    // if( _.arrayLike( src ) )
    {
      let args2 = [ ... args ];
      let result = _.longMakeEmpty( src );
      let append = _.long_.appender( result );
      let each = _.long_.eacher( src );
      each( ( e ) =>
      {
        args2[ 0 ] = e;
        append( routine.apply( this, args2 ) );
      });
      return result;

      // let args2 = [ ... args ]; // Dmytro : if args[ 1 ] and next elements is not primitive, then vectorized routine can affects on this elements and array args
      // // let result = [];
      // let result;
      // result = _.longMakeEmpty( src ); /* qqq : use this code */
      // // if( _.argumentsArray.is( src ) )
      // // result = [];
      // // else
      // // result = new src.constructor();
      // let append = _.long_.appender( result );
      // let each = _.long_.eacher( src );
      // // for( let r = 0 ; r < src.length ; r++ )
      // // let r = 0;
      // each( ( e ) =>
      // {
      //   args2[ 0 ] = e;
      //   append( routine.apply( this, args2 ) );
      // });
      // // if( _.class.methodIteratorOf( src ) )
      // // for( let e of src )
      // // {
      // //   // let e = src[ r ];
      // //   args2[ 0 ] = e;
      // //   append( routine.apply( this, args2 ) );
      // //   // if( 'eSet' in this )
      // //   // debugger;
      // //   // if( 'eSet' in this )
      // //   // {
      // //   //   result.eSet( r, routine.apply( this, args2 ) );
      // //   // }
      // //   // else
      // //   // {
      // //   //   _.assert( result[ r ] === e );
      // //   //   result[ r ] = routine.apply( this, args2 );
      // //   // }
      // //   r += 1;
      // // }
      // // else while( r < src.length )
      // // {
      // //   let e = src[ r ];
      // //   args2[ 0 ] = e;
      // //   append( routine.apply( this, args2 ) );
      // //   // if( 'eSet' in this )
      // //   // debugger;
      // //   // if( 'eSet' in this )
      // //   // result.eSet( r, routine.apply( this, args2 ) );
      // //   // else
      // //   // result[ r ] = routine.apply( this, args2 );
      // //   r += 1;
      // // }
      //
      // return result;
    }
    else if( _.set.like( src ) ) /* qqq : cover please */
    {
      let args2 = [ ... args ];
      let result = new Set;
      for( let e of src )
      {
        args2[ 0 ] = e;
        result.add( routine.apply( this, args2 ) );
      }
      return result;
    }
    else if( vectorizingContainerAdapter && _.containerAdapter.is( src ) )
    {
      let args2 = [ ... args ];
      let result = src.filter( ( e ) =>
      {
        args2[ 0 ] = e;
        return routine.apply( this, args2 );
      });
      if( unwrapingContainerAdapter )
      return result.original;
      else
      return result;
    }

    return routine.apply( this, args );
  }

  /* - */

  function vectorizeArrayMultiplying()
  {
    if( bypassingEmpty && !arguments.length )
    return [];

    // let args = multiply( _.originalsFromAdaptersInplace( arguments ) );
    let args = multiply( arguments );
    let src = args[ 0 ];
    // src = _.originalOfAdapter( src );

    if( _.arrayLike( src ) )
    {

      let args2 = [ ... args ];
      let result = _.longMakeEmpty( src );
      let append = _.long_.appender( result );
      let each = _.long_.eacher( src );
      each( ( e, r ) =>
      {
        // args2[ 0 ] = e;
        for( let m = 0 ; m < select ; m++ )
        args2[ m ] = args[ m ][ r ]; /* zzz qqq : use _.long_.get */
        append( routine.apply( this, args2 ) );
      });
      return result;

      // let args2 = [ ... args ];
      // let result = [];
      // for( let r = 0 ; r < src.length ; r++ )
      // {
      //   for( let m = 0 ; m < select ; m++ )
      //   args2[ m ] = args[ m ][ r ];
      //   result[ r ] = routine.apply( this, args2 );
      // }
      // return result;
    }

    return routine.apply( this, args );
  }

  /* - */

  function vectorizeForOptionsMap( srcMap )
  {
    if( bypassingEmpty && !arguments.length )
    return [];

    let src = srcMap[ select ];
    // let args = _.originalsFromAdaptersInplace( [ ... arguments ] );
    let args = [ ... arguments ];
    _.assert( arguments.length === 1, 'Expects single argument' );

    if( _.arrayLike( src ) )
    {
      if( head )
      {
        args = head( routine, args );
        _.assert( _.arrayLikeResizable( args ) );
      }

      let result = _.longMakeEmpty( src );
      let append = _.long_.appender( result );
      let each = _.long_.eacher( src );
      each( ( e ) =>
      {
        args[ 0 ] = _.mapExtend( null, srcMap );
        args[ 0 ][ select ] = e;
        append( routine.apply( this, args ) );
      });
      return result;

      // let result = [];
      // for( let r = 0 ; r < src.length ; r++ )
      // {
      //   args[ 0 ] = _.mapExtend( null, srcMap );
      //   args[ 0 ][ select ] = src[ r ];
      //   result[ r ] = routine.apply( this, args );
      // }
      // return result;

    }
    else if( _.set.like( src ) ) /* qqq : cover */
    {
      if( head )
      {
        args = head( routine, args );
        _.assert( _.arrayLikeResizable( args ) );
      }
      let result = new Set;
      for( let e of src )
      {
        args[ 0 ] = _.mapExtend( null, srcMap );
        args[ 0 ][ select ] = e;
        result.add( routine.apply( this, args ) );
      }
      return result;
    }
    else if( vectorizingContainerAdapter && _.containerAdapter.is( src ) ) /* qqq : cover */
    {
      if( head )
      {
        args = head( routine, args );
        _.assert( _.arrayLikeResizable( args ) );
      }
      result = src.filter( ( e ) =>
      {
        args[ 0 ] = _.mapExtend( null, srcMap );
        args[ 0 ][ select ] = e;
        return routine.apply( this, args );
      });
      if( unwrapingContainerAdapter )
      return result.original;
      else
      return result;
    }

    return routine.apply( this, arguments );
  }

  /* - */

  function vectorizeForOptionsMapForKeys()
  {
    let result = [];

    if( bypassingEmpty && !arguments.length )
    return result;

    for( let i = 0; i < o.select.length; i++ )
    {
      select = o.select[ i ];
      result[ i ] = vectorizeForOptionsMap.apply( this, arguments );
    }
    return result;
  }

  /* - */

  function vectorizeMapOrArray()
  {
    if( bypassingEmpty && !arguments.length )
    return [];

    // let args = multiply( _.originalsFromAdaptersInplace( arguments ) );
    let args = multiply( arguments );
    let src = args[ 0 ];

    if( vectorizingArray && _.arrayLike( src ) )
    {

      let args2 = [ ... args ];
      let result = _.longMakeEmpty( src );
      let append = _.long_.appender( result );
      let each = _.long_.eacher( src );
      each( ( e, r ) =>
      {

        for( let m = 0 ; m < select ; m++ )
        args2[ m ] = args[ m ][ r ]; /* qqq zzz : use _.long_.get? */

        // args2[ 0 ] = e;
        append( routine.apply( this, args2 ) );
      });
      return result;

      // let args2 = [ ... args ];
      // let result = [];
      // for( let r = 0 ; r < src.length ; r++ )
      // {
      //   for( let m = 0 ; m < select ; m++ )
      //   args2[ m ] = args[ m ][ r ];
      //   result[ r ] = routine.apply( this, args2 );
      // }
      // return result;
    }
    else if( vectorizingMapVals && _.mapIs( src ) )
    {
      let args2 = [ ... args ];
      let result = Object.create( null );
      for( let r in src )
      {
        for( let m = 0 ; m < select ; m++ )
        args2[ m ] = args[ m ][ r ];

        result[ r ] = routine.apply( this, args2 );
      }
      return result;
    }

    return routine.apply( this, arguments );
  }

  /* - */

  function vectorizeMapWithKeysOrArray()
  {
    if( bypassingEmpty && !arguments.length )
    return [];

    // let args = multiply( _.originalsFromAdaptersInplace( arguments ) );
    let args = multiply( arguments );
    let srcs = args[ 0 ];

    _.assert( args.length === select, () => 'Expects ' + select + ' arguments but got : ' + args.length );

    if( vectorizingMapKeys && vectorizingMapVals &&_.mapIs( srcs ) )
    {
      let result = Object.create( null );
      for( let s in srcs )
      {
        let val = routine.call( this, srcs[ s ] );
        let key = routine.call( this, s );
        result[ key ] = val;
      }
      return result;
    }
    else if( vectorizingArray && _.arrayLike( srcs ) )
    {
      let result = [];
      for( let s = 0 ; s < srcs.length ; s++ )
      result[ s ] = routine.call( this, srcs[ s ] );
      return result;
    }

    return routine.apply( this, arguments );
  }

  /* - */

  function vectorizeWithFilters( src )
  {

    _.assert( 0, 'not tested' ); /* qqq : cover please */
    _.assert( arguments.length === 1, 'Expects single argument' );

    // let args = multiply( _.originalsFromAdaptersInplace( arguments ) );
    let args = multiply( arguments );

    if( vectorizingArray && _.arrayLike( src ) )
    {
      args = [ ... args ];
      // let result = [];
      throw _.err( 'not tested' ); /* cover please */

      let result = _.longMakeEmpty( src );
      let append = _.long_.appender( result );
      let each = _.long_.eacher( src );
      each( ( e, r ) =>
      {
        if( propertyFilter( e, r, src ) )
        {
          args[ 0 ] = e;
          append( routine.apply( this, args ) );
        }
        else if( bypassingFilteredOut )
        {
          append( e );
        }

        args2[ 0 ] = e;
        append( routine.apply( this, args2 ) );
      });
      return result;

      // for( let r = 0 ; r < src.length ; r++ )
      // {
      //   if( propertyFilter( src[ r ], r, src ) )
      //   {
      //     args[ 0 ] = src[ r ];
      //     result.push( routine.apply( this, args ) );
      //   }
      //   else if( bypassingFilteredOut )
      //   {
      //     result.push( src[ r ] );
      //   }
      // }
      // return result;
    }
    else if( vectorizingMapVals && _.mapIs( src ) )
    {
      args = [ ... args ];
      let result = Object.create( null );
      throw _.err( 'not tested' ); /* qqq : cover please */
      for( let r in src )
      {
        if( propertyFilter( src[ r ], r, src ) )
        {
          args[ 0 ] = src[ r ];
          result[ r ] = routine.apply( this, args );
        }
        else if( bypassingFilteredOut )
        {
          result[ r ] = src[ r ];
        }
      }
      return result;
    }

    return routine.call( this, src );
  }

  /* - */

  function vectorizeKeysOrArray()
  {
    if( bypassingEmpty && !arguments.length )
    return [];

    // let args = multiply( _.originalsFromAdaptersInplace( arguments ) );
    let args = multiply( arguments );
    let src = args[ 0 ];
    let args2, result, map, mapIndex, arr;

    _.assert( args.length === select, () => 'Expects ' + select + ' arguments but got : ' + args.length );

    if( vectorizingMapKeys )
    {
      for( let d = 0; d < select; d++ )
      {
        if( vectorizingArray && _.arrayLike( args[ d ] ) )
        arr = args[ d ];
        else if( _.mapIs( args[ d ] ) )
        {
          _.assert( map === undefined, () => 'Arguments should have only single map. Incorrect argument : ' + args[ d ] );
          map = args[ d ];
          mapIndex = d;
        }
      }
    }

    if( map )
    {
      result = Object.create( null );
      args2 = [ ... args ];

      if( vectorizingArray && _.arrayLike( arr ) )
      {
        for( let i = 0; i < arr.length; i++ )
        {
          for( let m = 0 ; m < select ; m++ )
          args2[ m ] = args[ m ][ i ];

          for( let k in map )
          {
            args2[ mapIndex ] = k;
            let key = routine.apply( this, args2 );
            result[ key ] = map[ k ];
          }
        }
      }
      else
      {
        for( let k in map )
        {
          args2[ mapIndex ] = k;
          let key = routine.apply( this, args2 );
          result[ key ] = map[ k ];
        }
      }

      return result;
    }
    else if( vectorizingArray && _.arrayLike( src ) )
    {

      let args2 = [ ... args ];
      let result = _.longMakeEmpty( src );
      let append = _.long_.appender( result );
      let each = _.long_.eacher( src );
      each( ( e, r ) =>
      {
        for( let m = 0 ; m < select ; m++ )
        args2[ m ] = args[ m ][ r ]; /* qqq zzz : use _.long_.get */
        append( routine.apply( this, args2 ) );
      });
      return result;

      // args2 = [ ... args ];
      // result = [];
      // for( let r = 0 ; r < src.length ; r++ )
      // {
      //   for( let m = 0 ; m < select ; m++ )
      //   args2[ m ] = args[ m ][ r ];
      //   result[ r ] = routine.apply( this, args2 );
      // }
      // return result;
    }

    return routine.apply( this, arguments );
  }

}

/* qqq : implement options combination vectorizingMapVals : 1, vectorizingMapKeys : 1, vectorizingArray : [ 0, 1 ] */
/* qqq : cover it */

/* qqq : implement bypassingEmpty for all combinations of options */
/* qqq : options bypassingEmpty of routine _.vectorize requires good coverage */

vectorize_body.defaults =
{
  routine : null,
  propertyFilter : null,
  bypassingFilteredOut : 1,
  bypassingEmpty : 0,
  vectorizingArray : 1,
  vectorizingMapVals : 0,
  vectorizingMapKeys : 0,
  vectorizingContainerAdapter : 0,
  unwrapingContainerAdapter : 0,
  select : 1,
}

//

function vectorize()
{
  let o = vectorize.head.call( this, vectorize, arguments );
  let result = vectorize.body.call( this, o );
  return result;
}

vectorize.head = vectorize_head;
vectorize.body = vectorize_body;
vectorize.defaults = { ... vectorize_body.defaults };

//

function vectorizeAll_body( o )
{
  _.routine.assertOptions( vectorize, arguments );

  let routine1 = _.vectorize.body.call( this, o );

  _.routine.extend( all, o.routine );

  return all;

  function all()
  {
    let result = routine1.apply( this, arguments );
    return _.all( result );
  }

}

vectorizeAll_body.defaults = { ... vectorize_body.defaults };

//

function vectorizeAll()
{
  let o = vectorizeAll.head.call( this, vectorizeAll, arguments );
  let result = vectorizeAll.body.call( this, o );
  return result;
}

vectorizeAll.head = vectorize_head;
vectorizeAll.body = vectorizeAll_body;
vectorizeAll.defaults = { ... vectorizeAll_body.defaults };

//

function vectorizeAny_body( o )
{
  _.routine.assertOptions( vectorize, arguments );

  let routine1 = _.vectorize.body.call( this, o );
  _.routine.extend( any, o.routine );

  return any;

  function any()
  {
    let result = routine1.apply( this, arguments );
    return _.any( result );
  }

}

vectorizeAny_body.defaults = { ... vectorize_body.defaults };

//

function vectorizeAny()
{
  let o = vectorizeAny.head.call( this, vectorizeAny, arguments );
  let result = vectorizeAny.body.call( this, o );
  return result;
}

vectorizeAny.head = vectorize_head;
vectorizeAny.body = vectorizeAny_body;
vectorizeAny.defaults = { ... vectorizeAny_body.defaults };

//

function vectorizeNone_body( o )
{
  _.routine.assertOptions( vectorize, arguments );

  let routine1 = _.vectorize.body.call( this, o );
  _.routine.extend( none, o.routine );

  return none;

  function none()
  {
    let result = routine1.apply( this, arguments );
    return _.none( result );
  }

}

vectorizeNone_body.defaults = { ... vectorize_body.defaults };

//

function vectorizeNone()
{
  let o = vectorizeNone.head.call( this, vectorizeNone, arguments );
  let result = vectorizeNone.body.call( this, o );
  return result;
}

vectorizeNone.head = vectorize_head;
vectorizeNone.body = vectorizeNone_body;
vectorizeNone.defaults = { ... vectorizeNone_body.defaults };

//

/**
 * The routine vectorizeAccess() creates proxy object for each element of passed vector {-vector-}.
 * Proxy object provides access to existed properties of {-vector-} elements uses only get()
 * and set() handlers.
 * If get() handler is used, then routine returns new proxy object with vector of property values.
 * If a property is a routine, then its routines can be applied to a set of arguments. The result is
 * a new proxy with vector of returned values.
 * To get original vector uses property `$`.
 * If set() handler is used, then property of each proxy element is assigned to one value.
 *
 * @param { Long } vector - The vector of objects and vectors to get proxy access to properties.
 *
 * @example
 * let obj1 = { a : 1, b : 2, c : 3 };
 * let obj2 = { a : 5, b : 6 };
 * let vector = _.vectorizeAccess( [ obj1, obj2 ] );
 * console.log( vector );
 * // log Proxy [
 * //       [ { a : 1, b : 2, c : 3 }, { a : 5, b : 6 } ],
 * //       { get: [Function: get], set: [Function: set] }
 * //     ]
 * console.log( vector[ '$' ] );
 * // log [ { a : 1, b : 2, c : 3 }, { a : 5, b : 6 } ]
 * let vectorA = vector.a; // or vector[ 'a' ]
 * console.log( vectorA );
 * // log Proxy [ [ 1, 5 ], { get: [Function: get], set: [Function: set] } ]
 *
 * @example
 * let cb1 = ( e ) => Math.pow( e, 2 );
 * let cb2 = ( e ) => Math.sqrt( e, 2 );
 * let obj1 = { callback : cb1, name : 'obj1' };
 * let obj2 = { callback : cb2, name : 'obj2' };
 * let vector = _.vectorizeAccess( [ obj1, obj2 ] );
 * let result = vector.callback( 4 );
 * console.log( result );
 * // log Proxy [ [ 16, 2 ], { get: [Function: get], set: [Function: set] } ]
 *
 * @example
 * let v1 = [ 1, 2, 3 ];
 * let v2 = [ 5, 6 ];
 * let vector = _.vectorizeAccess( [ v1, v2 ] );
 * vector[ 1 ] = 10;
 * console.log( vector[ '$' ] );
 * // log [ [ 1, 10, 3 ], [ 5, 10 ] ]
 *
 * @returns { Proxy } - Proxy object, which provides access to existed properties in elements of vector.
 * @function vectorizeAccess
 * @throws { Error } If arguments.length is less or more then one.
 * @throws { Error } If {-vector-} is not a Long.
 * @namespace Tools
 */

function vectorizeAccess( vector )
{

  _.assert( _.longIs( vector ) );
  _.assert( arguments.length === 1 );

  let handler =
  {
    get,
    set,
  };

  let proxy = new Proxy( vector, handler );

  return proxy;

  /* */

  function set( /* back, key, val, context */ )
  {
    let back = arguments[ 0 ];
    let key = arguments[ 1 ];
    let val = arguments[ 2 ];
    let context = arguments[ 3 ];

    vector.map( ( scalar ) =>
    {
      _.assert( scalar[ key ] !== undefined, `One or several element(s) of vector does not have ${key}` );
    });

    vector.map( ( scalar ) =>
    {
      scalar[ key ] = val;
    });

    return true;
  }

  /* */

  function get( back, key, context )
  {
    if( key === '$' )
    {
      return vector;
    }

    let routineIs = vector.some( ( scalar ) => _.routine.is( scalar[ key ] ) );

    if( !routineIs )
    if( _.all( vector, ( scalar ) => scalar[ key ] === undefined ) )
    return;

    vector.map( ( scalar ) =>
    {
      _.assert( scalar[ key ] !== undefined, `One or several element(s) of vector does not have ${String( key )}` );
    });

    if( routineIs )
    return function()
    {
      let self = this;
      let args = arguments;
      let revectorizing = false;
      let result = vector.map( ( scalar ) =>
      {
        let r = scalar[ key ].apply( scalar, args );
        if( r !== scalar )
        revectorizing = true;
        return r; // Dmytro : it returns result in vector, if it not exists, then result has only undefined => [ undefined, undefined, undefined ]
      });
      if( revectorizing )
      {
        return vectorizeAccess( result );
      }
      else
      {
        return proxy;
      }
    }

    let result = vector.map( ( scalar ) =>
    {
      return scalar[ key ];
    });

    return vectorizeAccess( result );
  }

}

//

function exportStringShortDiagnostic( src )
{
  _.assert( arguments.length === 1, 'Expects exactly one argument' );
  _.assert( _.routine.is( src ) );

  if( src.name )
  return `{- routine ${src.name} -}`;
  else
  return `{- routine.anonymous -}`;
}


// --
// routines
// --

let ExtensionTools =
{

  routineIs : is,
  _routineIs : _is,
  routineLike : like,
  _routineLike : _like,
  routineIsTrivial : isTrivial,
  routineIsSync : isSync,
  routineIsAsync : isAsync,
  routinesAre : are,
  routineWithName : withName,

  _routineJoin : _join,
  constructorJoin,
  routineJoin : join,
  routineSeal : seal,

  routineOptions : options,
  routineOptions_ : options_, /* qqq : for Dmytro : bad : where is mark? */
  assertRoutineOptions : assertOptions,
  assertRoutineOptions_ : assertOptions_,
  routineOptionsPreservingUndefines : optionsPreservingUndefines,
  routineOptionsPreservingUndefines_ : optionsPreservingUndefines_,
  assertRoutineOptionsPreservingUndefines : assertOptionsPreservingUndefines,
  assertRoutineOptionsPreservingUndefines_ : assertOptionsPreservingUndefines_,
  routineOptionsFromThis : optionsFromThis,

  routinesCompose : compose, /* xxx : deprecate */
  routineExtend : extendCloning,
  routineDefaults : defaults,
  // routine.unite : uniteCloning,
  routineEr : er,
  routineErFor : erFor,
  // routineErJoin,

  routineVectorize_functor : vectorize,
  vectorize,
  vectorizeAll,
  vectorizeAny,
  vectorizeNone,

  vectorizeAccess,

}

//

let Extension = /* qqq : for Yevhen : bad */
{

  is,
  _is,
  like,
  _like,
  isTrivial,
  isSync,
  isAsync,
  withName,

  _join,
  constructorJoin,
  join,
  seal,

  options,
  assertOptions,
  optionsPreservingUndefines,
  assertOptionsPreservingUndefines,
  optionsFromThis,

  _amend,
  extend : extendCloning,
  extendCloning,
  extendInheriting,
  extendReplacing,
  defaults,

  // unite : uniteCloning,
  unite : uniteReplacing,
  uniteCloning,
  uniteCloning_ : uniteCloning,
  uniteInheriting,
  uniteReplacing,
  /* qqq : for Yevhen : for Dmytro : introduce routines uniteReplacing, uniteInheriting, uniteCloning */

  er,
  erFor,
  // erJoin : routineErJoin,

  vectorize_functor : vectorize,
  vectorize,
  vectorizeAll,
  vectorizeAny,
  vectorizeNone,

  vectorizeAccess,

  // export string

  exportString : exportStringShortDiagnostic,
  exportStringShort : exportStringShortDiagnostic,
  exportStringShortDiagnostic,
  exportStringShortCode : exportStringShortDiagnostic,
  exportStringDiagnostic : exportStringShortDiagnostic,
  exportStringCode : exportStringShortDiagnostic,
}

//

let ExtensionS =
{

  are,
  compose,
}

Object.assign( Self, ExtensionTools );
Object.assign( Routine, Extension );
Object.assign( RoutineS, ExtensionS );

})();
