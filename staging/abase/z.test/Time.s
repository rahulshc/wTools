( function _Time_test_s_( ) {

'use strict';

if( typeof module !== 'undefined' )
{

  //if( typeof wBase === 'undefined' )
  try
  {
    require( '../../abase/wTools.s' );
  }
  catch( err )
  {
    require( 'wTools' );
  }

  var _ = wTools;

  _.include( 'wTesting' );

}

var _ = wTools;
var sourceFilePath = _.diagnosticLocation().full; // typeof module !== 'undefined' ? __filename : document.scripts[ document.scripts.length-1 ].src;

//

function timeOut( test )
{ 
  var delay = 300;
  var testCon = new wConsequence().give()

  /* */

  .doThen( function()
  {
    test.description = 'delay only';
    var timeBefore = _.timeNow();
    return _.timeOut( delay )
    .doThen( function( err, got )
    { 
      test.shouldBe( _.timeNow() - timeBefore >= delay );
      test.shouldBe( _.routineIs( got ) );
    });
  })

  /* */
  
  .doThen( function()
  {
    test.description = 'delay + routine';
    var timeBefore = _.timeNow();
    return _.timeOut( delay, () => {} )
    .doThen( function( err, got )
    { 
      test.shouldBe( _.timeNow() - timeBefore >= delay );
      test.identical( got, undefined );
      test.identical( err, null );
    });
  })

  /* */
  
  .doThen( function()
  {
    test.description = 'delay + routine that returns a value';
    var timeBefore = _.timeNow();
    var value = 'value';
    return _.timeOut( delay, () => value )
    .doThen( function( err, got )
    { 
      test.shouldBe( _.timeNow() - timeBefore >= delay );
      test.identical( got, value );
      test.identical( err, null );
    });
  })

  /* */
  
  .doThen( function()
  {
    test.description = 'delay + routine that returns a consequence';
    var timeBefore = _.timeNow();
    return _.timeOut( delay, () => _.timeOut( delay ) )
    .doThen( function( err, got )
    { 
      test.shouldBe( _.timeNow() - timeBefore >= delay * 2 );
      test.shouldBe( _.routineIs( got ) );
      test.identical( err, null );
    });
  })

  /* */
  
  .doThen( function()
  {
    test.description = 'delay + routine that calls another timeOut';
    var timeBefore = _.timeNow();
    return _.timeOut( delay, () => { _.timeOut( delay ) } )
    .doThen( function( err, got )
    { 
      test.shouldBe( _.timeNow() - timeBefore >= delay );
      test.identical( err, null );
      test.identical( got, undefined );
    });
  })

  /* */
  
  .doThen( function()
  {
    test.description = 'delay + context + routine + arguments';
    var timeBefore = _.timeNow();
    function r( delay )
    {
      return delay / 2;
    }
    return _.timeOut( delay, undefined, r, [ delay ] )
    .doThen( function( err, got )
    { 
      test.shouldBe( _.timeNow() - timeBefore >= delay );
      test.identical( got, delay / 2 );
      test.identical( err, null );
    });
  })

  /* */
  
  .doThen( function()
  {
    test.description = 'delay + consequence';
    var timeBefore = _.timeNow();
   
    return _.timeOut( delay, _.timeOut( delay ) )
    .doThen( function( err, got )
    { 
      test.shouldBe( _.timeNow() - timeBefore >= delay * 2 );
      test.shouldBe( _.routineIs( got ) );
      test.identical( err, null );
    });
  })

  return testCon;
}

//

function timeOutError( test )
{ 
  var delay = 300;
  var testCon = new wConsequence().give()

  /* */

  .doThen( function()
  {
    test.description = 'delay only';
    var timeBefore = _.timeNow();
    return _.timeOutError( delay )
    .doThen( function( err, got )
    { 
      test.shouldBe( _.timeNow() - timeBefore >= delay );
      test.shouldBe( _.errIs( err ) );
    });
  })

  /* */
  
  .doThen( function()
  {
    test.description = 'delay + routine';
    var timeBefore = _.timeNow();
    return _.timeOutError( delay, () => {} )
    .doThen( function( err, got )
    { 
      test.shouldBe( _.timeNow() - timeBefore >= delay );
      test.identical( got, undefined );
      test.shouldBe( _.errIs( err ) );
    });
  })

  /* */
  
  .doThen( function()
  {
    test.description = 'delay + routine that returns a value';
    var timeBefore = _.timeNow();
    var value = 'value';
    return _.timeOutError( delay, () => value )
    .doThen( function( err, got )
    { 
      test.shouldBe( _.timeNow() - timeBefore >= delay );
      test.identical( got, undefined );
      test.shouldBe( _.errIs( err ) );
    });
  })

  // /* */
  
  .doThen( function()
  {
    test.description = 'delay + routine that returns a consequence';
    var timeBefore = _.timeNow();
    return _.timeOutError( delay, () => _.timeOut( delay ) )
    .doThen( function( err, got )
    { 
      test.shouldBe( _.timeNow() - timeBefore >= delay * 2 );
      test.identical( got, undefined );
      test.shouldBe( _.errIs( err ) );
    });
  })

  /* */
  
  .doThen( function()
  {
    test.description = 'delay + routine that calls another timeOut';
    var timeBefore = _.timeNow();
    return _.timeOutError( delay, () => { _.timeOut( delay ) } )
    .doThen( function( err, got )
    { 
      test.shouldBe( _.timeNow() - timeBefore >= delay );
      test.identical( got, undefined );
      test.shouldBe( _.errIs( err ) );
    });
  })

  /* */
  
  .doThen( function()
  {
    test.description = 'delay + context + routine + arguments';
    var timeBefore = _.timeNow();
    function r( delay )
    {
      return delay / 2;
    }
    return _.timeOutError( delay, undefined, r, [ delay ] )
    .doThen( function( err, got )
    { 
      test.shouldBe( _.timeNow() - timeBefore >= delay );
      test.identical( got, undefined );
      test.shouldBe( _.errIs( err ) );
    });
  })

  /* */
  
  .doThen( function()
  {
    test.description = 'delay + consequence';
    var timeBefore = _.timeNow();
   
    return _.timeOutError( delay, _.timeOut( delay ) )
    .doThen( function( err, got )
    { 
      test.shouldBe( _.timeNow() - timeBefore >= delay * 2 );
      test.identical( got, undefined );
      test.shouldBe( _.errIs( err ) );
    });
  })

  return testCon;
}

//

var Self =
{

  name : 'Time',
  sourceFilePath : sourceFilePath,

  tests :
  {
    timeOut : timeOut,
    timeOutError : timeOutError
  }

}

Self = wTestSuite( Self );
if( typeof module !== 'undefined' && !module.parent )
_.Testing.test( Self.name );

} )( );
