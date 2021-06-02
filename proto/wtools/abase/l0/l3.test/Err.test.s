( function _l0_l3_Err_test_s_()
{

'use strict';

if( typeof module !== 'undefined' )
{
  const _ = require( '../Include3.s' );
  require( 'wTesting' );
}

const _ = _global_.wTools;
const __ = _globals_.testing.wTools;
const fileProvider = __.fileProvider;
const path = fileProvider.path;
const logger = _global_.logger || _global_.console;

// --
// context
// --

function onSuiteBegin()
{
  let context = this;

  context.suiteTempPath = path.tempOpen( path.join( __dirname, '../..' ), 'err' );
  context.assetsOriginalPath = path.join( __dirname, '_asset' );

}

//

function onSuiteEnd()
{
  let context = this;
  _.assert( _.strHas( context.suiteTempPath, '/err-' ) )
  path.tempClose( context.suiteTempPath );
}

// --
// tests
// --

function errStackTrivial( test )
{
  let context = this;
  let visited = [];

  var args = [ 'str', { num : 1 } ];
  var err = _._err({ args });
  test.true( _.error.is( err ) );

  var errStr = String( err );
  console.log( errStr );
  test.identical( __.strCount( errStr, 'at Object.errStackTrivial' ), 2 );

}

//

function _errArgsWithMap( test )
{
  test.case = 'map in args, without Error';
  var err = _._err( { args : [ { 'location' : { 'filePath' : 'at program1' }, 'line' : 10, 'col' : 5 } ] } );
  test.true( _.error.is( err ) );
  test.identical( err.location.filePath, 'at program1' );
  test.identical( err.location.line, 10 );
  test.identical( err.location.col, 5 );
  var errStr = String( err );
  test.identical( __.strCount( errStr, 'Error' ), 0 );
  test.identical( __.strCount( errStr, 'Object._errArgsWithMap' ), 2 );

  test.case = 'map in args, with Error';
  var err = _._err( { args : [ { 'location' : { 'filePath' : 'at program1' }, 'line' : 10, 'col' : 5 }, new Error( 'Error' ) ] } );
  test.true( _.error.is( err ) );
  test.notIdentical( err.location.filePath, 'at program1' );
  test.notIdentical( err.location.line, 10 );
  test.notIdentical( err.location.col, 5 );
  var errStr = String( err );
  test.identical( __.strCount( errStr, 'Object._errArgsWithMap' ), 2 );

}

//

function errorFunctorBasic( test )
{
  let context = this;

  /* */

  test.case = 'without new';
  var SomeError = _.error.error_functor( 'SomeError', _onSomeError );
  var got = SomeError( 'abc' )
  test.true( _.errIs( got ) );
  test.true( got instanceof SomeError );
  test.identical( got.originalMessage, 'arg1 abc arg2' );
  test.identical( got.SomeError, true );
  var exp =
  {
    'value' : true,
    'writable' : true,
    'enumerable' : false,
    'configurable' : true,
  };
  var got = _.props.descriptorOwnOf( got, 'SomeError' );
  test.identical( got, exp );

  /* */

  test.case = 'with new';
  var SomeError = _.error.error_functor( 'SomeError', _onSomeError );
  var got = new SomeError( 'abc' );
  test.true( _.errIs( got ) );
  test.true( got instanceof SomeError );
  test.identical( got.originalMessage, 'arg1 abc arg2' );
  test.identical( got.SomeError, true );
  var exp =
  {
    'value' : true,
    'writable' : true,
    'enumerable' : false,
    'configurable' : true,
  };
  var got = _.props.descriptorOwnOf( got, 'SomeError' );
  test.identical( got, exp );

  /* */

  test.case = 'remake, without new';
  var SomeError = _.error.error_functor( 'SomeError', _onSomeError );
  var err1 = SomeError( 'abc' );
  var err2 = SomeError( err1 );
  test.true( err1 instanceof SomeError );
  test.true( err2 instanceof SomeError );
  test.identical( err1.originalMessage, 'arg1 abc arg2' );
  test.identical( err2.originalMessage, 'arg1 abc arg2' );
  test.true( err1 === err2 );

  /* */

  test.case = 'remake, with new';
  var SomeError = _.error.error_functor( 'SomeError', _onSomeError );
  var err1 = SomeError( 'abc' );
  var err2 = new SomeError( err1 );
  test.true( err1 instanceof SomeError );
  test.true( err2 instanceof SomeError );
  test.identical( err1.originalMessage, 'arg1 abc arg2' );
  test.identical( err2.originalMessage, 'arg1 arg1 abc arg2 arg2' );
  test.true( err1 !== err2 );

  /* */

  test.case = 'remake, extra argument, left, without new';
  var SomeError = _.error.error_functor( 'SomeError', _onSomeError );
  var err1 = SomeError( 'abc' );
  var err2 = SomeError( err1, 'def' );
  test.true( err1 instanceof SomeError );
  test.true( err2 instanceof SomeError );
  test.identical( err1.originalMessage, 'arg1 abc arg2 def' );
  test.identical( err2.originalMessage, 'arg1 abc arg2 def' );
  test.true( err1 === err2 );

  /* */

  test.case = 'remake, extra argument, right, without new';
  var SomeError = _.error.error_functor( 'SomeError', _onSomeError );
  var err1 = SomeError( 'abc' );
  var err2 = SomeError( 'def', err1 );
  test.true( err1 instanceof SomeError );
  test.true( err2 instanceof SomeError );
  test.identical( err1.originalMessage, 'def arg1 abc arg2' );
  test.identical( err2.originalMessage, 'def arg1 abc arg2' );
  test.true( err1 === err2 );

  /* */

  test.case = 'remake, extra argument, right, with new';
  var SomeError = _.error.error_functor( 'SomeError', _onSomeError );
  var err1 = SomeError( 'abc' );
  var err2 = new SomeError( err1, 'def' );
  test.true( err1 instanceof SomeError );
  test.true( err2 instanceof SomeError );
  test.identical( err1.originalMessage, 'arg1 abc arg2' );
  test.identical( err2.originalMessage, 'arg1 arg1 abc arg2 def arg2' );
  test.true( err1 !== err2 );

  /* */

  test.case = 'remake, extra argument, left, with new';
  var SomeError = _.error.error_functor( 'SomeError', _onSomeError );
  var err1 = SomeError( 'abc' );
  var err2 = new SomeError( 'def', err1 );
  test.true( err1 instanceof SomeError );
  test.true( err2 instanceof SomeError );
  test.identical( err1.originalMessage, 'arg1 abc arg2' );
  test.identical( err2.originalMessage, 'arg1 def arg1 abc arg2 arg2' );
  test.true( err1 !== err2 );

  /* */

  function _onSomeError( arg )
  {
    if( this.originalMessage !== undefined )
    return arguments;
    else
    return [ 'arg1', ... arguments, 'arg2' ];
  }

}

// --
// declare
// --

const Proto =
{

  name : 'Tools.Err.l0.l3',
  silencing : 1,

  onSuiteBegin,
  onSuiteEnd,

  context :
  {
    suiteTempPath : null,
    assetsOriginalPath : null,
    appJsPath : null,
  },

  tests :
  {

    errStackTrivial,
    _errArgsWithMap,
    errorFunctorBasic,

  }

}

const Self = wTestSuite( Proto );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

})();
