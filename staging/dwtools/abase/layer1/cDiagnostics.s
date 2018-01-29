(function _Diagnostics_s_() {

'use strict';

var _ArraySlice = Array.prototype.slice;
var _FunctionBind = Function.prototype.bind;
var _ObjectToString = Object.prototype.toString;
var _hasOwnProperty = Object.hasOwnProperty;
var _propertyIsEumerable = Object.propertyIsEnumerable;
var _ceil = Math.ceil;
var _floor = Math.floor;

var _ = _global_.wTools;
var _err = _._err;
var Self = _global_.wTools;

//

function diagnosticVariate( o )
{
  _.routineOptions( diagnosticVariate,o );

  if( _.arrayIs( o.routine ) )
  {
    _.assert( _.routineIs( o.routine[ 1 ] ) );
    if( !o.variates && o.routine[ 1 ].variates )
    o.variates = o.routine[ 1 ].variates;
    o.routine = _.routineJoin.apply( _,o.routine );
  }

  _.assert( _.routineIs( o.routine ) );
  _.assert( _.objectIs( o.variates ) );

  var vals = _.mapExtend( null,o.variates );
  vals = _.proxyNoUndefined( vals );

  if( o.test === null )
  o.test = function vtest( got,o )
  {
    return _.entityEquivalent( got,o.expected,{ eps : o.eps } );
  }

  var found = 0;
  var nsamples = _.eachSample
  ({

    onEach : function( sample,i )
    {
      var got = o.routine( sample );
      var res = o.test( got,o );
      if( res )
      found += 1;
      if( res || !o.printingValidOnly )
      {
        logger.log( 'routine',o.routine.name,'gave',got,'expected',o.expected,'#',i );
        if( res )
        {
          logger.log( 'sample :',sample );
          logger.log( got );
        }
      }
    },

    sets : o.variates,
    sample : vals,
    result : null,

  });

  logger.log( 'Found',found,'/',nsamples );

}

diagnosticVariate.defaults =
{
  routine : null,
  test : null,

  expected : null,
  variates : null,
  eps : 1e-3,
  printingValidOnly : 1,
}

// --
// diagnostics
// --

function _diagnosticStripPath( src )
{
  _.assert( arguments.length === 1 );

  if( _.strIs( src ) )
  {
    src = src.replace( /^\s+/,'' );
    // src = src.replace( /^at/,'' );
    // src = src.replace( /^\s+/,'' );
  }

  return src;
}

//

// function diagnosticScript( path )
// {
//
//   if( typeof document !== 'undefined' && document.scripts )
//   {
//     var scripts = document.scripts;
//     for( var s = 0 ; s < scripts.length ; s++ )
//     if( scripts[ s ].src === path )
//     return scripts[ s ];
//   }
//   else
//   {
//     debugger;
//   }
//
// }

//

function diagnosticLocation( o )
{

  if( _.numberIs( o ) )
  o = { level : o }
  else if( _.strIs( o ) )
  o = { stack : o, level : 0 }
  else if( _.errIs( o ) )
  o = { error : o, level : 0 }
  else if( o === undefined )
  o = { stack : _.diagnosticStack( 1 ) };

  _.routineOptions( diagnosticLocation,o );
  _.assert( arguments.length === 0 || arguments.length === 1 );
  _.assert( _.objectIs( o ),'diagnosticLocation expects integer ( level ) or string ( stack ) or object ( options )' );

  if( !o.location )
  o.location = Object.create( null );

  /* end */

  function end()
  {

    var path = o.location.path;

    /* full */

    if( path )
    {
      o.location.full = path;
      if( o.location.line !== undefined )
      o.location.full += ':' + o.location.line;
    }

    /* name long */

    if( o.location.full )
    {
      o.location.fullWithRoutine = o.location.routine + ' @ ' + o.location.full;
    }

    /* name */

    if( path )
    {
      var name = path;
      var i = name.lastIndexOf( '/' );
      if( i !== -1 )
      name = name.substr( i+1 );
      o.location.name = name;
    }

    /* name long */

    if( path )
    {
      var nameLong = o.location.name;
      if( o.location.line !== undefined )
      {
        nameLong += ':' + o.location.line;
        if( o.location.col !== undefined )
        nameLong += ':' + o.location.col;
      }
      o.location.nameLong = nameLong;
    }

    return o.location;
  }

  /* routine from stack */

  function routineFromStack( stack )
  {
    var path;

    if( !stack )
    return;

    if( _.strIs( stack ) )
    stack = stack.split( '\n' );

    path = stack[ o.level ];

    if( !_.strIs( path ) )
    return '(-routine anonymous-)';

    // debugger;

    var t = /^\s*(at\s+)?([\w\.]+)\s*.+/;
    var executed = t.exec( path );
    if( executed )
    path = executed[ 2 ] || '';

    if( _.strEnds( path, '.' ) )
    path += '?';

    o.location.routine = path;
    o.location.service = 0;
    if( o.location.service === 0 )
    if( _.strBegins( path , '__' ) || path.indexOf( '.__' ) !== -1 )
    o.location.service = 2;
    if( o.location.service === 0 )
    if( _.strBegins( path , '_' ) || path.indexOf( '._' ) !== -1 )
    o.location.service = 1;

    return path;
  }

  /* path from stack */

  function pathFromStack( stack )
  {
    var path;

    if( !stack )
    return;

    if( _.strIs( stack ) )
    stack = stack.split( '\n' );

    path = stack[ o.level ];

    if( !_.strIs( path ) )
    return end();

    path = path.replace( /^\s+/,'' );
    path = path.replace( /^\w+@/,'' );
    path = path.replace( /^at/,'' );
    path = path.replace( /^\s+/,'' );
    path = path.replace( /\s+$/,'' );

    if( _.strEnds( path,')' ) )
    path = _.strInbetweenOf( path,'(',')' );

    return path;
  }

  /* line / col number from path */

  function lineColFromPath( path )
  {

    var lineNumber,colNumber;
    var postfix = /(.+?):(\d+)(?::(\d+))?[^:/]*$/;
    var parsed = postfix.exec( path );

    if( parsed )
    {
      path = parsed[ 1 ];
      lineNumber = parsed[ 2 ];
      colNumber = parsed[ 3 ];
    }

    // var postfix = /:(\d+)$/;
    // colNumber = postfix.exec( o.location.path );
    // if( colNumber )
    // {
    //   o.location.path = _.strRemoveEnd( o.location.path,colNumber[ 0 ] );
    //   colNumber = colNumber[ 1 ];
    //   lineNumber = postfix.exec( o.location.path );
    //   if( lineNumber )
    //   {
    //     o.location.path = _.strRemoveEnd( o.location.path,lineNumber[ 0 ] );
    //     lineNumber = lineNumber[ 1 ];
    //   }
    //   else
    //   {
    //     lineNumber = colNumber;
    //     colNumber = undefined;
    //   }
    // }

    lineNumber = parseInt( lineNumber );
    colNumber = parseInt( colNumber );

    if( isNaN( o.location.line ) && !isNaN( lineNumber ) )
    o.location.line = lineNumber;

    if( isNaN( o.location.col ) && !isNaN( colNumber ) )
    o.location.col = colNumber;

    return path;
  }

  /* */

  if( o.error )
  {

    o.location.path = _.arrayLeftDefined([ o.location.path, o.error.filename, o.error.fileName ]).element;
    o.location.line = _.arrayLeftDefined([ o.location.line, o.error.line, o.error.linenumber, o.error.lineNumber, o.error.lineNo, o.error.lineno ]).element;
    o.location.col = _.arrayLeftDefined([ o.location.col, o.error.col, o.error.colnumber, o.error.colNumber, o.error.colNo, o.error.colno ]).element;

    if( o.location.path && _.numberIs( o.location.line ) )
    return end();
  }

  /* */

  if( !o.stack )
  {
    if( o.error )
    {
      o.stack = _.diagnosticStack( o.error );
    }
    else
    {
      o.stack = _.diagnosticStack();
      o.level += 1;
    }
  }

  routineFromStack( o.stack );

  var pathHad = !!o.location.path;
  if( !pathHad )
  o.location.path = pathFromStack( o.stack );

  if( !_.strIs( o.location.path ) )
  return end();

  if( !_.numberIs( o.location.line ) )
  o.location.path = lineColFromPath( o.location.path );

  if( !_.numberIs( o.location.line ) && pathHad )
  {
    // debugger;
    var path = pathFromStack( o.stack );
    if( path )
    lineColFromPath( path );
  }

  return end();
}

diagnosticLocation.defaults =
{
  level : 0,
  stack : null,
  error : null,
  location : null,
  // sourceCode : null,
}

//

function diagnosticCode( o )
{

  _.routineOptions( diagnosticCode,o );
  _.assert( arguments.length === 0 || arguments.length === 1 );

  if( !o.location )
  {
    if( o.error )
    o.location = _.diagnosticLocation({ error : o.error, level : o.level });
    else
    o.location = _.diagnosticLocation({ stack : o.stack, level : o.stack ? o.level : o.level+1 });
  }

  if( !_.numberIs( o.location.line ) )
  return;

  /* */

  if( !o.sourceCode )
  {

    if( !o.location.path )
    return;

    var codeProvider = _.codeProvider || _.fileProvider;

    if( !codeProvider )
    return;

    try
    {

      o.sourceCode = codeProvider.fileRead
      ({
        filePath : o.location.path,
        sync : 1,
        throwing : 0,
      })

    }
    catch( err )
    {
      o.sourceCode = 'CANT LOAD SOURCE CODE OF ' + _.strQuote( o.location.path );
    }

    if( !o.sourceCode )
    return;

  }

  /* */

  var result = _.strLinesSelect
  ({
    src : o.sourceCode,
    line : o.location.line,
    numberOfLines : o.numberOfLines,
    selectMode : o.selectMode,
    zero : 1,
    number : 1,
  });

  if( o.withPath )
  result = o.location.full + '\n' + result;

  return result;
}

diagnosticCode.defaults =
{
  level : 0,
  numberOfLines : 3,
  withPath : 1,
  selectMode : 'center',
  stack : null,
  error : null,
  location : null,
  sourceCode : null,
}

//

/**
 * Return stack trace as string.
 * @example
  var stack;
  function function1()
  {
    function2();
  }

  function function2()
  {
    function3();
  }

  function function3()
  {
    stack = wToolsxxx.diagnosticStack();
  }

  function1();
  console.log( stack );
 //"    at function3 (<anonymous>:10:17)
 // at function2 (<anonymous>:6:2)
 // at function1 (<anonymous>:2:2)
 // at <anonymous>:1:1"
 *
 * @returns {String} Return stack trace from call point.
 * @function stack
 * @memberof wTools
 */

function diagnosticStack( stack,first,last )
{

  if( last-first === 1 )
  debugger;

  if( _.numberIs( arguments[ 0 ] ) || arguments[ 0 ] === undefined )
  {

    var first = arguments[ 0 ] ? arguments[ 0 ] + 1 : 1;
    var last = arguments[ 1 ] >= 0 ? arguments[ 1 ] + 1 : arguments[ 1 ];

    return diagnosticStack( new Error(),first,last );
  }

  if( arguments.length !== 1 && arguments.length !== 2 && arguments.length !== 3 )
  {
    debugger;
    throw Error( 'diagnosticStack : expects one, two or three arguments if error provided' );
  }

  if( !_.numberIs( first ) && first !== undefined )
  {
    debugger;
    throw Error( 'diagnosticStack : expects number ( first ), got ' + _.strTypeOf( first ) );
  }

  if( !_.numberIs( last ) && last !== undefined )
  {
    debugger;
    throw Error( 'diagnosticStack : expects number ( last ), got' + _.strTypeOf( last ) );
  }

  var errIs = 0;
  if( _.errIs( stack ) )
  {
    stack = stack.stack;
    errIs = 1;
  }

  if( !stack )
  return '';

  if( !_.arrayIs( stack ) && !_.strIs( stack ) )
  return;

  if( !_.arrayIs( stack ) && !_.strIs( stack ) )
  debugger;
  if( !_.arrayIs( stack ) && !_.strIs( stack ) )
  throw 'diagnosticStack expects array or string';

  if( !_.arrayIs( stack ) )
  stack = stack.split( '\n' );

  /* remove redundant lines */

  if( !errIs )
  console.debug( 'REMINDER : problem here if !errIs' ); /* xxx */
  if( !errIs )
  debugger;

  if( errIs )
  {
    // debugger;
    while( stack.length )
    {
      var splice = 0;
      // if( stack[ 0 ].indexOf( '@' ) !== -1 )
      // debugger;
      // if( stack[ 0 ].indexOf( '@' ) !== -1 )
      // return '';
      splice |= ( stack[ 0 ].indexOf( 'at ' ) === -1 && stack[ 0 ].indexOf( '@' ) === -1 );
      splice |= stack[ 0 ].indexOf( '(vm.js:' ) !== -1;
      splice |= stack[ 0 ].indexOf( '(module.js:' ) !== -1;
      splice |= stack[ 0 ].indexOf( '(internal/module.js:' ) !== -1;
      if( splice )
      stack.splice( 0,1 );
      else break;
    }
    // debugger;
  }

  // if( stack[ 0 ].indexOf( '@' ) === -1 )
  // stack[ 0 ] = _.strCutOffLeft( stack[ 0 ],'@' )[ 1 ];

  if( !stack[ 0 ] )
  return '{ stack is empty }';

  // debugger;
  if( stack[ 0 ].indexOf( 'at ' ) === -1 && stack[ 0 ].indexOf( '@' ) === -1 )
  {
    debugger;
    throw Error( 'diagnosticStack : cant parse stack ' + stack );
  }

  /* */

  var first = first === undefined ? 0 : first;
  var last = last === undefined ? stack.length : last;

  if( _.numberIs( first ) )
  if( first < 0 )
  first = stack.length + first;

  if( _.numberIs( last ) )
  if( last < 0 )
  last = stack.length + last + 1;

  /* */

  // if( last-first === 1 )
  // {
  //   debugger;
  //   // stack = stack[ first ];
  //   //
  //   // if( _.strIs( stack ) )
  //   // {
  //   //   stack = _._diagnosticStripPath( stack );
  //   // }
  //   //
  //   // return stack;
  // }

  if( first !== 0 || last !== stack.length )
  {
    stack = stack.slice( first || 0,last );
  }

  /* */

  stack = String( stack.join( '\n' ) );

  return stack;
}

//

function diagnosticStackPurify( stack )
{

  if( arguments.length !== 1 )
  throw 'expects single arguments';
  if( !_.strIs( stack ) )
  throw 'expects string';

  stack = stack.split( '\n' );

  for( var s = 1 ; s < stack.length ; s++ )
  if( /(\w)_entry(\W|$)/.test( stack[ s ] ) )
  {
    stack.splice( s+1,stack.length );
    break;
  }

  for( var s = stack.length-1 ; s >= 1 ; s-- )
  {
    if( /(\W|^)__\w+/.test( stack[ s ] ) )
    stack.splice( s,1 )
  }

  return stack.join( '\n' );
}

//

// /*
// _.diagnosticWatchObject
// ({
//   dst : self,
//   names : 'wells',
// });
// */
//
// /*
// _.diagnosticWatchObject
// ({
//   dst : _global_,
//   names : 'logger',
// });
// */
//
// //function diagnosticWatchObject( dst,options )
// function diagnosticWatchObject( o )
// {
//
//   if( arguments.length === 2 )
//   {
//     o = { dst : arguments[ 0 ], names : arguments[ 1 ] };
//   }
//
//   _.assert( arguments.length === 1 || arguments.length === 2 );
//   _.assertMapHasOnly( diagnosticWatchObject.defaults,o );
//
//   debugger;
//   if( o.names )
//   o.names = _.nameFielded( o.names );
//
//   Object.observe( o.dst,function( changes )
//   {
//     for( var c in changes )
//     {
//       var change = changes[ c ];
//       if( o.names )
//       if( !o.names[ change.name ] ) return;
//       console.log( change.type,change.name,change.object[ change.name ] );
//       //if( !change.object[ change.name ] )
//       //console.log( change.name,change.object[ change.name ] );
//     }
//     //debugger;
//   });
//
// }
//
// diagnosticWatchObject.defaults =
// {
//   dst : null,
//   names : null,
// }

//

/*

_.diagnosticWatchFields
({
  target : _global_,
  names : 'Uniforms',
});

_.diagnosticWatchFields
({
  target : state,
  names : 'filterColor',
});

_.diagnosticWatchFields
({
  target : _global_,
  names : 'Config',
});

_.diagnosticWatchFields
({
  target : _global_,
  names : 'logger',
});

_.diagnosticWatchFields
({
  target : self,
  names : 'catalogPath',
});

*/

function diagnosticWatchFields( o )
{

  if( arguments[ 1 ] !== undefined )
  o = { target : arguments[ 0 ], names : arguments[ 1 ] }
  o = _.routineOptions( diagnosticWatchFields,o );

  if( o.names )
  o.names = _.nameFielded( o.names );
  else
  o.names = o.target;

  _.assert( arguments.length === 1 || arguments.length === 2 );
  _.assert( _.objectLike( o.target ) );
  _.assert( _.objectLike( o.names ) );

  for( var f in o.names ) ( function()
  {

    var fieldName = f;
    var fieldSymbol = Symbol.for( f );
    //o.target[ fieldSymbol ] = o.target[ f ];
    var val = o.target[ f ];

    /* */

    function read()
    {
      //var result = o.target[ fieldSymbol ];
      var result = val;
      if( o.verbosity > 1 )
      console.log( 'reading ' + fieldName + ' ' + _.toStr( result ) );
      else
      console.log( 'reading ' + fieldName );
      if( o.debug > 1 )
      debugger;
      return result;
    }

    /* */

    function write( src )
    {
      if( o.verbosity > 1 )
      console.log( 'writing ' + fieldName + ' ' + _.toStr( o.target[ fieldName ] ) + ' -> ' + _.toStr( src ) );
      else
      console.log( 'writing ' + fieldName );
      if( o.debug )
      debugger;
      //o.target[ fieldSymbol ] = src;
      val = src;
    }

    /* */

    if( o.debug )
    debugger;

    if( o.verbosity > 1 )
    console.log( 'watching for',fieldName,'in',o.target );
    Object.defineProperty( o.target, fieldName,
    {
      enumerable : true,
      configurable : true,
      get : read,
      set : write,
    });

  })();

}

diagnosticWatchFields.defaults =
{
  target : null,
  names : null,
  verbosity : 2,
  debug : 0,
}

//

/*

_.diagnosticProxyFields
({
  target : _.field,
});

_.diagnosticWatchFields
({
  target : _,
  names : 'field',
});

*/

function diagnosticProxyFields( o )
{

  if( arguments[ 1 ] !== undefined )
  o = { target : arguments[ 0 ], names : arguments[ 1 ] }
  o = _.routineOptions( diagnosticWatchFields,o );

  // if( o.names )
  // o.names = _.nameFielded( o.names );

  _.assert( arguments.length === 1 || arguments.length === 2 );
  _.assert( _.objectLike( o.target ) );
  _.assert( _.objectLike( o.names ) || o.names === null );

  var handler =
  {
    set : function( obj, k, e )
    {
      if( o.names && !( k in o.names ) )
      return;
      if( o.verbosity > 1 )
      console.log( 'writing ' + k + ' ' + _.toStr( o.target[ k ] ) + ' -> ' + _.toStr( e ) );
      else
      console.log( 'writing ' + k );
      if( o.debug )
      debugger;
      obj[ k ] = e;
      return true;
    }
  }

  var result = new Proxy( o.target, handler );
  if( o.verbosity > 1 )
  console.log( 'watching for',o.target );

  if( o.debug )
  debugger;

  return result;
}

diagnosticProxyFields.defaults =
{
}

diagnosticProxyFields.defaults.__proto__ == diagnosticWatchFields.defaults

//

function beep()
{
  console.log( '\x07' );
}

//

/**
 * Checks condition passed by argument( condition ). Works only in debug mode. Uses StackTrace level 2. @see wToolsxxx.err
 * If condition is true routine returns without exceptions, otherwise routine generates and throws exception. By default generates error with message 'Assertion failed'.
 * Also generates error using message(s) or existing error object(s) passed after first argument.
 *
 * @param {*} condition - condition to check.
 * @param {String|Error} [ msgs ] - error messages for generated exception.
 *
 * @example
 * var x = 1;
 * wToolsxxx.assert( wToolsxxx.strIs( x ), 'incorrect variable type->', typeof x, 'expects string' );
 *
 * // caught eval (<anonymous>:2:8)
 * // incorrect variable type-> number expects string
 * // Error
 * //   at _err (file:///.../wTools/staging/Base.s:3707)
 * //   at assert (file://.../wTools/staging/Base.s:4041)
 * //   at add (<anonymous>:2)
 * //   at <anonymous>:1
 *
 * @example
 * function add( x, y )
 * {
 *   wToolsxxx.assert( arguments.length === 2, 'incorrect arguments count' );
 *   return x + y;
 * }
 * add();
 *
 * // caught add (<anonymous>:3:14)
 * // incorrect arguments count
 * // Error
 * //   at _err (file:///.../wTools/staging/Base.s:3707)
 * //   at assert (file://.../wTools/staging/Base.s:4035)
 * //   at add (<anonymous>:3:14)
 * //   at <anonymous>:6
 *
 * @example
 *   function divide ( x, y )
 *   {
 *      wToolsxxx.assert( y != 0, 'divide by zero' );
 *      return x / y;
 *   }
 *   divide( 3, 0 );
 *
 * // caught     at divide (<anonymous>:2:29)
 * // divide by zero
 * // Error
 * //   at _err (file:///.../wTools/staging/Base.s:1418:13)
 * //   at wToolsxxx.errLog (file://.../wTools/staging/Base.s:1462:13)
 * //   at divide (<anonymous>:2:29)
 * //   at <anonymous>:1:1
 * @throws {Error} If passed condition( condition ) fails.
 * @function assert
 * @memberof wTools
 */

function _assertDebugger( condition )
{
  debugger;
}

function assert( condition )
{

  /*return;*/

  if( Config.debug === false )
  return;

  if( !condition )
  {
    _assertDebugger();
    if( arguments.length === 1 )
    throw _err
    ({
      args : [ 'Assertion failed' ],
      level : 2,
    });
    else if( arguments.length === 2 )
    throw _err
    ({
      args : [ arguments[ 1 ] ],
      level : 2,
    });
    else
    throw _err
    ({
      args : _.arraySlice( arguments,1 ),
      level : 2,
    });
  }

  return;
}

//

function assertWithoutBreakpoint( condition )
{

  /*return;*/

  if( Config.debug === false )
  return;

  if( !condition )
  {
    if( arguments.length === 1 )
    throw _err
    ({
      args : [ 'Assertion failed' ],
      level : 2,
    });
    else if( arguments.length === 2 )
    throw _err
    ({
      args : [ arguments[ 1 ] ],
      level : 2,
    });
    else
    throw _err
    ({
      args : _.arraySlice( arguments,1 ),
      level : 2,
    });
  }

  return;
}

//

/**
 * Checks if map passed by argument( src ) not contains undefined properties. Works only in debug mode. Uses StackTrace level 2. @see wToolsxxx.err
 * If routine found undefined property it generates and throws exception, otherwise returns without exception.
 * Also generates error using message passed after first argument.
 *
 * @param {Object} src - source map.
 * @param {String} [ msgs ] - error message for generated exception.
 *
 * @example
 * var map = { a : '1', b : undefined };
 * wToolsxxx.assertMapHasNoUndefine( map );
 *
 * // caught <anonymous>:2:8
 * // Object  should have no undefines, but has : b
 * //
 * // at _err (file:///.../wTools/staging/Base.s:3707)
 * // at assertMapHasNoUndefine (file:///.../wTools/staging/Base.s:4087)
 * // at <anonymous>:2
 *
 * @example
 * var map = { a : undefined, b : '1' };
 * wToolsxxx.assertMapHasNoUndefine( map, '"map"');
 *
 * // caught <anonymous>:2:8
 * // Object "map" should have no undefines, but has : a
 * //
 * // at _err (file:///.../wTools/staging/Base.s:3707)
 * // at assertMapHasNoUndefine (file:///.../wTools/staging/Base.s:4087)
 * // at <anonymous>:2
 *
 * @function assertMapHasNoUndefine
 * @throws {Exception} If no arguments provided.
 * @throws {Exception} If map( src ) contains undefined property.
 * @memberof wTools
 *
 */

function assertMapHasNoUndefine( src )
{

  if( Config.debug === false )
  return;

  _.assert( arguments.length === 1 || arguments.length === 2 )

  var l = arguments.length;
  var hasMsg = _.strIs( arguments[ l-1 ] );

  for( var s in src )
  if( src[ s ] === undefined )
  {
    debugger;
    throw _err
    ({
      args : [ ( 'Object ' + ( hasMsg ? _.arraySlice( arguments,1,arguments.length ) : '' ) + ' should have no undefines, but has' ) + ' : ' + s ],
      level : 2,
    });
  }

}

//

/**
 * Checks if map passed by argument( src ) has only properties represented in object(s) passed after first argument. Checks all enumerable properties.
 * Works only in debug mode. Uses StackTrace level 2. @see wToolsxxx.err
 * If routine found some unique properties in source it generates and throws exception, otherwise returns without exception.
 * Also generates error using message passed as last argument.
 *
 * @param {Object} src - source map.
 * @param {...Object} target - object(s) to compare with.
 * @param {String} [ msgs ] - error message as last argument.
 *
 * @example
 * var a = { a : 1, c : 3 };
 * var b = { a : 2, b : 3 };
 * wToolsxxx.assertMapHasOnly( a, b );
 *
 * // caught <anonymous>:3:8
 * // Object should have no fields : c
 * //
 * // at _err (file:///.../wTools/staging/Base.s:3707)
 * // at assertMapHasOnly (file:///.../wTools/staging/Base.s:4188)
 * // at <anonymous>:3
 *
 * @example
 * var x = { d : 1 };
 * var a = Object.create( x );
 * var b = { a : 1 };
 * wToolsxxx.assertMapHasOnly( a, b, 'message' )
 *
 * // caught <anonymous>:4:8
 * // message Object should have no fields : d
 * //
 * // at _err (file:///.../wTools/staging/Base.s:3707)
 * // at assertMapHasOnly (file:///.../wTools/staging/Base.s:4188)
 * // at <anonymous>:4
 *
 * @function assertMapHasOnly
 * @throws {Exception} If map( src ) contains unique property.
 * @memberof wTools
 *
 */

function assertMapHasOnly( src )
{

  if( Config.debug === false )
  return;

  var l = arguments.length;
  var hasMsg = _.strIs( arguments[ l-1 ] );
  var args = hasMsg ? _.arraySlice( arguments,0,l-1 ) : arguments;
  var but = Object.keys( _.mapBut.apply( this,args ) );

  if( but.length > 0 )
  {
    if( _.strJoin && !hasMsg )
    console.error( 'Consider extending Composes by :\n' + _.strJoin( '  ',but,' : null,' ).join( '\n' ) );
    debugger;
    throw _err
    ({
      args : [ hasMsg ? arguments[ l-1 ] + '\n' : '','Object should have no fields :',but.join( ',' ) ],
      level : 2,
    });
  }

}

//

function assertMapHasOnlyWithUndefines( src )
{

  if( Config.debug === false )
  return;

  var l = arguments.length;
  var hasMsg = _.strIs( arguments[ l-1 ] );
  var args = hasMsg ? _.arraySlice( arguments,0,l-1 ) : arguments;
  var but = Object.keys( _.mapButWithUndefines.apply( this,args ) );

  if( but.length > 0 )
  {
    if( _.strJoin && !hasMsg )
    console.error( 'Consider extending Composes by :\n' + _.strJoin( '  ',but,' : null,' ).join( '\n' ) );
    debugger;
    throw _err
    ({
      args : [ hasMsg ? arguments[ l-1 ] : '','Object should have no fields :',but.join( ',' ) ],
      level : 2,
    });
  }

}

//

/**
 * Checks if map passed by argument( src ) has only properties represented in object(s) passed after first argument. Checks only own properties of the objects.
 * Works only in debug mode. Uses StackTrace level 2.@see wToolsxxx.err
 * If routine found some unique properties in source it generates and throws exception, otherwise returns without exception.
 * Also generates error using message passed as last argument.
 *
 * @param {Object} src - source map.
 * @param {...Object} target - object(s) to compare with.
 * @param {String} [ msgs ] - error message as last argument.
 *
 * @example
 * var x = { d : 1 };
 * var a = Object.create( x );
 * a.a = 5;
 * var b = { a : 2 };
 * wToolsxxx.assertMapOwnOnly( a, b ); //no exception
 *
 * @example
 * var a = { d : 1 };
 * var b = { a : 2 };
 * wToolsxxx.assertMapOwnOnly( a, b );
 *
 * // caught <anonymous>:3:10
 * // Object should have no own fields : d
 * //
 * // at _err (file:///.../wTools/staging/Base.s:3707)
 * // at assertMapOwnOnly (file:///.../wTools/staging/Base.s:4215)
 * // at <anonymous>:3
 *
 * @example
 * var a = { x : 0, y : 2 };
 * var b = { c : 0, d : 3};
 * var c = { a : 1 };
 * wToolsxxx.assertMapOwnOnly( a, b, c, 'error msg' );
 *
 * // caught <anonymous>:4:8
 * // error msg Object should have no own fields : x,y
 * //
 * // at _err (file:///.../wTools/staging/Base.s:3707)
 * // at assertMapOwnOnly (file:///.../wTools/staging/Base.s:4215)
 * // at <anonymous>:4
 *
 * @function assertMapOwnOnly
 * @throws {Exception} If map( src ) contains unique property.
 * @memberof wTools
 *
 */

function assertMapOwnOnly( src )
{

  if( Config.debug === false )
  return;

  var l = arguments.length;
  var hasMsg = _.strIs( arguments[ l-1 ] );
  var args = hasMsg ? _.arraySlice( arguments,0,l-1 ) : arguments;
  var but = Object.keys( _.mapOwnBut.apply( this,args ) );

  if( but.length > 0 )
  {
    if( _.strJoin && !hasMsg )
    console.error( 'Consider extending Composes by :\n' + _.strJoin( '  ',but,' : null,' ).join( '\n' ) );
    debugger;
    throw _err
    ({
      args : [ hasMsg ? arguments[ l-1 ] : '','Object should have no own fields :',but.join( ',' ) ],
      level : 2,
    });
  }

}

//

/**
 * Checks if map passed by argument( src ) has all properties represented in object passed by argument( all ). Checks all enumerable properties.
 * Works only in debug mode. Uses StackTrace level 2.@see wToolsxxx.err
 * If routine did not find some properties in source it generates and throws exception, otherwise returns without exception.
 * Also generates error using message passed as last argument( msg ).
 *
 * @param {Object} src - source map.
 * @param {Object} all - object to compare with.
 * @param {String} [ msgs ] - error message.
 *
 * @example
 * var x = { a : 1 };
 * var a = Object.create( x );
 * var b = { a : 2 };
 * wToolsxxx.assertMapHasAll( a, b );// no exception
 *
 * @example
 * var a = { d : 1 };
 * var b = { a : 2 };
 * wToolsxxx.assertMapHasAll( a, b );
 *
 * // caught <anonymous>:3:10
 * // Object should have fields : a
 * //
 * // at _err (file:///.../wTools/staging/Base.s:3707)
 * // at assertMapHasAll (file:///.../wTools/staging/Base.s:4242)
 * // at <anonymous>:3
 *
 * @example
 * var a = { x : 0, y : 2 };
 * var b = { x : 0, d : 3};
 * wToolsxxx.assertMapHasAll( a, b, 'error msg' );
 *
 * // caught <anonymous>:4:9
 * // error msg Object should have fields : d
 * //
 * // at _err (file:///.../wTools/staging/Base.s:3707)
 * // at assertMapHasAll (file:///.../wTools/staging/Base.s:4242)
 * // at <anonymous>:3
 *
 * @function assertMapHasAll
 * @throws {Exception} If map( src ) not contains some properties from argument( all ).
 * @memberof wTools
 *
 */

function assertMapHasAll( src,all,msg )
{

  if( Config.debug === false )
  return;

  _.assert( arguments.length === 2 || arguments.length === 3 );
  _.assert( arguments.length === 2 || _.strIs( msg ) );

  var l = arguments.length;
  var hasMsg = _.strIs( arguments[ l-1 ] );
  var but = Object.keys( _.mapBut( all,src ) );

  if( but.length > 0 )
  {
    debugger;
    throw _err
    ({
      args : [ hasMsg ? arguments[ l-1 ] : '','Object should have fields :',but.join( ',' ) ],
      level : 2,
    });
  }

}

//

/**
 * Checks if map passed by argument( src ) has all properties represented in object passed by argument( all ). Checks only own properties of the objects.
 * Works only in Config.debug mode. Uses StackTrace level 2. @see wToolsxxx.err
 * If routine did not find some properties in source it generates and throws exception, otherwise returns without exception.
 * Also generates error using message passed as last argument( msg ).
 *
 * @param {Object} src - source map.
 * @param {Object} all - object to compare with.
 * @param {String} [ msgs ] - error message.
 *
 * @example
 * var a = { a : 1 };
 * var b = { a : 2 };
 * wToolsxxx.assertMapOwnAll( a, b );// no exception
 *
 * @example
 * var a = { a : 1 };
 * var b = { a : 2, b : 2 }
 * wToolsxxx.assertMapOwnAll( a, b );
 *
 * // caught <anonymous>:3:8
 * // Object should have own fields : b
 * //
 * // at _err (file:///.../wTools/staging/Base.s:3707)
 * // at assertMapHasAll (file:///.../wTools/staging/Base.s:4269)
 * // at <anonymous>:3
 *
 * @example
 * var a = { x : 0 };
 * var b = { x : 1, y : 0};
 * wToolsxxx.assertMapHasAll( a, b, 'error msg' );
 *
 * // caught <anonymous>:4:9
 * // error msg Object should have fields : y
 * //
 * // at _err (file:///.../wTools/staging/Base.s:3707)
 * // at assertMapOwnAll (file:///.../wTools/staging/Base.s:4269)
 * // at <anonymous>:3
 *
 * @function assertMapOwnAll
 * @throws {Exception} If map( src ) not contains some properties from argument( all ).
 * @memberof wTools
 *
 */

function assertMapOwnAll( src,all,msg )
{

  if( Config.debug === false )
  return;

  _.assert( arguments.length === 2 || arguments.length === 3 );
  _.assert( arguments.length === 2 || _.strIs( msg ) );

  var l = arguments.length;
  var hasMsg = _.strIs( arguments[ l-1 ] );
  var but = Object.keys( _.mapOwnBut( all,src ) );

  if( but.length > 0 )
  {
    debugger;
    throw _err
    ({
      args : [ hasMsg ? arguments[ l-1 ] : '','Object should have own fields :',but.join( ',' ) ],
      level : 2,
    });
  }

}

//

function assertInstanceOrClass( _Self,_this )
{

  _.assert( arguments.length === 2 );
  _.assert
  (
    _this === _Self ||
    _this instanceof _Self ||
    Object.isPrototypeOf.call( _Self,_this ) ||
    Object.isPrototypeOf.call( _Self,_this.prototype )
  );

}

//

function assertOwnNoConstructor( ins )
{
  _.assert( _.objectLikeOrRoutine( ins ) );
  var args = _.arraySlice( arguments );
  args.unshift( !_propertyIsEumerable.call( ins,'constructor' ) && !_hasOwnProperty.call( ins,'constructor' ) );
  _.assert.call( _,args );
}

//

function assertNotTested( src )
{

  debugger;
  _.assert( false,'not tested : ' + stack( 1 ) );

}

//

/**
 * Checks if map passed by argument( src ) has no properties represented in object(s) passed after first argument. Checks all enumerable properties.
 * Works only in debug mode. Uses StackTrace level 2. @see wToolsxxx.err
 * If routine found some properties in source it generates and throws exception, otherwise returns without exception.
 * Also generates error using message passed as last argument( msg ).
 *
 * @param {Object} src - source map.
 * @param {...Object} target - object(s) to compare with.
 * @param {String} [ msg ] - error message as last argument.
 *
 * @example
 * var a = { a : 1 };
 * var b = { b : 2 };
 * wToolsxxx.assertMapHasNone( a, b );// no exception
 *
 * @example
 * var x = { a : 1 };
 * var a = Object.create( x );
 * var b = { a : 2, b : 2 }
 * wToolsxxx.assertMapHasNone( a, b );
 *
 * // caught <anonymous>:4:8
 * // Object should have no fields : a
 * //
 * // at _err (file:///.../wTools/staging/Base.s:3707)
 * // at assertMapHasAll (file:///.../wTools/staging/Base.s:4518)
 * // at <anonymous>:4
 *
 * @example
 * var a = { x : 0, y : 1 };
 * var b = { x : 1, y : 0 };
 * wToolsxxx.assertMapHasNone( a, b, 'error msg' );
 *
 * // caught <anonymous>:3:9
 * // error msg Object should have no fields : x,y
 * //
 * // at _err (file:///.../wTools/staging/Base.s:3707)
 * // at assertMapOwnAll (file:///.../wTools/staging/Base.s:4518)
 * // at <anonymous>:3
 *
 * @function assertMapHasNone
 * @throws {Exception} If map( src ) contains some properties from other map(s).
 * @memberof wTools
 *
 */

function assertMapHasNone( src )
{

  if( Config.debug === false )
  return;

  var l = arguments.length;
  var hasMsg = _.strIs( arguments[ l-1 ] );
  var args = hasMsg ? _.arraySlice( arguments,0,l-1 ) : arguments;
  var none = _.mapScreens.apply( this,args );

  // for( var n in none )
  // {
  //   for( var a = 1 ; a < arguments.length ; a++ )
  //   if( arguments[ a ][ n ] !== src[ n ] )
  //   break;
  //   if( a === arguments.length )
  //   delete none[ n ];
  // }

  var keys = Object.keys( none );
  if( keys.length )
  {
    debugger;
    throw _err
    ({
      args : [ hasMsg ? arguments[ l-1 ] : '','Object should have no fields :', keys.join( ',' ) ],
      level : 2,
    });
  }

}

//

function assertMapOwnNone( src,none )
{

  if( Config.debug === false )
  return;

  var l = arguments.length;
  var hasMsg = _.strIs( arguments[ l-1 ] );
  if( hasMsg ) l -= 1;

  if( l > 2 )
  {
    var args =_ArraySlice.call( arguments,1,l ); debugger;
    none = _.mapCopy.apply( this,args );
  }

  var has = Object.keys( _._mapScreen
  ({
    filter : _.field.mapper.srcOwn,
    screenObjects : none,
    srcObjects : src,
  }));

  if( has.length )
  {
    debugger;
    throw _err
    ({
      args : [ hasMsg ? arguments[ l-1 ] : '','Object should have no own fields :',has.join( ',' ) ],
      level : 2,
    });
  }

}

//

/**
 * If condition failed, routine prints warning messages passed after condition argument
 * @example
  function checkAngles( a, b, c )
  {
     wToolsxxx.assertWarn( (a + b + c) === 180, 'triangle with that angles does not exists' );
  };
  checkAngles( 120, 23, 130 );

 // triangle with that angles does not exists
 * @param condition Condition to check.
 * @param messages messages to print.
 * @function assertWarn
 * @memberof wTools
 */

function assertWarn( condition )
{

  if( Config.debug )
  return;

  if( !condition )
  {
    console.warn.apply( console,[].slice.call( arguments,1 ) );
  }

}

// --
// prototype
// --

var Proto =
{

  diagnosticVariate : diagnosticVariate,

  _diagnosticStripPath : _diagnosticStripPath,
  diagnosticLocation : diagnosticLocation,
  diagnosticCode : diagnosticCode,
  diagnosticStack : diagnosticStack,
  diagnosticStackPurify : diagnosticStackPurify,
  diagnosticWatchFields : diagnosticWatchFields, /* experimental */
  diagnosticProxyFields : diagnosticProxyFields, /* experimental */

  beep : beep,

  assert : assert,
  assertWithoutBreakpoint : assertWithoutBreakpoint,
  assertMapHasNoUndefine : assertMapHasNoUndefine,
  assertMapHasOnly : assertMapHasOnly,
  assertMapHasOnlyWithUndefines : assertMapHasOnlyWithUndefines,
  assertMapOwnOnly : assertMapOwnOnly,
  assertMapHasNone : assertMapHasNone,
  assertMapOwnNone : assertMapOwnNone,
  assertMapHasAll : assertMapHasAll,
  assertMapOwnAll : assertMapOwnAll,
  assertInstanceOrClass : assertInstanceOrClass,

  assertOwnNoConstructor : assertOwnNoConstructor,

  assertNotTested : assertNotTested,
  assertWarn : assertWarn,

}

Object.assign( Self,Proto );

// --
// export
// --

if( typeof module !== 'undefined' && module !== null )
module[ 'exports' ] = Self;

})();
