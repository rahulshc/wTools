( function _fRoutine_s_() {

'use strict';

let _global = _global_;
let _ = _global_.wTools;
let Self = _global_.wTools;

//

let _ArrayIndexOf = Array.prototype.indexOf;
let _ArrayLastIndexOf = Array.prototype.lastIndexOf;
let _ArraySlice = Array.prototype.slice;
let _ArraySplice = Array.prototype.splice;
let _FunctionBind = Function.prototype.bind;
let _ObjectToString = Object.prototype.toString;
let _ObjectHasOwnProperty = Object.hasOwnProperty;
let _propertyIsEumerable = Object.propertyIsEnumerable;

// --
// routine
// --

function routineIs( src )
{
  return _ObjectToString.call( src ) === '[object Function]';
}

//

function routinesAre( src )
{
  _.assert( arguments.length === 1, 'expects single argument' );

  if( _.longIs( src ) )
  {
    for( let s = 0 ; s < src.length ; s++ )
    if( !_.routineIs( src[ s ] ) )
    return false;
    return true;
  }

  return _.routineIs( src );
}

//

function routineIsPure( src )
{
  if( !src )
  return false;
  if( !( Object.getPrototypeOf( src ) === Function.__proto__ ) )
  return false;
  return true;
}

//

function routineHasName( src )
{
  if( !routineIs( src ) )
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
 * @memberof wTools
 */

function _routineJoin( o )
{

  _.assert( arguments.length === 1, 'expects single argument' );
  _.assert( _.boolIs( o.seal ) );
  _.assert( _.routineIs( o.routine ),'expects routine' );
  _.assert( _.longIs( o.args ) || o.args === undefined );
  _.assert( _.routineIs( _FunctionBind ) );

  let routine = o.routine;
  let args = o.args;
  let context = o.context;

  let result = act();
  _.mapExtend( result, routine );
  return result;

  function act()
  {

    if( context !== undefined && args === undefined )
    {
      if( o.seal === true )
      {
        return function __sealedContext()
        {
          return routine.call( context );
        }
      }
      else
      {
        return _FunctionBind.call( routine, context );
      }
    }
    else if( context !== undefined )
    {
      if( o.seal === true )
      {
        return function __sealedContextAndArguments()
        {
          return routine.apply( context, args );
        }
      }
      else
      {
        let a = _.arrayAppendArray( [ context ],args );
        return _FunctionBind.apply( routine, a );
      }
    }
    else if( args === undefined && !o.seal )
    {
      return routine;
    }
    else
    {
      if( !args )
      args = [];

      if( o.seal === true )
      return function __sealedArguments()
      {
        return routine.apply( undefined, args );
      }
      else
      return function __joinedArguments()
      {
        let a = args.slice();
        _.arrayAppendArray( a,arguments );
        return routine.apply( this, a );
      }

    }
  }

}

//

/**
 * The routineJoin() routine creates a new function with its 'this' ( context ) set to the provided `context`
 value. Argumetns `args` of target function which are passed before arguments of binded function during
 calling of target function. Unlike bind routine, position of `context` parameter is more intuitive.
 * @example
   let o = {
        z: 5
    };

   let y = 4;

   function sum(x, y) {
       return x + y + this.z;
    }
   let newSum = wTools.routineJoin(o, sum, [3]);
   newSum(y); // 12

   function f1(){ console.log( this ) };
   let f2 = f1.bind( undefined ); // context of new function sealed to undefined (or global object);
   f2.call( o ); // try to call new function with context set to { z: 5 }
   let f3 = _.routineJoin( undefined,f1 ); // new function.
   f3.call( o ) // print  { z: 5 }

 * @param {Object} context The value that will be set as 'this' keyword in new function
 * @param {Function} routine Function which will be used as base for result function.
 * @param {Array<*>} args Argumetns of target function which are passed before arguments of binded function during
 calling of target function. Must be wraped into array.
 * @returns {Function} New created function with preceding this, and args.
 * @throws {Error} When second argument is not callable throws error with text 'first argument must be a routine'
 * @thorws {Error} If passed arguments more than 3 throws error with text 'expects 3 or less arguments'
 * @function routineJoin
 * @memberof wTools
 */

function routineJoin( context, routine, args )
{

  _.assert( _.routineIs( routine ),'routineJoin :','second argument must be a routine' );
  _.assert( arguments.length <= 3,'routineJoin :','expects 3 or less arguments' );

  return _routineJoin
  ({
    routine : routine,
    context : context,
    args : args,
    seal : false,
  });

}

//

  /**
   * Return new function with sealed context and arguments.
   *
   * @example
   let o = {
        z: 5
    };

   function sum(x, y) {
       return x + y + this.z;
    }
   let newSum = wTools.routineSeal(o, sum, [3, 4]);
   newSum(y); // 12
   * @param {Object} context The value that will be set as 'this' keyword in new function
   * @param {Function} routine Function which will be used as base for result function.
   * @param {Array<*>} args Arguments wrapped into array. Will be used as argument to `routine` function
   * @returns {Function} Result function with sealed context and arguments.
   * @function routineJoin
   * @memberof wTools
   */

function routineSeal( context, routine, args )
{

  _.assert( _.routineIs( routine ),'routineSeal :','second argument must be a routine' );
  _.assert( arguments.length <= 3,'routineSeal :','expects 3 or less arguments' );

  return _routineJoin
  ({
    routine : routine,
    context : context,
    args : args,
    seal : true,
  });

}

//

function routineOptions( routine, args, defaults )
{

  if( !_.argumentsArrayIs( args ) )
  args = [ args ];
  let options = args[ 0 ];
  if( options === undefined )
  options = Object.create( null );
  defaults = defaults || routine.defaults;

  _.assert( arguments.length === 2 || arguments.length === 3, 'expects 2 or 3 arguments' );
  _.assert( _.routineIs( routine ), 'expects routine' );
  _.assert( _.objectIs( defaults ), 'expects routine with defined defaults or defaults in third argument' );
  _.assert( _.objectIs( options ), 'expects object' );
  _.assert( args.length === 0 || args.length === 1, 'expects single options map, but got',args.length,'arguments' );

  _.assertMapHasOnly( options, defaults );
  _.mapComplement( options, defaults );
  _.assertMapHasNoUndefine( options );

  return options;
}

//

function assertRoutineOptions( routine,args,defaults )
{

  if( !_.argumentsArrayIs( args ) )
  args = [ args ];
  let options = args[ 0 ];
  defaults = defaults || routine.defaults;

  _.assert( arguments.length === 2 || arguments.length === 3,'expects 2 or 3 arguments' );
  _.assert( _.routineIs( routine ),'expects routine' );
  _.assert( _.objectIs( defaults ),'expects routine with defined defaults or defaults in third argument' );
  _.assert( _.objectIs( options ),'expects object' );
  _.assert( args.length === 0 || args.length === 1, 'expects single options map, but got',args.length,'arguments' );

  _.assertMapHasOnly( options, defaults );
  _.assertMapHasAll( options, defaults );
  _.assertMapHasNoUndefine( options );

  return options;
}

//

function routineOptionsPreservingUndefines( routine, args, defaults )
{

  if( !_.argumentsArrayIs( args ) )
  args = [ args ];
  let options = args[ 0 ];
  if( options === undefined )
  options = Object.create( null );
  defaults = defaults || routine.defaults;

  _.assert( arguments.length === 2 || arguments.length === 3,'expects 2 or 3 arguments' );
  _.assert( _.routineIs( routine ),'expects routine' );
  _.assert( _.objectIs( defaults ),'expects routine with defined defaults' );
  _.assert( _.objectIs( options ),'expects object' );
  _.assert( args.length === 0 || args.length === 1, 'routineOptions : expects single options map, but got',args.length,'arguments' );

  _.assertMapHasOnly( options, defaults );
  _.mapComplementPreservingUndefines( options, defaults );

  return options;
}

//

function routineOptionsReplacingUndefines( routine, args, defaults )
{

  if( !_.argumentsArrayIs( args ) )
  args = [ args ];
  let options = args[ 0 ];
  if( options === undefined )
  options = Object.create( null );
  defaults = defaults || routine.defaults;

  _.assert( arguments.length === 2 || arguments.length === 3, 'expects 2 or 3 arguments' );
  _.assert( _.routineIs( routine ), 'expects routine' );
  _.assert( _.objectIs( defaults ), 'expects routine with defined defaults or defaults in third argument' );
  _.assert( _.objectIs( options ), 'expects object' );
  _.assert( args.length === 0 || args.length === 1, 'expects single options map, but got',args.length,'arguments' );

  _.assertMapHasOnly( options, defaults );
  _.mapComplementReplacingUndefines( options, defaults );

  return options;
}

//

function assertRoutineOptionsPreservingUndefines( routine, args, defaults )
{

  if( !_.argumentsArrayIs( args ) )
  args = [ args ];
  let options = args[ 0 ];
  defaults = defaults || routine.defaults;

  _.assert( arguments.length === 2 || arguments.length === 3,'expects 2 or 3 arguments' );
  _.assert( _.routineIs( routine ),'expects routine' );
  _.assert( _.objectIs( defaults ),'expects routine with defined defaults or defaults in third argument' );
  _.assert( _.objectIs( options ),'expects object' );
  _.assert( args.length === 0 || args.length === 1, 'expects single options map, but got',args.length,'arguments' );

  _.assertMapHasOnly( options,defaults );
  _.assertMapHasAll( options,defaults );

  return options;
}

//

function routineOptionsFromThis( routine, _this, constructor )
{

  _.assert( arguments.length === 3,'routineOptionsFromThis : expects 3 arguments' );

  let options = _this || Object.create( null );
  if( Object.isPrototypeOf.call( constructor,_this ) || constructor === _this )
  options = Object.create( null );

  return _.routineOptions( routine,options );
}

//

function routineExtend( dst )
{

  _.assert( arguments.length === 1 || arguments.length === 2 );
  _.assert( _.routineIs( dst ) || dst === null );

  /* generate dst routine */

  if( dst === null )
  {

    let dstMap = Object.create( null );
    for( let a = 0 ; a < arguments.length ; a++ )
    {
      let src = arguments[ a ];
      if( src === null )
      continue
      _.mapExtend( dstMap, src )
    }

    if( dstMap.pre && dstMap.body )
    dst = _.routineForPreAndBody( dstMap.pre, dstMap.body );
    else
    _.assert( 0, 'Not clear how to construct the routine' );
  }

  /* shallow clone properties of dst routine */

  for( let s in dst )
  {
    let property = dst[ s ];
    if( _.mapIs( property ) )
    {
      property = _.mapExtend( null, property );
      dst[ s ] = property;
    }
  }

  /* extend dst routine */

  for( let a = 0 ; a < arguments.length ; a++ )
  {
    let src = arguments[ a ];
    if( src === null )
    continue;
    for( let s in src )
    {
      let property = src[ s ];
      let d = Object.getOwnPropertyDescriptor( dst, s );
      if( d && !d.wratable )
      continue;
      if( _.objectIs( property ) )
      {
        _.assert( !_.mapHas( dst, s ) || _.mapIs( dst[ s ] ) );
        property = Object.create( property );
        if( dst[ s ] )
        _.mapExtend( property, dst[ s ] );
      }
      dst[ s ] = property;
    }
  }

  return dst;
}

//

function routineForPreAndBody_pre( routine, args )
{
  let o = args[ 0 ];

  if( args[ 1 ] !== undefined )
  {
    o = { pre : args[ 0 ], body : args[ 1 ] };
  }

  _.routineOptions( routine, o );
  _.assert( args.length === 1 || args.length === 2, 'Expects exactly two arguments' );
  _.assert( arguments.length === 2 );
  _.assert( _.routineIs( o.pre ) || _.routinesAre( o.pre ), 'Expects routine or routines {-o.pre-}' );
  _.assert( _.routineIs( o.body ), 'Expects routine {-o.body-}' );
  _.assert( o.body.defaults !== undefined, 'Body should have defaults' );

  return o;
}

//

function routineForPreAndBody_body( o )
{

  _.assert( arguments.length === 1 ); // args, r, o, k

  if( !_.routineIs( o.pre ) )
  {
    // let _pre = _.routinesCompose( o.pre, function( element, index, args, op )
    let _pre = _.routinesCompose( o.pre, function( args, result, op, k )
    {
      _.assert( arguments.length === 4 );
      _.assert( !_.unrollIs( result ) );
      _.assert( _.objectIs( result ) );
      return _.unrollAppend([ callPreAndBody, [ result ] ]);
    });
    _.assert( _.routineIs( _pre ) );
    o.pre = function pre()
    {

      let result = _pre.apply( this, arguments );
      return result[ result.length-1 ];
    }
  }

  let pre = o.pre;
  let body = o.body;

  _.routineExtend( callPreAndBody, o.body );

  callPreAndBody.pre = o.pre;
  callPreAndBody.body = o.body;

  return callPreAndBody;

  /* */

  function callPreAndBody()
  {
    let result;
    let o = pre.call( this, callPreAndBody, arguments );
    _.assert( !_.argumentsArrayIs( o ), 'does not expect arguments array' );
    if( _.unrollIs( o ) )
    result = body.apply( this, o );
    else
    result = body.call( this, o );
    return result;
  }

}

routineForPreAndBody_body.defaults =
{
  pre : null,
  body : null,
  preProperties : {},
  bodyProperties : { defaults : null },
}

//

function routineForPreAndBody()
{
  let o = routineForPreAndBody.pre.call( this, routineForPreAndBody, arguments );
  let result = routineForPreAndBody.body.call( this, o );
  return result;
}

routineForPreAndBody.pre = routineForPreAndBody_pre;
routineForPreAndBody.body = routineForPreAndBody_body;
routineForPreAndBody.defaults = routineForPreAndBody_body.defaults;

//

function routineVectorize_functor( o )
{

  if( _.routineIs( o ) || _.strIs( o ) )
  o = { routine : o }
  o = _.routineOptions( routineVectorize_functor, o );

  if( _.arrayIs( o.routine ) && o.routine.length === 1 )
  o.routine = o.routine[ 0 ];

  let routine = o.routine;
  let fieldFilter = o.fieldFilter;
  let bypassingFilteredOut = o.bypassingFilteredOut;
  let vectorizingArray = o.vectorizingArray;
  let vectorizingMap = o.vectorizingMap;
  let vectorizingKeys = o.vectorizingKeys;
  let pre = null;
  let select = o.select === null ? 1 : o.select;
  let selectAll = o.select === Infinity;
  let multiply = select > 1 ? multiplyReally : multiplyNo;

  routine = normalizeRoutine( routine );

  _.assert( _.routineIs( routine ), 'expects routine {-o.routine-}, but got', _.strTypeOf( routine ) );
  _.assert( arguments.length === 1, 'expects single argument' );
  _.assert( select >= 1 || _.strIs( select ) || _.arrayIs( select ), 'expects {-o.select-} as number >= 1, string or array, but got', select );

  /* */

  let resultRoutine = vectorizeArray;

  if( _.numberIs( select ) )
  {
    if( !vectorizingArray && !vectorizingMap && !vectorizingKeys )
    resultRoutine = routine;
    else if( fieldFilter )
    resultRoutine = vectorizeWithFilters;
    else if( vectorizingKeys )
    {
      _.assert( !vectorizingMap, '{-o.vectorizingKeys-} and {-o.vectorizingMap-} should not be enabled at same time' );
      resultRoutine = vectorizeKeysOrArray;
    }
    else if( !vectorizingArray || vectorizingMap )
    resultRoutine = vectorizeMapOrArray;
    else if( multiply === multiplyNo )
    resultRoutine = vectorizeArray;
    else
    resultRoutine = vectorizeArrayMultiplying;

    /*
      vectorizeWithFilters : multiply + array/map vectorizing + filter
      vectorizeArray : array vectorizing
      vectorizeArrayMultiplying :  multiply + array vectorizing
      vectorizeMapOrArray :  multiply +  array/map vectorizing
    */

  }
  else
  {
    _.assert( multiply === multiplyNo, 'not implemented' );
    if( routine.pre )
    {
      pre = routine.pre;
      routine = routine.body;
    }
    if( fieldFilter )
    _.assert( 0, 'not implemented' );
    else if( vectorizingArray || !vectorizingMap )
    {
      if( _.strIs( select ) )
      resultRoutine = vectorizeForOptionsMap;
      else
      resultRoutine = vectorizeForOptionsMapForKeys;
    }
    else
    _.assert( 0, 'not implemented' );
  }

  /* */

  _.routineExtend( resultRoutine, routine );

  /* */

  return resultRoutine;

  /* - */

  function normalizeRoutine( routine )
  {

    if( _.strIs( routine ) )
    {
      return function methodCall()
      {
        return this[ routine ].apply( this, arguments );
      }
    }
    else if( _.arrayIs( routine ) )
    {
      _.assert( routine.length === 2 );
      return function methodCall()
      {
        let c = this[ routine[ 0 ] ];
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
    let length;
    let keys;

    args = _.longSlice( args );

    if( selectAll )
    select = args.length;

    _.assert( args.length === select, 'expects', select, 'arguments but got:', args.length );

    for( let d = 0 ; d < select ; d++ )
    {
      if( vectorizingArray && _.arrayIs( args[ d ] ) )
      {
        length = args[ d ].length;
        break;
      }
      if( vectorizingMap && _.mapIs( args[ d ] ) )
      {
        keys = _.mapOwnKeys( args[ d ] );
        break;
      }
    }

    if( length !== undefined )
    {
      for( let d = 0 ; d < select ; d++ )
      {
        if( vectorizingMap /* || vectorizingKeys  */)
        _.assert( !_.mapIs( args[ d ] ), 'Arguments should have only arrays or only maps, but not both. Incorrect argument:', args[ d ] );
        else if( vectorizingKeys && _.mapIs( args[ d ] ) )
        continue;

        args[ d ] = _.multiple( args[ d ], length );
      }

    }
    else if( keys !== undefined )
    {
      for( let d = 0 ; d < select ; d++ )
      if( _.mapIs( args[ d ] ) )
      _.assert( _.arraySetIdentical( _.mapOwnKeys( args[ d ] ), keys ), 'Maps should have same keys:', keys );
      else
      {
        if( vectorizingArray )
        _.assert( !_.longIs( args[ d ] ), 'Arguments should have only arrays or only maps, but not both. Incorrect argument:', args[ d ] );

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

    // _.assert( arguments.length === 1, 'expects single argument' );

    let args = arguments;
    let src = args[ 0 ];

    if( _.longIs( src ) )
    {
      let args2 = _.longSlice( args );
      let result = [];
      for( let r = 0 ; r < src.length ; r++ )
      {
        args2[ 0 ] = src[ r ];
        result[ r ] = routine.apply( this, args2 );
      }
      return result;
    }

    return routine.apply( this, args );
  }

  /* - */

  function vectorizeArrayMultiplying()
  {

    // _.assert( arguments.length === 1, 'expects single argument' );

    let args = multiply( arguments );
    let src = args[ 0 ];

    if( _.longIs( src ) )
    {
      let args2 = _.longSlice( args );
      let result = [];
      for( let r = 0 ; r < src.length ; r++ )
      {
        for( let m = 0 ; m < select ; m++ )
        args2[ m ] = args[ m ][ r ];
        result[ r ] = routine.apply( this, args2 );
      }
      return result;
    }

    return routine.apply( this, args );
  }

  /* - */

  function vectorizeForOptionsMap( srcMap )
  {
    let src = srcMap[ select ];

    _.assert( arguments.length === 1, 'expects single argument' );

    if( _.longIs( src ) )
    {
      let args = _.longSlice( arguments );
      if( pre )
      {
        args = pre( routine, args );
        _.assert( _.arrayLikeResizable( args ) );
      }
      let result = [];
      for( let r = 0 ; r < src.length ; r++ )
      {
        args[ 0 ] = _.mapExtend( null, srcMap );
        args[ 0 ][ select ] = src[ r ];
        result[ r ] = routine.apply( this, args );
      }
      return result;
    }

    return routine.apply( this, arguments );
  }

  /* - */

  function vectorizeForOptionsMapForKeys()
  {
    let result = [];

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

    // _.assert( arguments.length === 1, 'expects single argument' );
    let args = multiply( arguments );
    let src = args[ 0 ];

    if( vectorizingArray && _.longIs( src ) )
    {
      let args2 = _.longSlice( args );
      let result = [];
      for( let r = 0 ; r < src.length ; r++ )
      {
        for( let m = 0 ; m < select ; m++ )
        args2[ m ] = args[ m ][ r ];
        // args2[ 0 ] = src[ r ];
        result[ r ] = routine.apply( this, args2 );
      }
      return result;
    }
    else if( vectorizingMap && _.mapIs( src ) )
    {
      let args2 = _.longSlice( args );
      // debugger;
      // _.assert( 0, 'not tested' );
      // _.assert( select === 1, 'not implemented' );
      let result = Object.create( null );
      for( let r in src )
      {
        for( let m = 0 ; m < select ; m++ )
        args2[ m ] = args[ m ][ r ];

        // args2[ 0 ] = src[ r ];
        result[ r ] = routine.apply( this, args2 );
      }
      return result;
    }

    return routine.apply( this, arguments );
  }

  /* - */

  function vectorizeWithFilters( src )
  {

    _.assert( 0, 'not tested' );
    _.assert( arguments.length === 1, 'expects single argument' );

    let args = multiply( arguments );

    // {
    //   args[ 0 ] = src[ r ];
    //   result[ r ] = routine.apply( this, args );
    // }

    if( vectorizingArray && _.longIs( src ) )
    {
      args = _.longSlice( args );
      let result = [];
      throw _.err( 'not tested' );
      for( let r = 0 ; r < src.length ; r++ )
      {
        if( fieldFilter( src[ r ],r,src ) )
        {
          args[ 0 ] = src[ r ];
          result.push( routine.apply( this,args ) );
        }
        else if( bypassingFilteredOut )
        {
          result.push( src[ r ] );
        }
      }
      return result;
    }
    else if( vectorizingMap && _.mapIs( src ) )
    {
      args = _.longSlice( args );
      let result = Object.create( null );
      throw _.err( 'not tested' );
      for( let r in src )
      {
        if( fieldFilter( src[ r ],r,src ) )
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

    return routine.call( this,src );
  }

  /* - */

  function vectorizeKeysOrArray()
  {
    let args = multiply( arguments );
    let src = args[ 0 ];
    let args2;
    let result;
    let map;
    let mapIndex;
    let arr;

    _.assert( args.length === select, 'expects', select, 'arguments but got:', args.length );

    if( vectorizingKeys )
    {
      for( let d = 0; d < select; d++ )
      {
        if( vectorizingArray && _.arrayIs( args[ d ] ) )
        arr = args[ d ];
        else if( _.mapIs( args[ d ] ) )
        {
          _.assert( map === undefined, 'Arguments should have only single map. Incorrect argument:', args[ d ] );
          map = args[ d ];
          mapIndex = d;
        }
      }
    }

    if( map )
    {
      result = Object.create( null );
      args2 = _.longSlice( args );

      if( vectorizingArray && _.arrayIs( arr ) )
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
    else if( vectorizingArray && _.longIs( src ) )
    {
      args2 = _.longSlice( args );
      result = [];
      for( let r = 0 ; r < src.length ; r++ )
      {
        for( let m = 0 ; m < select ; m++ )
        args2[ m ] = args[ m ][ r ];
        // args2[ 0 ] = src[ r ];
        result[ r ] = routine.apply( this, args2 );
      }
      return result;
    }

    return routine.apply( this, arguments );
  }

}

routineVectorize_functor.defaults =
{
  routine : null,
  fieldFilter : null,
  bypassingFilteredOut : 1,
  vectorizingArray : 1,
  vectorizingMap : 0,
  vectorizingKeys : 0,
  select : 1,
}

// --
// fields
// --

let Fields =
{
}

// --
// routines
// --

let Routines =
{

  routineIs : routineIs,
  routinesAre : routinesAre,
  routineIsPure : routineIsPure,
  routineHasName : routineHasName,

  _routineJoin : _routineJoin,
  routineJoin : routineJoin,
  routineSeal : routineSeal,

  // routineDelayed : routineDelayed,
  //
  // routineCall : routineCall,
  // routineTolerantCall : routineTolerantCall,
  //
  // routinesJoin : routinesJoin,
  // _routinesCall : _routinesCall,
  // routinesCall : routinesCall,
  // routinesCallEvery : routinesCallEvery,
  // methodsCall : methodsCall,
  //
  // routinesCompose : routinesCompose,
  // routinesComposeReturningLast : routinesComposeReturningLast,
  // routinesComposeReturningBeforeLast : routinesComposeReturningBeforeLast,
  // routinesComposeAll : routinesComposeAll,
  // routinesComposeAllReturningLast : routinesComposeAllReturningLast,
  // routinesChain : routinesChain,

  routineOptions : routineOptions,
  assertRoutineOptions : assertRoutineOptions,
  routineOptionsPreservingUndefines : routineOptionsPreservingUndefines,
  assertRoutineOptionsPreservingUndefines : assertRoutineOptionsPreservingUndefines,
  routineOptionsFromThis : routineOptionsFromThis,

  routineExtend : routineExtend,
  routineForPreAndBody : routineForPreAndBody,

  routineVectorize_functor : routineVectorize_functor,

  // _equalizerFromMapper : _equalizerFromMapper,
  // _comparatorFromEvaluator : _comparatorFromEvaluator,

  bind : null,

}

//

Object.assign( Self, Routines );
Object.assign( Self, Fields );

// --
// export
// --

if( typeof module !== 'undefined' )
if( _global.WTOOLS_PRIVATE )
delete require.cache[ module.id ];

if( typeof module !== 'undefined' && module !== null )
module[ 'exports' ] = Self;

})();
