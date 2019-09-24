(function _cErr_s_() {

'use strict';

let _ArraySlice = Array.prototype.slice;
let _FunctionBind = Function.prototype.bind;
let _ObjectToString = Object.prototype.toString;
let _ObjectHasOwnProperty = Object.hasOwnProperty;
let _ObjectPropertyIsEumerable = Object.propertyIsEnumerable;
let _ceil = Math.ceil;
let _floor = Math.floor;

let _global = _global_;
let _ = _global.wTools;
let _err = _._err;
let Self = _;

// --
// diagnostics
// --

let _diagnosticCodeExecuting = 0;
function diagnosticCode( o )
{

  _.routineOptions( diagnosticCode, o );
  _.assert( arguments.length === 0 || arguments.length === 1 );

  if( _diagnosticCodeExecuting )
  return;
  _diagnosticCodeExecuting += 1;

  try
  {

    if( !o.location )
    {
      if( o.error )
      o.location = _.diagnosticLocation({ error : o.error, level : o.level });
      else
      o.location = _.diagnosticLocation({ stack : o.stack, level : o.stack ? o.level : o.level+1 });
    }

    if( !_.numberIs( o.location.line ) )
    return end();

    /* */

    if( !o.sourceCode )
    {

      if( !o.location.path )
      return end();

      let codeProvider = _.codeProvider || _.fileProvider;

      if( !codeProvider )
      return end();

      try
      {

        // if( _global._starter_ )
        // debugger;
        // if( _global._starter_ )
        // _global._starter_.fileProvider.fileRead( _.weburi.parse( o.location.path ).localWebPath );
        // o.location.path = codeProvider.path.normalize( o.location.path );
        let filePath = codeProvider.path.normalize( o.location.path );
        if( codeProvider.path.isAbsolute( filePath ) )
        o.sourceCode = codeProvider.fileRead
        ({
          filePath : filePath,
          sync : 1,
          throwing : 0,
        })

      }
      catch( err )
      {
        o.sourceCode = ' ! Cant load source code of ' + _.strQuote( o.location.path );
      }

      if( !o.sourceCode )
      return end();

    }

    /* */

    let result = _.strLinesSelect
    ({
      src : o.sourceCode,
      line : o.location.line,
      numberOfLines : o.numberOfLines,
      selectMode : o.selectMode,
      zero : 1,
      number : 1,
    });

    if( result && _.strIndentation )
    result = o.identation + _.strIndentation( result, o.identation );

    if( o.withPath )
    result = o.location.full + '\n' + result;

    return end( result );

  }
  catch( err )
  {
    console.log( err.toString() );
    return;
  }

  /* */

  function end( result )
  {
    _diagnosticCodeExecuting -= 1;
    return result;
  }

}

diagnosticCode.defaults =
{
  level : 0,
  numberOfLines : 5,
  withPath : 1,
  selectMode : 'center',
  identation : '    ',
  stack : null,
  error : null,
  location : null,
  sourceCode : null,
}

//

function diagnosticBeep()
{
  console.log( '\x07' );
}

//

function diagnosticApplicationEntryPointData()
{
  let result = Object.create( null );
  if( _global.process !== undefined )
  {
    if( _global.process.argv )
    result.execPath = _global.process.argv.join( ' ' );
    if( _.routineIs( _global.process.cwd ) )
    result.currentPath = _global.process.cwd();
  }
  return result;
}

//

function diagnosticApplicationEntryPointInfo()
{
  let data = _.diagnosticApplicationEntryPointData();
  let result = '';

  if( data.currentPath )
  result = join( 'Current path', data.currentPath );
  if( data.execPath )
  result = join( 'Exec path', data.execPath );

  return result;

  /* */

  function join( left, right )
  {
    if( result )
    result += '\n';
    result += left + ' : ' + right;
    return result;
  }
}

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
  o = _.routineOptions( diagnosticWatchFields, o );

  if( o.names )
  o.names = o.names;
  // o.names = _.nameFielded( o.names );
  else
  o.names = o.target;

  _.assert( arguments.length === 1 || arguments.length === 2 );
  _.assert( _.objectLike( o.target ) );
  _.assert( _.objectLike( o.names ) );

  for( let f in o.names ) ( function()
  {

    let fieldName = f;
    let fieldSymbol = Symbol.for( f );
    //o.target[ fieldSymbol ] = o.target[ f ];
    let val = o.target[ f ];

    /* */

    function read()
    {
      //let result = o.target[ fieldSymbol ];
      let result = val;
      if( o.verbosity > 1 )
      console.log( 'reading ' + fieldName + ' ' + _.toStr( result ) );
      else
      console.log( 'reading ' + fieldName );
      if( o.debugging > 1 )
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
      if( o.debugging )
      debugger;
      //o.target[ fieldSymbol ] = src;
      val = src;
    }

    /* */

    if( o.debugging > 1 )
    debugger;

    if( o.verbosity > 1 )
    console.log( 'watching for', fieldName, 'in', o.target );
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
  debugging : 1,
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
  o = _.routineOptions( diagnosticWatchFields, o );

  // if( o.names )
  // o.names = _.nameFielded( o.names );

  _.assert( arguments.length === 1 || arguments.length === 2 );
  _.assert( _.objectLike( o.target ) );
  _.assert( _.objectLike( o.names ) || o.names === null );

  let handler =
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

  let result = new Proxy( o.target, handler );
  if( o.verbosity > 1 )
  console.log( 'watching for', o.target );

  if( o.debug )
  debugger;

  return result;
}

diagnosticProxyFields.defaults =
{
}

diagnosticProxyFields.defaults.__proto__ == diagnosticWatchFields.defaults

//

function diagnosticEachLongType( o )
{
  let result = Object.create( null );

  if( _.routineIs( o ) )
  o = { onEach : o }
  o = _.routineOptions( diagnosticEachLongType, o );

  if( o.onEach === null )
  o.onEach = function onEach( make, descriptor )
  {
    return make;
  }

  _.assert( arguments.length === 0 || arguments.length === 1 );
  _.assert( _.routineIs( o.onEach ) )

  // debugger;

  for( let l in _.LongDescriptor )
  {
    let Long = _.LongDescriptor[ l ];
    result[ Long.name ] = o.onEach( Long.make, Long );
  }

  // debugger;

  return result;
}

diagnosticEachLongType.defaults =
{
  onEach : null,
}

//

function diagnosticEachElementComparator( o )
{
  let result = [];

  if( arguments[ 1 ] !== undefined )
  o = { onMake : arguments[ 0 ], onEach : arguments[ 1 ] }
  else if( _.routineIs( arguments[ 0 ] ) )
  o = { onEach : arguments[ 1 ] }

  o = _.routineOptions( diagnosticEachElementComparator, o );

  if( o.onEach === null )
  o.onEach = function onEach( make, evaluate, description )
  {
    return evaluate;
  }

  if( o.onMake === null )
  o.onMake = function onMake( src )
  {
    return src;
  }

  _.assert( arguments.length === 1 || arguments.length === 2 );
  _.assert( _.routineIs( o.onEach ) );
  _.assert( _.routineIs( o.onMake ) );

  result.push( o.onEach( o.onMake, undefined, 'no evaluator' ) );
  result.push( o.onEach( make, evaluator, 'evaluator' ) );
  result.push( o.onEach( make, [ evaluator, evaluator ], 'tandem of evaluators' ) );
  result.push( o.onEach( make, equalizer, 'equalizer' ) );

  return result;

  /* */

  function evaluator( e )
  {
    _.assert( e.length === 1 );
    return e[ 0 ];
  }

  /* */

  function equalizer( e1, e2 )
  {
    _.assert( e1.length === 1 );
    _.assert( e2.length === 1 );
    return e1[ 0 ] === e2[ 0 ];
  }

  /* */

  function make( long )
  {
    _.assert( _.longIs( long ) );
    let result = [];
    for( let l = 0 ; l < long.length ; l++ )
    result[ l ] = [ long[ l ] ];
    return o.onMake( result );
  }

}

diagnosticEachElementComparator.defaults =
{
  onMake : null,
  onEach : null,
}

//

function diagnosticsStructureGenerate( o )
{
  _.assert( arguments.length === 1 )
  _.routineOptions( diagnosticsStructureGenerate, o );
  _.assert( _.numberIs( o.breadth ) );
  _.assert( _.numberIs( o.depth ) );
  _.assert( o._pre === null || _.routineIs( o._pre ) );

  /* qqq: pre */

  /**/

  let depth = 0;

  o.structure = structureMake();
  o.size = _.entitySize( o.structure );

  // console.log( 'entitySize:', _.strMetricFormatBytes( o.size ) );

  return o;

  /*  */

  function structureMake()
  {
    let currentLevel = Object.create( null );

    let string = _.strDup( 'a', o.stringSize || o.fieldSize );

    if( o.boolean || o.primitive )
    currentLevel[ 'boolean' ] = true;

    if( o.number || o.primitive )
    currentLevel[ 'number' ] = 0;

    if( o.signedNumber || o.primitive > 2 )
    {
      currentLevel[ '-0' ] = -0;
      currentLevel[ '+0' ] = +0;
    }

    if( o.string || o.primitive )
    currentLevel[ 'string' ] = string;

    if( o.null || o.primitive > 1 )
    currentLevel[ 'null' ] = null;

    if( o.infinity || o.primitive > 1 )
    {
      currentLevel[ '+infinity' ] = +Infinity;
      currentLevel[ '-infinity' ] = -Infinity;
    }

    if( o.nan || o.primitive > 1 )
    currentLevel[ 'nan' ] = NaN;

    if( o.undefined || o.primitive > 2 )
    currentLevel[ 'undefined' ] = undefined;

    if( o.date || o.primitive > 2 )
    currentLevel[ 'date' ] = new Date();

    if( o.bigInt || o.primitive > 2 )
    if( typeof BigInt !== 'undefined' )
    currentLevel[ 'bigInt' ] = BigInt( 1 );

    if( o.regexp )
    {
      currentLevel[ 'regexp1'] = /ab|cd/,
      currentLevel[ 'regexp2'] = /a[bc]d/,
      currentLevel[ 'regexp3'] = /ab{1, }bc/,
      currentLevel[ 'regexp4'] = /\.js$/,
      currentLevel[ 'regexp5'] = /.regexp/
    }

    if( o.regexpComplex || o.regexp > 1 )
    {
      currentLevel[ 'complexRegexp0' ] = /^(?:(?!ab|cd).)+$/gm,
      currentLevel[ 'complexRegexp1' ] = /\/\*[\s\S]*?\*\/|\/\/.*/g,
      currentLevel[ 'complexRegexp2' ] = /^[1-9]+[0-9]*$/gm,
      currentLevel[ 'complexRegexp3' ] = /aBc/i,
      currentLevel[ 'complexRegexp4' ] = /^\d+/gm,
      currentLevel[ 'complexRegexp5' ] = /^a.*c$/g,
      currentLevel[ 'complexRegexp6' ] = /[a-z]/m,
      currentLevel[ 'complexRegexp7' ] = /^[A-Za-z0-9]$/
    }

    // let bufferSrc = _.longFillTimes( [], o.bufferSize || o.fieldSize, 0 );
    let bufferSrc = _.longFill( [], 0, [ 0, o.bufferSize || o.fieldSize ] );

    if( o.bufferNode || o.buffer && o.buffer !== 2 )
    if( typeof BufferNode !== 'undefined' )
    currentLevel[ 'bufferNode'] = BufferNode.from( bufferSrc );

    if( o.bufferRaw || o.buffer )
    currentLevel[ 'bufferRaw'] = new BufferRaw( bufferSrc );

    if( o.bufferBytes || o.buffer && o.buffer !== 2)
    currentLevel[ 'bufferBytes'] = new U8x( bufferSrc );

    if( o.map || o.structure )
    {
      let map = currentLevel[ 'map' ] = { 0 : string, 1 : 1, 2 : true  };
      if( o.mapSize )
      currentLevel[ 'map' ] = mapForSize( map, [ 0, 3 ] );
    }

    if( o.mapComplex || o.structure > 1 )
    {
      let map = currentLevel[ 'mapComplex' ] = { 0 : '1', 1 : { b : 2 }, 2 : [ 1, 2, 3 ] };
      if( o.mapSize )
      currentLevel[ 'mapComplex' ] = mapForSize( map, [ 0, 3 ] );
    }

    if( o.array || o.structure )
    currentLevel[ 'array' ] = _.longFill( [], 0, [ 0, o.arraySize || o.fieldSize ] )
    // currentLevel[ 'array' ] = _.longFillTimes( [], o.arraySize || o.fieldSize, 0 )

    if( o.arrayComplex || o.structure > 1 )
    {
      let src = { a : '1', dir : { b : 2 }, c : [ 1, 2, 3 ] }
      // currentLevel[ 'arrayComplex' ] = _.longFillTimes( [], o.arraySize || o.fieldSize, src )
      currentLevel[ 'arrayComplex' ] = _.longFill( [], src, [ 0, o.arraySize || o.fieldSize ] )
    }

    if( o.recursion || o.structure > 2 )
    {
      currentLevel.recursion = currentLevel;
    }

    var srcMap = _.mapExtend( null, currentLevel );

    /**/

    for( var b = 0; b < o.breadth; b++ )
    {
      currentLevel[ 'breadth' + b ] = _.mapExtend( null, srcMap );
    }

    /*  */

    if( depth < o.depth - 1 )
    {
      depth += 1;
      currentLevel[ 'depth' + depth ] = structureMake();
    }

    return currentLevel;

    /*  */

    function mapForSize( src, range )
    {
      let map = {};
      for( var i = 0; i < o.mapSize; i++ )
      {
        let k = _.numberRandomInt( range );
        map[ i ] = src[ k ];
      }
      return map;
    }
  }

}

diagnosticsStructureGenerate.defaults =
{
  _pre : null,
  depth : null,
  breadth : null,

  /**/

  boolean : null,
  number : null,
  signedNumber : null,
  string : null,
  null : null,
  infinity : null,
  nan : null,
  undefined : null,
  date : null,
  bigInt : null,

  regexp : null,
  regexpComplex : null,

  bufferNode : null,
  bufferRaw : null,
  bufferBytes : null,

  array : null,
  arrayComplex : null,
  map : null,
  mapComplex : null,

  /*  */

  primitive : null,
  buffer : null,
  structure : null,

  /* */

  stringSize : null,
  bufferSize : null,
  regexpSize : null,
  arraySize : null,
  mapSize : null,

  fieldSize : 50

}

// --
// checker
// --

function isInstanceOrClass( _constructor, _this )
{
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  debugger;
  let result =
  (
    _this === _constructor ||
    _this instanceof _constructor ||
    Object.isPrototypeOf.call( _constructor,_this ) ||
    Object.isPrototypeOf.call( _constructor,_this.prototype )
  );
  return result;
}

//

function isOwnNoConstructor( ins )
{
  _.assert( _.objectLikeOrRoutine( ins ) );
  _.assert( arguments.length === 1 );
  let result = !_ObjectHasOwnProperty.call( ins,'constructor' );
  return result;
}

//

function sureInstanceOrClass( _constructor, _this )
{
  _.sure( arguments.length === 2, 'Expects exactly two arguments' );
  _.sure( _.isInstanceOrClass( _constructor, _this ) );
}

//

function sureOwnNoConstructor( ins )
{
  _.sure( _.objectLikeOrRoutine( ins ) );
  // let args = _.longSlice( arguments );
  let args = Array.prototype.slice.call( arguments );
  args[ 0 ] = _.isOwnNoConstructor( ins );
  _.sure.apply( _, args );
}

//

function assertInstanceOrClass( _constructor, _this )
{
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  _.assert( _.isInstanceOrClass( _constructor, _this ) );
}

//

function assertOwnNoConstructor( ins )
{
  _.assert( _.objectLikeOrRoutine( ins ) );
  // let args = _.longSlice( arguments );
  let args = Array.prototype.slice.call( arguments );
  args[ 0 ] = _.isOwnNoConstructor( ins );

  if( args.length === 1 )
  args.push( () => 'Entity should not own constructor, but own ' + _.toStrShort( ins ) );

  _.assert.apply( _, args );
}

// --
// errrors
// --

let ErrorAbort = _.error_functor( 'ErrorAbort' );

// --
// declare
// --

let error =
{
  ErrorAbort,
}

let Extend =
{

  diagnosticCode,
  diagnosticBeep,

  diagnosticApplicationEntryPointData,
  diagnosticApplicationEntryPointInfo,

  diagnosticWatchFields, /* experimental */
  diagnosticProxyFields, /* experimental */
  diagnosticEachLongType,
  diagnosticEachElementComparator,

  diagnosticsStructureGenerate,

  // checker

  isInstanceOrClass,
  isOwnNoConstructor,

  // sure

  sureInstanceOrClass,
  sureOwnNoConstructor,

  // assert

  assertInstanceOrClass,
  assertOwnNoConstructor,

}

Object.assign( Self, Extend );
Object.assign( Self.error, error );

// --
// export
// --

if( typeof module !== 'undefined' && module !== null )
module[ 'exports' ] = Self;

})();
