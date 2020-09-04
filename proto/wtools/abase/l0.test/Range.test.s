( function _Range_test_s()
{

'use strict';

if( typeof module !== 'undefined' )
{
  let _ = require( '../Layer1.s' );
  _.include( 'wTesting' );
}

let _ = wTools;

//--
// range l0/l3/iRange.s
//--

function is( test )
{
  let namespaces =
  [
    'crange',
    'lrange',
    'orange',
  ];

  for( let i = 0 ; i < namespaces.length ; i++ )
  {
    test.open( `namespace - ${ namespaces[ i ] }` );
    testRun( namespaces[ i ] );
    test.close( `namespace - ${ namespaces[ i ] }` );
  }

  /* - */

  function testRun( namespace )
  {
    test.case = 'undefined';
    var got = _[ namespace ].is( undefined );
    var expected = false;
    test.identical( got, expected );

    test.case = 'null';
    var got = _[ namespace ].is( null );
    var expected = false;
    test.identical( got, expected );

    test.case = 'false';
    var got = _[ namespace ].is( false );
    var expected = false;
    test.identical( got, expected );

    test.case = 'empty string';
    var got = _[ namespace ].is( '' );
    var expected = false;
    test.identical( got, expected );

    test.case = 'zero';
    var got = _[ namespace ].is( 0 );
    var expected = false;
    test.identical( got, expected );

    test.case = 'NaN';
    var got = _[ namespace ].is( NaN );
    var expected = false;
    test.identical( got, expected );

    test.case = 'a boolean';
    var got = _[ namespace ].is( true );
    var expected = false;
    test.identical( got, expected );

    test.case = 'a number';
    var got = _[ namespace ].is( 13 );
    var expected = false;
    test.identical( got, expected );

    test.case = 'a function';
    var got = _[ namespace ].is( function() {} );
    var expected = false;
    test.identical( got, expected );

    test.case = 'constructor';
    function Constr( x )
    {
      this.x = x;
      return this;
    }
    var got = _[ namespace ].is( new Constr( 0 ) );
    var expected = false;
    test.identical( got, expected );

    test.case = 'a string';
    var got = _[ namespace ].is( 'str' );
    var expected = false;
    test.identical( got, expected );

    test.case = 'BufferRaw';
    var got = _[ namespace ].is( new BufferRaw( 5 ) );
    var expected = false;
    test.identical( got, expected );

    test.case = 'BufferView';
    var got = _[ namespace ].is( new BufferView( new BufferRaw( 5 ) ) );
    var expected = false;
    test.identical( got, expected );

    test.case = 'Set';
    var got = _[ namespace ].is( new Set( [ 5 ] ) );
    var expected = false;
    test.identical( got, expected );

    test.case = 'Map';
    var got = _[ namespace ].is( new Map( [ [ 1, 2 ] ] ) );
    var expected = false;
    test.identical( got, expected );

    test.case = 'pure empty map';
    var got = _[ namespace ].is( Object.create( null ) );
    var expected = false;
    test.identical( got, expected );

    test.case = 'pure map';
    var src = Object.create( null );
    src.x = 1;
    var got = _[ namespace ].is( src );
    var expected = false;
    test.identical( got, expected );

    test.case = 'map from pure map';
    var src = Object.create( Object.create( null ) );
    var got = _[ namespace ].is( src );
    var expected = false;
    test.identical( got, expected );

    test.case = 'an empty object';
    var got = _[ namespace ].is( {} );
    var expected = false;
    test.identical( got, expected );

    test.case = 'an object';
    var got = _[ namespace ].is( { a : 7, b : 13 } );
    var expected = false;
    test.identical( got, expected );

    /* */

    test.case = 'array.length = 0';
    var got = _[ namespace ].is( [] );
    var expected = false;
    test.identical( got, expected );

    test.case = 'array.length = 1';
    var got = _[ namespace ].is( [ 1 ] );
    var expected = false;
    test.identical( got, expected );

    test.case = 'array.length = 2, numbers';
    var got = _[ namespace ].is( [ 1, 2 ] );
    var expected = true;
    test.identical( got, expected );

    test.case = 'array.length = 2, number and undefined';
    var got = _[ namespace ].is( [ 1, undefined ] );
    var expected = false;
    test.identical( got, expected );

    test.case = 'array.length > 2';
    var got = _[ namespace ].is( [ 1, 2, 3 ] );
    var expected = false;
    test.identical( got, expected );

    test.case = 'unroll.length = 0';
    var got = _[ namespace ].is( _.unrollMake( [] ) );
    var expected = false;
    test.identical( got, expected );

    test.case = 'unroll.length = 1';
    var got = _[ namespace ].is( _.unrollMake( [ 1 ] ) );
    var expected = false;
    test.identical( got, expected );

    test.case = 'unroll.length = 2, numbers';
    var got = _[ namespace ].is( _.unrollMake( [ 1, 2 ] ) );
    var expected = true;
    test.identical( got, expected );

    test.case = 'unroll.length = 2, number and undefined';
    var got = _[ namespace ].is( _.unrollMake( [ 1, undefined ] ) );
    var expected = false;
    test.identical( got, expected );

    test.case = 'unroll.length > 2';
    var got = _[ namespace ].is( _.unrollMake( [ 1, 2, 3 ] ) );
    var expected = false;
    test.identical( got, expected );

    test.case = 'argumentsArray.length = 0';
    var got = _[ namespace ].is( _.argumentsArrayMake( [] ) );
    var expected = false;
    test.identical( got, expected );

    test.case = 'argumentsArray.length = 1';
    var got = _[ namespace ].is( _.argumentsArrayMake( [ 1 ] ) );
    var expected = false;
    test.identical( got, expected );

    test.case = 'argumentsArray.length = 2, numbers';
    var got = _[ namespace ].is( _.argumentsArrayMake( [ 1, 2 ] ) );
    var expected = true;
    test.identical( got, expected );

    test.case = 'argumentsArray.length = 2, number and undefined';
    var got = _[ namespace ].is( _.argumentsArrayMake( [ 1, undefined ] ) );
    var expected = false;
    test.identical( got, expected );

    test.case = 'argumentsArray.length > 2';
    var got = _[ namespace ].is( _.argumentsArrayMake( [ 1, 2, 3 ] ) );
    var expected = false;
    test.identical( got, expected );

    test.case = 'BufferTyped.length = 0';
    var got = _[ namespace ].is( new U8x() );
    var expected = false;
    test.identical( got, expected );

    test.case = 'BufferTyped.length = 1';
    var got = _[ namespace ].is( new I16x( 1 ) );
    var expected = false;
    test.identical( got, expected );

    test.case = 'BufferTyped.length = 2';
    var got = _[ namespace ].is( new F32x( 2 ) );
    var expected = true;
    test.identical( got, expected );

    test.case = 'BufferTyped.length > 2';
    var got = _[ namespace ].is( new F32x( 4 ) );
    var expected = false;
    test.identical( got, expected );

    /* - */

    if( !Config.debug )
    return;

    test.case = 'without arguments';
    test.shouldThrowErrorSync( () => _[ namespace ].is() );

    test.case = 'extra arguments';
    test.shouldThrowErrorSync( () => _[ namespace ].is( [ 1, 2 ], 'extra' ) );
  }
}

//

function isValid( test )
{
  let namespaces =
  [
    'crange',
    'lrange',
    'orange',
  ];

  for( let i = 0 ; i < namespaces.length ; i++ )
  {
    test.open( `namespace - ${ namespaces[ i ] }` );
    testRun( namespaces[ i ] );
    test.close( `namespace - ${ namespaces[ i ] }` );
  }

  /* - */

  function testRun( namespace )
  {
    test.case = 'not a range, long with 1 element';
    var got = _[ namespace ].isValid([ 1 ]);
    var expected = false;
    test.identical( got, expected );

    test.case = 'not a range, long with 3 elements';
    var got = _[ namespace ].isValid([ 1, 2, 3 ]);
    var expected = false;
    test.identical( got, expected );

    test.case = 'range, elements isValid undefined';
    var got = _[ namespace ].isValid([ undefined, undefined ]);
    var expected = false;
    test.identical( got, expected );

    test.case = 'range, first element isValid undefined';
    var got = _[ namespace ].isValid([ undefined, 2 ]);
    var expected = false;
    test.identical( got, expected );

    test.case = 'range, second element isValid undefined';
    var got = _[ namespace ].isValid([ 2, undefined ]);
    var expected = false;
    test.identical( got, expected );

    /* */

    test.case = 'range, two NaN';
    var got = _[ namespace ].isValid([ NaN, NaN ]);
    var expected = false;
    test.identical( got, expected );

    test.case = 'range, first element isValid NaN';
    var got = _[ namespace ].isValid([ NaN, 2 ]);
    var expected = false;
    test.identical( got, expected );

    test.case = 'range, second element isValid NaN';
    var got = _[ namespace ].isValid([ 2, NaN ]);
    var expected = false;
    test.identical( got, expected );

    /* */

    test.case = 'range, two not integer numbers';
    var got = _[ namespace ].isValid([ 2.01, 10/3 ]);
    var expected = false;
    test.identical( got, expected );

    test.case = 'range, first element isValid not an integer';
    var got = _[ namespace ].isValid([ 2.01, 2 ]);
    var expected = false;
    test.identical( got, expected );

    test.case = 'range, second element isValid not an integer';
    var got = _[ namespace ].isValid([ 2, 10/3 ]);
    var expected = false;
    test.identical( got, expected );

    /* */

    test.case = 'range, two Infinity';
    var got = _[ namespace ].isValid([ Infinity, Infinity ]);
    var expected = true;
    test.identical( got, expected );

    test.case = 'range, first element isValid Infinity';
    var got = _[ namespace ].isValid([ Infinity, 2 ]);
    var expected = true;
    test.identical( got, expected );

    test.case = 'range, second element isValid Infinity';
    var got = _[ namespace ].isValid([ 2, Infinity ]);
    var expected = true;
    test.identical( got, expected );

    /* */

    test.case = 'range, two positive integer';
    var got = _[ namespace ].isValid([ 2, 10 ]);
    var expected = true;
    test.identical( got, expected );

    test.case = 'range, two negative integer';
    var got = _[ namespace ].isValid([ -2, -10 ]);
    var expected = true;
    test.identical( got, expected );

    test.case = 'range, first element +0';
    var got = _[ namespace ].isValid([ +0, -10 ]);
    var expected = true;
    test.identical( got, expected );

    /* - */

    if( !Config.debug )
    return;

    test.case = 'without arguments';
    test.shouldThrowErrorSync( () => _[ namespace ].isValid() );

    test.case = 'extra arguments';
    test.shouldThrowErrorSync( () => _[ namespace ].isValid( [ 1, 2 ], 'extra' ) );
  }
}

//

function fromLeft( test )
{
  let namespaces =
  [
    'crange',
    'lrange',
    'orange',
  ];

  for( let i = 0 ; i < namespaces.length ; i++ )
  {
    test.open( `namespace - ${ namespaces[ i ] }` );
    testRun( namespaces[ i ] );
    test.close( `namespace - ${ namespaces[ i ] }` );
  }

  /* - */

  function testRun( namespace )
  {
    test.case = 'range - number';
    var got = _[ namespace ].fromLeft( 1 );
    test.identical( got, [ 1, Infinity ] );

    /* */

    test.case = 'range.length === 1';
    var src = [ 1 ];
    var got = _[ namespace ].fromLeft( src );
    test.identical( got, [ 1, Infinity ] );
    test.is( got !== src );

    test.case = 'range[ 0 ] - undefined';
    var src = [ undefined, 1 ];
    var got = _[ namespace ].fromLeft( src );
    test.identical( got, [ 0, 1 ] );
    test.is( got === src );

    test.case = 'range[ 1 ] - undefined';
    var src = [ 1, undefined ];
    var got = _[ namespace ].fromLeft( src );
    test.identical( got, [ 1, Infinity ] );
    test.is( got === src );

    test.case = 'range[ 0 ] - undefined, range[ 1 ] - undefined';
    var src = [ undefined, undefined ];
    var got = _[ namespace ].fromLeft( src );
    test.identical( got, [ 0, Infinity ] );
    test.is( got === src );

    test.case = 'range[ 0 ] - number, range[ 1 ] - number';
    var src = [ 1, 5 ];
    var got = _[ namespace ].fromLeft( src );
    test.identical( got, [ 1, 5 ] );
    test.is( got === src );

    /* */

    test.case = 'range.length === 1';
    var src = _.unrollMake( [ 1 ] );
    var got = _[ namespace ].fromLeft( src );
    test.identical( got, [ 1, Infinity ] );
    test.is( got !== src );

    test.case = 'range[ 0 ] - undefined';
    var src = _.unrollMake( [ undefined, 1 ] );
    var got = _[ namespace ].fromLeft( src );
    test.identical( got, [ 0, 1 ] );
    test.is( got === src );

    test.case = 'range[ 1 ] - undefined';
    var src = _.unrollMake( [ 1, undefined ] );
    var got = _[ namespace ].fromLeft( src );
    test.identical( got, [ 1, Infinity ] );
    test.is( got === src );

    test.case = 'range[ 0 ] - undefined, range[ 1 ] - undefined';
    var src = _.unrollMake( [ undefined, undefined ] );
    var got = _[ namespace ].fromLeft( src );
    test.identical( got, [ 0, Infinity ] );
    test.is( got === src );

    test.case = 'range[ 0 ] - number, range[ 1 ] - number';
    var src = _.unrollMake( [ 1, 5 ] );
    var got = _[ namespace ].fromLeft( src );
    test.identical( got, _.unrollMake( [ 1, 5 ] ) );
    test.is( got === src );

    /* */

    test.case = 'range.length === 1';
    var src = _.argumentsArrayMake( [ 1 ] );
    var got = _[ namespace ].fromLeft( src );
    test.identical( got, [ 1, Infinity ] );
    test.is( got !== src );

    test.case = 'range[ 0 ] - undefined';
    var src = _.argumentsArrayMake( [ undefined, 1 ] );
    var got = _[ namespace ].fromLeft( src );
    test.identical( got, _.argumentsArrayMake([ 0, 1 ]) );
    test.is( got === src );

    test.case = 'range[ 1 ] - undefined';
    var src = _.argumentsArrayMake( [ 1, undefined ] );
    var got = _[ namespace ].fromLeft( src );
    test.identical( got, _.argumentsArrayMake([ 1, Infinity ]) );
    test.is( got === src );

    test.case = 'range[ 0 ] - undefined, range[ 1 ] - undefined';
    var src = _.argumentsArrayMake( [ undefined, undefined ] );
    var got = _[ namespace ].fromLeft( src );
    test.identical( got, _.argumentsArrayMake([ 0, Infinity ]) );
    test.is( got === src );

    test.case = 'range[ 0 ] - number, range[ 1 ] - number';
    var src = _.argumentsArrayMake( [ 1, 5 ] );
    var got = _[ namespace ].fromLeft( src );
    test.identical( got, _.argumentsArrayMake( [ 1, 5 ] ) );
    test.is( got === src );

    /* */

    test.case = 'range.length === 1';
    var src = new U8x( [ 1 ] );
    var got = _[ namespace ].fromLeft( src );
    test.identical( got, [ 1, Infinity ] );
    test.is( got !== src );

    test.case = 'range[ 0 ] - number, range[ 1 ] - number';
    var src = new I16x( [ 1, 5 ] );
    var got = _[ namespace ].fromLeft( src );
    test.identical( got, new I16x( [ 1, 5 ] ) );
    test.is( got === src );

    /* - */

    if( !Config.debug )
    return;

    test.case = 'without arguments';
    test.shouldThrowErrorSync( () => _[ namespace ].fromLeft() );

    test.case = 'extra arguments';
    test.shouldThrowErrorSync( () => _[ namespace ].fromLeft( [ 1, 2 ], 1 ) );

    test.case = 'wrong type of range';
    test.shouldThrowErrorSync( () => _[ namespace ].fromLeft( { 0 : 1, 1 : 2 } ) );

    test.case = 'wrong range length';
    test.shouldThrowErrorSync( () => _[ namespace ].fromLeft( [ 0, 1, 2 ] ) );

    test.case = 'wrong elements in range';
    test.shouldThrowErrorSync( () => _[ namespace ].fromLeft( [ null, 2 ] ) );
    test.shouldThrowErrorSync( () => _[ namespace ].fromLeft( [ 2, 'abc' ] ) );
  }
}

//

function fromRight( test )
{
  let namespaces =
  [
    'crange',
    'lrange',
    'orange',
  ];

  for( let i = 0 ; i < namespaces.length ; i++ )
  {
    test.open( `namespace - ${ namespaces[ i ] }` );
    testRun( namespaces[ i ] );
    test.close( `namespace - ${ namespaces[ i ] }` );
  }

  /* - */

  function testRun( namespace )
  {
    test.case = 'range - number';
    var got = _[ namespace ].fromRight( 1 );
    test.identical( got, [ 0, 1 ] );

    /* */

    test.case = 'range.length === 1';
    var src = [ 1 ];
    var got = _[ namespace ].fromRight( src );
    test.identical( got, [ 1, Infinity ] );
    test.is( got !== src );

    test.case = 'range[ 0 ] - undefined';
    var src = [ undefined, 1 ];
    var got = _[ namespace ].fromRight( src );
    test.identical( got, [ 0, 1 ] );
    test.is( got === src );

    test.case = 'range[ 1 ] - undefined';
    var src = [ 1, undefined ];
    var got = _[ namespace ].fromRight( src );
    test.identical( got, [ 1, Infinity ] );
    test.is( got === src );

    test.case = 'range[ 0 ] - undefined, range[ 1 ] - undefined';
    var src = [ undefined, undefined ];
    var got = _[ namespace ].fromRight( src );
    test.identical( got, [ 0, Infinity ] );
    test.is( got === src );

    test.case = 'range[ 0 ] - number, range[ 1 ] - number';
    var src = [ 1, 5 ];
    var got = _[ namespace ].fromRight( src );
    test.identical( got, [ 1, 5 ] );
    test.is( got === src );

    /* */

    test.case = 'range.length === 1';
    var src = _.unrollMake( [ 1 ] );
    var got = _[ namespace ].fromRight( src );
    test.identical( got, [ 1, Infinity ] );
    test.is( got !== src );

    test.case = 'range[ 0 ] - undefined';
    var src = _.unrollMake( [ undefined, 1 ] );
    var got = _[ namespace ].fromRight( src );
    test.identical( got, [ 0, 1 ] );
    test.is( got === src );

    test.case = 'range[ 1 ] - undefined';
    var src = _.unrollMake( [ 1, undefined ] );
    var got = _[ namespace ].fromRight( src );
    test.identical( got, [ 1, Infinity ] );
    test.is( got === src );

    test.case = 'range[ 0 ] - undefined, range[ 1 ] - undefined';
    var src = _.unrollMake( [ undefined, undefined ] );
    var got = _[ namespace ].fromRight( src );
    test.identical( got, [ 0, Infinity ] );
    test.is( got === src );

    test.case = 'range[ 0 ] - number, range[ 1 ] - number';
    var src = _.unrollMake( [ 1, 5 ] );
    var got = _[ namespace ].fromRight( src );
    test.identical( got, _.unrollMake( [ 1, 5 ] ) );
    test.is( got === src );

    /* */

    test.case = 'range.length === 1';
    var src = _.argumentsArrayMake( [ 1 ] );
    var got = _[ namespace ].fromRight( src );
    test.identical( got, [ 1, Infinity ] );
    test.is( got !== src );

    test.case = 'range[ 0 ] - undefined';
    var src = _.argumentsArrayMake( [ undefined, 1 ] );
    var got = _[ namespace ].fromRight( src );
    test.identical( got, _.argumentsArrayMake([ 0, 1 ]) );
    test.is( got === src );

    test.case = 'range[ 1 ] - undefined';
    var src = _.argumentsArrayMake( [ 1, undefined ] );
    var got = _[ namespace ].fromRight( src );
    test.identical( got, _.argumentsArrayMake([ 1, Infinity ]) );
    test.is( got === src );

    test.case = 'range[ 0 ] - undefined, range[ 1 ] - undefined';
    var src = _.argumentsArrayMake( [ undefined, undefined ] );
    var got = _[ namespace ].fromRight( src );
    test.identical( got, _.argumentsArrayMake([ 0, Infinity ]) );
    test.is( got === src );

    test.case = 'range[ 0 ] - number, range[ 1 ] - number';
    var src = _.argumentsArrayMake( [ 1, 5 ] );
    var got = _[ namespace ].fromRight( src );
    test.identical( got, _.argumentsArrayMake( [ 1, 5 ] ) );
    test.is( got === src );

    /* */

    test.case = 'range.length === 1';
    var src = new U8x( [ 1 ] );
    var got = _[ namespace ].fromRight( src );
    test.identical( got, [ 1, Infinity ] );
    test.is( got !== src );

    test.case = 'range[ 0 ] - number, range[ 1 ] - number';
    var src = new I16x( [ 1, 5 ] );
    var got = _[ namespace ].fromRight( src );
    test.identical( got, new I16x( [ 1, 5 ] ) );
    test.is( got === src );

    /* - */

    if( !Config.debug )
    return;

    test.case = 'without arguments';
    test.shouldThrowErrorSync( () => _[ namespace ].fromRight() );

    test.case = 'extra arguments';
    test.shouldThrowErrorSync( () => _[ namespace ].fromRight( [ 1, 2 ], 1 ) );

    test.case = 'wrong type of range';
    test.shouldThrowErrorSync( () => _[ namespace ].fromRight( { 0 : 1, 1 : 2 } ) );

    test.case = 'wrong range length';
    test.shouldThrowErrorSync( () => _[ namespace ].fromRight( [ 0, 1, 2 ] ) );

    test.case = 'wrong elements in range';
    test.shouldThrowErrorSync( () => _[ namespace ].fromRight( [ null, 2 ] ) );
    test.shouldThrowErrorSync( () => _[ namespace ].fromRight( [ 2, 'abc' ] ) );
  }
}

//

function firstGet( test )
{
  let namespaces =
  [
    'crange',
    'lrange',
    'orange',
  ];

  for( let i = 0 ; i < namespaces.length ; i++ )
  {
    test.open( `namespace - ${ namespaces[ i ] }` );
    testRun( namespaces[ i ] );
    test.close( `namespace - ${ namespaces[ i ] }` );
  }

  /* - */

  function testRun( namespace )
  {
    test.open( 'range - array' );

    test.case = 'without options';
    var got = _[ namespace ].firstGet( [ 1, 2 ] );
    test.identical( got, 1 );

    test.case = 'options - undefined';
    var options = undefined;
    var got = _[ namespace ].firstGet( [ 1, 2 ], options );
    test.identical( got, 1 );
    test.identical( options, undefined );

    test.case = 'options - empty map';
    var options = {};
    var got = _[ namespace ].firstGet( [ 1, 2 ], options );
    test.identical( got, 1 );
    test.identical( options, { increment : 1 } );

    test.case = 'options - map with own field increment';
    var options = { increment : 2 };
    var got = _[ namespace ].firstGet( [ 1, 2 ], options );
    test.identical( got, 1 );
    test.identical( options, { increment : 2 } );

    test.case = 'options - map with own field increment - undefined';
    var options = { increment : undefined };
    var got = _[ namespace ].firstGet( [ 1, 2 ], options );
    test.identical( got, 1 );
    test.identical( options, { increment : 1 } );

    test.close( 'range - array' );

    /* - */

    test.open( 'range - unroll' );

    test.case = 'without options';
    var got = _[ namespace ].firstGet( _.unrollMake( [ 1, 2 ] ) );
    test.identical( got, 1 );

    test.case = 'options - undefined';
    var options = undefined;
    var got = _[ namespace ].firstGet( _.unrollMake( [ 1, 2 ] ), options );
    test.identical( got, 1 );
    test.identical( options, undefined );

    test.case = 'options - empty map';
    var options = {};
    var got = _[ namespace ].firstGet( _.unrollMake( [ 1, 2 ] ), options );
    test.identical( got, 1 );
    test.identical( options, { increment : 1 } );

    test.case = 'options - map with own field increment';
    var options = { increment : 2 };
    var got = _[ namespace ].firstGet( _.unrollMake( [ 1, 2 ] ), options );
    test.identical( got, 1 );
    test.identical( options, { increment : 2 } );

    test.case = 'options - map with own field increment - undefined';
    var options = { increment : undefined };
    var got = _[ namespace ].firstGet( _.unrollMake( [ 1, 2 ] ), options );
    test.identical( got, 1 );
    test.identical( options, { increment : 1 } );

    test.close( 'range - unroll' );

    /* - */

    test.open( 'range - argumentsArray' );

    test.case = 'without options';
    var got = _[ namespace ].firstGet( _.argumentsArrayMake( [ 1, 2 ] ) );
    test.identical( got, 1 );

    test.case = 'options - undefined';
    var options = undefined;
    var got = _[ namespace ].firstGet( _.argumentsArrayMake( [ 1, 2 ] ), options );
    test.identical( got, 1 );
    test.identical( options, undefined );

    test.case = 'options - empty map';
    var options = {};
    var got = _[ namespace ].firstGet( _.argumentsArrayMake( [ 1, 2 ] ), options );
    test.identical( got, 1 );
    test.identical( options, { increment : 1 } );

    test.case = 'options - map with own field increment';
    var options = { increment : 2 };
    var got = _[ namespace ].firstGet( _.argumentsArrayMake( [ 1, 2 ] ), options );
    test.identical( got, 1 );
    test.identical( options, { increment : 2 } );

    test.case = 'options - map with own field increment - undefined';
    var options = { increment : undefined };
    var got = _[ namespace ].firstGet( _.argumentsArrayMake( [ 1, 2 ] ), options );
    test.identical( got, 1 );
    test.identical( options, { increment : 1 } );

    test.close( 'range - argumentsArray' );

    /* - */

    test.open( 'range - BufferTyped' );

    test.case = 'without options';
    var got = _[ namespace ].firstGet( new U8x( [ 1, 2 ] ) );
    test.identical( got, 1 );

    test.case = 'options - undefined';
    var options = undefined;
    var got = _[ namespace ].firstGet( new I16x( [ 1, 2 ] ), options );
    test.identical( got, 1 );
    test.identical( options, undefined );

    test.case = 'options - empty map';
    var options = {};
    var got = _[ namespace ].firstGet( new F32x( [ 1, 2 ] ), options );
    test.identical( got, 1 );
    test.identical( options, { increment : 1 } );

    test.case = 'options - map with own field increment';
    var options = { increment : 2 };
    var got = _[ namespace ].firstGet( new F64x( [ 1, 2 ] ), options );
    test.identical( got, 1 );
    test.identical( options, { increment : 2 } );

    test.case = 'options - map with own field increment - undefined';
    var options = { increment : undefined };
    var got = _[ namespace ].firstGet( new I8x( [ 1, 2 ] ), options );
    test.identical( got, 1 );
    test.identical( options, { increment : 1 } );

    test.close( 'range - BufferTyped' );

    /* - */

    test.open( 'range - map' );

    test.case = 'without options, first - undefined';
    var got = _[ namespace ].firstGet( { first : undefined, last : undefined } );
    test.identical( got, undefined );

    test.case = 'without options, first - not exists';
    var got = _[ namespace ].firstGet( { last : undefined } );
    test.identical( got, undefined );

    test.case = 'without options, first - number';
    var got = _[ namespace ].firstGet( { first : 1, last : undefined } );
    test.identical( got, 1 );

    /* */

    test.case = 'options - undefined, first - undefined';
    var options = undefined;
    var got = _[ namespace ].firstGet( { first : undefined, last : undefined }, options );
    test.identical( got, undefined );
    test.identical( options, undefined );

    test.case = 'options - undefined, first - not exists';
    var options = undefined;
    var got = _[ namespace ].firstGet( { last : undefined }, options );
    test.identical( got, undefined );
    test.identical( options, undefined );

    test.case = 'options - undefined, first - number';
    var options = undefined;
    var got = _[ namespace ].firstGet( { first : 1, last : undefined }, options );
    test.identical( got, 1 );
    test.identical( options, undefined );

    /* */

    test.case = 'options - empty map, first - undefined';
    var options = {};
    var got = _[ namespace ].firstGet( { first : undefined, last : undefined }, options );
    test.identical( got, undefined );
    test.identical( options, { increment : 1 } );

    test.case = 'options - empty map, first - not exists';
    var options = {};
    var got = _[ namespace ].firstGet( { last : undefined }, options );
    test.identical( got, undefined );
    test.identical( options, { increment : 1 } );

    test.case = 'options - empty map, first - number';
    var options = {};
    var got = _[ namespace ].firstGet( { first : 1, last : undefined }, options );
    test.identical( got, 1 );
    test.identical( options, { increment : 1 } );

    /* */

    test.case = 'options - map with own field increment, first - undefined';
    var options = { increment : 2 };
    var got = _[ namespace ].firstGet( { first : undefined, last : undefined }, options );
    test.identical( got, undefined );
    test.identical( options, { increment : 2 } );

    test.case = 'options - map with own field increment, first - not exists';
    var options = { increment : 2 };
    var got = _[ namespace ].firstGet( { last : undefined }, options );
    test.identical( got, undefined );
    test.identical( options, { increment : 2 } );

    test.case = 'options - map with own field increment, first - number';
    var options = { increment : 2 };
    var got = _[ namespace ].firstGet( { first : 1, last : undefined }, options );
    test.identical( got, 1 );
    test.identical( options, { increment : 2 } );

    /* */

    test.case = 'options - map with own field increment - undefined, first - undefined';
    var options = { increment : undefined };
    var got = _[ namespace ].firstGet( { first : undefined, last : undefined }, options );
    test.identical( got, undefined );
    test.identical( options, { increment : 1 } );

    test.case = 'options - map with own field increment - undefined, first - not exists';
    var options = { increment : undefined };
    var got = _[ namespace ].firstGet( { last : undefined }, options );
    test.identical( got, undefined );
    test.identical( options, { increment : 1 } );

    test.case = 'options - map with own field increment - undefined, first - number';
    var options = { increment : undefined };
    var got = _[ namespace ].firstGet( { first : 1, last : undefined }, options );
    test.identical( got, 1 );
    test.identical( options, { increment : 1 } );

    test.close( 'range - map' );

    if( !Config.debug )
    return;

    test.case = 'without arguments';
    test.shouldThrowErrorSync( () => _[ namespace ].firstGet() );

    test.case = 'extra arguments';
    test.shouldThrowErrorSync( () => _[ namespace ].firstGet( [ 1, 2 ], {}, 'extra' ) );

    test.case = 'range is a long, but is not a range';
    test.shouldThrowErrorSync( () => _[ namespace ].firstGet( [ 1, 2, 3 ] ) );
    test.shouldThrowErrorSync( () => _[ namespace ].firstGet( [ 1, 'wrong' ] ) );
    test.shouldThrowErrorSync( () => _[ namespace ].firstGet( [ undefined, 1 ] ) );

    test.case = 'wrong type of range';
    test.shouldThrowErrorSync( () => _[ namespace ].firstGet( new Set( [ 1, 2 ] ) ) );
    test.shouldThrowErrorSync( () => _[ namespace ].firstGet( new Map( [ [ 1, 2 ] ] ) ) );
  }
}

//

function toStr( test )
{
  let namespaces =
  [
    'crange',
    'lrange',
    'orange',
  ];

  for( let i = 0 ; i < namespaces.length ; i++ )
  {
    test.open( `namespace - ${ namespaces[ i ] }` );
    testRun( namespaces[ i ] );
    test.close( `namespace - ${ namespaces[ i ] }` );
  }

  /* - */

  function testRun( namespace )
  {
    test.case = 'range';
    var got = _[ namespace ].toStr( [ 1, 2 ] );
    test.identical( got, '1..2' );

    test.case = 'range with negative numbers';
    var got = _[ namespace ].toStr( [ -1, -2 ] );
    test.identical( got, '-1..-2' );

    /* - */

    if( !Config.debug )
    return;

    test.case = 'without arguments';
    test.shouldThrowErrorSync( () => _[ namespace ].toStr() );

    test.case = 'extra arguments';
    test.shouldThrowErrorSync( () => _[ namespace ].toStr( [ 1, 2 ], [ 1, 2 ] ) );

    test.case = 'range is not a range';
    test.shouldThrowErrorSync( () => _[ namespace ].toStr( [ 1, 2, 3 ] ) );
    test.shouldThrowErrorSync( () => _[ namespace ].toStr( [ 1, 'wrong' ] ) );
    test.shouldThrowErrorSync( () => _[ namespace ].toStr( [ undefined, 1 ] ) );
  }
}

// --
// crange
// --

function crangeIsEmpty( test )
{
  test.case = 'undefined';
  var got = _.crange.isEmpty( undefined );
  var expected = false;
  test.identical( got, expected );

  test.case = 'null';
  var got = _.crange.isEmpty( null );
  var expected = false;
  test.identical( got, expected );

  test.case = 'false';
  var got = _.crange.isEmpty( false );
  var expected = false;
  test.identical( got, expected );

  test.case = 'empty string';
  var got = _.crange.isEmpty( '' );
  var expected = false;
  test.identical( got, expected );

  test.case = 'zero';
  var got = _.crange.isEmpty( 0 );
  var expected = false;
  test.identical( got, expected );

  test.case = 'NaN';
  var got = _.crange.isEmpty( NaN );
  var expected = false;
  test.identical( got, expected );

  test.case = 'a boolean';
  var got = _.crange.isEmpty( true );
  var expected = false;
  test.identical( got, expected );

  test.case = 'a number';
  var got = _.crange.isEmpty( 13 );
  var expected = false;
  test.identical( got, expected );

  test.case = 'a function';
  var got = _.crange.isEmpty( function() {} );
  var expected = false;
  test.identical( got, expected );

  test.case = 'constructor';
  function Constr( x )
  {
    this.x = x;
    return this;
  }
  var got = _.crange.isEmpty( new Constr( 0 ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'a string';
  var got = _.crange.isEmpty( 'str' );
  var expected = false;
  test.identical( got, expected );

  test.case = 'BufferRaw';
  var got = _.crange.isEmpty( new BufferRaw( 5 ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'BufferView';
  var got = _.crange.isEmpty( new BufferView( new BufferRaw( 5 ) ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'Set';
  var got = _.crange.isEmpty( new Set( [ 5 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'Map';
  var got = _.crange.isEmpty( new Map( [ [ 1, 2 ] ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'pure empty map';
  var got = _.crange.isEmpty( Object.create( null ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'pure map';
  var src = Object.create( null );
  src.x = 1;
  var got = _.crange.isEmpty( src );
  var expected = false;
  test.identical( got, expected );

  test.case = 'map from pure map';
  var src = Object.create( Object.create( null ) );
  var got = _.crange.isEmpty( src );
  var expected = false;
  test.identical( got, expected );

  test.case = 'an empty object';
  var got = _.crange.isEmpty( {} );
  var expected = false;
  test.identical( got, expected );

  test.case = 'an object';
  var got = _.crange.isEmpty( { a : 7, b : 13 } );
  var expected = false;
  test.identical( got, expected );

  /* */

  test.case = 'array.length = 0';
  var got = _.crange.isEmpty( [] );
  var expected = false;
  test.identical( got, expected );

  test.case = 'array.length = 1';
  var got = _.crange.isEmpty( [ 1 ] );
  var expected = false;
  test.identical( got, expected );

  test.case = 'array.length = 2, different numbers';
  var got = _.crange.isEmpty( [ 1, 2 ] );
  var expected = false;
  test.identical( got, expected );

  test.case = 'array.length = 2, equal numbers';
  var got = _.crange.isEmpty( [ 1, 1 ] );
  var expected = false;
  test.identical( got, expected );

  test.case = 'array.length = 2, crange[ 0 ] - crange[ 1 ] === 1';
  var got = _.crange.isEmpty( [ 1, 0 ] );
  var expected = true;
  test.identical( got, expected );

  test.case = 'array.length = 2, number and undefined';
  var got = _.crange.isEmpty( [ 1, undefined ] );
  var expected = false;
  test.identical( got, expected );

  test.case = 'array.length > 2';
  var got = _.crange.isEmpty( [ 1, 2, 3 ] );
  var expected = false;
  test.identical( got, expected );

  test.case = 'unroll.length = 0';
  var got = _.crange.isEmpty( _.unrollMake( [] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'unroll.length = 1';
  var got = _.crange.isEmpty( _.unrollMake( [ 1 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'unroll.length = 2, different numbers';
  var got = _.crange.isEmpty( _.unrollMake( [ 1, 2 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'unroll.length = 2, equal numbers';
  var got = _.crange.isEmpty( _.unrollMake( [ 10, 10 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'unroll.length = 2, crange[ 0 ] - crange[ 1 ] === 1';
  var got = _.crange.isEmpty( _.unrollMake( [ 10, 9 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'unroll.length = 2, number and undefined';
  var got = _.crange.isEmpty( _.unrollMake( [ 1, undefined ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'unroll.length > 2';
  var got = _.crange.isEmpty( _.unrollMake( [ 1, 2, 3 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'argumentsArray.length = 0';
  var got = _.crange.isEmpty( _.argumentsArrayMake( [] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'argumentsArray.length = 1';
  var got = _.crange.isEmpty( _.argumentsArrayMake( [ 1 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'argumentsArray.length = 2, different numbers';
  var got = _.crange.isEmpty( _.argumentsArrayMake( [ 1, 2 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'argumentsArray.length = 2, equal numbers';
  var got = _.crange.isEmpty( _.argumentsArrayMake( [ -2, -2 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'argumentsArray.length = 2, crange[ 0 ] - crange[ 1 ] === 1';
  var got = _.crange.isEmpty( _.argumentsArrayMake( [ -1, -2 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'argumentsArray.length = 2, number and undefined';
  var got = _.crange.isEmpty( _.argumentsArrayMake( [ 1, undefined ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'argumentsArray.length > 2';
  var got = _.crange.isEmpty( _.argumentsArrayMake( [ 1, 2, 3 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'BufferTyped.length = 0';
  var got = _.crange.isEmpty( new U8x() );
  var expected = false;
  test.identical( got, expected );

  test.case = 'BufferTyped.length = 1';
  var got = _.crange.isEmpty( new I16x( 1 ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'BufferTyped.length = 2, different numbers';
  var got = _.crange.isEmpty( new F32x( [ 1, 3 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'BufferTyped.length = 2, equal numbers';
  var got = _.crange.isEmpty( new F32x( [ 1, 1 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'BufferTyped.length = 2, crange[ 0 ] - crange[ 1 ] === 1';
  var got = _.crange.isEmpty( new F32x( [ 0, -1 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'BufferTyped.length > 2';
  var got = _.crange.isEmpty( new F32x( 4 ) );
  var expected = false;
  test.identical( got, expected );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.crange.isEmpty() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.crange.isEmpty( [ 1, 2 ], 'extra' ) );
}

//

function crangeIsPopulated( test )
{
  test.case = 'undefined';
  var got = _.crange.isPopulated( undefined );
  var expected = false;
  test.identical( got, expected );

  test.case = 'null';
  var got = _.crange.isPopulated( null );
  var expected = false;
  test.identical( got, expected );

  test.case = 'false';
  var got = _.crange.isPopulated( false );
  var expected = false;
  test.identical( got, expected );

  test.case = 'empty string';
  var got = _.crange.isPopulated( '' );
  var expected = false;
  test.identical( got, expected );

  test.case = 'zero';
  var got = _.crange.isPopulated( 0 );
  var expected = false;
  test.identical( got, expected );

  test.case = 'NaN';
  var got = _.crange.isPopulated( NaN );
  var expected = false;
  test.identical( got, expected );

  test.case = 'a boolean';
  var got = _.crange.isPopulated( true );
  var expected = false;
  test.identical( got, expected );

  test.case = 'a number';
  var got = _.crange.isPopulated( 13 );
  var expected = false;
  test.identical( got, expected );

  test.case = 'a function';
  var got = _.crange.isPopulated( function() {} );
  var expected = false;
  test.identical( got, expected );

  test.case = 'constructor';
  function Constr( x )
  {
    this.x = x;
    return this;
  }
  var got = _.crange.isPopulated( new Constr( 0 ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'a string';
  var got = _.crange.isPopulated( 'str' );
  var expected = false;
  test.identical( got, expected );

  test.case = 'BufferRaw';
  var got = _.crange.isPopulated( new BufferRaw( 5 ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'BufferView';
  var got = _.crange.isPopulated( new BufferView( new BufferRaw( 5 ) ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'Set';
  var got = _.crange.isPopulated( new Set( [ 5 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'Map';
  var got = _.crange.isPopulated( new Map( [ [ 1, 2 ] ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'pure empty map';
  var got = _.crange.isPopulated( Object.create( null ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'pure map';
  var src = Object.create( null );
  src.x = 1;
  var got = _.crange.isPopulated( src );
  var expected = false;
  test.identical( got, expected );

  test.case = 'map from pure map';
  var src = Object.create( Object.create( null ) );
  var got = _.crange.isPopulated( src );
  var expected = false;
  test.identical( got, expected );

  test.case = 'an empty object';
  var got = _.crange.isPopulated( {} );
  var expected = false;
  test.identical( got, expected );

  test.case = 'an object';
  var got = _.crange.isPopulated( { a : 7, b : 13 } );
  var expected = false;
  test.identical( got, expected );

  /* */

  test.case = 'array.length = 0';
  var got = _.crange.isPopulated( [] );
  var expected = false;
  test.identical( got, expected );

  test.case = 'array.length = 1';
  var got = _.crange.isPopulated( [ 1 ] );
  var expected = false;
  test.identical( got, expected );

  test.case = 'array.length = 2, different numbers';
  var got = _.crange.isPopulated( [ 1, 2 ] );
  var expected = true;
  test.identical( got, expected );

  test.case = 'array.length = 2, equal numbers';
  var got = _.crange.isPopulated( [ 1, 1 ] );
  var expected = true;
  test.identical( got, expected );

  test.case = 'array.length = 2, crange[ 0 ] - crange[ 1 ] === 1';
  var got = _.crange.isPopulated( [ 1, 0 ] );
  var expected = false;
  test.identical( got, expected );

  test.case = 'array.length = 2, number and undefined';
  var got = _.crange.isPopulated( [ 1, undefined ] );
  var expected = false;
  test.identical( got, expected );

  test.case = 'array.length > 2';
  var got = _.crange.isPopulated( [ 1, 2, 3 ] );
  var expected = false;
  test.identical( got, expected );

  test.case = 'unroll.length = 0';
  var got = _.crange.isPopulated( _.unrollMake( [] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'unroll.length = 1';
  var got = _.crange.isPopulated( _.unrollMake( [ 1 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'unroll.length = 2, different numbers';
  var got = _.crange.isPopulated( _.unrollMake( [ 1, 2 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'unroll.length = 2, equal numbers';
  var got = _.crange.isPopulated( _.unrollMake( [ 10, 10 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'unroll.length = 2, crange[ 0 ] - crange[ 1 ] === 1';
  var got = _.crange.isPopulated( _.unrollMake( [ 10, 9 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'unroll.length = 2, number and undefined';
  var got = _.crange.isPopulated( _.unrollMake( [ 1, undefined ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'unroll.length > 2';
  var got = _.crange.isPopulated( _.unrollMake( [ 1, 2, 3 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'argumentsArray.length = 0';
  var got = _.crange.isPopulated( _.argumentsArrayMake( [] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'argumentsArray.length = 1';
  var got = _.crange.isPopulated( _.argumentsArrayMake( [ 1 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'argumentsArray.length = 2, different numbers';
  var got = _.crange.isPopulated( _.argumentsArrayMake( [ 1, 2 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'argumentsArray.length = 2, equal numbers';
  var got = _.crange.isPopulated( _.argumentsArrayMake( [ -2, -2 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'argumentsArray.length = 2, crange[ 0 ] - crange[ 1 ] === 1';
  var got = _.crange.isPopulated( _.argumentsArrayMake( [ -1, -2 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'argumentsArray.length = 2, number and undefined';
  var got = _.crange.isPopulated( _.argumentsArrayMake( [ 1, undefined ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'argumentsArray.length > 2';
  var got = _.crange.isPopulated( _.argumentsArrayMake( [ 1, 2, 3 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'BufferTyped.length = 0';
  var got = _.crange.isPopulated( new U8x() );
  var expected = false;
  test.identical( got, expected );

  test.case = 'BufferTyped.length = 1';
  var got = _.crange.isPopulated( new I16x( 1 ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'BufferTyped.length = 2, different numbers';
  var got = _.crange.isPopulated( new F32x( [ 1, 3 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'BufferTyped.length = 2, equal numbers';
  var got = _.crange.isPopulated( new F32x( [ 1, 1 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'BufferTyped.length = 2, crange[ 0 ] - crange[ 1 ] === 1';
  var got = _.crange.isPopulated( new F32x( [ 1, 0 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'BufferTyped.length > 2';
  var got = _.crange.isPopulated( new F32x( 4 ) );
  var expected = false;
  test.identical( got, expected );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.crange.isPopulated() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.crange.isPopulated( [ 1, 2 ], 'extra' ) );
}

//

function crangeInInclusive( test )
{
  test.case = 'srcNumber - number, srcNumber < crange[ 0 ]';
  var got = _.crange.inInclusive( [ 2, 5 ], 1 );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - number, srcNumber = crange[ 0 ]';
  var got = _.crange.inInclusive( [ 2, 5 ], 2 );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - number, srcNumber > crange[ 1 ]';
  var got = _.crange.inInclusive( [ 2, 5 ], 7 );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - number, srcNumber = crange[ 1 ]';
  var got = _.crange.inInclusive( [ 2, 5 ], 5 );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - number, crange[ 0 ] < srcNumber < crange[ 1 ]';
  var got = _.crange.inInclusive( [ 2, 5 ], 4 );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - array, srcNumber < crange[ 0 ]';
  var got = _.crange.inInclusive( [ 2, 5 ], [ 0 ] );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - array, srcNumber = crange[ 0 ]';
  var got = _.crange.inInclusive( [ 2, 5 ], [ 0, 0 ] );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - array, srcNumber > crange[ 1 ]';
  var got = _.crange.inInclusive( [ 2, 5 ], [ 0, 0, 0, 0, 0, 0, 0 ] );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - array, srcNumber = crange[ 1 ]';
  var got = _.crange.inInclusive( [ 2, 5 ], [ 0, 0, 0, 0, 0 ] );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - array, crange[ 0 ] < srcNumber < crange[ 1 ]';
  var got = _.crange.inInclusive( [ 2, 5 ], [ 0, 0, 0, 0 ] );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - unroll, srcNumber < crange[ 0 ]';
  var got = _.crange.inInclusive( [ 2, 5 ], _.unrollMake( [ 0 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - unroll, srcNumber = crange[ 0 ]';
  var got = _.crange.inInclusive( [ 2, 5 ], _.unrollMake( [ 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - unroll, srcNumber > crange[ 1 ]';
  var got = _.crange.inInclusive( [ 2, 5 ], _.unrollMake( [ 0, 0, 0, 0, 0, 0, 0 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - unroll, srcNumber = crange[ 1 ]';
  var got = _.crange.inInclusive( [ 2, 5 ], _.unrollMake( [ 0, 0, 0, 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - unroll, crange[ 0 ] < srcNumber < crange[ 1 ]';
  var got = _.crange.inInclusive( [ 2, 5 ], _.unrollMake( [ 0, 0, 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - argumentsArray, srcNumber < crange[ 0 ]';
  var got = _.crange.inInclusive( [ 2, 5 ], _.argumentsArrayMake( [ 0 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - argumentsArray, srcNumber = crange[ 0 ]';
  var got = _.crange.inInclusive( [ 2, 5 ], _.argumentsArrayMake( [ 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - argumentsArray, srcNumber > crange[ 1 ]';
  var got = _.crange.inInclusive( [ 2, 5 ], _.argumentsArrayMake( [ 0, 0, 0, 0, 0, 0, 0 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - argumentsArray, srcNumber = crange[ 1 ]';
  var got = _.crange.inInclusive( [ 2, 5 ], _.argumentsArrayMake( [ 0, 0, 0, 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - argumentsArray, crange[ 0 ] < srcNumber < crange[ 1 ]';
  var got = _.crange.inInclusive( [ 2, 5 ], _.argumentsArrayMake( [ 0, 0, 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - BufferTyped, srcNumber < crange[ 0 ]';
  var got = _.crange.inInclusive( [ 2, 5 ], new I8x( [ 0 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - BufferTyped, srcNumber = crange[ 0 ]';
  var got = _.crange.inInclusive( [ 2, 5 ], new I8x( [ 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - BufferTyped, srcNumber > crange[ 1 ]';
  var got = _.crange.inInclusive( [ 2, 5 ], new U16x( [ 0, 0, 0, 0, 0, 0, 0 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - BufferTyped, srcNumber = crange[ 1 ]';
  var got = _.crange.inInclusive( [ 2, 5 ], new U16x( [ 0, 0, 0, 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - BufferTyped, crange[ 0 ] < srcNumber < crange[ 1 ]';
  var got = _.crange.inInclusive( [ 2, 5 ], new F32x( [ 0, 0, 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.crange.inInclusive() );

  test.case = 'not enough arguments';
  test.shouldThrowErrorSync( () => _.crange.inInclusive( [ 1, 2 ] ) );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.crange.inInclusive( [ 1, 2 ], 3, 'extra' ) );

  test.case = 'crange is not crange';
  test.shouldThrowErrorSync( () => _.crange.inInclusive( 'wrong', 3 ) );

  test.case = 'srcNumber is not Long, not Number';
  test.shouldThrowErrorSync( () => _.crange.inInclusive( [ 1, 2 ], 'wrong' ) );
}

//

function crangeInExclusive( test )
{
  test.case = 'srcNumber - number, srcNumber < crange[ 0 ]';
  var got = _.crange.inExclusive( [ 2, 5 ], 1 );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - number, srcNumber = crange[ 0 ]';
  var got = _.crange.inExclusive( [ 2, 5 ], 2 );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - number, srcNumber > crange[ 1 ] + 1';
  var got = _.crange.inExclusive( [ 2, 5 ], 7 );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - number, srcNumber === crange[ 1 ] + 1';
  var got = _.crange.inExclusive( [ 2, 5 ], 6 );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - number, srcNumber = crange[ 1 ]';
  var got = _.crange.inExclusive( [ 2, 5 ], 5 );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - number, crange[ 0 ] < srcNumber < crange[ 1 ]';
  var got = _.crange.inExclusive( [ 2, 5 ], 4 );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - array, srcNumber < crange[ 0 ]';
  var got = _.crange.inExclusive( [ 2, 5 ], [ 0 ] );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - array, srcNumber = crange[ 0 ]';
  var got = _.crange.inExclusive( [ 2, 5 ], [ 0, 0 ] );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - array, srcNumber > crange[ 1 ] + 1';
  var got = _.crange.inExclusive( [ 2, 5 ], [ 0, 0, 0, 0, 0, 0, 0 ] );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - array, srcNumber === crange[ 1 ] + 1';
  var got = _.crange.inExclusive( [ 2, 5 ], [ 0, 0, 0, 0, 0, 0 ] );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - array, srcNumber = crange[ 1 ]';
  var got = _.crange.inExclusive( [ 2, 5 ], [ 0, 0, 0, 0, 0 ] );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - array, crange[ 0 ] < srcNumber < crange[ 1 ]';
  var got = _.crange.inExclusive( [ 2, 5 ], [ 0, 0, 0, 0 ] );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - unroll, srcNumber < crange[ 0 ]';
  var got = _.crange.inExclusive( [ 2, 5 ], _.unrollMake( [ 0 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - unroll, srcNumber = crange[ 0 ]';
  var got = _.crange.inExclusive( [ 2, 5 ], _.unrollMake( [ 0, 0 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - unroll, srcNumber > crange[ 1 ], srcNumber > crange[ 1 ] + 1';
  var got = _.crange.inExclusive( [ 2, 5 ], _.unrollMake( [ 0, 0, 0, 0, 0, 0, 0 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - unroll, srcNumber > crange[ 1 ], srcNumber === crange[ 1 ] + 1';
  var got = _.crange.inExclusive( [ 2, 5 ], _.unrollMake( [ 0, 0, 0, 0, 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - unroll, srcNumber = crange[ 1 ]';
  var got = _.crange.inExclusive( [ 2, 5 ], _.unrollMake( [ 0, 0, 0, 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - unroll, crange[ 0 ] < srcNumber < crange[ 1 ]';
  var got = _.crange.inExclusive( [ 2, 5 ], _.unrollMake( [ 0, 0, 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - argumentsArray, srcNumber < crange[ 0 ]';
  var got = _.crange.inExclusive( [ 2, 5 ], _.argumentsArrayMake( [ 0 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - argumentsArray, srcNumber = crange[ 0 ]';
  var got = _.crange.inExclusive( [ 2, 5 ], _.argumentsArrayMake( [ 0, 0 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - argumentsArray, srcNumber > crange[ 1 ] + 1';
  var got = _.crange.inExclusive( [ 2, 5 ], _.argumentsArrayMake( [ 0, 0, 0, 0, 0, 0, 0 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - argumentsArray, srcNumber === crange[ 1 ] + 1';
  var got = _.crange.inExclusive( [ 2, 5 ], _.argumentsArrayMake( [ 0, 0, 0, 0, 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - argumentsArray, srcNumber = crange[ 1 ]';
  var got = _.crange.inExclusive( [ 2, 5 ], _.argumentsArrayMake( [ 0, 0, 0, 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - argumentsArray, crange[ 0 ] < srcNumber < crange[ 1 ]';
  var got = _.crange.inExclusive( [ 2, 5 ], _.argumentsArrayMake( [ 0, 0, 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - BufferTyped, srcNumber < crange[ 0 ]';
  var got = _.crange.inExclusive( [ 2, 5 ], new I8x( [ 0 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - BufferTyped, srcNumber = crange[ 0 ]';
  var got = _.crange.inExclusive( [ 2, 5 ], new I8x( [ 0, 0 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - BufferTyped, srcNumber > crange[ 1 ] + 1';
  var got = _.crange.inExclusive( [ 2, 5 ], new U16x( [ 0, 0, 0, 0, 0, 0, 0 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - BufferTyped, srcNumber === crange[ 1 ] + 1';
  var got = _.crange.inExclusive( [ 2, 5 ], new U16x( [ 0, 0, 0, 0, 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - BufferTyped, srcNumber = crange[ 1 ]';
  var got = _.crange.inExclusive( [ 2, 5 ], new U16x( [ 0, 0, 0, 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - BufferTyped, crange[ 0 ] < srcNumber < crange[ 1 ]';
  var got = _.crange.inExclusive( [ 2, 5 ], new F32x( [ 0, 0, 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.crange.inExclusive() );

  test.case = 'not enough arguments';
  test.shouldThrowErrorSync( () => _.crange.inExclusive( [ 1, 2 ] ) );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.crange.inExclusive( [ 1, 2 ], 3, 'extra' ) );

  test.case = 'crange is not crange';
  test.shouldThrowErrorSync( () => _.crange.inExclusive( 'wrong', 3 ) );

  test.case = 'srcNumber is not Long, not Number';
  test.shouldThrowErrorSync( () => _.crange.inExclusive( [ 1, 2 ], 'wrong' ) );
}

//

function crangeInInclusiveLeft( test )
{
  test.case = 'srcNumber - number, srcNumber < crange[ 0 ]';
  var got = _.crange.inInclusiveLeft( [ 2, 5 ], 1 );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - number, srcNumber = crange[ 0 ]';
  var got = _.crange.inInclusiveLeft( [ 2, 5 ], 2 );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - number, srcNumber > crange[ 1 ]';
  var got = _.crange.inInclusiveLeft( [ 2, 5 ], 7 );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - number, srcNumber = crange[ 1 ]';
  var got = _.crange.inInclusiveLeft( [ 2, 5 ], 5 );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - number, crange[ 0 ] < srcNumber < crange[ 1 ]';
  var got = _.crange.inInclusiveLeft( [ 2, 5 ], 4 );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - array, srcNumber < crange[ 0 ]';
  var got = _.crange.inInclusiveLeft( [ 2, 5 ], [ 0 ] );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - array, srcNumber = crange[ 0 ]';
  var got = _.crange.inInclusiveLeft( [ 2, 5 ], [ 0, 0 ] );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - array, srcNumber > crange[ 1 ]';
  var got = _.crange.inInclusiveLeft( [ 2, 5 ], [ 0, 0, 0, 0, 0, 0, 0 ] );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - array, srcNumber = crange[ 1 ]';
  var got = _.crange.inInclusiveLeft( [ 2, 5 ], [ 0, 0, 0, 0, 0 ] );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - array, crange[ 0 ] < srcNumber < crange[ 1 ]';
  var got = _.crange.inInclusiveLeft( [ 2, 5 ], [ 0, 0, 0, 0 ] );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - unroll, srcNumber < crange[ 0 ]';
  var got = _.crange.inInclusiveLeft( [ 2, 5 ], _.unrollMake( [ 0 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - unroll, srcNumber = crange[ 0 ]';
  var got = _.crange.inInclusiveLeft( [ 2, 5 ], _.unrollMake( [ 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - unroll, srcNumber > crange[ 1 ]';
  var got = _.crange.inInclusiveLeft( [ 2, 5 ], _.unrollMake( [ 0, 0, 0, 0, 0, 0, 0 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - unroll, srcNumber = crange[ 1 ]';
  var got = _.crange.inInclusiveLeft( [ 2, 5 ], _.unrollMake( [ 0, 0, 0, 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - unroll, crange[ 0 ] < srcNumber < crange[ 1 ]';
  var got = _.crange.inInclusiveLeft( [ 2, 5 ], _.unrollMake( [ 0, 0, 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - argumentsArray, srcNumber < crange[ 0 ]';
  var got = _.crange.inInclusiveLeft( [ 2, 5 ], _.argumentsArrayMake( [ 0 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - argumentsArray, srcNumber = crange[ 0 ]';
  var got = _.crange.inInclusiveLeft( [ 2, 5 ], _.argumentsArrayMake( [ 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - argumentsArray, srcNumber > crange[ 1 ]';
  var got = _.crange.inInclusiveLeft( [ 2, 5 ], _.argumentsArrayMake( [ 0, 0, 0, 0, 0, 0, 0 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - argumentsArray, srcNumber = crange[ 1 ]';
  var got = _.crange.inInclusiveLeft( [ 2, 5 ], _.argumentsArrayMake( [ 0, 0, 0, 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - argumentsArray, crange[ 0 ] < srcNumber < crange[ 1 ]';
  var got = _.crange.inInclusiveLeft( [ 2, 5 ], _.argumentsArrayMake( [ 0, 0, 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - BufferTyped, srcNumber < crange[ 0 ]';
  var got = _.crange.inInclusiveLeft( [ 2, 5 ], new I8x( [ 0 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - BufferTyped, srcNumber = crange[ 0 ]';
  var got = _.crange.inInclusiveLeft( [ 2, 5 ], new I8x( [ 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - BufferTyped, srcNumber > crange[ 1 ]';
  var got = _.crange.inInclusiveLeft( [ 2, 5 ], new U16x( [ 0, 0, 0, 0, 0, 0, 0 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - BufferTyped, srcNumber = crange[ 1 ]';
  var got = _.crange.inInclusiveLeft( [ 2, 5 ], new U16x( [ 0, 0, 0, 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - BufferTyped, crange[ 0 ] < srcNumber < crange[ 1 ]';
  var got = _.crange.inInclusiveLeft( [ 2, 5 ], new F32x( [ 0, 0, 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.crange.inInclusiveLeft() );

  test.case = 'not enough arguments';
  test.shouldThrowErrorSync( () => _.crange.inInclusiveLeft( [ 1, 2 ] ) );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.crange.inInclusiveLeft( [ 1, 2 ], 3, 'extra' ) );

  test.case = 'crange is not crange';
  test.shouldThrowErrorSync( () => _.crange.inInclusiveLeft( 'wrong', 3 ) );

  test.case = 'srcNumber is not Long, not Number';
  test.shouldThrowErrorSync( () => _.crange.inInclusiveLeft( [ 1, 2 ], 'wrong' ) );
}

//

function crangeInInclusiveRight( test )
{
  test.case = 'srcNumber - number, srcNumber < crange[ 0 ]';
  var got = _.crange.inInclusiveRight( [ 2, 5 ], 1 );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - number, srcNumber = crange[ 0 ]';
  var got = _.crange.inInclusiveRight( [ 2, 5 ], 2 );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - number, srcNumber > crange[ 1 ]';
  var got = _.crange.inInclusiveRight( [ 2, 5 ], 7 );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - number, srcNumber = crange[ 1 ]';
  var got = _.crange.inInclusiveRight( [ 2, 5 ], 5 );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - number, crange[ 0 ] < srcNumber < crange[ 1 ]';
  var got = _.crange.inInclusiveRight( [ 2, 5 ], 4 );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - array, srcNumber < crange[ 0 ]';
  var got = _.crange.inInclusiveRight( [ 2, 5 ], [ 0 ] );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - array, srcNumber = crange[ 0 ]';
  var got = _.crange.inInclusiveRight( [ 2, 5 ], [ 0, 0 ] );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - array, srcNumber > crange[ 1 ]';
  var got = _.crange.inInclusiveRight( [ 2, 5 ], [ 0, 0, 0, 0, 0, 0, 0 ] );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - array, srcNumber = crange[ 1 ]';
  var got = _.crange.inInclusiveRight( [ 2, 5 ], [ 0, 0, 0, 0, 0 ] );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - array, crange[ 0 ] < srcNumber < crange[ 1 ]';
  var got = _.crange.inInclusiveRight( [ 2, 5 ], [ 0, 0, 0, 0 ] );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - unroll, srcNumber < crange[ 0 ]';
  var got = _.crange.inInclusiveRight( [ 2, 5 ], _.unrollMake( [ 0 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - unroll, srcNumber = crange[ 0 ]';
  var got = _.crange.inInclusiveRight( [ 2, 5 ], _.unrollMake( [ 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - unroll, srcNumber > crange[ 1 ]';
  var got = _.crange.inInclusiveRight( [ 2, 5 ], _.unrollMake( [ 0, 0, 0, 0, 0, 0, 0 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - unroll, srcNumber = crange[ 1 ]';
  var got = _.crange.inInclusiveRight( [ 2, 5 ], _.unrollMake( [ 0, 0, 0, 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - unroll, crange[ 0 ] < srcNumber < crange[ 1 ]';
  var got = _.crange.inInclusiveRight( [ 2, 5 ], _.unrollMake( [ 0, 0, 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - argumentsArray, srcNumber < crange[ 0 ]';
  var got = _.crange.inInclusiveRight( [ 2, 5 ], _.argumentsArrayMake( [ 0 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - argumentsArray, srcNumber = crange[ 0 ]';
  var got = _.crange.inInclusiveRight( [ 2, 5 ], _.argumentsArrayMake( [ 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - argumentsArray, srcNumber > crange[ 1 ]';
  var got = _.crange.inInclusiveRight( [ 2, 5 ], _.argumentsArrayMake( [ 0, 0, 0, 0, 0, 0, 0 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - argumentsArray, srcNumber = crange[ 1 ]';
  var got = _.crange.inInclusiveRight( [ 2, 5 ], _.argumentsArrayMake( [ 0, 0, 0, 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - argumentsArray, crange[ 0 ] < srcNumber < crange[ 1 ]';
  var got = _.crange.inInclusiveRight( [ 2, 5 ], _.argumentsArrayMake( [ 0, 0, 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - BufferTyped, srcNumber < crange[ 0 ]';
  var got = _.crange.inInclusiveRight( [ 2, 5 ], new I8x( [ 0 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - BufferTyped, srcNumber = crange[ 0 ]';
  var got = _.crange.inInclusiveRight( [ 2, 5 ], new I8x( [ 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - BufferTyped, srcNumber > crange[ 1 ]';
  var got = _.crange.inInclusiveRight( [ 2, 5 ], new U16x( [ 0, 0, 0, 0, 0, 0, 0 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - BufferTyped, srcNumber = crange[ 1 ]';
  var got = _.crange.inInclusiveRight( [ 2, 5 ], new U16x( [ 0, 0, 0, 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - BufferTyped, crange[ 0 ] < srcNumber < crange[ 1 ]';
  var got = _.crange.inInclusiveRight( [ 2, 5 ], new F32x( [ 0, 0, 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.crange.inInclusiveRight() );

  test.case = 'not enough arguments';
  test.shouldThrowErrorSync( () => _.crange.inInclusiveRight( [ 1, 2 ] ) );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.crange.inInclusiveRight( [ 1, 2 ], 3, 'extra' ) );

  test.case = 'crange is not crange';
  test.shouldThrowErrorSync( () => _.crange.inInclusiveRight( 'wrong', 3 ) );

  test.case = 'srcNumber is not Long, not Number';
  test.shouldThrowErrorSync( () => _.crange.inInclusiveRight( [ 1, 2 ], 'wrong' ) );
}

// --
// lrange
// --

function lrangeIsEmpty( test )
{
  test.case = 'undefined';
  var got = _.lrange.isEmpty( undefined );
  var expected = false;
  test.identical( got, expected );

  test.case = 'null';
  var got = _.lrange.isEmpty( null );
  var expected = false;
  test.identical( got, expected );

  test.case = 'false';
  var got = _.lrange.isEmpty( false );
  var expected = false;
  test.identical( got, expected );

  test.case = 'empty string';
  var got = _.lrange.isEmpty( '' );
  var expected = false;
  test.identical( got, expected );

  test.case = 'zero';
  var got = _.lrange.isEmpty( 0 );
  var expected = false;
  test.identical( got, expected );

  test.case = 'NaN';
  var got = _.lrange.isEmpty( NaN );
  var expected = false;
  test.identical( got, expected );

  test.case = 'a boolean';
  var got = _.lrange.isEmpty( true );
  var expected = false;
  test.identical( got, expected );

  test.case = 'a number';
  var got = _.lrange.isEmpty( 13 );
  var expected = false;
  test.identical( got, expected );

  test.case = 'a function';
  var got = _.lrange.isEmpty( function() {} );
  var expected = false;
  test.identical( got, expected );

  test.case = 'constructor';
  function Constr( x )
  {
    this.x = x;
    return this;
  }
  var got = _.lrange.isEmpty( new Constr( 0 ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'a string';
  var got = _.lrange.isEmpty( 'str' );
  var expected = false;
  test.identical( got, expected );

  test.case = 'BufferRaw';
  var got = _.lrange.isEmpty( new BufferRaw( 5 ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'BufferView';
  var got = _.lrange.isEmpty( new BufferView( new BufferRaw( 5 ) ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'Set';
  var got = _.lrange.isEmpty( new Set( [ 5 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'Map';
  var got = _.lrange.isEmpty( new Map( [ [ 1, 2 ] ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'pure empty map';
  var got = _.lrange.isEmpty( Object.create( null ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'pure map';
  var src = Object.create( null );
  src.x = 1;
  var got = _.lrange.isEmpty( src );
  var expected = false;
  test.identical( got, expected );

  test.case = 'map from pure map';
  var src = Object.create( Object.create( null ) );
  var got = _.lrange.isEmpty( src );
  var expected = false;
  test.identical( got, expected );

  test.case = 'an empty object';
  var got = _.lrange.isEmpty( {} );
  var expected = false;
  test.identical( got, expected );

  test.case = 'an object';
  var got = _.lrange.isEmpty( { a : 7, b : 13 } );
  var expected = false;
  test.identical( got, expected );

  /* */

  test.case = 'array.length = 0';
  var got = _.lrange.isEmpty( [] );
  var expected = false;
  test.identical( got, expected );

  test.case = 'array.length = 1';
  var got = _.lrange.isEmpty( [ 1 ] );
  var expected = false;
  test.identical( got, expected );

  test.case = 'array.length = 2, different numbers';
  var got = _.lrange.isEmpty( [ 1, 2 ] );
  var expected = false;
  test.identical( got, expected );

  test.case = 'array.length = 2, equal numbers';
  var got = _.lrange.isEmpty( [ 1, 1 ] );
  var expected = false;
  test.identical( got, expected );

  test.case = 'array.length = 2, lrange[ 0 ] - lrange[ 1 ] === 1';
  var got = _.lrange.isEmpty( [ 1, 0 ] );
  var expected = true;
  test.identical( got, expected );

  test.case = 'array.length = 2, number and undefined';
  var got = _.lrange.isEmpty( [ 1, undefined ] );
  var expected = false;
  test.identical( got, expected );

  test.case = 'array.length > 2';
  var got = _.lrange.isEmpty( [ 1, 2, 3 ] );
  var expected = false;
  test.identical( got, expected );

  test.case = 'unroll.length = 0';
  var got = _.lrange.isEmpty( _.unrollMake( [] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'unroll.length = 1';
  var got = _.lrange.isEmpty( _.unrollMake( [ 1 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'unroll.length = 2, different numbers';
  var got = _.lrange.isEmpty( _.unrollMake( [ 1, 2 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'unroll.length = 2, equal numbers';
  var got = _.lrange.isEmpty( _.unrollMake( [ 10, 10 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'unroll.length = 2, lrange[ 1 ] === 0';
  var got = _.lrange.isEmpty( _.unrollMake( [ 10, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'unroll.length = 2, number and undefined';
  var got = _.lrange.isEmpty( _.unrollMake( [ 1, undefined ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'unroll.length > 2';
  var got = _.lrange.isEmpty( _.unrollMake( [ 1, 2, 3 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'argumentsArray.length = 0';
  var got = _.lrange.isEmpty( _.argumentsArrayMake( [] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'argumentsArray.length = 1';
  var got = _.lrange.isEmpty( _.argumentsArrayMake( [ 1 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'argumentsArray.length = 2, different numbers';
  var got = _.lrange.isEmpty( _.argumentsArrayMake( [ 1, 2 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'argumentsArray.length = 2, equal numbers';
  var got = _.lrange.isEmpty( _.argumentsArrayMake( [ -2, -2 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'argumentsArray.length = 2, lrange[ 1 ] === 0';
  var got = _.lrange.isEmpty( _.argumentsArrayMake( [ -1, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'argumentsArray.length = 2, number and undefined';
  var got = _.lrange.isEmpty( _.argumentsArrayMake( [ 1, undefined ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'argumentsArray.length > 2';
  var got = _.lrange.isEmpty( _.argumentsArrayMake( [ 1, 2, 3 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'BufferTyped.length = 0';
  var got = _.lrange.isEmpty( new U8x() );
  var expected = false;
  test.identical( got, expected );

  test.case = 'BufferTyped.length = 1';
  var got = _.lrange.isEmpty( new I16x( 1 ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'BufferTyped.length = 2, different numbers';
  var got = _.lrange.isEmpty( new F32x( [ 1, 3 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'BufferTyped.length = 2, equal numbers';
  var got = _.lrange.isEmpty( new F32x( [ 1, 1 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'BufferTyped.length = 2, lrange[ 1 ] === 0';
  var got = _.lrange.isEmpty( new F32x( [ 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'BufferTyped.length > 2';
  var got = _.lrange.isEmpty( new F32x( 4 ) );
  var expected = false;
  test.identical( got, expected );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.lrange.isEmpty() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.lrange.isEmpty( [ 1, 2 ], 'extra' ) );
}

//

function lrangeIsPopulated( test )
{
  test.case = 'undefined';
  var got = _.lrange.isPopulated( undefined );
  var expected = false;
  test.identical( got, expected );

  test.case = 'null';
  var got = _.lrange.isPopulated( null );
  var expected = false;
  test.identical( got, expected );

  test.case = 'false';
  var got = _.lrange.isPopulated( false );
  var expected = false;
  test.identical( got, expected );

  test.case = 'empty string';
  var got = _.lrange.isPopulated( '' );
  var expected = false;
  test.identical( got, expected );

  test.case = 'zero';
  var got = _.lrange.isPopulated( 0 );
  var expected = false;
  test.identical( got, expected );

  test.case = 'NaN';
  var got = _.lrange.isPopulated( NaN );
  var expected = false;
  test.identical( got, expected );

  test.case = 'a boolean';
  var got = _.lrange.isPopulated( true );
  var expected = false;
  test.identical( got, expected );

  test.case = 'a number';
  var got = _.lrange.isPopulated( 13 );
  var expected = false;
  test.identical( got, expected );

  test.case = 'a function';
  var got = _.lrange.isPopulated( function() {} );
  var expected = false;
  test.identical( got, expected );

  test.case = 'constructor';
  function Constr( x )
  {
    this.x = x;
    return this;
  }
  var got = _.lrange.isPopulated( new Constr( 0 ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'a string';
  var got = _.lrange.isPopulated( 'str' );
  var expected = false;
  test.identical( got, expected );

  test.case = 'BufferRaw';
  var got = _.lrange.isPopulated( new BufferRaw( 5 ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'BufferView';
  var got = _.lrange.isPopulated( new BufferView( new BufferRaw( 5 ) ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'Set';
  var got = _.lrange.isPopulated( new Set( [ 5 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'Map';
  var got = _.lrange.isPopulated( new Map( [ [ 1, 2 ] ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'pure empty map';
  var got = _.lrange.isPopulated( Object.create( null ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'pure map';
  var src = Object.create( null );
  src.x = 1;
  var got = _.lrange.isPopulated( src );
  var expected = false;
  test.identical( got, expected );

  test.case = 'map from pure map';
  var src = Object.create( Object.create( null ) );
  var got = _.lrange.isPopulated( src );
  var expected = false;
  test.identical( got, expected );

  test.case = 'an empty object';
  var got = _.lrange.isPopulated( {} );
  var expected = false;
  test.identical( got, expected );

  test.case = 'an object';
  var got = _.lrange.isPopulated( { a : 7, b : 13 } );
  var expected = false;
  test.identical( got, expected );

  /* */

  test.case = 'array.length = 0';
  var got = _.lrange.isPopulated( [] );
  var expected = false;
  test.identical( got, expected );

  test.case = 'array.length = 1';
  var got = _.lrange.isPopulated( [ 1 ] );
  var expected = false;
  test.identical( got, expected );

  test.case = 'array.length = 2, different numbers';
  var got = _.lrange.isPopulated( [ 1, 2 ] );
  var expected = true;
  test.identical( got, expected );

  test.case = 'array.length = 2, equal numbers';
  var got = _.lrange.isPopulated( [ 1, 1 ] );
  var expected = true;
  test.identical( got, expected );

  test.case = 'array.length = 2, lrange[ 0 ] - lrange[ 1 ] === 1';
  var got = _.lrange.isPopulated( [ 1, 0 ] );
  var expected = false;
  test.identical( got, expected );

  test.case = 'array.length = 2, number and undefined';
  var got = _.lrange.isPopulated( [ 1, undefined ] );
  var expected = false;
  test.identical( got, expected );

  test.case = 'array.length > 2';
  var got = _.lrange.isPopulated( [ 1, 2, 3 ] );
  var expected = false;
  test.identical( got, expected );

  test.case = 'unroll.length = 0';
  var got = _.lrange.isPopulated( _.unrollMake( [] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'unroll.length = 1';
  var got = _.lrange.isPopulated( _.unrollMake( [ 1 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'unroll.length = 2, different numbers';
  var got = _.lrange.isPopulated( _.unrollMake( [ 1, 2 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'unroll.length = 2, equal numbers';
  var got = _.lrange.isPopulated( _.unrollMake( [ 10, 10 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'unroll.length = 2, lrange[ 0 ] - lrange[ 1 ] === 1';
  var got = _.lrange.isPopulated( _.unrollMake( [ 10, 9 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'unroll.length = 2, number and undefined';
  var got = _.lrange.isPopulated( _.unrollMake( [ 1, undefined ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'unroll.length > 2';
  var got = _.lrange.isPopulated( _.unrollMake( [ 1, 2, 3 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'argumentsArray.length = 0';
  var got = _.lrange.isPopulated( _.argumentsArrayMake( [] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'argumentsArray.length = 1';
  var got = _.lrange.isPopulated( _.argumentsArrayMake( [ 1 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'argumentsArray.length = 2, different numbers';
  var got = _.lrange.isPopulated( _.argumentsArrayMake( [ 1, 2 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'argumentsArray.length = 2, equal numbers';
  var got = _.lrange.isPopulated( _.argumentsArrayMake( [ -2, -2 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'argumentsArray.length = 2, lrange[ 0 ] - lrange[ 1 ] === 1';
  var got = _.lrange.isPopulated( _.argumentsArrayMake( [ -1, -2 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'argumentsArray.length = 2, number and undefined';
  var got = _.lrange.isPopulated( _.argumentsArrayMake( [ 1, undefined ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'argumentsArray.length > 2';
  var got = _.lrange.isPopulated( _.argumentsArrayMake( [ 1, 2, 3 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'BufferTyped.length = 0';
  var got = _.lrange.isPopulated( new U8x() );
  var expected = false;
  test.identical( got, expected );

  test.case = 'BufferTyped.length = 1';
  var got = _.lrange.isPopulated( new I16x( 1 ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'BufferTyped.length = 2, different numbers';
  var got = _.lrange.isPopulated( new F32x( [ 1, 3 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'BufferTyped.length = 2, equal numbers';
  var got = _.lrange.isPopulated( new F32x( [ 1, 1 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'BufferTyped.length = 2, lrange[ 0 ] - lrange[ 1 ] === 1';
  var got = _.lrange.isPopulated( new F32x( [ 1, 0 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'BufferTyped.length > 2';
  var got = _.lrange.isPopulated( new F32x( 4 ) );
  var expected = false;
  test.identical( got, expected );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.lrange.isPopulated() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.lrange.isPopulated( [ 1, 2 ], 'extra' ) );
}

//

function lrangeInInclusive( test )
{
  test.case = 'srcNumber - number, srcNumber < lrange[ 0 ]';
  var got = _.lrange.inInclusive( [ 2, 5 ], 1 );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - number, srcNumber = lrange[ 0 ]';
  var got = _.lrange.inInclusive( [ 2, 5 ], 2 );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - number, srcNumber > lrange[ 1 ], srcNumber > lrange[ 0 ] + lrange[ 1 ]';
  var got = _.lrange.inInclusive( [ 2, 5 ], 7 );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - number, srcNumber > lrange[ 1 ], srcNumber === lrange[ 0 ] + lrange[ 1 ]';
  var got = _.lrange.inInclusive( [ 2, 5 ], 6 );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - number, srcNumber = lrange[ 1 ]';
  var got = _.lrange.inInclusive( [ 2, 5 ], 5 );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - number, lrange[ 0 ] < srcNumber < lrange[ 1 ]';
  var got = _.lrange.inInclusive( [ 2, 5 ], 4 );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - array, srcNumber < lrange[ 0 ]';
  var got = _.lrange.inInclusive( [ 2, 5 ], [ 0 ] );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - array, srcNumber = lrange[ 0 ]';
  var got = _.lrange.inInclusive( [ 2, 5 ], [ 0, 0 ] );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - array, srcNumber > lrange[ 1 ], srcNumber > lrange[ 0 ] + lrange[ 1 ]';
  var got = _.lrange.inInclusive( [ 2, 5 ], [ 0, 0, 0, 0, 0, 0, 0 ] );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - array, srcNumber > lrange[ 1 ], srcNumber === lrange[ 0 ] + lrange[ 1 ]';
  var got = _.lrange.inInclusive( [ 2, 5 ], [ 0, 0, 0, 0, 0, 0 ] );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - array, srcNumber = lrange[ 1 ]';
  var got = _.lrange.inInclusive( [ 2, 5 ], [ 0, 0, 0, 0, 0 ] );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - array, lrange[ 0 ] < srcNumber < lrange[ 1 ]';
  var got = _.lrange.inInclusive( [ 2, 5 ], [ 0, 0, 0, 0 ] );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - unroll, srcNumber < lrange[ 0 ]';
  var got = _.lrange.inInclusive( [ 2, 5 ], _.unrollMake( [ 0 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - unroll, srcNumber = lrange[ 0 ]';
  var got = _.lrange.inInclusive( [ 2, 5 ], _.unrollMake( [ 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - unroll, srcNumber > lrange[ 1 ], srcNumber > lrange[ 0 ] + lrange[ 1 ]';
  var got = _.lrange.inInclusive( [ 2, 5 ], _.unrollMake( [ 0, 0, 0, 0, 0, 0, 0 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - unroll, srcNumber > lrange[ 1 ], srcNumber === lrange[ 0 ] + lrange[ 1 ]';
  var got = _.lrange.inInclusive( [ 2, 5 ], _.unrollMake( [ 0, 0, 0, 0, 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - unroll, srcNumber = lrange[ 1 ]';
  var got = _.lrange.inInclusive( [ 2, 5 ], _.unrollMake( [ 0, 0, 0, 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - unroll, lrange[ 0 ] < srcNumber < lrange[ 1 ]';
  var got = _.lrange.inInclusive( [ 2, 5 ], _.unrollMake( [ 0, 0, 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - argumentsArray, srcNumber < lrange[ 0 ]';
  var got = _.lrange.inInclusive( [ 2, 5 ], _.argumentsArrayMake( [ 0 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - argumentsArray, srcNumber = lrange[ 0 ]';
  var got = _.lrange.inInclusive( [ 2, 5 ], _.argumentsArrayMake( [ 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - argumentsArray, srcNumber > lrange[ 1 ], srcNumber > lrange[ 0 ] + lrange[ 1 ]';
  var got = _.lrange.inInclusive( [ 2, 5 ], _.argumentsArrayMake( [ 0, 0, 0, 0, 0, 0, 0 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - argumentsArray, srcNumber > lrange[ 1 ], srcNumber === lrange[ 0 ] + lrange[ 1 ]';
  var got = _.lrange.inInclusive( [ 2, 5 ], _.argumentsArrayMake( [ 0, 0, 0, 0, 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - argumentsArray, srcNumber = lrange[ 1 ]';
  var got = _.lrange.inInclusive( [ 2, 5 ], _.argumentsArrayMake( [ 0, 0, 0, 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - argumentsArray, lrange[ 0 ] < srcNumber < lrange[ 1 ]';
  var got = _.lrange.inInclusive( [ 2, 5 ], _.argumentsArrayMake( [ 0, 0, 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - BufferTyped, srcNumber < lrange[ 0 ]';
  var got = _.lrange.inInclusive( [ 2, 5 ], new I8x( [ 0 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - BufferTyped, srcNumber = lrange[ 0 ]';
  var got = _.lrange.inInclusive( [ 2, 5 ], new I8x( [ 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - BufferTyped, srcNumber > lrange[ 1 ], srcNumber > lrange[ 0 ] + lrange[ 1 ]';
  var got = _.lrange.inInclusive( [ 2, 5 ], new U16x( [ 0, 0, 0, 0, 0, 0, 0 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - BufferTyped, srcNumber > lrange[ 1 ], srcNumber === lrange[ 0 ] + lrange[ 1 ]';
  var got = _.lrange.inInclusive( [ 2, 5 ], new U16x( [ 0, 0, 0, 0, 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - BufferTyped, srcNumber = lrange[ 1 ]';
  var got = _.lrange.inInclusive( [ 2, 5 ], new U16x( [ 0, 0, 0, 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - BufferTyped, lrange[ 0 ] < srcNumber < lrange[ 1 ]';
  var got = _.lrange.inInclusive( [ 2, 5 ], new F32x( [ 0, 0, 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.lrange.inInclusive() );

  test.case = 'not enough arguments';
  test.shouldThrowErrorSync( () => _.lrange.inInclusive( [ 1, 2 ] ) );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.lrange.inInclusive( [ 1, 2 ], 3, 'extra' ) );

  test.case = 'lrange is not lrange';
  test.shouldThrowErrorSync( () => _.lrange.inInclusive( 'wrong', 3 ) );

  test.case = 'srcNumber is not Long, not Number';
  test.shouldThrowErrorSync( () => _.lrange.inInclusive( [ 1, 2 ], 'wrong' ) );
}

//

function lrangeInExclusive( test )
{
  test.case = 'srcNumber - number, srcNumber < lrange[ 0 ]';
  var got = _.lrange.inExclusive( [ 2, 5 ], 1 );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - number, srcNumber = lrange[ 0 ]';
  var got = _.lrange.inExclusive( [ 2, 5 ], 2 );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - number, srcNumber > lrange[ 0 ] + lrange[ 1 ]';
  var got = _.lrange.inExclusive( [ 2, 5 ], 8 );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - number, srcNumber === lrange[ 0 ] + lrange[ 1 ]';
  var got = _.lrange.inExclusive( [ 2, 5 ], 7 );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - number, srcNumber = lrange[ 1 ]';
  var got = _.lrange.inExclusive( [ 2, 5 ], 5 );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - number, lrange[ 0 ] < srcNumber < lrange[ 1 ]';
  var got = _.lrange.inExclusive( [ 2, 5 ], 4 );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - array, srcNumber < lrange[ 0 ]';
  var got = _.lrange.inExclusive( [ 2, 5 ], [ 0 ] );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - array, srcNumber = lrange[ 0 ]';
  var got = _.lrange.inExclusive( [ 2, 5 ], [ 0, 0 ] );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - array, srcNumber > lrange[ 0 ] + lrange[ 1 ]';
  var got = _.lrange.inExclusive( [ 2, 5 ], [ 0, 0, 0, 0, 0, 0, 0, 0 ] );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - array, srcNumber === lrange[ 0 ] + lrange[ 1 ]';
  var got = _.lrange.inExclusive( [ 2, 5 ], [ 0, 0, 0, 0, 0, 0, 0 ] );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - array, srcNumber = lrange[ 1 ]';
  var got = _.lrange.inExclusive( [ 2, 5 ], [ 0, 0, 0, 0, 0 ] );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - array, lrange[ 0 ] < srcNumber < lrange[ 1 ]';
  var got = _.lrange.inExclusive( [ 2, 5 ], [ 0, 0, 0, 0 ] );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - unroll, srcNumber < lrange[ 0 ]';
  var got = _.lrange.inExclusive( [ 2, 5 ], _.unrollMake( [ 0 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - unroll, srcNumber = lrange[ 0 ]';
  var got = _.lrange.inExclusive( [ 2, 5 ], _.unrollMake( [ 0, 0 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - unroll, srcNumber > lrange[ 1 ], srcNumber > lrange[ 0 ] + lrange[ 1 ]';
  var got = _.lrange.inExclusive( [ 2, 5 ], _.unrollMake( [ 0, 0, 0, 0, 0, 0, 0, 0 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - unroll, srcNumber > lrange[ 1 ], srcNumber === lrange[ 0 ] + lrange[ 1 ]';
  var got = _.lrange.inExclusive( [ 2, 5 ], _.unrollMake( [ 0, 0, 0, 0, 0, 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - unroll, srcNumber = lrange[ 1 ]';
  var got = _.lrange.inExclusive( [ 2, 5 ], _.unrollMake( [ 0, 0, 0, 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - unroll, lrange[ 0 ] < srcNumber < lrange[ 1 ]';
  var got = _.lrange.inExclusive( [ 2, 5 ], _.unrollMake( [ 0, 0, 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - argumentsArray, srcNumber < lrange[ 0 ]';
  var got = _.lrange.inExclusive( [ 2, 5 ], _.argumentsArrayMake( [ 0 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - argumentsArray, srcNumber = lrange[ 0 ]';
  var got = _.lrange.inExclusive( [ 2, 5 ], _.argumentsArrayMake( [ 0, 0 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - argumentsArray, srcNumber > lrange[ 0 ] + lrange[ 1 ]';
  var got = _.lrange.inExclusive( [ 2, 5 ], _.argumentsArrayMake( [ 0, 0, 0, 0, 0, 0, 0, 0 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - argumentsArray, srcNumber === lrange[ 0 ] + lrange[ 1 ]';
  var got = _.lrange.inExclusive( [ 2, 5 ], _.argumentsArrayMake( [ 0, 0, 0, 0, 0, 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - argumentsArray, srcNumber = lrange[ 1 ]';
  var got = _.lrange.inExclusive( [ 2, 5 ], _.argumentsArrayMake( [ 0, 0, 0, 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - argumentsArray, lrange[ 0 ] < srcNumber < lrange[ 1 ]';
  var got = _.lrange.inExclusive( [ 2, 5 ], _.argumentsArrayMake( [ 0, 0, 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - BufferTyped, srcNumber < lrange[ 0 ]';
  var got = _.lrange.inExclusive( [ 2, 5 ], new I8x( [ 0 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - BufferTyped, srcNumber = lrange[ 0 ]';
  var got = _.lrange.inExclusive( [ 2, 5 ], new I8x( [ 0, 0 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - BufferTyped, srcNumber > lrange[ 0 ] + lrange[ 1 ]';
  var got = _.lrange.inExclusive( [ 2, 5 ], new U16x( [ 0, 0, 0, 0, 0, 0, 0, 0 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - BufferTyped, srcNumber === lrange[ 0 ] + lrange[ 1 ]';
  var got = _.lrange.inExclusive( [ 2, 5 ], new U16x( [ 0, 0, 0, 0, 0, 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - BufferTyped, srcNumber = lrange[ 1 ]';
  var got = _.lrange.inExclusive( [ 2, 5 ], new U16x( [ 0, 0, 0, 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - BufferTyped, lrange[ 0 ] < srcNumber < lrange[ 1 ]';
  var got = _.lrange.inExclusive( [ 2, 5 ], new F32x( [ 0, 0, 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.lrange.inExclusive() );

  test.case = 'not enough arguments';
  test.shouldThrowErrorSync( () => _.lrange.inExclusive( [ 1, 2 ] ) );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.lrange.inExclusive( [ 1, 2 ], 3, 'extra' ) );

  test.case = 'lrange is not lrange';
  test.shouldThrowErrorSync( () => _.lrange.inExclusive( 'wrong', 3 ) );

  test.case = 'srcNumber is not Long, not Number';
  test.shouldThrowErrorSync( () => _.lrange.inExclusive( [ 1, 2 ], 'wrong' ) );
}

//

function lrangeInInclusiveLeft( test )
{
  test.case = 'srcNumber - number, srcNumber < lrange[ 0 ]';
  var got = _.lrange.inInclusiveLeft( [ 2, 5 ], 1 );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - number, srcNumber = lrange[ 0 ]';
  var got = _.lrange.inInclusiveLeft( [ 2, 5 ], 2 );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - number, srcNumber > lrange[ 1 ], srcNumber > lrange[ 0 ] + lrange[ 1 ]';
  var got = _.lrange.inInclusiveLeft( [ 2, 5 ], 7 );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - number, srcNumber > lrange[ 1 ], srcNumber === lrange[ 0 ] + lrange[ 1 ]';
  var got = _.lrange.inInclusiveLeft( [ 2, 5 ], 6 );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - number, srcNumber = lrange[ 1 ]';
  var got = _.lrange.inInclusiveLeft( [ 2, 5 ], 5 );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - number, lrange[ 0 ] < srcNumber < lrange[ 1 ]';
  var got = _.lrange.inInclusiveLeft( [ 2, 5 ], 4 );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - array, srcNumber < lrange[ 0 ]';
  var got = _.lrange.inInclusiveLeft( [ 2, 5 ], [ 0 ] );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - array, srcNumber = lrange[ 0 ]';
  var got = _.lrange.inInclusiveLeft( [ 2, 5 ], [ 0, 0 ] );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - array, srcNumber > lrange[ 1 ], srcNumber > lrange[ 0 ] + lrange[ 1 ]';
  var got = _.lrange.inInclusiveLeft( [ 2, 5 ], [ 0, 0, 0, 0, 0, 0, 0 ] );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - array, srcNumber > lrange[ 1 ], srcNumber === lrange[ 0 ] + lrange[ 1 ]';
  var got = _.lrange.inInclusiveLeft( [ 2, 5 ], [ 0, 0, 0, 0, 0, 0 ] );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - array, srcNumber = lrange[ 1 ]';
  var got = _.lrange.inInclusiveLeft( [ 2, 5 ], [ 0, 0, 0, 0, 0 ] );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - array, lrange[ 0 ] < srcNumber < lrange[ 1 ]';
  var got = _.lrange.inInclusiveLeft( [ 2, 5 ], [ 0, 0, 0, 0 ] );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - unroll, srcNumber < lrange[ 0 ]';
  var got = _.lrange.inInclusiveLeft( [ 2, 5 ], _.unrollMake( [ 0 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - unroll, srcNumber = lrange[ 0 ]';
  var got = _.lrange.inInclusiveLeft( [ 2, 5 ], _.unrollMake( [ 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - unroll, srcNumber > lrange[ 1 ], srcNumber > lrange[ 0 ] + lrange[ 1 ]';
  var got = _.lrange.inInclusiveLeft( [ 2, 5 ], _.unrollMake( [ 0, 0, 0, 0, 0, 0, 0 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - unroll, srcNumber > lrange[ 1 ], srcNumber === lrange[ 0 ] + lrange[ 1 ]';
  var got = _.lrange.inInclusiveLeft( [ 2, 5 ], _.unrollMake( [ 0, 0, 0, 0, 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - unroll, srcNumber = lrange[ 1 ]';
  var got = _.lrange.inInclusiveLeft( [ 2, 5 ], _.unrollMake( [ 0, 0, 0, 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - unroll, lrange[ 0 ] < srcNumber < lrange[ 1 ]';
  var got = _.lrange.inInclusiveLeft( [ 2, 5 ], _.unrollMake( [ 0, 0, 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - argumentsArray, srcNumber < lrange[ 0 ]';
  var got = _.lrange.inInclusiveLeft( [ 2, 5 ], _.argumentsArrayMake( [ 0 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - argumentsArray, srcNumber = lrange[ 0 ]';
  var got = _.lrange.inInclusiveLeft( [ 2, 5 ], _.argumentsArrayMake( [ 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - argumentsArray, srcNumber > lrange[ 1 ], srcNumber > lrange[ 0 ] + lrange[ 1 ]';
  var got = _.lrange.inInclusiveLeft( [ 2, 5 ], _.argumentsArrayMake( [ 0, 0, 0, 0, 0, 0, 0 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - argumentsArray, srcNumber > lrange[ 1 ], srcNumber === lrange[ 0 ] + lrange[ 1 ]';
  var got = _.lrange.inInclusiveLeft( [ 2, 5 ], _.argumentsArrayMake( [ 0, 0, 0, 0, 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - argumentsArray, srcNumber = lrange[ 1 ]';
  var got = _.lrange.inInclusiveLeft( [ 2, 5 ], _.argumentsArrayMake( [ 0, 0, 0, 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - argumentsArray, lrange[ 0 ] < srcNumber < lrange[ 1 ]';
  var got = _.lrange.inInclusiveLeft( [ 2, 5 ], _.argumentsArrayMake( [ 0, 0, 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - BufferTyped, srcNumber < lrange[ 0 ]';
  var got = _.lrange.inInclusiveLeft( [ 2, 5 ], new I8x( [ 0 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - BufferTyped, srcNumber = lrange[ 0 ]';
  var got = _.lrange.inInclusiveLeft( [ 2, 5 ], new I8x( [ 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - BufferTyped, srcNumber > lrange[ 1 ], srcNumber > lrange[ 0 ] + lrange[ 1 ]';
  var got = _.lrange.inInclusiveLeft( [ 2, 5 ], new U16x( [ 0, 0, 0, 0, 0, 0, 0 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - BufferTyped, srcNumber > lrange[ 1 ], srcNumber === lrange[ 0 ] + lrange[ 1 ]';
  var got = _.lrange.inInclusiveLeft( [ 2, 5 ], new U16x( [ 0, 0, 0, 0, 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - BufferTyped, srcNumber = lrange[ 1 ]';
  var got = _.lrange.inInclusiveLeft( [ 2, 5 ], new U16x( [ 0, 0, 0, 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - BufferTyped, lrange[ 0 ] < srcNumber < lrange[ 1 ]';
  var got = _.lrange.inInclusiveLeft( [ 2, 5 ], new F32x( [ 0, 0, 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.lrange.inInclusiveLeft() );

  test.case = 'not enough arguments';
  test.shouldThrowErrorSync( () => _.lrange.inInclusiveLeft( [ 1, 2 ] ) );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.lrange.inInclusiveLeft( [ 1, 2 ], 3, 'extra' ) );

  test.case = 'lrange is not lrange';
  test.shouldThrowErrorSync( () => _.lrange.inInclusiveLeft( 'wrong', 3 ) );

  test.case = 'srcNumber is not Long, not Number';
  test.shouldThrowErrorSync( () => _.lrange.inInclusiveLeft( [ 1, 2 ], 'wrong' ) );
}

//

function lrangeInInclusiveRight( test )
{
  test.case = 'srcNumber - number, srcNumber < lrange[ 0 ]';
  var got = _.lrange.inInclusiveRight( [ 2, 5 ], 1 );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - number, srcNumber = lrange[ 0 ]';
  var got = _.lrange.inInclusiveRight( [ 2, 5 ], 2 );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - number, srcNumber > lrange[ 1 ], srcNumber > lrange[ 0 ] + lrange[ 1 ]';
  var got = _.lrange.inInclusiveRight( [ 2, 5 ], 7 );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - number, srcNumber > lrange[ 1 ], srcNumber === lrange[ 0 ] + lrange[ 1 ]';
  var got = _.lrange.inInclusiveRight( [ 2, 5 ], 6 );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - number, srcNumber = lrange[ 1 ]';
  var got = _.lrange.inInclusiveRight( [ 2, 5 ], 5 );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - number, lrange[ 0 ] < srcNumber < lrange[ 1 ]';
  var got = _.lrange.inInclusiveRight( [ 2, 5 ], 4 );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - array, srcNumber < lrange[ 0 ]';
  var got = _.lrange.inInclusiveRight( [ 2, 5 ], [ 0 ] );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - array, srcNumber = lrange[ 0 ]';
  var got = _.lrange.inInclusiveRight( [ 2, 5 ], [ 0, 0 ] );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - array, srcNumber > lrange[ 1 ], srcNumber > lrange[ 0 ] + lrange[ 1 ]';
  var got = _.lrange.inInclusiveRight( [ 2, 5 ], [ 0, 0, 0, 0, 0, 0, 0 ] );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - array, srcNumber > lrange[ 1 ], srcNumber === lrange[ 0 ] + lrange[ 1 ]';
  var got = _.lrange.inInclusiveRight( [ 2, 5 ], [ 0, 0, 0, 0, 0, 0 ] );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - array, srcNumber = lrange[ 1 ]';
  var got = _.lrange.inInclusiveRight( [ 2, 5 ], [ 0, 0, 0, 0, 0 ] );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - array, lrange[ 0 ] < srcNumber < lrange[ 1 ]';
  var got = _.lrange.inInclusiveRight( [ 2, 5 ], [ 0, 0, 0, 0 ] );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - unroll, srcNumber < lrange[ 0 ]';
  var got = _.lrange.inInclusiveRight( [ 2, 5 ], _.unrollMake( [ 0 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - unroll, srcNumber = lrange[ 0 ]';
  var got = _.lrange.inInclusiveRight( [ 2, 5 ], _.unrollMake( [ 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - unroll, srcNumber > lrange[ 1 ], srcNumber > lrange[ 0 ] + lrange[ 1 ]';
  var got = _.lrange.inInclusiveRight( [ 2, 5 ], _.unrollMake( [ 0, 0, 0, 0, 0, 0, 0 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - unroll, srcNumber > lrange[ 1 ], srcNumber === lrange[ 0 ] + lrange[ 1 ]';
  var got = _.lrange.inInclusiveRight( [ 2, 5 ], _.unrollMake( [ 0, 0, 0, 0, 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - unroll, srcNumber = lrange[ 1 ]';
  var got = _.lrange.inInclusiveRight( [ 2, 5 ], _.unrollMake( [ 0, 0, 0, 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - unroll, lrange[ 0 ] < srcNumber < lrange[ 1 ]';
  var got = _.lrange.inInclusiveRight( [ 2, 5 ], _.unrollMake( [ 0, 0, 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - argumentsArray, srcNumber < lrange[ 0 ]';
  var got = _.lrange.inInclusiveRight( [ 2, 5 ], _.argumentsArrayMake( [ 0 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - argumentsArray, srcNumber = lrange[ 0 ]';
  var got = _.lrange.inInclusiveRight( [ 2, 5 ], _.argumentsArrayMake( [ 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - argumentsArray, srcNumber > lrange[ 1 ], srcNumber > lrange[ 0 ] + lrange[ 1 ]';
  var got = _.lrange.inInclusiveRight( [ 2, 5 ], _.argumentsArrayMake( [ 0, 0, 0, 0, 0, 0, 0 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - argumentsArray, srcNumber > lrange[ 1 ], srcNumber === lrange[ 0 ] + lrange[ 1 ]';
  var got = _.lrange.inInclusiveRight( [ 2, 5 ], _.argumentsArrayMake( [ 0, 0, 0, 0, 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - argumentsArray, srcNumber = lrange[ 1 ]';
  var got = _.lrange.inInclusiveRight( [ 2, 5 ], _.argumentsArrayMake( [ 0, 0, 0, 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - argumentsArray, lrange[ 0 ] < srcNumber < lrange[ 1 ]';
  var got = _.lrange.inInclusiveRight( [ 2, 5 ], _.argumentsArrayMake( [ 0, 0, 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - BufferTyped, srcNumber < lrange[ 0 ]';
  var got = _.lrange.inInclusiveRight( [ 2, 5 ], new I8x( [ 0 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - BufferTyped, srcNumber = lrange[ 0 ]';
  var got = _.lrange.inInclusiveRight( [ 2, 5 ], new I8x( [ 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - BufferTyped, srcNumber > lrange[ 1 ], srcNumber > lrange[ 0 ] + lrange[ 1 ]';
  var got = _.lrange.inInclusiveRight( [ 2, 5 ], new U16x( [ 0, 0, 0, 0, 0, 0, 0 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - BufferTyped, srcNumber > lrange[ 1 ], srcNumber === lrange[ 0 ] + lrange[ 1 ]';
  var got = _.lrange.inInclusiveRight( [ 2, 5 ], new U16x( [ 0, 0, 0, 0, 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - BufferTyped, srcNumber = lrange[ 1 ]';
  var got = _.lrange.inInclusiveRight( [ 2, 5 ], new U16x( [ 0, 0, 0, 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - BufferTyped, lrange[ 0 ] < srcNumber < lrange[ 1 ]';
  var got = _.lrange.inInclusiveRight( [ 2, 5 ], new F32x( [ 0, 0, 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.lrange.inInclusiveRight() );

  test.case = 'not enough arguments';
  test.shouldThrowErrorSync( () => _.lrange.inInclusiveRight( [ 1, 2 ] ) );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.lrange.inInclusiveRight( [ 1, 2 ], 3, 'extra' ) );

  test.case = 'lrange is not lrange';
  test.shouldThrowErrorSync( () => _.lrange.inInclusiveRight( 'wrong', 3 ) );

  test.case = 'srcNumber is not Long, not Number';
  test.shouldThrowErrorSync( () => _.lrange.inInclusiveRight( [ 1, 2 ], 'wrong' ) );
}

// --
// orange
// --

function orangeIsEmpty( test )
{
  test.case = 'undefined';
  var got = _.orange.isEmpty( undefined );
  var expected = false;
  test.identical( got, expected );

  test.case = 'null';
  var got = _.orange.isEmpty( null );
  var expected = false;
  test.identical( got, expected );

  test.case = 'false';
  var got = _.orange.isEmpty( false );
  var expected = false;
  test.identical( got, expected );

  test.case = 'empty string';
  var got = _.orange.isEmpty( '' );
  var expected = false;
  test.identical( got, expected );

  test.case = 'zero';
  var got = _.orange.isEmpty( 0 );
  var expected = false;
  test.identical( got, expected );

  test.case = 'NaN';
  var got = _.orange.isEmpty( NaN );
  var expected = false;
  test.identical( got, expected );

  test.case = 'a boolean';
  var got = _.orange.isEmpty( true );
  var expected = false;
  test.identical( got, expected );

  test.case = 'a number';
  var got = _.orange.isEmpty( 13 );
  var expected = false;
  test.identical( got, expected );

  test.case = 'a function';
  var got = _.orange.isEmpty( function() {} );
  var expected = false;
  test.identical( got, expected );

  test.case = 'constructor';
  function Constr( x )
  {
    this.x = x;
    return this;
  }
  var got = _.orange.isEmpty( new Constr( 0 ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'a string';
  var got = _.orange.isEmpty( 'str' );
  var expected = false;
  test.identical( got, expected );

  test.case = 'BufferRaw';
  var got = _.orange.isEmpty( new BufferRaw( 5 ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'BufferView';
  var got = _.orange.isEmpty( new BufferView( new BufferRaw( 5 ) ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'Set';
  var got = _.orange.isEmpty( new Set( [ 5 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'Map';
  var got = _.orange.isEmpty( new Map( [ [ 1, 2 ] ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'pure empty map';
  var got = _.orange.isEmpty( Object.create( null ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'pure map';
  var src = Object.create( null );
  src.x = 1;
  var got = _.orange.isEmpty( src );
  var expected = false;
  test.identical( got, expected );

  test.case = 'map from pure map';
  var src = Object.create( Object.create( null ) );
  var got = _.orange.isEmpty( src );
  var expected = false;
  test.identical( got, expected );

  test.case = 'an empty object';
  var got = _.orange.isEmpty( {} );
  var expected = false;
  test.identical( got, expected );

  test.case = 'an object';
  var got = _.orange.isEmpty( { a : 7, b : 13 } );
  var expected = false;
  test.identical( got, expected );

  /* */

  test.case = 'array.length = 0';
  var got = _.orange.isEmpty( [] );
  var expected = false;
  test.identical( got, expected );

  test.case = 'array.length = 1';
  var got = _.orange.isEmpty( [ 1 ] );
  var expected = false;
  test.identical( got, expected );

  test.case = 'array.length = 2, different numbers';
  var got = _.orange.isEmpty( [ 1, 2 ] );
  var expected = false;
  test.identical( got, expected );

  test.case = 'array.length = 2, equal numbers';
  var got = _.orange.isEmpty( [ 1, 1 ] );
  var expected = true;
  test.identical( got, expected );

  test.case = 'array.length = 2, number and undefined';
  var got = _.orange.isEmpty( [ 1, undefined ] );
  var expected = false;
  test.identical( got, expected );

  test.case = 'array.length > 2';
  var got = _.orange.isEmpty( [ 1, 2, 3 ] );
  var expected = false;
  test.identical( got, expected );

  test.case = 'unroll.length = 0';
  var got = _.orange.isEmpty( _.unrollMake( [] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'unroll.length = 1';
  var got = _.orange.isEmpty( _.unrollMake( [ 1 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'unroll.length = 2, different numbers';
  var got = _.orange.isEmpty( _.unrollMake( [ 1, 2 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'unroll.length = 2, equal numbers';
  var got = _.orange.isEmpty( _.unrollMake( [ 10, 10 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'unroll.length = 2, number and undefined';
  var got = _.orange.isEmpty( _.unrollMake( [ 1, undefined ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'unroll.length > 2';
  var got = _.orange.isEmpty( _.unrollMake( [ 1, 2, 3 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'argumentsArray.length = 0';
  var got = _.orange.isEmpty( _.argumentsArrayMake( [] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'argumentsArray.length = 1';
  var got = _.orange.isEmpty( _.argumentsArrayMake( [ 1 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'argumentsArray.length = 2, different numbers';
  var got = _.orange.isEmpty( _.argumentsArrayMake( [ 1, 2 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'argumentsArray.length = 2, equal numbers';
  var got = _.orange.isEmpty( _.argumentsArrayMake( [ -2, -2 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'argumentsArray.length = 2, number and undefined';
  var got = _.orange.isEmpty( _.argumentsArrayMake( [ 1, undefined ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'argumentsArray.length > 2';
  var got = _.orange.isEmpty( _.argumentsArrayMake( [ 1, 2, 3 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'BufferTyped.length = 0';
  var got = _.orange.isEmpty( new U8x() );
  var expected = false;
  test.identical( got, expected );

  test.case = 'BufferTyped.length = 1';
  var got = _.orange.isEmpty( new I16x( 1 ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'BufferTyped.length = 2, different numbers';
  var got = _.orange.isEmpty( new F32x( [ 1, 3 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'BufferTyped.length = 2, equal numbers';
  var got = _.orange.isEmpty( new F32x( [ 1, 1 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'BufferTyped.length > 2';
  var got = _.orange.isEmpty( new F32x( 4 ) );
  var expected = false;
  test.identical( got, expected );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.orange.isEmpty() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.orange.isEmpty( [ 1, 2 ], 'extra' ) );
}

//

function orangeIsPopulated( test )
{
  test.case = 'undefined';
  var got = _.orange.isPopulated( undefined );
  var expected = false;
  test.identical( got, expected );

  test.case = 'null';
  var got = _.orange.isPopulated( null );
  var expected = false;
  test.identical( got, expected );

  test.case = 'false';
  var got = _.orange.isPopulated( false );
  var expected = false;
  test.identical( got, expected );

  test.case = 'empty string';
  var got = _.orange.isPopulated( '' );
  var expected = false;
  test.identical( got, expected );

  test.case = 'zero';
  var got = _.orange.isPopulated( 0 );
  var expected = false;
  test.identical( got, expected );

  test.case = 'NaN';
  var got = _.orange.isPopulated( NaN );
  var expected = false;
  test.identical( got, expected );

  test.case = 'a boolean';
  var got = _.orange.isPopulated( true );
  var expected = false;
  test.identical( got, expected );

  test.case = 'a number';
  var got = _.orange.isPopulated( 13 );
  var expected = false;
  test.identical( got, expected );

  test.case = 'a function';
  var got = _.orange.isPopulated( function() {} );
  var expected = false;
  test.identical( got, expected );

  test.case = 'constructor';
  function Constr( x )
  {
    this.x = x;
    return this;
  }
  var got = _.orange.isPopulated( new Constr( 0 ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'a string';
  var got = _.orange.isPopulated( 'str' );
  var expected = false;
  test.identical( got, expected );

  test.case = 'BufferRaw';
  var got = _.orange.isPopulated( new BufferRaw( 5 ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'BufferView';
  var got = _.orange.isPopulated( new BufferView( new BufferRaw( 5 ) ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'Set';
  var got = _.orange.isPopulated( new Set( [ 5 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'Map';
  var got = _.orange.isPopulated( new Map( [ [ 1, 2 ] ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'pure empty map';
  var got = _.orange.isPopulated( Object.create( null ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'pure map';
  var src = Object.create( null );
  src.x = 1;
  var got = _.orange.isPopulated( src );
  var expected = false;
  test.identical( got, expected );

  test.case = 'map from pure map';
  var src = Object.create( Object.create( null ) );
  var got = _.orange.isPopulated( src );
  var expected = false;
  test.identical( got, expected );

  test.case = 'an empty object';
  var got = _.orange.isPopulated( {} );
  var expected = false;
  test.identical( got, expected );

  test.case = 'an object';
  var got = _.orange.isPopulated( { a : 7, b : 13 } );
  var expected = false;
  test.identical( got, expected );

  /* */

  test.case = 'array.length = 0';
  var got = _.orange.isPopulated( [] );
  var expected = false;
  test.identical( got, expected );

  test.case = 'array.length = 1';
  var got = _.orange.isPopulated( [ 1 ] );
  var expected = false;
  test.identical( got, expected );

  test.case = 'array.length = 2, different numbers';
  var got = _.orange.isPopulated( [ 1, 2 ] );
  var expected = true;
  test.identical( got, expected );

  test.case = 'array.length = 2, equal numbers';
  var got = _.orange.isPopulated( [ 1, 1 ] );
  var expected = false;
  test.identical( got, expected );

  test.case = 'array.length = 2, number and undefined';
  var got = _.orange.isPopulated( [ 1, undefined ] );
  var expected = false;
  test.identical( got, expected );

  test.case = 'array.length > 2';
  var got = _.orange.isPopulated( [ 1, 2, 3 ] );
  var expected = false;
  test.identical( got, expected );

  test.case = 'unroll.length = 0';
  var got = _.orange.isPopulated( _.unrollMake( [] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'unroll.length = 1';
  var got = _.orange.isPopulated( _.unrollMake( [ 1 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'unroll.length = 2, different numbers';
  var got = _.orange.isPopulated( _.unrollMake( [ 1, 2 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'unroll.length = 2, equal numbers';
  var got = _.orange.isPopulated( _.unrollMake( [ 10, 10 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'unroll.length = 2, number and undefined';
  var got = _.orange.isPopulated( _.unrollMake( [ 1, undefined ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'unroll.length > 2';
  var got = _.orange.isPopulated( _.unrollMake( [ 1, 2, 3 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'argumentsArray.length = 0';
  var got = _.orange.isPopulated( _.argumentsArrayMake( [] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'argumentsArray.length = 1';
  var got = _.orange.isPopulated( _.argumentsArrayMake( [ 1 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'argumentsArray.length = 2, different numbers';
  var got = _.orange.isPopulated( _.argumentsArrayMake( [ 1, 2 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'argumentsArray.length = 2, equal numbers';
  var got = _.orange.isPopulated( _.argumentsArrayMake( [ -2, -2 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'argumentsArray.length = 2, number and undefined';
  var got = _.orange.isPopulated( _.argumentsArrayMake( [ 1, undefined ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'argumentsArray.length > 2';
  var got = _.orange.isPopulated( _.argumentsArrayMake( [ 1, 2, 3 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'BufferTyped.length = 0';
  var got = _.orange.isPopulated( new U8x() );
  var expected = false;
  test.identical( got, expected );

  test.case = 'BufferTyped.length = 1';
  var got = _.orange.isPopulated( new I16x( 1 ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'BufferTyped.length = 2, different numbers';
  var got = _.orange.isPopulated( new F32x( [ 1, 3 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'BufferTyped.length = 2, equal numbers';
  var got = _.orange.isPopulated( new F32x( [ 1, 1 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'BufferTyped.length > 2';
  var got = _.orange.isPopulated( new F32x( 4 ) );
  var expected = false;
  test.identical( got, expected );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.orange.isPopulated() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.orange.isPopulated( [ 1, 2 ], 'extra' ) );
}

//

function orangeInInclusive( test )
{
  test.case = 'srcNumber - number, srcNumber < orange[ 0 ]';
  var got = _.orange.inInclusive( [ 2, 5 ], 1 );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - number, srcNumber = orange[ 0 ]';
  var got = _.orange.inInclusive( [ 2, 5 ], 2 );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - number, srcNumber > orange[ 1 ]';
  var got = _.orange.inInclusive( [ 2, 5 ], 7 );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - number, srcNumber = orange[ 1 ]';
  var got = _.orange.inInclusive( [ 2, 5 ], 5 );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - number, orange[ 0 ] < srcNumber < range[ 1 ]';
  var got = _.orange.inInclusive( [ 2, 5 ], 4 );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - array, srcNumber < orange[ 0 ]';
  var got = _.orange.inInclusive( [ 2, 5 ], [ 0 ] );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - array, srcNumber = orange[ 0 ]';
  var got = _.orange.inInclusive( [ 2, 5 ], [ 0, 0 ] );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - array, srcNumber > orange[ 1 ]';
  var got = _.orange.inInclusive( [ 2, 5 ], [ 0, 0, 0, 0, 0, 0, 0 ] );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - array, srcNumber = orange[ 1 ]';
  var got = _.orange.inInclusive( [ 2, 5 ], [ 0, 0, 0, 0, 0 ] );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - array, orange[ 0 ] < srcNumber < range[ 1 ]';
  var got = _.orange.inInclusive( [ 2, 5 ], [ 0, 0, 0, 0 ] );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - unroll, srcNumber < orange[ 0 ]';
  var got = _.orange.inInclusive( [ 2, 5 ], _.unrollMake( [ 0 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - unroll, srcNumber = orange[ 0 ]';
  var got = _.orange.inInclusive( [ 2, 5 ], _.unrollMake( [ 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - unroll, srcNumber > orange[ 1 ]';
  var got = _.orange.inInclusive( [ 2, 5 ], _.unrollMake( [ 0, 0, 0, 0, 0, 0, 0 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - unroll, srcNumber = orange[ 1 ]';
  var got = _.orange.inInclusive( [ 2, 5 ], _.unrollMake( [ 0, 0, 0, 0, 0 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - unroll, orange[ 0 ] < srcNumber < range[ 1 ]';
  var got = _.orange.inInclusive( [ 2, 5 ], _.unrollMake( [ 0, 0, 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - argumentsArray, srcNumber < orange[ 0 ]';
  var got = _.orange.inInclusive( [ 2, 5 ], _.argumentsArrayMake( [ 0 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - argumentsArray, srcNumber = orange[ 0 ]';
  var got = _.orange.inInclusive( [ 2, 5 ], _.argumentsArrayMake( [ 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - argumentsArray, srcNumber > orange[ 1 ]';
  var got = _.orange.inInclusive( [ 2, 5 ], _.argumentsArrayMake( [ 0, 0, 0, 0, 0, 0, 0 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - argumentsArray, srcNumber = orange[ 1 ]';
  var got = _.orange.inInclusive( [ 2, 5 ], _.argumentsArrayMake( [ 0, 0, 0, 0, 0 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - argumentsArray, orange[ 0 ] < srcNumber < range[ 1 ]';
  var got = _.orange.inInclusive( [ 2, 5 ], _.argumentsArrayMake( [ 0, 0, 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - BufferTyped, srcNumber < orange[ 0 ]';
  var got = _.orange.inInclusive( [ 2, 5 ], new I8x( [ 0 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - BufferTyped, srcNumber = orange[ 0 ]';
  var got = _.orange.inInclusive( [ 2, 5 ], new I8x( [ 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - BufferTyped, srcNumber > orange[ 1 ]';
  var got = _.orange.inInclusive( [ 2, 5 ], new U16x( [ 0, 0, 0, 0, 0, 0, 0 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - BufferTyped, srcNumber = orange[ 1 ]';
  var got = _.orange.inInclusive( [ 2, 5 ], new U16x( [ 0, 0, 0, 0, 0 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - BufferTyped, orange[ 0 ] < srcNumber < range[ 1 ]';
  var got = _.orange.inInclusive( [ 2, 5 ], new F32x( [ 0, 0, 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.orange.inInclusive() );

  test.case = 'not enough arguments';
  test.shouldThrowErrorSync( () => _.orange.inInclusive( [ 1, 2 ] ) );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.orange.inInclusive( [ 1, 2 ], 3, 'extra' ) );

  test.case = 'orange is not Range';
  test.shouldThrowErrorSync( () => _.orange.inInclusive( 'wrong', 3 ) );

  test.case = 'srcNumber is not Long, not Number';
  test.shouldThrowErrorSync( () => _.orange.inInclusive( [ 1, 2 ], 'wrong' ) );
}

//

function orangeInExclusive( test )
{
  test.case = 'srcNumber - number, srcNumber < orange[ 0 ]';
  var got = _.orange.inExclusive( [ 2, 5 ], 1 );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - number, srcNumber = orange[ 0 ]';
  var got = _.orange.inExclusive( [ 2, 5 ], 2 );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - number, srcNumber > orange[ 1 ]';
  var got = _.orange.inExclusive( [ 2, 5 ], 7 );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - number, srcNumber = orange[ 1 ]';
  var got = _.orange.inExclusive( [ 2, 5 ], 5 );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - number, orange[ 0 ] < srcNumber < orange[ 1 ]';
  var got = _.orange.inExclusive( [ 2, 5 ], 4 );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - array, srcNumber < orange[ 0 ]';
  var got = _.orange.inExclusive( [ 2, 5 ], [ 0 ] );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - array, srcNumber = orange[ 0 ]';
  var got = _.orange.inExclusive( [ 2, 5 ], [ 0, 0 ] );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - array, srcNumber > orange[ 1 ]';
  var got = _.orange.inExclusive( [ 2, 5 ], [ 0, 0, 0, 0, 0, 0, 0 ] );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - array, srcNumber = orange[ 1 ]';
  var got = _.orange.inExclusive( [ 2, 5 ], [ 0, 0, 0, 0, 0 ] );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - array, orange[ 0 ] < srcNumber < orange[ 1 ]';
  var got = _.orange.inExclusive( [ 2, 5 ], [ 0, 0, 0, 0 ] );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - unroll, srcNumber < orange[ 0 ]';
  var got = _.orange.inExclusive( [ 2, 5 ], _.unrollMake( [ 0 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - unroll, srcNumber = orange[ 0 ]';
  var got = _.orange.inExclusive( [ 2, 5 ], _.unrollMake( [ 0, 0 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - unroll, srcNumber > orange[ 1 ]';
  var got = _.orange.inExclusive( [ 2, 5 ], _.unrollMake( [ 0, 0, 0, 0, 0, 0, 0 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - unroll, srcNumber = orange[ 1 ]';
  var got = _.orange.inExclusive( [ 2, 5 ], _.unrollMake( [ 0, 0, 0, 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - unroll, orange[ 0 ] < srcNumber < orange[ 1 ]';
  var got = _.orange.inExclusive( [ 2, 5 ], _.unrollMake( [ 0, 0, 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - argumentsArray, srcNumber < orange[ 0 ]';
  var got = _.orange.inExclusive( [ 2, 5 ], _.argumentsArrayMake( [ 0 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - argumentsArray, srcNumber = orange[ 0 ]';
  var got = _.orange.inExclusive( [ 2, 5 ], _.argumentsArrayMake( [ 0, 0 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - argumentsArray, srcNumber > orange[ 1 ]';
  var got = _.orange.inExclusive( [ 2, 5 ], _.argumentsArrayMake( [ 0, 0, 0, 0, 0, 0, 0 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - argumentsArray, srcNumber = orange[ 1 ]';
  var got = _.orange.inExclusive( [ 2, 5 ], _.argumentsArrayMake( [ 0, 0, 0, 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - argumentsArray, orange[ 0 ] < srcNumber < orange[ 1 ]';
  var got = _.orange.inExclusive( [ 2, 5 ], _.argumentsArrayMake( [ 0, 0, 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - BufferTyped, srcNumber < orange[ 0 ]';
  var got = _.orange.inExclusive( [ 2, 5 ], new I8x( [ 0 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - BufferTyped, srcNumber = orange[ 0 ]';
  var got = _.orange.inExclusive( [ 2, 5 ], new I8x( [ 0, 0 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - BufferTyped, srcNumber > orange[ 1 ]';
  var got = _.orange.inExclusive( [ 2, 5 ], new U16x( [ 0, 0, 0, 0, 0, 0, 0 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - BufferTyped, srcNumber = orange[ 1 ]';
  var got = _.orange.inExclusive( [ 2, 5 ], new U16x( [ 0, 0, 0, 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - BufferTyped, orange[ 0 ] < srcNumber < orange[ 1 ]';
  var got = _.orange.inExclusive( [ 2, 5 ], new F32x( [ 0, 0, 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.orange.inExclusive() );

  test.case = 'not enough arguments';
  test.shouldThrowErrorSync( () => _.orange.inExclusive( [ 1, 2 ] ) );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.orange.inExclusive( [ 1, 2 ], 3, 'extra' ) );

  test.case = 'orange is not orange';
  test.shouldThrowErrorSync( () => _.orange.inExclusive( 'wrong', 3 ) );

  test.case = 'srcNumber is not Long, not Number';
  test.shouldThrowErrorSync( () => _.orange.inExclusive( [ 1, 2 ], 'wrong' ) );
}

//

function orangeInInclusiveLeft( test )
{
  test.case = 'srcNumber - number, srcNumber < orange[ 0 ]';
  var got = _.orange.inInclusiveLeft( [ 2, 5 ], 1 );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - number, srcNumber = orange[ 0 ]';
  var got = _.orange.inInclusiveLeft( [ 2, 5 ], 2 );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - number, srcNumber > orange[ 1 ]';
  var got = _.orange.inInclusiveLeft( [ 2, 5 ], 7 );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - number, srcNumber = orange[ 1 ]';
  var got = _.orange.inInclusiveLeft( [ 2, 5 ], 5 );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - number, orange[ 0 ] < srcNumber < range[ 1 ]';
  var got = _.orange.inInclusiveLeft( [ 2, 5 ], 4 );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - array, srcNumber < orange[ 0 ]';
  var got = _.orange.inInclusiveLeft( [ 2, 5 ], [ 0 ] );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - array, srcNumber = orange[ 0 ]';
  var got = _.orange.inInclusiveLeft( [ 2, 5 ], [ 0, 0 ] );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - array, srcNumber > orange[ 1 ]';
  var got = _.orange.inInclusiveLeft( [ 2, 5 ], [ 0, 0, 0, 0, 0, 0, 0 ] );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - array, srcNumber = orange[ 1 ]';
  var got = _.orange.inInclusiveLeft( [ 2, 5 ], [ 0, 0, 0, 0, 0 ] );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - array, orange[ 0 ] < srcNumber < range[ 1 ]';
  var got = _.orange.inInclusiveLeft( [ 2, 5 ], [ 0, 0, 0, 0 ] );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - unroll, srcNumber < orange[ 0 ]';
  var got = _.orange.inInclusiveLeft( [ 2, 5 ], _.unrollMake( [ 0 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - unroll, srcNumber = orange[ 0 ]';
  var got = _.orange.inInclusiveLeft( [ 2, 5 ], _.unrollMake( [ 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - unroll, srcNumber > orange[ 1 ]';
  var got = _.orange.inInclusiveLeft( [ 2, 5 ], _.unrollMake( [ 0, 0, 0, 0, 0, 0, 0 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - unroll, srcNumber = orange[ 1 ]';
  var got = _.orange.inInclusiveLeft( [ 2, 5 ], _.unrollMake( [ 0, 0, 0, 0, 0 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - unroll, orange[ 0 ] < srcNumber < range[ 1 ]';
  var got = _.orange.inInclusiveLeft( [ 2, 5 ], _.unrollMake( [ 0, 0, 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - argumentsArray, srcNumber < orange[ 0 ]';
  var got = _.orange.inInclusiveLeft( [ 2, 5 ], _.argumentsArrayMake( [ 0 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - argumentsArray, srcNumber = orange[ 0 ]';
  var got = _.orange.inInclusiveLeft( [ 2, 5 ], _.argumentsArrayMake( [ 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - argumentsArray, srcNumber > orange[ 1 ]';
  var got = _.orange.inInclusiveLeft( [ 2, 5 ], _.argumentsArrayMake( [ 0, 0, 0, 0, 0, 0, 0 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - argumentsArray, srcNumber = orange[ 1 ]';
  var got = _.orange.inInclusiveLeft( [ 2, 5 ], _.argumentsArrayMake( [ 0, 0, 0, 0, 0 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - argumentsArray, orange[ 0 ] < srcNumber < range[ 1 ]';
  var got = _.orange.inInclusiveLeft( [ 2, 5 ], _.argumentsArrayMake( [ 0, 0, 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - BufferTyped, srcNumber < orange[ 0 ]';
  var got = _.orange.inInclusiveLeft( [ 2, 5 ], new I8x( [ 0 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - BufferTyped, srcNumber = orange[ 0 ]';
  var got = _.orange.inInclusiveLeft( [ 2, 5 ], new I8x( [ 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - BufferTyped, srcNumber > orange[ 1 ]';
  var got = _.orange.inInclusiveLeft( [ 2, 5 ], new U16x( [ 0, 0, 0, 0, 0, 0, 0 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - BufferTyped, srcNumber = orange[ 1 ]';
  var got = _.orange.inInclusiveLeft( [ 2, 5 ], new U16x( [ 0, 0, 0, 0, 0 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - BufferTyped, orange[ 0 ] < srcNumber < range[ 1 ]';
  var got = _.orange.inInclusiveLeft( [ 2, 5 ], new F32x( [ 0, 0, 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.orange.inInclusiveLeft() );

  test.case = 'not enough arguments';
  test.shouldThrowErrorSync( () => _.orange.inInclusiveLeft( [ 1, 2 ] ) );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.orange.inInclusiveLeft( [ 1, 2 ], 3, 'extra' ) );

  test.case = 'orange is not Range';
  test.shouldThrowErrorSync( () => _.orange.inInclusiveLeft( 'wrong', 3 ) );

  test.case = 'srcNumber is not Long, not Number';
  test.shouldThrowErrorSync( () => _.orange.inInclusiveLeft( [ 1, 2 ], 'wrong' ) );
}

//

function orangeInInclusiveRight( test )
{
  test.case = 'srcNumber - number, srcNumber < orange[ 0 ]';
  var got = _.orange.inInclusiveRight( [ 2, 5 ], 1 );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - number, srcNumber = orange[ 0 ]';
  var got = _.orange.inInclusiveRight( [ 2, 5 ], 2 );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - number, srcNumber > orange[ 1 ]';
  var got = _.orange.inInclusiveRight( [ 2, 5 ], 7 );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - number, srcNumber = orange[ 1 ]';
  var got = _.orange.inInclusiveRight( [ 2, 5 ], 5 );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - number, orange[ 0 ] < srcNumber < range[ 1 ]';
  var got = _.orange.inInclusiveRight( [ 2, 5 ], 4 );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - array, srcNumber < orange[ 0 ]';
  var got = _.orange.inInclusiveRight( [ 2, 5 ], [ 0 ] );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - array, srcNumber = orange[ 0 ]';
  var got = _.orange.inInclusiveRight( [ 2, 5 ], [ 0, 0 ] );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - array, srcNumber > orange[ 1 ]';
  var got = _.orange.inInclusiveRight( [ 2, 5 ], [ 0, 0, 0, 0, 0, 0, 0 ] );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - array, srcNumber = orange[ 1 ]';
  var got = _.orange.inInclusiveRight( [ 2, 5 ], [ 0, 0, 0, 0, 0 ] );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - array, orange[ 0 ] < srcNumber < range[ 1 ]';
  var got = _.orange.inInclusiveRight( [ 2, 5 ], [ 0, 0, 0, 0 ] );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - unroll, srcNumber < orange[ 0 ]';
  var got = _.orange.inInclusiveRight( [ 2, 5 ], _.unrollMake( [ 0 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - unroll, srcNumber = orange[ 0 ]';
  var got = _.orange.inInclusiveRight( [ 2, 5 ], _.unrollMake( [ 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - unroll, srcNumber > orange[ 1 ]';
  var got = _.orange.inInclusiveRight( [ 2, 5 ], _.unrollMake( [ 0, 0, 0, 0, 0, 0, 0 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - unroll, srcNumber = orange[ 1 ]';
  var got = _.orange.inInclusiveRight( [ 2, 5 ], _.unrollMake( [ 0, 0, 0, 0, 0 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - unroll, orange[ 0 ] < srcNumber < range[ 1 ]';
  var got = _.orange.inInclusiveRight( [ 2, 5 ], _.unrollMake( [ 0, 0, 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - argumentsArray, srcNumber < orange[ 0 ]';
  var got = _.orange.inInclusiveRight( [ 2, 5 ], _.argumentsArrayMake( [ 0 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - argumentsArray, srcNumber = orange[ 0 ]';
  var got = _.orange.inInclusiveRight( [ 2, 5 ], _.argumentsArrayMake( [ 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - argumentsArray, srcNumber > orange[ 1 ]';
  var got = _.orange.inInclusiveRight( [ 2, 5 ], _.argumentsArrayMake( [ 0, 0, 0, 0, 0, 0, 0 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - argumentsArray, srcNumber = orange[ 1 ]';
  var got = _.orange.inInclusiveRight( [ 2, 5 ], _.argumentsArrayMake( [ 0, 0, 0, 0, 0 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - argumentsArray, orange[ 0 ] < srcNumber < range[ 1 ]';
  var got = _.orange.inInclusiveRight( [ 2, 5 ], _.argumentsArrayMake( [ 0, 0, 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - BufferTyped, srcNumber < orange[ 0 ]';
  var got = _.orange.inInclusiveRight( [ 2, 5 ], new I8x( [ 0 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - BufferTyped, srcNumber = orange[ 0 ]';
  var got = _.orange.inInclusiveRight( [ 2, 5 ], new I8x( [ 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'srcNumber - BufferTyped, srcNumber > orange[ 1 ]';
  var got = _.orange.inInclusiveRight( [ 2, 5 ], new U16x( [ 0, 0, 0, 0, 0, 0, 0 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - BufferTyped, srcNumber = orange[ 1 ]';
  var got = _.orange.inInclusiveRight( [ 2, 5 ], new U16x( [ 0, 0, 0, 0, 0 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'srcNumber - BufferTyped, orange[ 0 ] < srcNumber < range[ 1 ]';
  var got = _.orange.inInclusiveRight( [ 2, 5 ], new F32x( [ 0, 0, 0, 0 ] ) );
  var expected = true;
  test.identical( got, expected );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.orange.inInclusiveRight() );

  test.case = 'not enough arguments';
  test.shouldThrowErrorSync( () => _.orange.inInclusiveRight( [ 1, 2 ] ) );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.orange.inInclusiveRight( [ 1, 2 ], 3, 'extra' ) );

  test.case = 'orange is not Range';
  test.shouldThrowErrorSync( () => _.orange.inInclusiveRight( 'wrong', 3 ) );

  test.case = 'srcNumber is not Long, not Number';
  test.shouldThrowErrorSync( () => _.orange.inInclusiveRight( [ 1, 2 ], 'wrong' ) );
}

//

function sureInRange( test )
{
  test.case = 'two arguments, src - number, in range';
  var got = _.range.sureInRange( 3, [ 1, 5 ] );
  var expected = true;
  test.identical( got, expected );

  test.case = 'two arguments, src - array, in range';
  var got = _.range.sureInRange( 3, [ 1, 5 ] );
  var expected = true;
  test.identical( got, expected );

  test.case = 'more then two arguments, src - number, in range';
  var got = _.range.sureInRange( 3, [ 1, 5 ], 'extra', [ 'next' ] );
  var expected = true;
  test.identical( got, expected );

  test.case = 'more then two arguments, src - array, in range';
  var got = _.range.sureInRange( 3, [ 1, 5 ], 'extra', [ 'next' ] );
  var expected = true;
  test.identical( got, expected );

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.range.sureInRange() );

  test.case = 'not enough arguments';
  test.shouldThrowErrorSync( () => _.range.sureInRange( 2 ) );

  test.case = 'src out of range';
  test.shouldThrowErrorSync( () => _.range.sureInRange( 1, [ 2, 5 ] ) );
  test.shouldThrowErrorSync( () => _.range.sureInRange( 5, [ 2, 5 ] ) );
  test.shouldThrowErrorSync( () => _.range.sureInRange( 7, [ 2, 5 ] ) );
  test.shouldThrowErrorSync( () => _.range.sureInRange( 1, [ 2, 5 ], [] ) );
  test.shouldThrowErrorSync( () => _.range.sureInRange( 5, [ 2, 5 ], {} ) );
  test.shouldThrowErrorSync( () => _.range.sureInRange( 7, [ 2, 5 ], undefined ) );
}

//

function assertInRange( test )
{
  test.case = 'two arguments, src - number, in range';
  var got = _.range.assertInRange( 3, [ 1, 5 ] );
  var expected = true;
  test.identical( got, expected );

  test.case = 'two arguments, src - array, in range';
  var got = _.range.assertInRange( 3, [ 1, 5 ] );
  var expected = true;
  test.identical( got, expected );

  test.case = 'more then two arguments, src - number, in range';
  var got = _.range.assertInRange( 3, [ 1, 5 ], 'extra', [ 'next' ] );
  var expected = true;
  test.identical( got, expected );

  test.case = 'more then two arguments, src - array, in range';
  var got = _.range.assertInRange( 3, [ 1, 5 ], 'extra', [ 'next' ] );
  var expected = true;
  test.identical( got, expected );

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.range.assertInRange() );

  test.case = 'not enough arguments';
  test.shouldThrowErrorSync( () => _.range.assertInRange( 2 ) );

  test.case = 'src out of range';
  test.shouldThrowErrorSync( () => _.range.assertInRange( 1, [ 2, 5 ] ) );
  test.shouldThrowErrorSync( () => _.range.assertInRange( 5, [ 2, 5 ] ) );
  test.shouldThrowErrorSync( () => _.range.assertInRange( 7, [ 2, 5 ] ) );
  test.shouldThrowErrorSync( () => _.range.assertInRange( 1, [ 2, 5 ], [] ) );
  test.shouldThrowErrorSync( () => _.range.assertInRange( 5, [ 2, 5 ], {} ) );
  test.shouldThrowErrorSync( () => _.range.assertInRange( 7, [ 2, 5 ], undefined ) );
}

//

function fromSingle( test )
{
  test.case = 'range - number';
  var got = _.range.fromSingle( 1 );
  test.identical( got, [ 1, 2 ] );

  /* */

  test.case = 'range.length === 1';
  var src = [ 1 ];
  var got = _.range.fromSingle( src );
  test.identical( got, [ 1, 2 ] );
  test.is( got !== src );

  test.case = 'range[ 0 ] - undefined';
  var src = [ undefined, 2 ];
  var got = _.range.fromSingle( src );
  test.identical( got, [ 1, 2 ] );
  test.is( got !== src );

  test.case = 'range[ 1 ] - undefined';
  var src = [ 1, undefined ];
  var got = _.range.fromSingle( src );
  test.identical( got, [ 1, 2 ] );
  test.is( got !== src );

  test.case = 'range[ 0 ] - undefined, range[ 1 ] - undefined';
  var src = [ undefined, undefined ];
  var got = _.range.fromSingle( src );
  test.identical( got, [ 0, 1 ] );
  test.is( got !== src );

  test.case = 'range[ 0 ] - number, range[ 1 ] - number';
  var src = [ 1, 5 ];
  var got = _.range.fromSingle( src );
  test.identical( got, [ 1, 5 ] );
  test.is( got === src );

  /* */

  test.case = 'range.length === 1';
  var src = _.unrollMake( [ 1 ] );
  var got = _.range.fromSingle( src );
  test.identical( got, [ 1, 2 ] );
  test.is( got !== src );

  test.case = 'range[ 0 ] - undefined';
  var src = _.unrollMake( [ undefined, 2 ] );
  var got = _.range.fromSingle( src );
  test.identical( got, [ 1, 2 ] );
  test.is( got !== src );

  test.case = 'range[ 1 ] - undefined';
  var src = _.unrollMake( [ 1, undefined ] );
  var got = _.range.fromSingle( src );
  test.identical( got, [ 1, 2 ] );
  test.is( got !== src );

  test.case = 'range[ 0 ] - undefined, range[ 1 ] - undefined';
  var src = _.unrollMake( [ undefined, undefined ] );
  var got = _.range.fromSingle( src );
  test.identical( got, [ 0, 1 ] );
  test.is( got !== src );

  test.case = 'range[ 0 ] - number, range[ 1 ] - number';
  var src = _.unrollMake( [ 1, 5 ] );
  var got = _.range.fromSingle( src );
  test.identical( got, _.unrollMake( [ 1, 5 ] ) );
  test.is( got === src );

  /* */

  test.case = 'range.length === 1';
  var src = _.argumentsArrayMake( [ 1 ] );
  var got = _.range.fromSingle( src );
  test.identical( got, [ 1, 2 ] );
  test.is( got !== src );

  test.case = 'range[ 0 ] - undefined';
  var src = _.argumentsArrayMake( [ undefined, 2 ] );
  var got = _.range.fromSingle( src );
  test.identical( got, [ 1, 2 ] );
  test.is( got !== src );

  test.case = 'range[ 1 ] - undefined';
  var src = _.argumentsArrayMake( [ 1, undefined ] );
  var got = _.range.fromSingle( src );
  test.identical( got, [ 1, 2 ] );
  test.is( got !== src );

  test.case = 'range[ 0 ] - undefined, range[ 1 ] - undefined';
  var src = _.argumentsArrayMake( [ undefined, undefined ] );
  var got = _.range.fromSingle( src );
  test.identical( got, [ 0, 1 ] );
  test.is( got !== src );

  test.case = 'range[ 0 ] - number, range[ 1 ] - number';
  var src = _.argumentsArrayMake( [ 1, 5 ] );
  var got = _.range.fromSingle( src );
  test.identical( got, _.argumentsArrayMake( [ 1, 5 ] ) );
  test.is( got === src );

  /* */

  test.case = 'range.length === 1';
  var src = new U8x( [ 1 ] );
  var got = _.range.fromSingle( src );
  test.identical( got, [ 1, 2 ] );
  test.is( got !== src );

  test.case = 'range[ 0 ] - number, range[ 1 ] - number';
  var src = new I16x( [ 1, 5 ] );
  var got = _.range.fromSingle( src );
  test.identical( got, new I16x( [ 1, 5 ] ) );
  test.is( got === src );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.range.fromSingle() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.range.fromSingle( [ 1, 2 ], 1 ) );

  test.case = 'wrong type of range';
  test.shouldThrowErrorSync( () => _.range.fromSingle( { 0 : 1, 1 : 2 } ) );

  test.case = 'wrong range length';
  test.shouldThrowErrorSync( () => _.range.fromSingle( [ 0, 1, 2 ] ) );

  test.case = 'wrong elements in range';
  test.shouldThrowErrorSync( () => _.range.fromSingle( [ null, 2 ] ) );
  test.shouldThrowErrorSync( () => _.range.fromSingle( [ 2, 'abc' ] ) );
}

//

function clamp( test )
{
  test.open( 'array' );

  test.case = 'identical ranges';
  var dst = [ 2, 2 ];
  var clamp = [ 2, 2 ];
  var got = _.range.clamp( dst, clamp );
  test.identical( got, [ 2, 2 ] );
  test.is( got === dst );

  test.case = 'dst[ 0 ] < clamp[ 0 ], dst[ 1 ] < clamp[ 0 ]';
  var dst = [ 2, 2 ];
  var clamp = [ 3, 6 ];
  var got = _.range.clamp( dst, clamp );
  test.identical( got, [ 3, 3 ] );
  test.is( got === dst );

  test.case = 'dst[ 0 ] < clamp[ 0 ], clamp[ 1 ] > dst[ 1 ] > clamp[ 0 ]';
  var dst = [ 2, 4 ];
  var clamp = [ 3, 6 ];
  var got = _.range.clamp( dst, clamp );
  test.identical( got, [ 3, 4 ] );
  test.is( got === dst );

  test.case = 'clamp[ 1 ] > dst[ 0 ] > clamp[ 0 ], dst[ 1 ] < clamp[ 0 ]';
  var dst = [ 4, 2 ];
  var clamp = [ 3, 6 ];
  var got = _.range.clamp( dst, clamp );
  test.identical( got, [ 4, 3 ] );
  test.is( got === dst );

  test.case = 'clamp[ 1 ] > dst[ 0 ] > clamp[ 0 ], clamp[ 1 ] > dst[ 1 ] > clamp[ 0 ]';
  var dst = [ 4, 5 ];
  var clamp = [ 3, 6 ];
  var got = _.range.clamp( dst, clamp );
  test.identical( got, [ 4, 5 ] );
  test.is( got === dst );

  test.case = 'dst[ 0 ] > clamp[ 1 ], clamp[ 1 ] > dst[ 1 ] > clamp[ 0 ]';
  var dst = [ 7, 5 ];
  var clamp = [ 3, 6 ];
  var got = _.range.clamp( dst, clamp );
  test.identical( got, [ 6, 5 ] );
  test.is( got === dst );

  test.case = 'clamp[ 1 ] > dst[ 0 ] > clamp[ 0 ], dst[ 1 ] > clamp[ 1 ]';
  var dst = [ 4, 7 ];
  var clamp = [ 3, 6 ];
  var got = _.range.clamp( dst, clamp );
  test.identical( got, [ 4, 6 ] );
  test.is( got === dst );

  test.case = 'dst[ 0 ] > clamp[ 1 ], dst[ 1 ] > clamp[ 1 ]';
  var dst = [ 8, 7 ];
  var clamp = [ 3, 6 ];
  var got = _.range.clamp( dst, clamp );
  test.identical( got, [ 6, 6 ] );
  test.is( got === dst );

  test.case = 'dst[ 0 ] < clamp[ 0 ], dst[ 1 ] > clamp[ 1 ]';
  var dst = [ 2, 7 ];
  var clamp = [ 3, 6 ];
  var got = _.range.clamp( dst, clamp );
  test.identical( got, [ 3, 6 ] );
  test.is( got === dst );

  test.close( 'array' );

  /* - */

  test.open( 'unroll' );

  test.case = 'identical ranges';
  var dst = _.unrollMake( [ 2, 2 ] );
  var clamp = [ 2, 2 ];
  var got = _.range.clamp( dst, clamp );
  test.identical( got, _.unrollMake( [ 2, 2 ] ) );
  test.is( got === dst );

  test.case = 'dst[ 0 ] < clamp[ 0 ], dst[ 1 ] < clamp[ 0 ]';
  var dst = _.unrollMake( [ 2, 2 ] );
  var clamp = [ 3, 6 ];
  var got = _.range.clamp( dst, clamp );
  test.identical( got, _.unrollMake( [ 3, 3 ] ) );
  test.is( got === dst );

  test.case = 'dst[ 0 ] < clamp[ 0 ], clamp[ 1 ] > dst[ 1 ] > clamp[ 0 ]';
  var dst = _.unrollMake( [ 2, 4 ] );
  var clamp = [ 3, 6 ];
  var got = _.range.clamp( dst, clamp );
  test.identical( got, _.unrollMake( [ 3, 4 ] ) );
  test.is( got === dst );

  test.case = 'clamp[ 1 ] > dst[ 0 ] > clamp[ 0 ], dst[ 1 ] < clamp[ 0 ]';
  var dst = _.unrollMake( [ 4, 2 ] );
  var clamp = [ 3, 6 ];
  var got = _.range.clamp( dst, clamp );
  test.identical( got, _.unrollMake( [ 4, 3 ] ) );
  test.is( got === dst );

  test.case = 'clamp[ 1 ] > dst[ 0 ] > clamp[ 0 ], clamp[ 1 ] > dst[ 1 ] > clamp[ 0 ]';
  var dst = _.unrollMake( [ 4, 5 ] );
  var clamp = [ 3, 6 ];
  var got = _.range.clamp( dst, clamp );
  test.identical( got, _.unrollMake( [ 4, 5 ] ) );
  test.is( got === dst );

  test.case = 'dst[ 0 ] > clamp[ 1 ], clamp[ 1 ] > dst[ 1 ] > clamp[ 0 ]';
  var dst = _.unrollMake( [ 7, 5 ] );
  var clamp = [ 3, 6 ];
  var got = _.range.clamp( dst, clamp );
  test.identical( got, _.unrollMake( [ 6, 5 ] ) );
  test.is( got === dst );

  test.case = 'clamp[ 1 ] > dst[ 0 ] > clamp[ 0 ], dst[ 1 ] > clamp[ 1 ]';
  var dst = _.unrollMake( [ 4, 7 ] );
  var clamp = [ 3, 6 ];
  var got = _.range.clamp( dst, clamp );
  test.identical( got, _.unrollMake( [ 4, 6 ] ) );
  test.is( got === dst );

  test.case = 'dst[ 0 ] > clamp[ 1 ], dst[ 1 ] > clamp[ 1 ]';
  var dst = _.unrollMake( [ 8, 7 ] );
  var clamp = [ 3, 6 ];
  var got = _.range.clamp( dst, clamp );
  test.identical( got, _.unrollMake( [ 6, 6 ] ) );
  test.is( got === dst );

  test.case = 'dst[ 0 ] < clamp[ 0 ], dst[ 1 ] > clamp[ 1 ]';
  var dst = _.unrollMake( [ 2, 7 ] );
  var clamp = [ 3, 6 ];
  var got = _.range.clamp( dst, clamp );
  test.identical( got, _.unrollMake( [ 3, 6 ] ) );
  test.is( got === dst );

  test.close( 'unroll' );

  /* - */

  test.open( 'argumentsArray' );

  test.case = 'identical ranges';
  var dst = _.argumentsArrayMake( [ 2, 2 ] );
  var clamp = [ 2, 2 ];
  var got = _.range.clamp( dst, clamp );
  test.identical( got, _.argumentsArrayMake( [ 2, 2 ] ) );
  test.is( got === dst );

  test.case = 'dst[ 0 ] < clamp[ 0 ], dst[ 1 ] < clamp[ 0 ]';
  var dst = _.argumentsArrayMake( [ 2, 2 ] );
  var clamp = [ 3, 6 ];
  var got = _.range.clamp( dst, clamp );
  test.identical( got, _.argumentsArrayMake( [ 3, 3 ] ) );
  test.is( got === dst );

  test.case = 'dst[ 0 ] < clamp[ 0 ], clamp[ 1 ] > dst[ 1 ] > clamp[ 0 ]';
  var dst = _.argumentsArrayMake( [ 2, 4 ] );
  var clamp = [ 3, 6 ];
  var got = _.range.clamp( dst, clamp );
  test.identical( got, _.argumentsArrayMake( [ 3, 4 ] ) );
  test.is( got === dst );

  test.case = 'clamp[ 1 ] > dst[ 0 ] > clamp[ 0 ], dst[ 1 ] < clamp[ 0 ]';
  var dst = _.argumentsArrayMake( [ 4, 2 ] );
  var clamp = [ 3, 6 ];
  var got = _.range.clamp( dst, clamp );
  test.identical( got, _.argumentsArrayMake( [ 4, 3 ] ) );
  test.is( got === dst );

  test.case = 'clamp[ 1 ] > dst[ 0 ] > clamp[ 0 ], clamp[ 1 ] > dst[ 1 ] > clamp[ 0 ]';
  var dst = _.argumentsArrayMake( [ 4, 5 ] );
  var clamp = [ 3, 6 ];
  var got = _.range.clamp( dst, clamp );
  test.identical( got, _.argumentsArrayMake( [ 4, 5 ] ) );
  test.is( got === dst );

  test.case = 'dst[ 0 ] > clamp[ 1 ], clamp[ 1 ] > dst[ 1 ] > clamp[ 0 ]';
  var dst = _.argumentsArrayMake( [ 7, 5 ] );
  var clamp = [ 3, 6 ];
  var got = _.range.clamp( dst, clamp );
  test.identical( got, _.argumentsArrayMake( [ 6, 5 ] ) );
  test.is( got === dst );

  test.case = 'clamp[ 1 ] > dst[ 0 ] > clamp[ 0 ], dst[ 1 ] > clamp[ 1 ]';
  var dst = _.argumentsArrayMake( [ 4, 7 ] );
  var clamp = [ 3, 6 ];
  var got = _.range.clamp( dst, clamp );
  test.identical( got, _.argumentsArrayMake( [ 4, 6 ] ) );
  test.is( got === dst );

  test.case = 'dst[ 0 ] > clamp[ 1 ], dst[ 1 ] > clamp[ 1 ]';
  var dst = _.argumentsArrayMake( [ 8, 7 ] );
  var clamp = [ 3, 6 ];
  var got = _.range.clamp( dst, clamp );
  test.identical( got, _.argumentsArrayMake( [ 6, 6 ] ) );
  test.is( got === dst );

  test.case = 'dst[ 0 ] < clamp[ 0 ], dst[ 1 ] > clamp[ 1 ]';
  var dst = _.argumentsArrayMake( [ 2, 7 ] );
  var clamp = [ 3, 6 ];
  var got = _.range.clamp( dst, clamp );
  test.identical( got, _.argumentsArrayMake( [ 3, 6 ] ) );
  test.is( got === dst );

  test.close( 'argumentsArray' );

  /* - */

  test.open( 'bufferTyped' );

  test.case = 'identical ranges';
  var dst = new U8x( [ 2, 2 ] );
  var clamp = [ 2, 2 ];
  var got = _.range.clamp( dst, clamp );
  test.identical( got, new U8x( [ 2, 2 ] ) );
  test.is( got === dst );

  test.case = 'dst[ 0 ] < clamp[ 0 ], dst[ 1 ] < clamp[ 0 ]';
  var dst = new I8x( [ 2, 2 ] );
  var clamp = [ 3, 6 ];
  var got = _.range.clamp( dst, clamp );
  test.identical( got, new I8x( [ 3, 3 ] ) );
  test.is( got === dst );

  test.case = 'dst[ 0 ] < clamp[ 0 ], clamp[ 1 ] > dst[ 1 ] > clamp[ 0 ]';
  var dst = new U16x( [ 2, 4 ] );
  var clamp = [ 3, 6 ];
  var got = _.range.clamp( dst, clamp );
  test.identical( got, new U16x( [ 3, 4 ] ) );
  test.is( got === dst );

  test.case = 'clamp[ 1 ] > dst[ 0 ] > clamp[ 0 ], dst[ 1 ] < clamp[ 0 ]';
  var dst = new I16x( [ 4, 2 ] );
  var clamp = [ 3, 6 ];
  var got = _.range.clamp( dst, clamp );
  test.identical( got, new I16x( [ 4, 3 ] ) );
  test.is( got === dst );

  test.case = 'clamp[ 1 ] > dst[ 0 ] > clamp[ 0 ], clamp[ 1 ] > dst[ 1 ] > clamp[ 0 ]';
  var dst = new U32x( [ 4, 5 ] );
  var clamp = [ 3, 6 ];
  var got = _.range.clamp( dst, clamp );
  test.identical( got, new U32x( [ 4, 5 ] ) );
  test.is( got === dst );

  test.case = 'dst[ 0 ] > clamp[ 1 ], clamp[ 1 ] > dst[ 1 ] > clamp[ 0 ]';
  var dst = new I32x( [ 7, 5 ] );
  var clamp = [ 3, 6 ];
  var got = _.range.clamp( dst, clamp );
  test.identical( got, new I32x( [ 6, 5 ] ) );
  test.is( got === dst );

  test.case = 'clamp[ 1 ] > dst[ 0 ] > clamp[ 0 ], dst[ 1 ] > clamp[ 1 ]';
  var dst = new F32x( [ 4, 7 ] );
  var clamp = [ 3, 6 ];
  var got = _.range.clamp( dst, clamp );
  test.identical( got, new F32x( [ 4, 6 ] ) );
  test.is( got === dst );

  test.case = 'dst[ 0 ] > clamp[ 1 ], dst[ 1 ] > clamp[ 1 ]';
  var dst = new F64x( [ 8, 7 ] );
  var clamp = [ 3, 6 ];
  var got = _.range.clamp( dst, clamp );
  test.identical( got, new F64x( [ 6, 6 ] ) );
  test.is( got === dst );

  test.case = 'dst[ 0 ] < clamp[ 0 ], dst[ 1 ] > clamp[ 1 ]';
  var dst = new U8x( [ 2, 7 ] );
  var clamp = [ 3, 6 ];
  var got = _.range.clamp( dst, clamp );
  test.identical( got, new U8x( [ 3, 6 ] ) );
  test.is( got === dst );

  test.close( 'bufferTyped' );

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.range.clamp() );

  test.case = 'not enough arguments';
  test.shouldThrowErrorSync( () => _.range.clamp( [ 1, 2 ] ) );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.range.clamp( [ 1, 2 ], [ 3, 4 ], [ 5, 6 ] ) );

  test.case = 'dstRange is not a range';
  test.shouldThrowErrorSync( () => _.range.clamp( [ 1, 2, 3 ], [ 3, 4 ] ) );
  test.shouldThrowErrorSync( () => _.range.clamp( [ 1, 'wrong' ], [ 3, 4 ] ) );
  test.shouldThrowErrorSync( () => _.range.clamp( [ undefined, 1 ], [ 3, 4 ] ) );

  test.case = 'clampRange is not a range';
  test.shouldThrowErrorSync( () => _.range.clamp( [ 3, 4 ], [ 1, 2, 3 ] ) );
  test.shouldThrowErrorSync( () => _.range.clamp( [ 3, 4 ], [ 1, 'wrong' ] ) );
  test.shouldThrowErrorSync( () => _.range.clamp( [ 3, 4 ], [ undefined, 1 ] ) );
}

//

function countElements( test )
{
  test.case = 'increment - zero, positive substruction result';
  var got = _.range.countElements( [ 1, 6 ], 0 );
  test.identical( got, 0 );

  test.case = 'increment - zero, negative substruction result';
  var got = _.range.countElements( [ 6, 1 ], 0 );
  test.identical( got, 0 );

  test.case = 'increment - zero, zero substruction result';
  var got = _.range.countElements( [ 5, 5 ], 0 );
  test.identical( got, 0 );

  /* */

  test.case = 'increment - 1, positive substruction result';
  var got = _.range.countElements( [ 1, 6 ], 1 );
  test.identical( got, 5 );

  test.case = 'increment - 1, negative substruction result';
  var got = _.range.countElements( [ 6, 1 ], 1 );
  test.identical( got, -5 );

  test.case = 'increment - 1, zero substruction result';
  var got = _.range.countElements( [ 5, 5 ], 1 );
  test.identical( got, 0 );

  /* */

  test.case = 'increment - undefined, positive substruction result';
  var got = _.range.countElements( [ 1, 6 ], undefined );
  test.identical( got, 5 );

  test.case = 'increment - undefined, negative substruction result';
  var got = _.range.countElements( [ 6, 1 ], undefined );
  test.identical( got, -5 );

  test.case = 'increment - undefined, zero substruction result';
  var got = _.range.countElements( [ 5, 5 ], undefined );
  test.identical( got, 0 );

  /* */

  test.case = 'increment - not passed, positive substruction result';
  var got = _.range.countElements( [ 1, 6 ] );
  test.identical( got, 5 );

  test.case = 'increment - not passed, negative substruction result';
  var got = _.range.countElements( [ 6, 1 ] );
  test.identical( got, -5 );

  test.case = 'increment - not passed, zero substruction result';
  var got = _.range.countElements( [ 5, 5 ] );
  test.identical( got, 0 );

  /* */

  test.case = 'increment - -1, positive substruction result';
  var got = _.range.countElements( [ 1, 6 ], -1 );
  test.identical( got, -5 );

  test.case = 'increment - -1, negative substruction result';
  var got = _.range.countElements( [ 6, 1 ], -1 );
  test.identical( got, 5 );

  test.case = 'increment - -1, zero substruction result';
  var got = _.range.countElements( [ 5, 5 ], -1 );
  test.identical( got, -0 );

  /* */

  test.case = 'increment - 5, positive substruction result';
  var got = _.range.countElements( [ 1, 6 ], 5 );
  test.identical( got, 1 );

  test.case = 'increment - 5, negative substruction result';
  var got = _.range.countElements( [ 6, 1 ], 5 );
  test.identical( got, -1 );

  test.case = 'increment - 5, zero substruction result';
  var got = _.range.countElements( [ 5, 5 ], 5 );
  test.identical( got, 0 );

  /* */

  test.case = 'increment - -5, positive substruction result';
  var got = _.range.countElements( [ 1, 6 ], -5 );
  test.identical( got, -1 );

  test.case = 'increment - -5, negative substruction result';
  var got = _.range.countElements( [ 6, 1 ], -5 );
  test.identical( got, 1 );

  test.case = 'increment - 5, zero substruction result';
  var got = _.range.countElements( [ 5, 5 ], -5 );
  test.identical( got, -0 );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.range.countElements() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.range.countElements( [ 1, 2 ], 1, 'extra' ) );

  test.case = 'range is not a range';
  test.shouldThrowErrorSync( () => _.range.countElements( [ 1, 2, 3 ], [ 3, 4 ] ) );
  test.shouldThrowErrorSync( () => _.range.countElements( [ 1, 'wrong' ], [ 3, 4 ] ) );
  test.shouldThrowErrorSync( () => _.range.countElements( [ undefined, 1 ], [ 3, 4 ] ) );

  test.case = 'increment is not a number and not undefined';
  test.shouldThrowErrorSync( () => _.range.countElements( [ 1, 2 ], 'wrong' ) );
}

//

function lastGet( test )
{
  test.open( 'range - array' );

  test.case = 'without options';
  var got = _.range.lastGet( [ 1, 2 ] );
  test.identical( got, 2 );

  test.case = 'options - undefined';
  var options = undefined;
  var got = _.range.lastGet( [ 1, 2 ], options );
  test.identical( got, 2 );
  test.identical( options, undefined );

  test.case = 'options - empty map';
  var options = {};
  var got = _.range.lastGet( [ 1, 2 ], options );
  test.identical( got, 2 );
  test.identical( options, { increment : 1 } );

  test.case = 'options - map with own field increment';
  var options = { increment : 2 };
  var got = _.range.lastGet( [ 1, 2 ], options );
  test.identical( got, 2 );
  test.identical( options, { increment : 2 } );

  test.case = 'options - map with own field increment - undefined';
  var options = { increment : undefined };
  var got = _.range.lastGet( [ 1, 2 ], options );
  test.identical( got, 2 );
  test.identical( options, { increment : 1 } );

  test.close( 'range - array' );

  /* - */

  test.open( 'range - unroll' );

  test.case = 'without options';
  var got = _.range.lastGet( _.unrollMake( [ 1, 2 ] ) );
  test.identical( got, 2 );

  test.case = 'options - undefined';
  var options = undefined;
  var got = _.range.lastGet( _.unrollMake( [ 1, 2 ] ), options );
  test.identical( got, 2 );
  test.identical( options, undefined );

  test.case = 'options - empty map';
  var options = {};
  var got = _.range.lastGet( _.unrollMake( [ 1, 2 ] ), options );
  test.identical( got, 2 );
  test.identical( options, { increment : 1 } );

  test.case = 'options - map with own field increment';
  var options = { increment : 2 };
  var got = _.range.lastGet( _.unrollMake( [ 1, 2 ] ), options );
  test.identical( got, 2 );
  test.identical( options, { increment : 2 } );

  test.case = 'options - map with own field increment - undefined';
  var options = { increment : undefined };
  var got = _.range.lastGet( _.unrollMake( [ 1, 2 ] ), options );
  test.identical( got, 2 );
  test.identical( options, { increment : 1 } );

  test.close( 'range - unroll' );

  /* - */

  test.open( 'range - argumentsArray' );

  test.case = 'without options';
  var got = _.range.lastGet( _.argumentsArrayMake( [ 1, 2 ] ) );
  test.identical( got, 2 );

  test.case = 'options - undefined';
  var options = undefined;
  var got = _.range.lastGet( _.argumentsArrayMake( [ 1, 2 ] ), options );
  test.identical( got, 2 );
  test.identical( options, undefined );

  test.case = 'options - empty map';
  var options = {};
  var got = _.range.lastGet( _.argumentsArrayMake( [ 1, 2 ] ), options );
  test.identical( got, 2 );
  test.identical( options, { increment : 1 } );

  test.case = 'options - map with own field increment';
  var options = { increment : 2 };
  var got = _.range.lastGet( _.argumentsArrayMake( [ 1, 2 ] ), options );
  test.identical( got, 2 );
  test.identical( options, { increment : 2 } );

  test.case = 'options - map with own field increment - undefined';
  var options = { increment : undefined };
  var got = _.range.lastGet( _.argumentsArrayMake( [ 1, 2 ] ), options );
  test.identical( got, 2 );
  test.identical( options, { increment : 1 } );

  test.close( 'range - argumentsArray' );

  /* - */

  test.open( 'range - BufferTyped' );

  test.case = 'without options';
  var got = _.range.lastGet( new U8x( [ 1, 2 ] ) );
  test.identical( got, 2 );

  test.case = 'options - undefined';
  var options = undefined;
  var got = _.range.lastGet( new I16x( [ 1, 2 ] ), options );
  test.identical( got, 2 );
  test.identical( options, undefined );

  test.case = 'options - empty map';
  var options = {};
  var got = _.range.lastGet( new F32x( [ 1, 2 ] ), options );
  test.identical( got, 2 );
  test.identical( options, { increment : 1 } );

  test.case = 'options - map with own field increment';
  var options = { increment : 2 };
  var got = _.range.lastGet( new F64x( [ 1, 2 ] ), options );
  test.identical( got, 2 );
  test.identical( options, { increment : 2 } );

  test.case = 'options - map with own field increment - undefined';
  var options = { increment : undefined };
  var got = _.range.lastGet( new I8x( [ 1, 2 ] ), options );
  test.identical( got, 2 );
  test.identical( options, { increment : 1 } );

  test.close( 'range - BufferTyped' );

  /* - */

  test.open( 'range - map' );

  test.case = 'without options, last - undefined';
  var got = _.range.lastGet( { first : undefined, last : undefined } );
  test.identical( got, undefined );

  test.case = 'without options, last - not exists';
  var got = _.range.lastGet( { first : undefined } );
  test.identical( got, undefined );

  test.case = 'without options, last - number';
  var got = _.range.lastGet( { first : 1, last : 2 } );
  test.identical( got, 2 );

  /* */

  test.case = 'options - undefined, last - undefined';
  var options = undefined;
  var got = _.range.lastGet( { first : undefined, last : undefined }, options );
  test.identical( got, undefined );
  test.identical( options, undefined );

  test.case = 'options - undefined, last - not exists';
  var options = undefined;
  var got = _.range.lastGet( { first : undefined }, options );
  test.identical( got, undefined );
  test.identical( options, undefined );

  test.case = 'options - undefined, last - number';
  var options = undefined;
  var got = _.range.lastGet( { first : 1, last : 2 }, options );
  test.identical( got, 2 );
  test.identical( options, undefined );

  /* */

  test.case = 'options - empty map, last - undefined';
  var options = {};
  var got = _.range.lastGet( { first : undefined, last : undefined }, options );
  test.identical( got, undefined );
  test.identical( options, { increment : 1 } );

  test.case = 'options - empty map, last - not exists';
  var options = {};
  var got = _.range.lastGet( { first : undefined }, options );
  test.identical( got, undefined );
  test.identical( options, { increment : 1 } );

  test.case = 'options - empty map, last - number';
  var options = {};
  var got = _.range.lastGet( { first : 1, last : 2 }, options );
  test.identical( got, 2 );
  test.identical( options, { increment : 1 } );

  /* */

  test.case = 'options - map with own field increment, last - undefined';
  var options = { increment : 2 };
  var got = _.range.lastGet( { first : undefined, last : undefined }, options );
  test.identical( got, undefined );
  test.identical( options, { increment : 2 } );

  test.case = 'options - map with own field increment, last - not exists';
  var options = { increment : 2 };
  var got = _.range.lastGet( { first : undefined }, options );
  test.identical( got, undefined );
  test.identical( options, { increment : 2 } );

  test.case = 'options - map with own field increment, last - number';
  var options = { increment : 2 };
  var got = _.range.lastGet( { first : 1, last : 2 }, options );
  test.identical( got, 2 );
  test.identical( options, { increment : 2 } );

  /* */

  test.case = 'options - map with own field increment - undefined, last - undefined';
  var options = { increment : undefined };
  var got = _.range.lastGet( { first : undefined, last : undefined }, options );
  test.identical( got, undefined );
  test.identical( options, { increment : 1 } );

  test.case = 'options - map with own field increment - undefined, last - not exists';
  var options = { increment : undefined };
  var got = _.range.lastGet( { first : undefined }, options );
  test.identical( got, undefined );
  test.identical( options, { increment : 1 } );

  test.case = 'options - map with own field increment - undefined, last - number';
  var options = { increment : undefined };
  var got = _.range.lastGet( { first : 1, last : 2 }, options );
  test.identical( got, 2 );
  test.identical( options, { increment : 1 } );

  test.close( 'range - map' );

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.range.lastGet() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.range.lastGet( [ 1, 2 ], {}, 'extra' ) );

  test.case = 'range is a long, but is not a range';
  test.shouldThrowErrorSync( () => _.range.lastGet( [ 1, 2, 3 ] ) );
  test.shouldThrowErrorSync( () => _.range.lastGet( [ 1, 'wrong' ] ) );
  test.shouldThrowErrorSync( () => _.range.lastGet( [ undefined, 1 ] ) );

  test.case = 'wrong type of range';
  test.shouldThrowErrorSync( () => _.range.lastGet( new Set( [ 1, 2 ] ) ) );
  test.shouldThrowErrorSync( () => _.range.lastGet( new Map( [ [ 1, 2 ] ] ) ) );
}

// --
// declaration
// --

let Self =
{

  name : 'Tools.Range',
  silencing : 1,
  enabled : 1,

  tests :
  {

    // common

    is,
    isValid,

    fromLeft,
    fromRight, /* aaa : fix */ /* Dmytro : fixed */

    firstGet,
    toStr,

    // crange

    crangeIsEmpty,
    crangeIsPopulated,
    crangeInInclusive,
    crangeInExclusive,
    crangeInInclusiveLeft,
    crangeInInclusiveRight,

    // lrange

    lrangeIsEmpty,
    lrangeIsPopulated,
    lrangeInInclusive,
    lrangeInExclusive,
    lrangeInInclusiveLeft,
    lrangeInInclusiveRight,

    // orange

    orangeIsEmpty,
    orangeIsPopulated,
    orangeInInclusive,
    orangeInExclusive,
    orangeInInclusiveLeft,
    orangeInInclusiveRight,
    sureInRange,
    assertInRange,

    fromSingle,
    clamp,
    countElements,
    lastGet,

  }

}

Self = wTestSuite( Self );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

})();
