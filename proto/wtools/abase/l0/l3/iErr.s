( function _iErr_s_()
{

'use strict';

let _global = _global_;
let _ = _global_.wTools;
let Self = _global_.wTools;

_global.wTools.error = _global.wTools.error || Object.create( null );

// --
// error
// --

function errIs( src )
{
  return src instanceof Error || Object.prototype.toString.call( src ) === '[object Error]';
}

//

function errIsStandard( src )
{
  if( !_.errIs( src ) )
  return false;
  return src.originalMessage !== undefined;
}

//

function errIsAttended( src )
{
  if( !_.errIs( src ) )
  return false;
  return !!src.attended;
}

//

function errIsLogged( src )
{
  if( _.errIs( src ) === false )
  return false;
  return !!src.logged;
}

//

function errIsSuspended( src )
{
  if( _.errIs( src ) === false )
  return false;
  return !!src.suspended;
}

//

function errIsWary( src )
{
  if( _.errIs( src ) === false )
  return false;
  return !!src.wary;
}

//

function errIsBrief( src )
{
  if( !_.errIs( src ) )
  return false;
  return !!src.brief;
}

//

function errIsProcess( src )
{
  if( !_.errIs( src ) )
  return false;
  return !!src.isProcess;
}

//

function errReason( err, reason )
{

  if( arguments.length === 1 )
  {
    return err.reason;
  }
  else if( arguments.length === 2 )
  {
    nonenumerable( 'reason', reason );
    return err.reason;
  }

  throw Error( 'Expects one or two argument' );

  /* */

  function nonenumerable( fieldName, value )
  {
    try
    {
      let o =
      {
        enumerable : false,
        configurable : true,
        writable : true,
        value,
      };
      Object.defineProperty( err, fieldName, o );
    }
    catch( err2 )
    {
      console.error( err2 );
    }
  }

}

//

function errOriginalMessage( err )
{

  if( arguments.length !== 1 )
  throw Error( 'errOriginalMessage : Expects single argument' );

  if( _.strIs( err ) )
  return err;

  if( !err )
  return;

  if( err.originalMessage )
  return err.originalMessage;

  let message = err.message;

  if( !message && message !== '' )
  message = err.msg;
  if( !message && message !== '' )
  message = err.name;

  if( _.mapFields )
  {
    let fields = _.mapFields( err );
    if( Object.keys( fields ).length )
    message += '\n' + _.toStr( fields, { wrap : 0, multiline : 1, levels : 2 } );
  }

  return message;
}

//

function errOriginalStack( err )
{

  if( arguments.length !== 1 )
  throw Error( 'errOriginalStack : Expects single argument' );

  if( !_.errIs( err ) )
  throw Error( 'errOriginalStack : Expects error' );

  if( err.throwCallsStack )
  return err.throwCallsStack;

  if( err.combinedStack )
  return err.combinedStack;

  if( err[ stackSymbol ] )
  return err[ stackSymbol ];

  if( err.stack )
  return _.introspector.stack( err.stack );

  /* should return null if nothing found */
  return null;
}

//

function _errMake( o )
{

  if( arguments.length !== 1 )
  throw Error( 'Expects single argument : options map' );

  if( !_.mapIs( o ) )
  throw Error( 'Expects single argument : options map' );

  for( let e in o )
  {
    if( _errMake.defaults[ e ] === undefined )
    {
      throw Error( `Unknown option::${e}` );
    }
  }

  for( let e in _errMake.defaults )
  {
    if( o[ e ] === undefined )
    o[ e ] = _errMake.defaults[ e ];
  }

  if( !_.errIs( o.dstError ) )
  throw Error( 'Expects option.dstError:Error' );

  if( !_.strIs( o.originalMessage ) )
  throw Error( 'Expects option.originalMessage:String' );

  if( !_.strIs( o.combinedStack ) )
  throw Error( 'Expects option.combinedStack:String' );

  if( !_.strIs( o.throwCallsStack ) )
  throw Error( 'Expects option.throwCallsStack:String' );

  if( !_.strIs( o.throwsStack ) )
  throw Error( 'Expects option.throwsStack:String' );

  if( !o.throwLocation )
  throw Error( 'Expects option.throwLocation:Location' );

  attributesForm();
  sectionsForm();
  messageForm();
  fieldsForm();

  return o.dstError;

  /* */

  function attributesForm()
  {

    if( o.attended === null || o.attended === undefined )
    o.attended = o.dstError.attended;
    o.attended = !!o.attended;

    if( o.logged === null || o.logged === undefined )
    o.logged = o.dstError.logged;
    o.logged = !!o.logged;

    if( o.brief === null || o.brief === undefined )
    o.brief = o.dstError.brief;
    o.brief = !!o.brief;

    if( o.isProcess === null || o.isProcess === undefined )
    o.isProcess = o.dstError.isProcess;
    o.isProcess = !!o.isProcess;

    if( o.debugging === null || o.debugging === undefined )
    o.debugging = o.dstError.debugging;
    o.debugging = !!o.debugging;

    if( o.reason === null || o.reason === undefined )
    o.reason = o.dstError.reason;

    let sections = o.dstError.section || Object.create( null );
    if( o.sections )
    _.mapExtend( sections, o.sections );
    o.sections = sections;

    o.id = o.dstError.id;
    if( !o.id )
    {
      _.error._errorCounter += 1;
      o.id = _.error._errorCounter;
    }

  }

  /* */

  function sectionsForm()
  {
    let result = '';

    sectionWrite( 'message', `Message of error#${o.id}`, o.originalMessage );
    sectionWrite( 'combinedStack', o.stackCondensing ? 'Beautified calls stack' : 'Calls stack', o.combinedStack );
    sectionWrite( 'throwsStack', `Throws stack`, o.throwsStack );

    /* xxx : remove isProcess */
    if( o.isProcess && _.process && _.process.entryPointInfo )
    sectionWrite( 'process', `Process`, _.process.entryPointInfo() );

    if( o.sourceCode )
    if( _.strIs( o.sourceCode ) )
    sectionWrite( 'sourceCode', `Source code`, o.sourceCode );
    else if( _.routineIs( o.sourceCode.read ) )
    sectionWrite( 'sourceCode', `Source code from ${o.sourceCode.path}`, o.sourceCode.read );
    else if( _.strIs( o.sourceCode.code ) )
    sectionWrite( 'sourceCode', `Source code from ${o.sourceCode.path}`, o.sourceCode.code );
    else
    console.error( 'Unknown format of {- o.sourceCode -}' );

    for( let s in o.sections )
    {
      let section = o.sections[ s ];
      if( !_.strIs( section.head ) )
      {
        logger.error( `Each section of an error should have head, but head of section::${s} is ${_.strType(section.head)}` );
        delete o.sections[ s ];
      }
      if( !_.strIs( section.body ) )
      {
        logger.error( `Each section of an error should have body, but body of section::${s} is ${_.strType(section.body)}` );
        delete o.sections[ s ];
      }
    }

    return result;
  }

  /* */

  function sectionWrite( name, head, body )
  {
    let section = { head, body };
    o.sections[ name ] = section;
    return section;
  }

  /* */

  function strLinesIndentation( str, indentation )
  {
    if( _.strLinesIndentation )
    return indentation + _.strLinesIndentation( str, indentation );
    else
    return str;
  }

  /* */

  function messageForm()
  {
    let result = '';

    if( o.brief )
    {
      result += o.originalMessage;
    }
    else
    {

      for( let s in o.sections )
      {
        let section = o.sections[ s ];
        let head = section.head || '';
        let body = strLinesIndentation( section.body, '    ' );
        if( !body.trim().length )
        continue;
        result += ` = ${head}\n${body}\n\n`;
      }

    }

    o.message = result;
    return result;
  }

  /* */

  function fieldsForm()
  {

    nonenumerable( 'message', o.message );
    nonenumerable( 'originalMessage', o.originalMessage );
    logging( 'stack', o.message );
    nonenumerable( 'reason', o.reason );

    nonenumerable( 'combinedStack', o.combinedStack );
    nonenumerable( 'throwCallsStack', o.throwCallsStack );
    nonenumerable( 'asyncCallsStack', o.asyncCallsStack );
    nonenumerable( 'throwsStack', o.throwsStack );
    nonenumerable( 'catchCounter', o.dstError.catchCounter ? o.dstError.catchCounter+1 : 1 );

    nonenumerable( 'attended', o.attended );
    nonenumerable( 'logged', o.logged );
    nonenumerable( 'brief', o.brief );
    nonenumerable( 'isProcess', o.isProcess );

    if( o.throwLocation.line !== undefined )
    nonenumerable( 'lineNumber', o.throwLocation.line );
    if( o.dstError.throwLocation === undefined )
    nonenumerable( 'location', o.throwLocation );
    nonenumerable( 'sourceCode', o.sourceCode || null );
    nonenumerable( 'debugging', o.debugging );
    nonenumerable( 'id', o.id );

    nonenumerable( 'toString', function() { return this.stack } );
    nonenumerable( 'sections', o.sections );

    o.dstError[ Symbol.for( 'nodejs.util.inspect.custom' ) ] = o.dstError.toString;

    if( o.debugging )
    debugger;

  }

  /* */

  function nonenumerable( fieldName, value )
  {
    try
    {
      let o2 =
      {
        enumerable : false,
        configurable : true,
        writable : true,
        value,
      };
      Object.defineProperty( o.dstError, fieldName, o2 );
    }
    catch( err2 )
    {
      console.error( err2 );
    }
  }

  /* */

  function logging( fieldName, value )
  {
    let symbol = Symbol.for( fieldName );
    try
    {
      let o2 =
      {
        enumerable : false,
        configurable : true,
        get,
        set,
      };
      nonenumerable( symbol, value );
      Object.defineProperty( o.dstError, fieldName, o2 );
    }
    catch( err2 )
    {
      console.error( err2 );
    }
    function get()
    {
      // if( this.id === 1 )
      // {
      //   console.log( `logging error#${this.id}` );
      //   console.log( _.introspector.stack() );
      // }
      _.errLogged( this );
      _.errAttend( this );
      return this[ symbol ];
    }
    function set( src )
    {
      this[ symbol ] = src;
      return src;
    }
  }

}

_errMake.defaults =
{

  dstError : null,
  id : null,
  throwLocation : null,
  sections : null,

  attended : null,
  logged : null,
  brief : null,
  isProcess : null,
  debugging : null,
  stackCondensing : null,

  originalMessage : null,
  combinedStack : '',
  throwCallsStack : '',
  throwsStack : '',
  asyncCallsStack : '',
  sourceCode : null,
  reason : null,

}

//

/**
 * Creates Error object based on passed options.
 * Result error contains in message detailed stack trace and error description.
 * @param {Object} o Options for creating error.
 * @param {String[]|Error[]} o.args array with messages or errors objects, from which will be created Error obj.
 * @param {number} [o.level] using for specifying in error message on which level of stack trace was caught error.
 * @returns {Error} Result Error. If in `o.args` passed Error object, result will be reference to it.
 * @private
 * @throws {Error} Expects single argument if pass les or more than one argument
 * @throws {Error} o.args should be array like, if o.args is not array.
 * @function _err
 * @namespace Tools
 */

/*
xxx : maybe use customInspectSymbol
*/

function _err( o )
{
  let dstError;

  if( arguments.length !== 1 )
  throw Error( '_err : Expects single argument : options map' );

  if( !_.mapIs( o ) )
  throw Error( '_err : Expects single argument : options map' );

  if( !_.longIs( o.args ) )
  throw Error( '_err : Expects Long option::args' );

  for( let e in o )
  {
    if( _err.defaults[ e ] === undefined )
    {
      throw Error( `Unknown option::${e}` );
    }
  }

  for( let e in _err.defaults )
  {
    if( o[ e ] === undefined )
    o[ e ] = _err.defaults[ e ];
  }

  if( _.error._errorMaking )
  {
    throw Error( 'Recursive dead lock because of error inside of routine _err()!' );
  }
  _.error._errorMaking = true;

  if( o.level === undefined || o.level === null )
  o.level = null;

  /* let */

  if( !o.message )
  o.message = '';
  // let originalMessage = '';
  let fallBackMessage = '';
  let errors = [];
  let combinedStack = '';
  // let message = null;

  if( o.args[ 0 ] === 'not implemented' || o.args[ 0 ] === 'not tested' || o.args[ 0 ] === 'unexpected' )
  if( _.error.breakpointEnabled )
  debugger;
  if( _global_.debugger )
  debugger;

  /* algorithm */

  try
  {

    argumentsPreprocessArguments();
    argumentsPreprocessErrors();
    locationForm();
    stackAndErrorForm();
    attributesForm();
    catchesForm();
    sourceCodeForm();
    originalMessageForm();

    dstError = _._errMake
    ({
      dstError,
      throwLocation : o.throwLocation,
      sections : o.sections,

      attended : o.attended,
      logged : o.logged,
      brief : o.brief,
      isProcess : o.isProcess,
      debugging : o.debugging,
      stackCondensing : o.stackCondensing,

      originalMessage : o.message,
      combinedStack,
      throwCallsStack : o.throwCallsStack,
      throwsStack : o.throwsStack,
      asyncCallsStack : o.asyncCallsStack,
      sourceCode : o.sourceCode,
      reason : o.reason,
    });

  }
  catch( err2 )
  {
    _.error._errorMaking = false;
    console.log( err2.message );
    console.log( err2.stack );
  }
  _.error._errorMaking = false;

  return dstError;

  /* */

  function argumentsPreprocessArguments()
  {

    for( let a = 0 ; a < o.args.length ; a++ )
    {
      let arg = o.args[ a ];

      if( !_.errIs( arg ) && _.routineIs( arg ) )
      {
        if( arg.length === 0 )
        {
          try
          {
            arg = o.args[ a ] = arg();
          }
          catch( err )
          {
            let original = arg;
            arg = o.args[ a ] = 'Error throwen by callback for formatting of error string';
            console.error( String( err ) );
            if( _.strLinesSelect ) /* qqq xxx : make sure it works and cover */
            console.error( _.strLinesSelect
            ({
              src : original.toString(),
              line : 0,
              nearestLines : 5,
              numbering : 1,
            }));
            else
            console.error( original.toString() );
          }
        }
        if( _.unrollIs( arg ) )
        {
          o.args = _.longBut( o.args, [ a, a+1 ], arg );
          a -= 1;
          continue;
        }
      }

    }

  }

  /* */

  function argumentsPreprocessErrors()
  {

    for( let a = 0 ; a < o.args.length ; a++ )
    {
      let arg = o.args[ a ];

      if( _.errIs( arg ) )
      {

        errProcess( arg );
        o.args[ a ] = _.errOriginalMessage( arg )

      }
      else if( _.strIs( arg ) && _.errInStr( arg ) )
      {

        let err = _.errFromStr( arg );
        errProcess( err );
        o.args[ a ] = _.errOriginalMessage( err );

      }

    }

  }

  /* */

  function errProcess( arg )
  {

    if( !dstError )
    {
      dstError = arg;
      if( !o.sourceCode )
      o.sourceCode = arg.sourceCode || null;
      if( o.attended === null )
      o.attended = arg.attended || false;
      if( o.logged === null )
      o.logged = arg.logged || false;
    }

    if( arg.throwCallsStack )
    if( !o.throwCallsStack )
    o.throwCallsStack = arg.throwCallsStack;

    // if( arg.asyncCallsStack )
    // if( !o.asyncCallsStack )
    // o.asyncCallsStack = arg.asyncCallsStack;

    if( arg.throwsStack )
    if( o.throwsStack )
    o.throwsStack += '\n' + arg.throwsStack;
    else
    o.throwsStack = arg.throwsStack;

    if( arg.constructor )
    fallBackMessage = fallBackMessage || arg.constructor.name;
    errors.push( arg );

  }

  /* */

  function locationForm()
  {

    if( !dstError )
    for( let a = 0 ; a < o.args.length ; a++ )
    {
      let arg = o.args[ a ];
      if( !_.primitiveIs( arg ) && _.objectLike( arg ) )
      try
      {
        o.throwLocation = _.introspector.location
        ({
          error : arg,
          location : o.throwLocation,
        });
      }
      catch( err2 )
      {
        console.error( err2 );
      }
    }

    o.throwLocation = o.throwLocation || Object.create( null );
    o.catchLocation = o.catchLocation || Object.create( null );

  }

  /* */

  function stackAndErrorForm()
  {

    if( dstError )
    {

      /* qqq : cover each if-branch. ask how to. *difficult problem* */

      if( !o.throwCallsStack )
      if( o.throwLocation )
      o.throwCallsStack = _.introspector.locationToStack( o.throwLocation );
      if( !o.throwCallsStack )
      o.throwCallsStack = _.errOriginalStack( dstError );
      if( !o.throwCallsStack )
      o.throwCallsStack = _.introspector.stack([ ( o.level || 0 ) + 1, Infinity ]);

      if( !o.catchCallsStack && o.catchLocation )
      o.catchCallsStack = _.introspector.locationToStack( o.catchLocation );
      if( !o.catchCallsStack )
      o.catchCallsStack = _.introspector.stack( o.catchCallsStack, [ ( o.level || 0 ) + 1, Infinity ] );

      if( !o.throwCallsStack && o.catchCallsStack )
      o.throwCallsStack = o.catchCallsStack;
      if( !o.throwCallsStack )
      o.throwCallsStack = _.introspector.stack( dstError, [ ( o.level || 0 ) + 1, Infinity ] );

      o.level = 0;

    }
    else
    {

      dstError = new Error( o.message + '\n' );
      if( o.throwCallsStack )
      {
        dstError.stack = o.throwCallsStack;
        o.catchCallsStack = _.introspector.stack( o.catchCallsStack, [ o.level + 1, Infinity ] );
        o.level = 0;
      }
      else
      {
        if( o.catchCallsStack )
        {
          o.throwCallsStack = dstError.stack = o.catchCallsStack;
        }
        else
        {
          if( o.level === undefined || o.level === null )
          o.level = 1;
          o.level += 1;
          o.throwCallsStack = dstError.stack = _.introspector.stack( dstError.stack, [ o.level, Infinity ] );
        }
        o.level = 0;
        if( !o.catchCallsStack )
        o.catchCallsStack = o.throwCallsStack;
      }

    }

    _.assert( o.level === 0 );

    if( ( o.stackRemovingBeginIncluding || o.stackRemovingBeginExcluding ) && o.throwCallsStack )
    o.throwCallsStack = _.introspector.stackRemoveLeft
    (
      o.throwCallsStack, o.stackRemovingBeginIncluding || null, o.stackRemovingBeginExcluding || null
    );

    if( !o.throwCallsStack )
    o.throwCallsStack = dstError.stack = o.fallBackStack;

    combinedStack = o.throwCallsStack;

    _.assert
    (
      dstError.asyncCallsStack === undefined
      || dstError.asyncCallsStack === null
      || dstError.asyncCallsStack === ''
      || _.arrayIs( dstError.asyncCallsStack )
    );
    if( dstError.asyncCallsStack && dstError.asyncCallsStack.length )
    {
      o.asyncCallsStack = o.asyncCallsStack || [];
      _.arrayAppendArray( o.asyncCallsStack, dstError.asyncCallsStack );
    }

    if( o.asyncCallsStack === null || o.asyncCallsStack === undefined )
    if( _.Procedure && _.Procedure.ActiveProcedure )
    o.asyncCallsStack = [ _.Procedure.ActiveProcedure.stack() ];

    _.assert( o.asyncCallsStack === null || _.arrayIs( o.asyncCallsStack ) );
    if( o.asyncCallsStack && o.asyncCallsStack.length )
    {
      combinedStack += '\n\n' + o.asyncCallsStack.join( '\n\n' );
    }

    _.assert( _.strIs( combinedStack ) );
    if( o.stackCondensing )
    combinedStack = _.introspector.stackCondense( combinedStack );

  }

  /* */

  function attributesForm()
  {

    try
    {
      o.catchLocation = _.introspector.location
      ({
        stack : o.catchCallsStack,
        location : o.catchLocation,
      });
    }
    catch( err2 )
    {
      console.error( err2 );
    }

    try
    {
      o.throwLocation = _.introspector.location
      ({
        error : dstError,
        stack : o.throwCallsStack,
        location : o.throwLocation,
      });
    }
    catch( err2 )
    {
      console.error( err2 );
    }

  }

  /* */

  function catchesForm()
  {

    if( o.throws )
    {
      _.assert( _.arrayIs( o.throws ) );
      o.throws.forEach( ( c ) =>
      {
        c = _.introspector.locationFromStackFrame( c ).routineFilePathLineCol;
        if( o.throwsStack )
        o.throwsStack += `\nthrown at ${c}`;
        else
        o.throwsStack = `thrown at ${c}`;
      });
    }

    _.assert( _.numberIs( o.catchLocation.abstraction ) );
    if( !o.catchLocation.abstraction || o.catchLocation.abstraction === 1 )
    {
      if( o.throwsStack )
      o.throwsStack += `\nthrown at ${o.catchLocation.routineFilePathLineCol}`;
      else
      o.throwsStack = `thrown at ${o.catchLocation.routineFilePathLineCol}`;
    }

  }

  /* */

  function sourceCodeForm()
  {

    if( !o.usingSourceCode )
    return;

    if( o.sourceCode )
    return;

    if( dstError.sourceCode === undefined )
    {
      let c = _.introspector.code
      ({
        location : o.throwLocation,
        sourceCode : o.sourceCode,
        asMap : 1,
      });
      if( c && c.code && c.code.length < 400 )
      {
        o.sourceCode = c;
      }
    }

  }

  /* */

  function originalMessageForm()
  {
    let multiline = false; // Dmytro : this option is not used in code
    let result = [];

    if( o.message )
    return;

    for( let a = 0 ; a < o.args.length ; a++ )
    {
      let arg = o.args[ a ];
      let str;

      if( arg && !_.primitiveIs( arg ) )
      {

        if( _.primitiveIs( arg ) ) // Dmytro : unnecessary condition, see above
        {
          str = String( arg );
        }
        else if( _.routineIs( arg.toStr ) )
        {
          str = arg.toStr();
        }
        else if( _.errIs( arg ) && _.strIs( arg.originalMessage ) )
        {
          str = arg.originalMessage;
        }
        else if( _.errIs( arg ) )
        {
          if( _.strIs( arg.originalMessage ) ) // Dmytro : duplicates condition above
          str = arg.originalMessage;
          else if( _.strIs( arg.message ) )
          str = arg.message;
          else
          str = _.toStr( arg );
        }
        else
        {
          str = _.toStr( arg, { levels : 2 } );
        }
      }
      else if( arg === undefined )
      {
        str = '\n' + String( arg ) + '\n';
      }
      else
      {
        str = String( arg );
      }

      let currentIsMultiline = _.strHas( str, '\n' );
      if( currentIsMultiline )
      multiline = true;

      result[ a ] = str;

    }

    // for( let a = 0 ; a < result.length ; a++ )
    // {
    //   let str = result[ a ];
    //
    //   if( !o.message.replace( /\s*/m, '' ) )
    //   {
    //     o.message = str;
    //   }
    //   else if( _.strEnds( o.message, '\n' ) || _.strBegins( str, '\n' ) )
    //   {
    //     // o.message = o.message.replace( /\s+$/m, '' ) + '\n' + str; /* Dmytro : this is task, this line affects manual formatting of error message */
    //     o.message += str;
    //   }
    //   else
    //   {
    //     o.message = o.message.replace( /\x20+$/m, '' ) + ' ' + str.replace( /^\x20+/m, '' );
    //     // o.message = o.message.replace( /\s+$/m, '' ) + ' ' + str.replace( /^\s+/m, '' );
    //   }
    //
    // }

    let a = 0;
    while( !o.message.replace( /\s*/m, '' ) && a < result.length ) /* Dmytro : to remove redundant statement 'if' in main loop */
    {
      o.message = errStrFormat( result[ a ] );
      a += 1;
    }

    for( ; a < result.length ; a++ )
    {
      let str = errStrFormat( result[ a ] );

      if( str === '' )
      continue;

      if( _.strEnds( o.message, '\n' ) )
      {
        if( !_.strBegins( str, '\n' ) )
        o.message += str;
        else
        o.message = strConcatenateCounting( o.message, str );
      }
      else
      {
        if( _.strBegins( str, '\n' ) )
        o.message += str;
        else
        o.message += ' ' + str;
      }
    }


    /*
      remove redundant spaces at the begin and the end of lines
    */

    o.message = o.message || fallBackMessage || 'UnknownError';
    // o.message = o.message.replace( /^\x20*\n/m, '' ); /* Dmytro : this is task, this lines affect manual formatting of error message */
    // o.message = o.message.replace( /\x20*\n$/m, '' );

    // o.message = o.message.replace( /^\x20*/gm, '' );
    o.message = o.message.replace( /^\s*/, '' );
    o.message = o.message.replace( /\x20*$/gm, '' );
    o.message = o.message.replace( /\s*$/, '' );

  }

  /* */

  function errStrFormat( str )
  {
    if( _.strBegins( str, /\x20/ ) )
    str = _.strRemoveBegin( str, /\x20+/ );
    if( _.strEnds( str, /\x20$/ ) )
    str = _.strRemoveEnd( str, /\x20+$/ );

    if( _.strBegins( str, /\n/ ) )
    {
      let splitsAfter = _.strIsolateLeftOrAll( str, /\S/ );
      if( splitsAfter[ 1 ] )
      {
        let splitsBefore = _.strIsolateRightOrAll( splitsAfter[ 0 ], /\n+/ );
        str = splitsBefore[ 1 ] + splitsBefore[ 2 ] + splitsAfter[ 1 ] + splitsAfter[ 2 ];
      }
      else
      {
        str = '';
      }
    }

    if( _.strEnds( str, /\n/ ) )
    {
      let splitsBefore = _.strIsolate( str, /\s*$/ );
      if( splitsBefore[ 0 ] )
      {
        let splitsAfter = _.strIsolateLeftOrAll( splitsBefore[ 1 ], /\n+/ );
        str = splitsBefore[ 0 ] + splitsAfter[ 1 ];
      }
      else
      {
        str = '';
      }
    }

    return str;
  }

  /* */

  function strConcatenateCounting( src1, src2 )
  {
    let right = _.strIsolateRightOrAll( src1, /\n+$/ );
    let left = _.strIsolateLeftOrAll( src2, /\n+/ );

    let result = right[ 0 ];
    result += right[ 1 ].length > left[ 1 ].length ? right[ 1 ] : left[ 1 ];
    result += left[ 2 ];
    return result;
  }
}

_err.defaults =
{

  /**/

  args : null,
  sections : null,
  level : 1, /* to make catch stack work properly level should be 1 by default */

  /* string */

  message : null, /* qqq : cover the option */
  reason : null,
  sourceCode : null,

  /* Bolean */

  stackRemovingBeginIncluding : 0,
  stackRemovingBeginExcluding : 0,
  usingSourceCode : 1,
  stackCondensing : 1,
  attended : null,
  logged : null,
  brief : null,
  isProcess : null,
  debugging : null,

  /* Location */

  throwLocation : null,
  catchLocation : null,

  /* Stack */

  asyncCallsStack : null,
  throwCallsStack : null,
  catchCallsStack : null,
  fallBackStack : null,
  throwsStack : '',
  throws : null,

}

//

/**
 * Creates error object, with message created from passed `msg` parameters and contains error trace.
 * If passed several strings (or mixed error and strings) as arguments, the result error message is created by
 concatenating them.
 *
 * @example
 * function divide( x, y )
 * {
 *   if( y == 0 )
 *     throw _.err( 'divide by zero' )
 *   return x / y;
 * }
 * divide( 3, 0 );
 *
 * // log
 * // Error:
 * // caught     at divide (<anonymous>:2:29)
 * // divide by zero
 * // Error
 * //   at _err (file:///.../wTools/staging/Base.s:1418:13)
 * //   at wTools.err (file:///.../wTools/staging/Base.s:1449:10)
 * //   at divide (<anonymous>:2:29)
 * //   at <anonymous>:1:1
 *
 * @param {...String|Error} msg Accepts list of messeges/errors.
 * @returns {Error} Created Error. If passed existing error as one of parameters, routine modified it and return
 * reference.
 * @function err
 * @namespace Tools
 */

function err()
{
  return _._err
  ({
    args : arguments,
    level : 2,
  });
}

//

function errBrief()
{
  return _._err
  ({
    args : arguments,
    level : 2,
    brief : 1,
  });
}

//

function errUnbrief()
{
  return _._err
  ({
    args : arguments,
    level : 2,
    brief : 0,
  });
}

//

function errProcess()
{
  return _._err
  ({
    args : arguments,
    level : 2,
    isProcess : 1,
  });
}

//

function errUnprocess()
{
  return _._err
  ({
    args : arguments,
    level : 2,
    isProcess : 0,
  });
}

//

function _errFields( args, fields )
{

  _.assert( arguments.length === 2 );
  _.assert( _.mapIs( fields ) )

  if( !_.longIs( args ) )
  args = [ args ];

  let err = args[ 0 ];

  if( _.symbolIs( err ) )
  {
    _.assert( args.length === 1 );
    return err;
  }

  if( args.length !== 1 || !_.errIsStandard( err ) )
  err = _._err
  ({
    args,
    level : 2,
  });

  /* */

  try
  {

    for( let f in fields )
    {
      let o =
      {
        enumerable : false,
        configurable : true,
        writable : true,
        value : fields[ f ],
      };
      Object.defineProperty( err, f, o );
    }

  }
  catch( err )
  {
    console.error( `Cant assign "${f}" property to error\n` + err.toString() );
  }

  /* */

  return err;
}

//

function errAttend( err, value )
{
  _.assert( arguments.length === 1 || arguments.length === 2 );
  if( value === undefined )
  value = Config.debug ? _.introspector.stack([ 0, Infinity ]) : true;
  let result = _._errFields( err, { attended : value } );
  return result;
}

//

function errLogged( err, value )
{
  _.assert( arguments.length === 1 || arguments.length === 2 );
  if( value === undefined )
  value = Config.debug ? _.introspector.stack([ 0, Infinity ]) : true;
  return _._errFields( err, { logged : value } );
}

//

function errSuspend( err, owner, value )
{
  _.assert( arguments.length === 3 );
  _.assert( !!owner );

  /*
  cant suspend/resume suspended by another owner error
  */

  if( err.suspended && err.suspended !== owner )
  return _._errFields( err, {} );

  let value2 = err.suspended;
  if( value === undefined )
  value = true;
  let result = _._errFields( err, { suspended : value ? owner : false } );

  /*
  resuming of suspended wary error object should resume _handleUncaughtAsync
  */

  if( value2 && !value && err.wary )
  {
    _.error._handleUncaughtAsync( err );
  }

  return result
}

//

function errWary( err, value )
{
  _.assert( arguments.length === 1 || arguments.length === 2 );
  if( value === undefined )
  value = true;
  return _._errFields( err, { wary : value } );
}

// {
//
//   _.assert( arguments.length === 1 );
//
//   if( !_.errIsStandard( err ) )
//   err = _._err
//   ({
//     args : arguments,
//     level : 2,
//   });
//
//   /* */
//
//   try
//   {
//
//     let value = Config.debug ? _.introspector.stack([ 0, Infinity ]) : true;
//     Object.defineProperty( err, 'logged',
//     {
//       enumerable : false,
//       configurable : true,
//       writable : true,
//       value,
//     });
//
//   }
//   catch( err )
//   {
//     logger.warn( 'Cant assign logged property to error\n' + err.toString() );
//   }
//
//   _.errAttend( err );
//
//   /* */
//
//   return err;
// }

//

function errRestack( err, level )
{

  if( err && err.debugging )
  debugger;

  if( !( arguments.length === 1 || arguments.length === 2 ) )
  throw Error( 'Expects single argument or none' );

  if( level === undefined )
  level = 1;

  if( !_.numberDefined( level ) )
  throw Error( 'Expects defined number' );

  let err2 = _._err
  ({
    args : [],
    level : level + 1,
  });

  return _.err( err2, err );
}

//

function errOnce( err )
{

  err = _._err
  ({
    args : arguments,
    level : 2,
  });

  if( err.logged )
  return undefined;

  _.errAttend( err );

  return err;
}

//

function errInStr( errStr )
{
  _.assert( _.strIs( errStr ) );

  if( !_.strHas( errStr, /\=\s+Message of/m ) )
  return false;

  if( !_.strHas( errStr, /(^|\n)\s*=\s+Beautified calls stack/m ) )
  return false;

  return true;
}

//

function errFromStr( errStr )
{

  try
  {

    errStr = _.strLinesStrip( errStr );

    let sectionBeginRegexp = /[=]\s+(.*?)\s*\n/mg;
    let splits = _.strSplitFast
    ({
      src : errStr,
      delimeter : sectionBeginRegexp,
    });

    let sectionName;
    let throwCallsStack = '';
    let throwsStack = '';
    let stackCondensing = true;
    let messages = [];
    for( let s = 0 ; s < splits.length ; s++ )
    {
      let split = splits[ s ];
      let sectionNameParsed = sectionBeginRegexp.exec( split + '\n' );
      if( sectionNameParsed )
      {
        sectionName = sectionNameParsed[ 1 ];
        continue;
      }

      if( !sectionName )
      messages.push( split );
      else if( !sectionName || _.strBegins( sectionName, 'Message of' ) )
      messages.push( split );
      else if( _.strBegins( sectionName, 'Beautified calls stack' ) )
      throwCallsStack = split;
      else if( _.strBegins( sectionName, 'Throws stack' ) )
      throwsStack = split;

    }

    let dstError = new Error();

    let throwLocation = _.introspector.locationFromStackFrame( throwCallsStack || dstError.stack );

    let originalMessage = messages.join( '\n' ); /* xxx : implement routine for joining */

    let result = _._errMake
    ({
      dstError,
      throwLocation,
      stackCondensing,
      originalMessage,
      combinedStack : throwCallsStack,
      throwCallsStack,
      throwsStack,
    });

    return result;
  }
  catch( err2 )
  {
    console.error( err2 );
    return Error( errStr );
  }
}

//

function _errLog( err, logger )
{
  logger = logger || _global.logger || _global.console;

  /* */

  if( err && err.debugging )
  debugger;

  if( _.routineIs( err.toString ) )
  {
    let str = err.toString();
    if( _.color && _.color.strFormat )
    str = _.color.strFormat( str, 'negative' );
    logger.error( str )
  }
  else
  {
    logger.error( 'Error does not have toString' );
    logger.error( err );
  }

  /* */

  _.errLogged( err );
  _.errAttend( err );

  /* */

  return err;
}

//

/**
 * Creates error object, with message created from passed `msg` parameters and contains error trace.
 * If passed several strings (or mixed error and strings) as arguments, the result error message is created by
 concatenating them. Prints the created error.
 * If _global_.logger defined, routine will use it to print error, else uses console
 *
 * @see {@link wTools.err See err}
 *
 * @example
 * function divide( x, y )
 * {
 *   if( y == 0 )
 *    throw _.errLog( 'divide by zero' )
 *    return x / y;
 * }
 * divide( 3, 0 );
 *
 * // log
 * // Error:
 * // caught     at divide (<anonymous>:2:29)
 * // divide by zero
 * // Error
 * //   at _err (file:///.../wTools/staging/Base.s:1418:13)
 * //   at wTools.errLog (file:///.../wTools/staging/Base.s:1462:13)
 * //   at divide (<anonymous>:2:29)
 * //   at <anonymous>:1:1
 *
 * @param {...String|Error} msg Accepts list of messeges/errors.
 * @returns {Error} Created Error. If passed existing error as one of parameters, routine modified it and return
 * @function errLog
 * @namespace Tools
 */

function errLog()
{

  let err = _._err
  ({
    args : arguments,
    level : 2,
  });

  return _._errLog( err );
}

//

function errLogOnce( err )
{

  err = _._err
  ({
    args : arguments,
    level : 2,
  });

  if( err.logged )
  return err;

  return _._errLog( err );
}

// --
// try
// --

function tryCatch( routine )
{
  _.assert( arguments.length === 1 );
  _.assert( _.routineIs( routine ) )
  try
  {
    return routine();
  }
  catch( err )
  {
    throw _._err({ args : [ err ] });
  }
}

//

function tryCatchBrief( routine )
{
  _.assert( arguments.length === 1 );
  _.assert( _.routineIs( routine ) )

  try
  {
    return routine();
  }
  catch( err )
  {
    throw _._err({ args : [ err ], brief : 1 });
  }
}

//

function tryCatchDebug( routine )
{
  _.assert( arguments.length === 1 );
  _.assert( _.routineIs( routine ) )
  try
  {
    return routine();
  }
  catch( err )
  {
    throw _._err({ args : [ err ], debugging : 1 });
  }
}

// --
// surer
// --

function _sureDebugger( condition )
{
  if( _.error.breakpointEnabled )
  debugger;
}

//

function sure( condition )
{

  if( !condition || !boolLike( condition ) )
  {
    _sureDebugger( condition );
    if( arguments.length === 1 )
    throw _err
    ({
      args : [ 'Assertion fails' ],
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
      args : Array.prototype.slice.call( arguments, 1 ),
      level : 2,
    });
  }

  return;

  function boolLike( src )
  {
    let type = Object.prototype.toString.call( src );
    return type === '[object Boolean]' || type === '[object Number]';
  }

}

//

function sureBriefly( condition )
{

  if( !condition || !boolLike( condition ) )
  {
    _sureDebugger( condition );
    if( arguments.length === 1 )
    throw _err
    ({
      args : [ 'Assertion fails' ],
      level : 2,
      brief : 1,
    });
    else if( arguments.length === 2 )
    throw _err
    ({
      args : [ arguments[ 1 ] ],
      level : 2,
      brief : 1,
    });
    else
    throw _err
    ({
      args : Array.prototype.slice.call( arguments, 1 ),
      level : 2,
      brief : 1,
    });
  }

  return;

  function boolLike( src )
  {
    let type = Object.prototype.toString.call( src );
    return type === '[object Boolean]' || type === '[object Number]';
  }

}

//

function sureWithoutDebugger( condition )
{

  if( !condition || !boolLike( condition ) )
  {
    if( arguments.length === 1 )
    throw _err
    ({
      args : [ 'Assertion fails' ],
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
      args : Array.prototype.slice.call( arguments, 1 ),
      level : 2,
    });
  }

  return;

  function boolLike( src )
  {
    let type = Object.prototype.toString.call( src );
    return type === '[object Boolean]' || type === '[object Number]';
  }

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
  let args = Array.prototype.slice.call( arguments );
  args[ 0 ] = _.ownNoConstructor( ins );
  _.sure.apply( _, args );
}

// --
// assert
// --

function breakpoint( condition )
{

  if( Config.debug === false )
  return true;

  if( !condition )
  {
    // let err = _err
    // ({
    //   args : Array.prototype.slice.call( arguments, 1 ),
    //   level : 2,
    // });
    logger.log( _.introspector.stack() );

    return false;
  }

  return true;
}

//

/**
 * Checks condition passed by argument( condition ). Works only in debug mode. Uses StackTrace level 2.
 *
 * @see {@link wTools.err err}
 *
 * If condition is true routine returns without exceptions, otherwise routine generates and throws exception. By default generates error with message 'Assertion fails'.
 * Also generates error using message(s) or existing error object(s) passed after first argument.
 *
 * @param {*} condition - condition to check.
 * @param {String|Error} [ msgs ] - error messages for generated exception.
 *
 * @example
 * let x = 1;
 * _.assert( _.strIs( x ), 'incorrect variable type->', typeof x, 'Expects string' );
 *
 * // log
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
 *   _.assert( arguments.length === 2, 'incorrect arguments count' );
 *   return x + y;
 * }
 * add();
 *
 * // log
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
 *      _.assert( y != 0, 'divide by zero' );
 *      return x / y;
 *   }
 *   divide( 3, 0 );
 *
 * // log
 * // caught     at divide (<anonymous>:2:29)
 * // divide by zero
 * // Error
 * //   at _err (file:///.../wTools/staging/Base.s:1418:13)
 * //   at wTools.errLog (file://.../wTools/staging/Base.s:1462:13)
 * //   at divide (<anonymous>:2:29)
 * //   at <anonymous>:1:1
 * @throws {Error} If passed condition( condition ) fails.
 * @function assert
 * @namespace Tools
 */

//

function assert( condition )
{

  if( Config.debug === false )
  return true;

  if( !condition )
  {
    _assertDebugger( condition, arguments );
    if( arguments.length === 1 )
    throw _err
    ({
      args : [ 'Assertion fails' ],
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
      args : Array.prototype.slice.call( arguments, 1 ),
      level : 2,
    });
  }

  return true;

  function boolLike( src )
  {
    let type = Object.prototype.toString.call( src );
    return type === '[object Boolean]' || type === '[object Number]';
  }

  function _assertDebugger( condition, args )
  {
    if( !_.error.breakpointEnabled )
    return;
    let err = _._err
    ({
      args : Array.prototype.slice.call( args, 1 ),
      level : 3,
    });
  }

}

//

function assertWithoutBreakpoint( condition )
{

  /*return;*/

  if( Config.debug === false )
  return true;

  if( !condition || !_.boolLike( condition ) )
  {
    if( arguments.length === 1 )
    throw _err
    ({
      args : [ 'Assertion fails' ],
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
      args : Array.prototype.slice.call( arguments, 1 ),
      level : 2,
    });
  }

  return;
}

//

function assertNotTested( src )
{

  if( _.error.breakpointEnabled )
  debugger;
  _.assert( false, 'not tested : ' + stack( 1 ) );

}

//

/**
 * If condition failed, routine prints warning messages passed after condition argument
 * @example
 * function checkAngles( a, b, c )
 * {
 *    _.assertWarn( (a + b + c) === 180, 'triangle with that angles does not exists' );
 * };
 * checkAngles( 120, 23, 130 );
 *
 * // log 'triangle with that angles does not exists'
 *
 * @param condition Condition to check.
 * @param messages messages to print.
 * @function assertWarn
 * @namespace Tools
 */

function assertWarn( condition )
{

  if( Config.debug )
  return;

  if( !condition || !_.boolLike( condition ) )
  {
    console.warn.apply( console, [].slice.call( arguments, 1 ) );
  }

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
  let args = Array.prototype.slice.call( arguments );
  args[ 0 ] = _.ownNoConstructor( ins );

  if( args.length === 1 )
  args.push( () => 'Entity should not own constructor, but own ' + _.toStrShort( ins ) );

  _.assert.apply( _, args );
}

// --
// namespace
// --

// let _errorCounter = 0;
// let _errorMaking = false;
let stackSymbol = Symbol.for( 'stack' );

/* Error.stackTraceLimit = 99; */

/**
 * @property {Object} error={}
 * @property {Boolean} breakpointEnabled=!!Config.debug
 * @name ErrFields
 * @namespace Tools
 */

let ErrorExtension =
{

  breakpoint,
  breakpointEnabled : !!Config.debug,
  _errorCounter : 0,
  _errorMaking : false,

}

let ToolsExtension =
{

  /* xxx : make migration of routines to namespace */

  // error

  errIs,
  errIsStandard,
  errIsAttended,
  errIsBrief,
  errIsProcess,
  errIsLogged,
  errIsSuspended,
  errIsWary,
  errReason,
  errOriginalMessage,
  errOriginalStack,

  _errMake,
  _err,
  err,
  errBrief,
  errUnbrief,
  errProcess,
  errUnprocess,
  _errFields,
  errAttend,
  errLogged,
  errSuspend, /* qqq : cover, please. should work okay with symbols */
  errWary,
  errRestack,
  errOnce,
  errInStr,
  errFromStr,

  _errLog,
  errLog,
  errLogOnce,

  // try

  tryCatch,
  tryCatchBrief,
  tryCatchDebug,

  // sure

  sure,
  sureBriefly,
  sureWithoutDebugger,

  // assert

  assert,
  assertWithoutBreakpoint,
  assertNotTested,
  assertWarn,

  // fields

  // error : Object.create( null ),
  // breakpointEnabled : !!Config.debug,
  //
  // _errorCounter,
  // _errorMaking,

}

//

Object.assign( _.error, ErrorExtension );
Object.assign( _, ToolsExtension );

/* zzz : improve formatting of stack with table */

Error.stackTraceLimit = Infinity;

// --
// export
// --

if( typeof module !== 'undefined' )
module[ 'exports' ] = Self;

})();
