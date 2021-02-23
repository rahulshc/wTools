( function _l3_Err_s_()
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

  function nonenumerable( propName, value )
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
      Object.defineProperty( err, propName, o );
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

  if( _.property.fields )
  {
    let fields = _.property.fields( err );
    if( Object.keys( fields ).length )
    message += '\n' + _.entity.exportString( fields, { wrap : 0, multiline : 1, levels : 2 } );
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
        logger.error( `Each section of an error should have head, but head of section::${s} is ${_.entity.strType(section.head)}` );
        delete o.sections[ s ];
      }
      if( !_.strIs( section.body ) )
      {
        logger.error( `Each section of an error should have body, but body of section::${s} is ${_.entity.strType(section.body)}` );
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

    if( o.fields )
    {
      for( let k in o.fields )
      nonenumerable( k, o.fields[ k ] );
    }

    if( o.debugging )
    debugger;

  }

  /* */

  function nonenumerable( propName, value )
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
      Object.defineProperty( o.dstError, propName, o2 );
    }
    catch( err2 )
    {
      console.error( err2 );
    }
  }

  /* */

  function logging( propName, value )
  {
    let symbol = Symbol.for( propName );
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
      Object.defineProperty( o.dstError, propName, o2 );
    }
    catch( err2 )
    {
      console.error( err2 );
    }
    function get()
    {
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
  sections : null, /* qqq : cover please */
  fields : null, /* qqq : cover please */

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
  if( _.error.breakpointOnAssertEnabled )
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
          debugger;
          o.args = _.longBut_( null, o.args, [ a, a ], arg );
          // o.args = _.longBut( o.args, [ a, a+1 ], arg );
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
      if( !_.primitive.is( arg ) && _.object.like( arg ) )
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

    _.assert( _.number.is( o.catchLocation.abstraction ) );
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

      if( arg && !_.primitive.is( arg ) )
      {

        // if( _.primitive.is( arg ) ) // Dmytro : unnecessary condition, see above
        // {
        //   str = String( arg );
        // }
        // else if( _.routineIs( arg.toStr ) )
        if( _.routineIs( arg.toStr ) )
        {
          str = arg.toStr();
        }
        else if( _.errIs( arg ) && _.strIs( arg.originalMessage ) )
        {
          str = arg.originalMessage;
        }
        else if( _.errIs( arg ) )
        {
          // if( _.strIs( arg.originalMessage ) ) // Dmytro : duplicates condition above
          // str = arg.originalMessage;
          // else if( _.strIs( arg.message ) )
          if( _.strIs( arg.message ) )
          str = arg.message;
          else
          str = _.entity.exportString( arg );
        }
        else
        {
          str = _.entity.exportString( arg, { levels : 2 } );
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

    let o2 =
    {
      onToStr : eachMessageFormat,
      onPairWithDelimeter : strConcatenateCounting
    };
    o.message = _.strConcat( result, o2 );

    /*
      remove redundant spaces at the begin and the end of lines
    */

    o.message = o.message || fallBackMessage || 'UnknownError';
    o.message = o.message.replace( /^\s*/, '' );
    o.message = o.message.replace( /\x20*$/gm, '' );
    o.message = o.message.replace( /\s*$/, '' );

  }

  /* */

  function eachMessageFormat( str )
  {
    let strBeginsWithRegular = _.strBegins( str, /\S/ );
    let strEndsWithRegular = _.strEnds( str, /\S/ );

    if( !strBeginsWithRegular )
    {
      let notSpaceLikeSymbol = /\S/.exec( str );

      if( notSpaceLikeSymbol === null )
      {
        str = str.replace( /\x20+/g, '' );
        strEndsWithRegular = true;
      }
      else
      {
        let before = str.substring( 0, notSpaceLikeSymbol.index );
        let spaces = /(?<=\n)\x20+$/.exec( before );
        before = before.replace( /\x20+/g, '' );
        before += spaces ? spaces[ 0 ] : '';

        str = before + str.substring( notSpaceLikeSymbol.index );
      }
    }

    // let splitsAfter = _.strIsolateLeftOrAll( str, /\S/ ); /* aaa2 for Dmytro : cant use _.strIsolate* on this level */ /* Dmytro : strIsolateLeft not used, rewrote subroutines, simplified subroutines */

    /*

    _.strIsolateLeftOrAll is not a function
    TypeError: _.strIsolateLeftOrAll is not a function
        at Object.eachMessageFormat [as onToStr] (/wtools/abase/l0/l3/Err.s:1062:27)
        at Object.strConcat (/wtools/abase/l0/l3/Str.s:723:13)
        at originalMessageForm (/wtools/abase/l0/l3/Err.s:1034:19)
        at Object._err (/wtools/abase/l0/l3/Err.s:577:5)
        at Object.err (/wtools/abase/l0/l3/Err.s:1192:12)
        at Function._load (/wtools/abase/l0/l8/gModule.s:872:17)
        at Module.require (internal/modules/cjs/loader.js:830:19)
        at require (internal/modules/cjs/helpers.js:68:18)
        at _wToolsLayer0_s_ (/wtools/abase/Layer0.s:90:3)
        at Object.<anonymous> (/wtools/abase/Layer0.s:112:3)
        at Module._compile (internal/modules/cjs/loader.js:936:30)
        at Object.Module._extensions..js (internal/modules/cjs/loader.js:947:10)
        at Module.load (internal/modules/cjs/loader.js:790:32)
        at Function.Module._load (internal/modules/cjs/loader.js:703:12)
        at Module.require (internal/modules/cjs/loader.js:830:19)
        at require (internal/modules/cjs/helpers.js:68:18)
        at _wToolsLayer1_s_ (/wtools/abase/Layer1.s:9:3)
        at Object.<anonymous> (/wtools/abase/Layer1.s:28:3)
        at Module._compile (internal/modules/cjs/loader.js:936:30)
        at Object.Module._extensions..js (internal/modules/cjs/loader.js:947:10)
        at Module.load (internal/modules/cjs/loader.js:790:32)
        at Function.Module._load (internal/modules/cjs/loader.js:703:12)
        at Module.require (internal/modules/cjs/loader.js:830:19)
        at require (internal/modules/cjs/helpers.js:68:18)
        at Object.<anonymous> (/wtools/Tools.s:19:5)
        at Module._compile (internal/modules/cjs/loader.js:936:30)
        at Object.Module._extensions..js (internal/modules/cjs/loader.js:947:10)
        at Module.load (internal/modules/cjs/loader.js:790:32)
        at Function.Module._load (internal/modules/cjs/loader.js:703:12)
        at Module.require (internal/modules/cjs/loader.js:830:19)
        at require (internal/modules/cjs/helpers.js:68:18)
        at _StringTools_test_s_ (/wtools/abase/l5.test/Dissector.test.s:8:11)
        at Object.<anonymous> (/wtools/abase/l5.test/Dissector.test.s:2061:3)
        at Module._compile (internal/modules/cjs/loader.js:936:30)
        at Object.Module._extensions..js (internal/modules/cjs/loader.js:947:10)
        at Module.load (internal/modules/cjs/loader.js:790:32)
        at Function.Module._load (internal/modules/cjs/loader.js:703:12)
        at Function.Module.runMain (internal/modules/cjs/loader.js:999:10)
        at internal/main/run_main_module.js:17:11

    */

    if( str && !strEndsWithRegular )
    {
      let notSpaceLikeSymbol = /\S\s*$/.exec( str );

      let after = str.substring( notSpaceLikeSymbol.index + 1 );
      let spaces = /^\x20+(?=\n)/.exec( after );
      after = after.replace( /\x20+/g, '' );
      after += spaces ? spaces[ 0 ] : '';

      str = str.substring( 0, notSpaceLikeSymbol.index + 1 ) + after;
    }

    return str;
  }

  /* */

  function strConcatenateCounting( src1, src2 )
  {
    let result;
    if( _.strEnds( src1, '\n' ) && _.strBegins( src2, '\n' ) )
    {
      let right = /\n+$/.exec( src1 );
      let left = /^\n+/.exec( src2 );

      result = src1.substring( 0, right.index );
      result += right[ 0 ].length > left[ 0 ].length ? right[ 0 ] : left[ 0 ];
      result += src2.substring( left[ 0 ].length );
    }
    else
    {
      result = src1 + src2;
    }
    return result;
  }
}

_err.defaults =
{

  /**/

  args : null,
  sections : null,
  fields : null,
  level : 1, /* to make catch stack work properly level should be 1 by default */

  /* String */

  message : null, /* qqq : cover the option */
  reason : null,
  sourceCode : null,

  /* Boolean */

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

  if( _.symbol.is( err ) )
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

  if( !_.number.defined( level ) )
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
  if( _.error.breakpointOnAssertEnabled )
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

// --
//
// --

// function breakpoint( condition )
// {
//
//   if( Config.debug === false )
//   return true;
//
//   if( !condition )
//   {
//     // let err = _err
//     // ({
//     //   args : Array.prototype.slice.call( arguments, 1 ),
//     //   level : 2,
//     // });
//     logger.log( _.introspector.stack() );
//
//     return false;
//   }
//
//   return true;
// }

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
    if( !_.error.breakpointOnAssertEnabled )
    return;
    debugger;
  }

}

//

function assertWithoutBreakpoint( condition )
{

  /*return;*/

  if( Config.debug === false )
  return true;

  if( !condition || !_.bool.like( condition ) )
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

  if( _.error.breakpointOnAssertEnabled )
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

  if( !condition || !_.bool.like( condition ) )
  {
    console.warn.apply( console, [].slice.call( arguments, 1 ) );
  }

}

//

if( Config.debug )
Object.defineProperty( _, 'debugger',
{
  enumerable : false,
  configurable : false,
  set : function( val )
  {
    _[ Symbol.for( 'debugger' ) ] = val;
    // if( val )
    // debugger;
    return val;
  },
  get : function()
  {
    let val = _[ Symbol.for( 'debugger' ) ];
    if( val )
    debugger;
    return val;
  },
});

// --
// namespace
// --

let stackSymbol = Symbol.for( 'stack' );

/* Error.stackTraceLimit = 99; */

/**
 * @property {Object} error={}
 * @property {Boolean} breakpointOnAssertEnabled=!!Config.debug
 * @name ErrFields
 * @namespace Tools
 */

let ErrorExtension =
{

  // breakpoint,
  breakpointOnDebugger : 0,
  breakpointOnAssertEnabled : !!Config.debug,
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

  // sureInstanceOrClass,
  // sureOwnNoConstructor,
  //
  // // checker
  //
  // _isInstanceOrClass,
  // _ownNoConstructor,

  // assert

  assert,
  assertWithoutBreakpoint,
  assertNotTested,
  assertWarn,

  // fields

  // error : Object.create( null ),
  // breakpointOnAssertEnabled : !!Config.debug,
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
module[ 'exports' ] = _;

})();
