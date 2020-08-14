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

  test.case = 'bool true input'
  var got = _.fuzzyIs( Symbol.for( 'maybe' ) );
  test.identical( got, true );

  test.case = 'bool true input'
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

  test.case = 'bool true input'
  var got = _.fuzzyLike( Symbol.for( 'maybe' ) );
  test.identical( got, true );

  test.case = 'bool true input'
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

  test.case = 'bool true input'
  var got = _.fuzzyLikeFalse( Symbol.for( 'maybe' ) );
  test.identical( got, false );

  test.case = 'bool true input'
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

  test.case = 'bool true input'
  var got = _.fuzzyLikeTrue( Symbol.for( 'maybe' ) );
  test.identical( got, false );

  test.case = 'bool true input'
  var got = _.fuzzyLikeTrue( Symbol.for( 'another' ) );
  test.identical( got, false );
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

  }

}

Self = wTestSuite( Self );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

})();
