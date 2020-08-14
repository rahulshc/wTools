( function _Bool_test_s()
{

'use strict';

if( typeof module !== 'undefined' )
{
  let _ = require( '../Layer2.s' );
  _.include( 'wTesting' );
}

let _ = wTools;

//--
// l0/l3/iBool.s
//--

function boolIs( test )
{
  test.case = 'string empty input';
  var got = _.boolIs( '' );
  test.identical( got, false );

  test.case = 'string input'
  var got = _.boolIs( 'hello' );
  test.identical( got, false );

  //

  test.case = 'number 1 input'
  var got = _.boolIs( 1 );
  test.identical( got, false );

  test.case = 'number 0 input'
  var got = _.boolIs( 0 );
  test.identical( got, false );

  test.case = 'number negative input'
  var got = _.boolIs( -10 );
  test.identical( got, false );

  test.case = 'number positive input'
  var got = _.boolIs( 10 );
  test.identical( got, false );

  //

  test.case = 'empty object input'
  var got = _.boolIs( {} );
  test.identical( got, false );

  test.case = 'object input'
  var got = _.boolIs( { name : 'a', age : 99 } );
  test.identical( got, false );

  test.case = 'empty array input'
  var got = _.boolIs( [] );
  test.identical( got, false );

  test.case = 'array input'
  var got = _.boolIs( [ 1, 2, 3 ] );
  test.identical( got, false );

  //

  test.case = 'bool false input'
  var got = _.boolIs( false );
  test.identical( got, true );

  test.case = 'bool true input'
  var got = _.boolIs( true );
  test.identical( got, true );

}

//

function boolLike( test )
{
  test.case = 'string empty input';
  var got = _.boolLike( '' );
  test.identical( got, false );

  test.case = 'string input'
  var got = _.boolLike( 'hello' );
  test.identical( got, false );

  test.case = 'string number'
  var got = _.boolLike( '1' );
  test.identical( got, false );

  //

  test.case = 'number 1 input'
  var got = _.boolLike( 1 );
  test.identical( got, true );

  test.case = 'number 0 input'
  var got = _.boolLike( 0 );
  test.identical( got, true );

  test.case = 'number negative input'
  var got = _.boolLike( -10 );
  test.identical( got, false );

  test.case = 'number positive input'
  var got = _.boolLike( 10 );
  test.identical( got, false );

  //

  test.case = 'empty object input'
  var got = _.boolLike( {} );
  test.identical( got, false );

  test.case = 'object input'
  var got = _.boolLike( { name : 'a', age : 99 } );
  test.identical( got, false );

  test.case = 'empty array input'
  var got = _.boolLike( [] );
  test.identical( got, false );

  test.case = 'array input'
  var got = _.boolLike( [ 1, 2, 3 ] );
  test.identical( got, false );

  //

  test.case = 'bool false input'
  var got = _.boolLike( false );
  test.identical( got, true );

  test.case = 'bool true input'
  var got = _.boolLike( true );
  test.identical( got, true );
}

//

function boolLikeFalse ( test )
{
  test.case = 'string empty input';
  var got = _.boolLikeFalse( '' );
  test.identical( got, false );

  test.case = 'string input'
  var got = _.boolLikeFalse( 'hello' );
  test.identical( got, false );

  test.case = 'string number'
  var got = _.boolLikeFalse( '1' );
  test.identical( got, false );

  //

  test.case = 'number 1 input'
  var got = _.boolLikeFalse( 1 );
  test.identical( got, false );

  test.case = 'number 0 input'
  var got = _.boolLikeFalse( 0 );
  test.identical( got, true );

  test.case = 'number negative input'
  var got = _.boolLikeFalse( -10 );
  test.identical( got, false );

  test.case = 'number positive input'
  var got = _.boolLikeFalse( 10 );
  test.identical( got, false );

  //

  test.case = 'empty object input'
  var got = _.boolLikeFalse( {} );
  test.identical( got, false );

  test.case = 'object input'
  var got = _.boolLikeFalse( { name : 'a', age : 99 } );
  test.identical( got, false );

  test.case = 'empty array input'
  var got = _.boolLikeFalse( [] );
  test.identical( got, false );

  test.case = 'array input'
  var got = _.boolLikeFalse( [ 1, 2, 3 ] );
  test.identical( got, false );

  //

  test.case = 'bool false input'
  var got = _.boolLikeFalse( false );
  test.identical( got, true );

  test.case = 'bool true input'
  var got = _.boolLikeFalse( true );
  test.identical( got, false );
}

//

function boolLikeTrue ( test )
{
  test.case = 'string empty input';
  var got = _.boolLikeTrue( '' );
  test.identical( got, false );

  test.case = 'string input'
  var got = _.boolLikeTrue( 'hello' );
  test.identical( got, false );

  test.case = 'string number'
  var got = _.boolLikeTrue( '1' );
  test.identical( got, false );

  //

  test.case = 'number 1 input'
  var got = _.boolLikeTrue( 1 );
  test.identical( got, true );

  test.case = 'number 0 input'
  var got = _.boolLikeTrue( 0 );
  test.identical( got, false );

  test.case = 'number negative input'
  var got = _.boolLikeTrue( -10 );
  test.identical( got, false );

  test.case = 'number positive input'
  var got = _.boolLikeTrue( 10 );
  test.identical( got, false );

  //

  test.case = 'empty object input'
  var got = _.boolLikeTrue( {} );
  test.identical( got, false );

  test.case = 'object input'
  var got = _.boolLikeTrue( { name : 'a', age : 99 } );
  test.identical( got, false );

  test.case = 'empty array input'
  var got = _.boolLikeTrue( [] );
  test.identical( got, false );

  test.case = 'array input'
  var got = _.boolLikeTrue( [ 1, 2, 3 ] );
  test.identical( got, false );

  //

  test.case = 'bool false input'
  var got = _.boolLikeTrue( false );
  test.identical( got, false );

  test.case = 'bool true input'
  var got = _.boolLikeTrue( true );
  test.identical( got, true );
}

//

function fuzzyIs( test )
{
  test.case = 'string empty input';
  var got = _.fuzzyIs( '' );
  test.identical( got, false );

  test.case = 'string input'
  var got = _.fuzzyIs( 'hello' );
  test.identical( got, false );

  test.case = 'string number'
  var got = _.fuzzyIs( '1' );
  test.identical( got, false );

  //

  test.case = 'number 1 input'
  var got = _.fuzzyIs( 1 );
  test.identical( got, false );

  test.case = 'number 0 input'
  var got = _.fuzzyIs( 0 );
  test.identical( got, false );

  test.case = 'number negative input'
  var got = _.fuzzyIs( -10 );
  test.identical( got, false );

  test.case = 'number positive input'
  var got = _.fuzzyIs( 10 );
  test.identical( got, false );

  //

  test.case = 'empty object input'
  var got = _.fuzzyIs( {} );
  test.identical( got, false );

  test.case = 'object input'
  var got = _.fuzzyIs( { name : 'a', age : 99 } );
  test.identical( got, false );

  test.case = 'empty array input'
  var got = _.fuzzyIs( [] );
  test.identical( got, false );

  test.case = 'array input'
  var got = _.fuzzyIs( [ 1, 2, 3 ] );
  test.identical( got, false );

  //

  test.case = 'bool false input'
  var got = _.fuzzyIs( false );
  test.identical( got, true );

  test.case = 'bool true input'
  var got = _.fuzzyIs( true );
  test.identical( got, true );

  //

  test.case = 'Symbol( maybe ) input'
  var got = _.fuzzyIs( Symbol.for( 'maybe' ) );
  test.identical( got, true );

  test.case = 'Symbol( another ) input'
  var got = _.fuzzyIs( Symbol.for( 'another' ) );
  test.identical( got, false );
}

//

function fuzzyLike( test )
{
  test.case = 'string empty input';
  var got = _.fuzzyLike( '' );
  test.identical( got, false );

  test.case = 'string input'
  var got = _.fuzzyLike( 'hello' );
  test.identical( got, false );

  test.case = 'string number'
  var got = _.fuzzyLike( '1' );
  test.identical( got, false );

  //

  test.case = 'number 1 input'
  var got = _.fuzzyLike( 1 );
  test.identical( got, true );

  test.case = 'number 0 input'
  var got = _.fuzzyLike( 0 );
  test.identical( got, true );

  test.case = 'number negative input'
  var got = _.fuzzyLike( -10 );
  test.identical( got, true );

  test.case = 'number positive input'
  var got = _.fuzzyLike( 10 );
  test.identical( got, true );

  //

  test.case = 'empty object input'
  var got = _.fuzzyLike( {} );
  test.identical( got, false );

  test.case = 'object input'
  var got = _.fuzzyLike( { name : 'a', age : 99 } );
  test.identical( got, false );

  test.case = 'empty array input'
  var got = _.fuzzyLike( [] );
  test.identical( got, false );

  test.case = 'array input'
  var got = _.fuzzyLike( [ 1, 2, 3 ] );
  test.identical( got, false );

  //

  test.case = 'bool false input'
  var got = _.fuzzyLike( false );
  test.identical( got, true );

  test.case = 'bool true input'
  var got = _.fuzzyLike( true );
  test.identical( got, true );

  //

  test.case = 'Symbol( maybe ) input'
  var got = _.fuzzyLike( Symbol.for( 'maybe' ) );
  test.identical( got, true );

  test.case = 'Symbol( another ) input'
  var got = _.fuzzyLike( Symbol.for( 'another' ) );
  test.identical( got, false );
}

//

function fuzzyLikeFalse( test )
{
  test.case = 'string empty input';
  var got = _.fuzzyLikeFalse( '' );
  test.identical( got, false );

  test.case = 'string input'
  var got = _.fuzzyLikeFalse( 'hello' );
  test.identical( got, false );

  test.case = 'string number'
  var got = _.fuzzyLikeFalse( '1' );
  test.identical( got, false );

  //

  test.case = 'number 1 input'
  var got = _.fuzzyLikeFalse( 1 );
  test.identical( got, false );

  test.case = 'number 0 input'
  var got = _.fuzzyLikeFalse( 0 );
  test.identical( got, true );

  test.case = 'number negative input'
  var got = _.fuzzyLikeFalse( -10 );
  test.identical( got, false );

  test.case = 'number positive input'
  var got = _.fuzzyLikeFalse( 10 );
  test.identical( got, false );

  //

  test.case = 'empty object input'
  var got = _.fuzzyLikeFalse( {} );
  test.identical( got, false );

  test.case = 'object input'
  var got = _.fuzzyLikeFalse( { name : 'a', age : 99 } );
  test.identical( got, false );

  test.case = 'empty array input'
  var got = _.fuzzyLikeFalse( [] );
  test.identical( got, false );

  test.case = 'array input'
  var got = _.fuzzyLikeFalse( [ 1, 2, 3 ] );
  test.identical( got, false );

  //

  test.case = 'bool false input'
  var got = _.fuzzyLikeFalse( false );
  test.identical( got, true );

  test.case = 'bool true input'
  var got = _.fuzzyLikeFalse( true );
  test.identical( got, false );

  //

  test.case = 'Symbol( maybe ) input'
  var got = _.fuzzyLikeFalse( Symbol.for( 'maybe' ) );
  test.identical( got, false );

  test.case = 'Symbol( another ) input'
  var got = _.fuzzyLikeFalse( Symbol.for( 'another' ) );
  test.identical( got, false );
}

//

function fuzzyLikeTrue( test )
{
  test.case = 'string empty input';
  var got = _.fuzzyLikeTrue( '' );
  test.identical( got, false );

  test.case = 'string input'
  var got = _.fuzzyLikeTrue( 'hello' );
  test.identical( got, false );

  test.case = 'string number'
  var got = _.fuzzyLikeTrue( '1' );
  test.identical( got, false );

  //

  test.case = 'number 1 input'
  var got = _.fuzzyLikeTrue( 1 );
  test.identical( got, true );

  test.case = 'number 0 input'
  var got = _.fuzzyLikeTrue( 0 );
  test.identical( got, false );

  test.case = 'number negative input'
  var got = _.fuzzyLikeTrue( -10 );
  test.identical( got, true );

  test.case = 'number positive input'
  var got = _.fuzzyLikeTrue( 10 );
  test.identical( got, true );

  //

  test.case = 'empty object input'
  var got = _.fuzzyLikeTrue( {} );
  test.identical( got, false );

  test.case = 'object input'
  var got = _.fuzzyLikeTrue( { name : 'a', age : 99 } );
  test.identical( got, false );

  test.case = 'empty array input'
  var got = _.fuzzyLikeTrue( [] );
  test.identical( got, false );

  test.case = 'array input'
  var got = _.fuzzyLikeTrue( [ 1, 2, 3 ] );
  test.identical( got, false );

  //

  test.case = 'bool false input'
  var got = _.fuzzyLikeTrue( false );
  test.identical( got, false );

  test.case = 'bool true input'
  var got = _.fuzzyLikeTrue( true );
  test.identical( got, true );

  //

  test.case = 'Symbol( maybe ) input'
  var got = _.fuzzyLikeTrue( Symbol.for( 'maybe' ) );
  test.identical( got, false );

  test.case = 'Symbol( another )input'
  var got = _.fuzzyLikeTrue( Symbol.for( 'another' ) );
  test.identical( got, false );
}

//--
// l0/l8/gBool.s
//--

function boolFrom( test )
{
  test.case = 'string \'1\''
  var got = _.boolFrom( '1' );
  test.identical( got, true );

  test.case = 'string \'0\''
  var got = _.boolFrom( '0' );
  test.identical( got, false );

  test.case = 'string \'true\''
  var got = _.boolFrom( 'true' );
  test.identical( got, true );

  test.case = 'string \'false\''
  var got = _.boolFrom( 'false' );
  test.identical( got, false );

  //

  test.case = 'number 1 input'
  var got = _.boolFrom( 1 );
  test.identical( got, true );

  test.case = 'number 0 input'
  var got = _.boolFrom( 0 );
  test.identical( got, false );

  test.case = 'number negative input'
  var got = _.boolFrom( -10 );
  test.identical( got, true );

  test.case = 'number positive input'
  var got = _.boolFrom( 10 );
  test.identical( got, true );

  //

  test.case = 'bool false input'
  var got = _.boolFrom( false );
  test.identical( got, false );

  test.case = 'bool true input'
  var got = _.boolFrom( true );
  test.identical( got, true );

  //

  test.case = 'empty object input'
  test.shouldThrowErrorSync( () => _.boolFrom( {} ) );

  test.case = 'object input'
  test.shouldThrowErrorSync( () => _.boolFrom( { name : 'a', age : 100 } ) );

  test.case = 'empty array input'
  test.shouldThrowErrorSync( () => _.boolFrom( [] ) );

  test.case = 'array input'
  test.shouldThrowErrorSync( () => _.boolFrom( [ 1, 2, 3 ] ) );

  test.case = 'Symbol( maybe ) input'
  test.shouldThrowErrorSync( () => _.boolFrom( Symbol.for( 'maybe' ) ) );

  test.case = 'Symbol( another )input'
  test.shouldThrowErrorSync( () => _.boolFrom( Symbol.for( 'another' ) ) );

  test.case = 'string empty input';
  test.shouldThrowErrorSync( () => _.boolFrom( '' ) );

  test.case = 'string input'
  test.shouldThrowErrorSync( () => _.boolFrom( 'hello' ) );
}

//

function boolFromMaybe( test )
{
  test.case = 'string \'1\''
  var got = _.boolFromMaybe( '1' );
  test.identical( got, true );

  test.case = 'string \'0\''
  var got = _.boolFromMaybe( '0' );
  test.identical( got, false );

  test.case = 'string \'true\''
  var got = _.boolFromMaybe( 'true' );
  test.identical( got, true );

  test.case = 'string \'false\''
  var got = _.boolFromMaybe( 'false' );
  test.identical( got, false );

  test.case = 'string \'hello\''
  var got = _.boolFromMaybe( 'hello' );
  test.identical( got, 'hello' );

  //

  test.case = 'number 1 input'
  var got = _.boolFromMaybe( 1 );
  test.identical( got, true );

  test.case = 'number 0 input'
  var got = _.boolFromMaybe( 0 );
  test.identical( got, false );

  test.case = 'number negative input'
  var got = _.boolFromMaybe( -10 );
  test.identical( got, true );

  test.case = 'number positive input'
  var got = _.boolFromMaybe( 10 );
  test.identical( got, true );

  //

  test.case = 'empty object input'
  var got = _.boolFromMaybe( {} );
  test.identical( got, {} );

  test.case = 'object input'
  var got = _.boolFromMaybe( { name : 'a', age : 99 } );
  test.identical( got, { name : 'a', age : 99 } );

  test.case = 'empty array input'
  var got = _.boolFromMaybe( [] );
  test.identical( got, [] );

  test.case = 'array input'
  var got = _.boolFromMaybe( [ 1, 2, 3 ] );
  test.identical( got, [ 1, 2, 3 ] );

  //

  test.case = 'bool false input'
  var got = _.boolFromMaybe( false );
  test.identical( got, false );

  test.case = 'bool true input'
  var got = _.boolFromMaybe( true );
  test.identical( got, true );

  //

  test.case = 'Symbol( maybe ) input'
  var got = _.boolFromMaybe( Symbol.for( 'maybe' ) );
  test.identical( got, Symbol.for( 'maybe' ) );

  test.case = 'Symbol( another )input'
  var got = _.boolFromMaybe( Symbol.for( 'another' ) );
  test.identical( got, Symbol.for( 'another' ) );
}

//

function boolFromForce( test )
{
  test.case = 'empty string'
  var got = _.boolFromForce( '' );
  test.identical( got, false );

  test.case = 'string \'1\''
  var got = _.boolFromForce( '1' );
  test.identical( got, true );

  test.case = 'string \'0\''
  var got = _.boolFromForce( '0' );
  test.identical( got, false );

  test.case = 'string \'true\''
  var got = _.boolFromForce( 'true' );
  test.identical( got, true );

  test.case = 'string \'false\''
  var got = _.boolFromForce( 'false' );
  test.identical( got, false );

  test.case = 'string \'undefined\''
  var got = _.boolFromForce( 'undefined' );
  test.identical( got, false );

  test.case = 'string \'null\''
  var got = _.boolFromForce( 'null' );
  test.identical( got, false );

  test.case = 'string \'hello\''
  var got = _.boolFromForce( 'hello' );
  test.identical( got, true );

  //

  test.case = 'number 1 input'
  var got = _.boolFromForce( 1 );
  test.identical( got, true );

  test.case = 'number 0 input'
  var got = _.boolFromForce( 0 );
  test.identical( got, false );

  test.case = 'number negative input'
  var got = _.boolFromForce( -10 );
  test.identical( got, true );

  test.case = 'number positive input'
  var got = _.boolFromForce( 10 );
  test.identical( got, true );

  //

  test.case = 'empty object input'
  var got = _.boolFromForce( {} );
  test.identical( got, true );

  test.case = 'object input'
  var got = _.boolFromForce( { name : 'a', age : 99 } );
  test.identical( got, true );

  test.case = 'empty array input'
  var got = _.boolFromForce( [] );
  test.identical( got, true );

  test.case = 'array input'
  var got = _.boolFromForce( [ 1, 2, 3 ] );
  test.identical( got, true );

  //

  test.case = 'bool false input'
  var got = _.boolFromForce( false );
  test.identical( got, false );

  test.case = 'bool true input'
  var got = _.boolFromForce( true );
  test.identical( got, true );

  //

  test.case = 'Symbol( maybe ) input'
  var got = _.boolFromForce( Symbol.for( 'maybe' ) );
  test.identical( got, true );

  test.case = 'Symbol( another )input'
  var got = _.boolFromForce( Symbol.for( 'another' ) );
  test.identical( got, true );
}

// --
// declaration
// --

let Self =
{

  name : 'Tools.Bool',
  silencing : 1,
  enabled : 1,

  tests :
  {

    // l0/l3/iBool.s

    boolIs,
    boolLike,
    boolLikeFalse,
    boolLikeTrue,

    fuzzyIs,
    fuzzyLike,
    fuzzyLikeFalse,
    fuzzyLikeTrue,


    // lo/l8/gBool.s

    boolFrom,
    boolFromMaybe,
    boolFromForce
  }

}

Self = wTestSuite( Self );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

})();
