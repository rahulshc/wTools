( function Sample_test_s( ) {

'use strict';

/*

to run this test
from the project directory run

npm install
node ./staging/z.tests/Sample.test.s

*/

if( typeof module !== 'undefined' )
{

  if( require( 'fs' ).existsSync( __dirname + '/../object/Testing.debug.s' ) )
  require( '../object/Testing.debug.s' );
  else
  require( 'wTesting' );

}

var _ = wTools;
var Self = {};

//

var strTypeOf = function( test ) {

  test.description = 'string';
  var got = _.strTypeOf( 'testing');
  var expected = 'String';
  test.identical( got,expected );

  test.description = 'number';
  var got = _.strTypeOf(1);
  var expected = 'Number';
  test.identical( got,expected );

  test.description = 'nothing';
  var got = _.strTypeOf();
  var expected = 'Undefined';
  test.identical( got,expected );

  test.description = 'array';
  var got = _.strTypeOf([ 1,3 ]);
  var expected = 'Array';
  test.identical( got,expected );

  test.description = 'object';
  var got = _.strTypeOf{};
  var expected = 'Object';
  test.identical( got,expected );

  test.description = 'boolean';
  var got = _.strTypeOf{};
  var expected = 'Boolean';
  test.identical( got,expected );
}

var str = function(test) {
  var testAgrument1= 1,
    testAgrument2= 'abc',
    testAgrument3= [1,2],
    testAgrument4= {
      a:1,
      b:'2'
    };
    
  test.description = 'nothing';
    var got = _.str();
    var expected = '';
    test.identical( got,expected );

     test.description = 'few arguments';
    var got = _.str(testAgrument1,testAgrument2);
    var expected = '1 abc';
    test.identical( got,expected );


    if( Config.debug )  {

    test.description = 'if argument object';
    test.shouldThrowError( function()
    {
      _.str({});
    });
   

}
 
var strBegins = function( test ) {

  test.description = 'if begin match';
  var got = _.strBegins( 'tes','t');
  var expected = true;
  test.identical( got,expected );

  test.description = 'if begin not match';
  var got = _.strBegins( 'tes','e');
  var expected = false;
  test.identical( got,expected );































//

var Proto =
{

  name : 'simple1',

  tests:
  {

    arrayRange : arrayRange,

  }

}

_.mapExtend( Self,Proto );

if( typeof module !== 'undefined' && !module.parent )
_.testing.test( Self );

} )( );

