( function _Buffer_test_s_( ) {

'use strict';

if( typeof module !== 'undefined' )
{
  let _ = require( '../Layer2.s' );
  _.include( 'wTesting' );
}

var _ = wTools;

// --
// buffer
// --

function bufferRawIs( test )
{
  test.case = 'array buffer';
  var src = new BufferRaw( [ 1, 2 ] );
  var got = _.bufferRawIs( src );
  test.identical( got, true );
  test.isNot( _.bufferTypedIs( src ) );
  test.isNot( _.bufferNodeIs( src ) );
  test.isNot( _.bufferViewIs( src ) );

  test.case = 'shared array buffer';
  var src = new SharedArrayBuffer( [ 1, 2 ] );
  var got = _.bufferRawIs( src );
  test.identical( got, true );
  test.isNot( _.bufferTypedIs( src ) );
  test.isNot( _.bufferNodeIs( src ) );
  test.isNot( _.bufferViewIs( src ) );

  test.case = 'typed array';
  var src = new F32x( [ 1, 2 ] );
  var got = _.bufferRawIs( src );
  test.identical( got, false );

  var src = new U8ClampedX( 10*10*4 );
  var got = _.bufferRawIs( src );
  test.identical( got, false );

  if( Config.interpreter === 'njs' )
  {
  test.case = 'node buffer';
  var src = BufferNode.alloc( 10 );
  var got = _.bufferRawIs( src );
  test.identical( got, false );

  var src = BufferNode.from( [ 2, 4 ] );
  var got = _.bufferRawIs( src );
  test.identical( got, false );
  }

  test.case = 'view buffer, BufferRaw';
  var src = new BufferView( new BufferRaw( [ 10 ] ) );
  var got = _.bufferRawIs( src );
  test.identical( got, false );

  test.case = 'view buffer, SharedArrayBuffer';
  var src = new BufferView( new SharedArrayBuffer( [ 10 ] ) );
  var got = _.bufferRawIs( src );
  test.identical( got, false );

  if( !Config.debug )
  return;

  test.case = 'no arguments';
  var got = _.bufferRawIs();
  test.identical( got, false );

  test.case = 'extra arguments';
  var src = new BufferRaw( [ 1, 2 ] );
  var got = _.bufferRawIs( src, new U8x( 1 ) );
  test.identical( got, true );
}

//

function bufferTypedIs( test )
{
  test.case = 'typed array';
  var src = new F32x( [ 1, 2 ] );
  var got = _.bufferTypedIs( src );
  test.identical( got, true );
  test.isNot( _.bufferRawIs( src ) );
  test.isNot( _.bufferNodeIs( src ) );
  test.isNot( _.bufferViewIs( src ) );

  var src = new U8ClampedX( 10*10*4 );
  var got = _.bufferTypedIs( src );
  test.identical( got, true );
  test.isNot( _.bufferRawIs( src ) );
  test.isNot( _.bufferNodeIs( src ) );
  test.isNot( _.bufferViewIs( src ) );

  test.case = 'array buffer';
  var src = new BufferRaw( [ 1, 2 ] );
  var got = _.bufferTypedIs( src );
  test.identical( got, false );

  test.case = 'shared array buffer';
  var src = new SharedArrayBuffer( [ 1, 2 ] );
  var got = _.bufferTypedIs( src );
  test.identical( got, false );

  if( Config.interpreter === 'njs' )
  {
  test.case = 'node buffer';
  var src = BufferNode.alloc( 10 );
  var got = _.bufferTypedIs( src );
  test.identical( got, false );

  var src = BufferNode.from( [ 2, 4 ] );
  var got = _.bufferTypedIs( src );
  test.identical( got, false );
  }

  test.case = 'view buffer, BufferRaw';
  var src = new BufferView( new BufferRaw( [ 10 ] ) );
  var got = _.bufferTypedIs( src );
  test.identical( got, false );

  test.case = 'view buffer, SharedArrayBuffer';
  var src = new BufferView( new SharedArrayBuffer( [ 10 ] ) );
  var got = _.bufferTypedIs( src );
  test.identical( got, false );

  if( !Config.debug )
  return;

  test.case = 'no arguments';
  var got = _.bufferTypedIs();
  test.identical( got, false );

  test.case = 'extra arguments';
  var src = new I16x( [ 1, 2 ] );
  var got = _.bufferTypedIs( src, new SharedArrayBuffer( 1 ) );
  test.identical( got, true );
}

//

function bufferNodeIs( test )
{
  if( !Config.interpreter === 'njs' )
  return;

  test.case = 'node buffer';
  var src = BufferNode.alloc( 10 );
  var got = _.bufferNodeIs( src );
  test.identical( got, true );
  test.isNot( _.bufferRawIs( src ) );
  test.isNot( _.bufferTypedIs( src ) );
  test.isNot( _.bufferViewIs( src ) );

  var src = BufferNode.from( [ 2, 4 ] );
  var got = _.bufferNodeIs( src );
  test.identical( got, true );
  test.isNot( _.bufferRawIs( src ) );
  test.isNot( _.bufferTypedIs( src ) );
  test.isNot( _.bufferViewIs( src ) );

  test.case = 'typed array';
  var src = new F32x( [ 1, 2 ] );
  var got = _.bufferNodeIs( src );
  test.identical( got, false );

  var src = new U8ClampedX( 10*10*4 );
  var got = _.bufferNodeIs( src );
  test.identical( got, false );

  test.case = 'array buffer';
  var src = new BufferRaw( [ 1, 2 ] );
  var got = _.bufferNodeIs( src );
  test.identical( got, false );

  test.case = 'shared array buffer';
  var src = new SharedArrayBuffer( [ 1, 2 ] );
  var got = _.bufferNodeIs( src );
  test.identical( got, false );

  test.case = 'view buffer, BufferRaw';
  var src = new BufferView( new BufferRaw( [ 10 ] ) );
  var got = _.bufferNodeIs( src );
  test.identical( got, false );

  test.case = 'view buffer, SharedArrayBuffer';
  var src = new BufferView( new SharedArrayBuffer( [ 10 ] ) );
  var got = _.bufferNodeIs( src );
  test.identical( got, false );

  if( !Config.debug )
  return;

  test.case = 'no arguments';
  var got = _.bufferNodeIs();
  test.identical( got, false );

  test.case = 'extra arguments';
  var src = BufferNode.from( [ 1, 2 ] );
  var got = _.bufferNodeIs( src, new SharedArrayBuffer( 1 ) );
  test.identical( got, true );
}

//

function bufferViewIs( test )
{
  test.case = 'view buffer, BufferRaw';
  var src = new BufferView( new BufferRaw( [ 10 ] ) );
  var got = _.bufferViewIs( src );
  test.identical( got, true );
  test.isNot( _.bufferRawIs( src ) );
  test.isNot( _.bufferNodeIs( src ) );
  test.isNot( _.bufferTypedIs( src ) );

  test.case = 'view buffer, SharedArrayBuffer';
  var src = new BufferView( new SharedArrayBuffer( [ 10 ] ) );
  var got = _.bufferViewIs( src );
  test.identical( got, true );
  test.isNot( _.bufferRawIs( src ) );
  test.isNot( _.bufferNodeIs( src ) );
  test.isNot( _.bufferTypedIs( src ) );

  test.case = 'typed array';
  var src = new F32x( [ 1, 2 ] );
  var got = _.bufferViewIs( src );
  test.identical( got, false );

  var src = new U8ClampedX( 10*10*4 );
  var got = _.bufferViewIs( src );
  test.identical( got, false );

  test.case = 'array buffer';
  var src = new BufferRaw( [ 1, 2 ] );
  var got = _.bufferViewIs( src );
  test.identical( got, false );

  test.case = 'shared array buffer';
  var src = new SharedArrayBuffer( [ 1, 2 ] );
  var got = _.bufferViewIs( src );
  test.identical( got, false );

  if( Config.interpreter === 'njs' )
  {
  test.case = 'node buffer';
  var src = BufferNode.alloc( 10 );
  var got = _.bufferViewIs( src );
  test.identical( got, false );

  var src = BufferNode.from( [ 2, 4 ] );
  var got = _.bufferViewIs( src );
  test.identical( got, false );
  }

  if( !Config.debug )
  return;

  test.case = 'no arguments';
  var got = _.bufferViewIs();
  test.identical( got, false );

  test.case = 'extra arguments';
  var src = new BufferView( new BufferRaw( [ 1, 2 ] ) );
  var got = _.bufferViewIs( src, new U8x( 1 ) );
  test.identical( got, true );
}

//

function bufferMake( test )
{
  /* constructors */

  var array = ( src ) => _.arrayMake( src );
  var unroll = ( src ) => _.unrollMake( src );
  var argumentsArray = ( src ) => _.argumentsArrayMake( src );
  var bufferTyped = function( buf )
  {
    let name = buf.name;
    return { [ name ] : function( src ){ return new buf( src ) } } [ name ];
  };
  var bufferRaw = ( src ) => new U8x( src ).buffer;
  var bufferNode = ( src ) => _.numberIs( src ) ? BufferNode.alloc( src ) : BufferNode.from( src );
  var bufferView = ( src ) => new BufferView( bufferRaw( src ) );

  /* lists */

  var typedList =
  [
    I8x,
    // U8x,
    // U8ClampedX,
    // I16x,
    U16x,
    // I32x,
    // U32x,
    F32x,
    F64x,
  ];
  var list =
  [
    array,
    // unroll,
    // argumentsArray,
    bufferRaw,
    bufferView,
  ];
  for( let i = 0; i < typedList.length; i++ )
  list.push( bufferTyped( typedList[ i ] ) );
  if( Config.interpreter === 'njs' )
  list.push( bufferNode );

  /* tests */

  for( let i = 0; i < list.length; i++ )
  {
    test.open( list[ i ].name );
    run( list[ i ] );
    test.close( list[ i ].name );
  }

  /* test subroutine */

  function run( long )
  {
    var type = ( dst, got ) => _.argumentsArrayIs( dst ) ?
    got.constructor.name === 'Array' : dst.constructor.name === got.constructor.name;
    var result = ( dst, src ) => _.argumentsArrayIs( dst ) ?
    array( src ) : long( src );

    test.case = 'dst = empty, not src';
    var dst = long( [] );
    var got = _.bufferMake( dst );
    var expected = result( dst, [] );
    test.identical( got, expected );
    test.is( got !== dst );
    test.is( type( dst, got ) );

    test.case = 'dst = empty, src = number';
    var dst = long( [] );
    var got = _.bufferMake( dst, 2 );
    var expected = result( dst, 2 );
    test.identical( got, expected );
    test.is( got !== dst );
    test.is( type( dst, got ) );

    test.case = 'src = number, src < dst.length';
    var dst = long( [ 1, 2, 3 ] );
    var got = _.bufferMake( dst, 2 );
    var expected = result( dst, [ 1, 2 ] );
    test.identical( got, expected );
    test.is( got !== dst );
    test.is( type( dst, got ) );

    test.case = 'src = number, src > dst.length';
    var dst = long( [ 1, 2, 3 ] );
    var got = _.bufferMake( dst, 4 );
    var expected = _.bufferTypedIs( dst ) ? result( dst, [ 1, 2, 3, 0 ] ) : result( dst, [ 1, 2, 3, undefined ] );
    test.identical( got, expected );
    test.is( got !== dst );
    test.is( type( dst, got ) );

    test.case = 'src = long, src.length > dst.length';
    var dst = long( [ 0, 1 ] );
    var src = [ 1, 2, 3 ];
    var got = _.bufferMake( dst, src );
    var expected = result( dst, [ 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got !== src );
    test.is( got !== dst );
    test.is( type( dst, got ) );

    test.case = 'dst = long, not src';
    var dst = long( [ 1, 2, 3 ] );
    var got = _.bufferMake( dst );
    var expected = result( dst, [ 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got !== dst );
    test.is( type( dst, got ) );

    test.case = 'dst = new long, src = array'
    var dst = long( 2 );
    var src = [ 1, 2, 3, 4, 5 ];
    var got = _.bufferMake( dst, src );
    var expected = result( dst, [ 1, 2, 3, 4, 5 ] );
    test.identical( got, expected );
    test.is( got !== dst );
    test.is( type( dst, got ) );

    test.case = 'dst = Array constructor, src = long';
    var src = long( [ 1, 2, 3 ] );
    var got = _.bufferMake( Array, src );
    var expected = [ 1, 2, 3 ];
    test.identical( got, expected );
    test.is( _.arrayIs( got ) );
    test.is( got !== src );

    test.case = 'dst = BufferTyped constructor, src = long';
    var src = long( [ 1, 1, 1, 1, 1 ] );
    var got = _.bufferMake( U32x, src );
    var expected = new U32x( [ 1, 1, 1, 1, 1 ] );
    test.identical( got, expected );
    test.is( _.bufferTypedIs(  got ) );
    test.is( got !== src );
  }

  test.case = 'dst = BufferTyped constructor, src = number';
  var got = _.bufferMake( U32x, 2 );
  var expected = new U32x( [ 0, 0 ] );
  test.identical( got, expected );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.bufferMake() );

  test.case = 'extra argument';
  test.shouldThrowErrorSync( () => _.bufferMake( [ 1, 2, 3 ], 4, 'extra argument' ) );

  test.case = 'wrong type of src';
  test.shouldThrowErrorSync( () => _.bufferMake( 'wrong argument', 1 ) );
  test.shouldThrowErrorSync( () => _.bufferMake( 1, 1 ) );

  test.case = 'wrong type of ins';
  test.shouldThrowErrorSync( () => _.bufferMake( [ 1, 2, 3 ], 'wrong type of argument' ) );
  test.shouldThrowErrorSync( () => _.bufferMake( [ 1, 2, 3 ], Infinity  ) );

}

//

function bufferMakeUndefined( test )
{
  /* constructors */

  var array = ( src ) => _.arrayMake( src );
  var unroll = ( src ) => _.unrollMake( src );
  var argumentsArray = ( src ) => _.argumentsArrayMake( src );
  var bufferTyped = function( buf )
  {
    let name = buf.name;
    return { [ name ] : function( src ){ return new buf( src ) } } [ name ];
  };
  var bufferRaw = ( src ) => new U8x( src ).buffer;
  var bufferNode = ( src ) => _.numberIs( src ) ? BufferNode.alloc( src ) : BufferNode.from( src );
  var bufferView = ( src ) => new BufferView( bufferRaw( src ) );

  /* lists */

  var typedList =
  [
    I8x,
    // U8x,
    // U8ClampedX,
    // I16x,
    U16x,
    // I32x,
    // U32x,
    F32x,
    F64x,
  ];
  var list =
  [
    array,
    // unroll,
    // argumentsArray,
    bufferRaw,
    bufferView,
  ];
  for( let i = 0; i < typedList.length; i++ )
  list.push( bufferTyped( typedList[ i ] ) );
  if( Config.interpreter === 'njs' )
  list.push( bufferNode );

  /* tests */

  for( let i = 0; i < list.length; i++ )
  {
    test.open( list[ i ].name );
    run( list[ i ] );
    test.close( list[ i ].name );
  }

  /* test subroutine */

  function run( buffer )
  {
    var type = ( dst, got ) => _.argumentsArrayIs( dst ) ?
    got.constructor.name === 'Array' : dst.constructor.name === got.constructor.name;
    var result = ( dst, length ) => _.argumentsArrayIs( dst ) ?
    array( length ) : buffer( length );

    test.case = 'dst = empty, not src';
    var dst = buffer( [] );
    var got = _.bufferMakeUndefined( dst );
    var expected = result( dst, 0 ) ;
    test.identical( got, expected );
    test.is( got !== dst );
    test.is( type( dst, got ) );

    test.case = 'dst = empty, src = number';
    var dst = buffer( [] );
    var got = _.bufferMakeUndefined( dst, 2 );
    var expected = result( dst, 2 );
    test.identical( got, expected );
    test.is( got !== dst );
    test.is( type( dst, got ) );

    test.case = 'src = number, src < dst.length';
    var dst = buffer( [ 1, 2, 3 ] );
    var got = _.bufferMakeUndefined( dst, 2 );
    var expected = result( dst, 2 );
    test.identical( got, expected );
    test.is( got !== dst );
    test.is( type( dst, got ) );

    test.case = 'src = number, src > dst.length';
    var dst = buffer( [ 1, 2, 3 ] );
    var got = _.bufferMakeUndefined( dst, 4 );
    var expected = result( dst, 4 );
    test.identical( got, expected );
    test.is( got !== dst );
    test.is( type( dst, got ) );

    test.case = 'src = buffer, src.length > dst.length';
    var dst = buffer( [ 0, 1 ] );
    var src = [ 1, 2, 3 ];
    var got = _.bufferMakeUndefined( dst, src );
    var expected = result( dst, 3 );
    test.identical( got, expected );
    test.is( got !== src );
    test.is( got !== dst );
    test.is( type( dst, got ) );

    test.case = 'dst = buffer, not src';
    var dst = buffer( [ 1, 2, 3 ] );
    var got = _.bufferMakeUndefined( dst );
    var expected = result( dst, 3 );
    test.identical( got, expected );
    test.is( got !== dst );
    test.is( type( dst, got ) );

    test.case = 'dst = new buffer, src = array'
    var dst = buffer( 4 );
    var src = [ 1, 2, 3, 4, 5 ];
    var got = _.bufferMakeUndefined( dst, src );
    var expected = result( dst, 5 );
    test.identical( got, expected );
    test.is( got !== dst );
    test.is( type( dst, got ) );

    test.case = 'dst = array, src = buffer';
    var src = buffer( [ 1, 2, 3 ] );
    var got = _.bufferMakeUndefined( [ 1, 2, 3, 5 ], src );
    var expected = [ undefined, undefined, undefined ];
    test.identical( got, expected );
    test.is( _.arrayIs( got ) );
    test.is( got !== src );

    test.case = 'dst = Array constructor, src = buffer';
    var src = buffer( [ 1, 2, 3 ] );
    var got = _.bufferMakeUndefined( Array, src );
    var expected = [ undefined, undefined, undefined ];
    test.identical( got, expected );
    test.is( _.arrayIs( got ) );
    test.is( got !== src );

    test.case = 'dst = BufferTyped constructor, src = buffer';
    var src = buffer( [ 1, 1, 1, 1, 1 ] );
    var got = _.bufferMakeUndefined( U32x, src );
    var expected = new U32x( 5 );
    test.identical( got, expected );
    test.is( _.bufferTypedIs(  got ) );
    test.is( got !== src );
  }

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.bufferMakeUndefined() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.bufferMakeUndefined( [ 1, 2, 3 ], 4, 'extra argument' ) );

  test.case = 'wrong length when ins is routine';
  test.shouldThrowErrorSync( () => _.bufferMakeUndefined( Array ) );
  test.shouldThrowErrorSync( () => _.bufferMakeUndefined( Array, 1, 2 ) );

  test.case = 'wrong type of ins';
  test.shouldThrowErrorSync( () => _.bufferMakeUndefined( 'wrong argument', 1 ) );
  test.shouldThrowErrorSync( () => _.bufferMakeUndefined( 1, 1 ) );

  test.case = 'wrong type of src';
  test.shouldThrowErrorSync( () => _.bufferMakeUndefined( [ 1, 2, 3 ], 'wrong type of argument' ) );
  test.shouldThrowErrorSync( () => _.bufferMakeUndefined( [ 1, 2, 3 ], Infinity ) );
}

//

function bufferBut( test )
{
  /* not a buffer, trivial */

  test.case = 'dst = array, src = array, range = negative number';
  var dst = [ 1, 2, 3, 4 ];
  var got = _.bufferBut( dst, -5, [ 0 ] );
  test.identical( got, [ 0, 1, 2, 3, 4 ] );
  test.is( got !== dst );

  test.case = 'dst = empty array, src = array, range[ 0 ] === range[ 1 ]';
  var dst = [];
  var got = _.bufferBut( dst, [ 0, 0 ], [ 2 ] );
  test.identical( got, [ 2 ] );
  test.is( got !== dst );

  test.case = 'dst = array, src = array';
  var dst = [ 1, 2, 3, 4 ];
  var got = _.bufferBut( dst, [ 1, 3 ], [ 2 ] );
  test.identical( got, [ 1, 2, 4 ] );
  test.is( got !== dst );

  /* */

  test.case = 'dst = unroll, src = array, range = negative number';
  var dst = _.unrollFrom( [ 1, 2, 3, 4 ] );
  var got = _.bufferBut( dst, -5, [ 2 ] );
  test.identical( got, [ 2, 1, 2, 3, 4 ] );
  test.is( got !== dst );

  test.case = 'dst = empty unroll, src = array, range[ 0 ] === range[ 1 ]';
  var dst = _.unrollFrom( [] );
  var got = _.bufferBut( dst, [ 0, 0 ], [ 2 ] );
  test.identical( got, [ 2 ] );
  test.is( got !== dst );

  test.case = 'dst = unroll, src = array';
  var dst = _.unrollFrom( [ 1, 2, 3, 4 ] );
  var got = _.bufferBut( dst, [ 1, 3 ], [ 2 ] );
  test.identical( got, [ 1, 2, 4 ] );
  test.is( got !== dst );

  /* */

  test.case = 'dst = argumentsArray, src = array, range = negative number';
  var dst = _.argumentsArrayFrom( [ 1, 2, 3, 4 ] );
  var got = _.bufferBut( dst, -5, [ 2 ] );
  test.identical( got, [ 2, 1, 2, 3, 4 ] );
  test.is( got !== dst );

  test.case = 'dst = empty argumentsArray, src = array, range[ 0 ] === range[ 1 ]';
  var dst = _.argumentsArrayFrom( [] );
  var got = _.bufferBut( dst, [ 0, 0 ], [ 2 ] );
  test.identical( got, [ 2 ] );
  test.is( got !== dst );

  test.case = 'dst = argumentsArray, src = array';
  var dst = _.argumentsArrayFrom( [ 1, 2, 3, 4 ] );
  var got = _.bufferBut( dst, [ 1, 3 ], [ 2 ] );
  test.identical( got, [ 1, 2, 4 ] );
  test.is( got !== dst );

  /* BufferTyped and BufferNode */

  var bufferTyped = function( buf )
  {
    let name = buf.name;
    return { [ name ] : function( src ){ return new buf( src ) } } [ name ];
  };

  var bufferNode = function( src )
  {
    if( _.numberIs( src ) )
    return BufferNode.alloc( src );
    else
    return BufferNode.from( src );
  };

  /* - */

  var list =
  [
    I8x,
    U16x,
    F32x,
    F64x,

    // I8x,
    // U8x,
    // U8ClampedX,
    // I16x,
    // U16x,
    // I32x,
    // U32x,
    // F32x,
    // F64x,
  ];

  for( let i = 0; i < list.length; i++ )
  {
    test.open( list[ i ].name );
    run( bufferTyped( list[ i ] ) );
    test.close( list[ i ].name );
  }

  /* - */

  if( Config.interpreter === 'njs' )
  {
    /* qqq : should work */
    /* Dmytro : works. Previus 'qqq' implemented */

    test.open( 'bufferNode' );
    run( bufferNode );
    test.close( 'bufferNode' );
  }

  /* - */

  function run( buf )
  {
    test.case = 'src = undefined';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferBut( dst, [ 1, 2 ] );
    var expected = buf( [ 0, 2, 3 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'src = undefined, range = undefined';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferBut( dst );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'src = undefined, range[ 0 ] === range[ 1 ]';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferBut( dst, [ 1, 1 ] );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'src = undefined, range[ 0 ] < 0, range[ 1 ] < 0';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferBut( dst, [ -1, -5 ] );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'src = array';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var src = new Array( 1, 2, 3 );
    var got = _.bufferBut( dst, [ 1, 2 ], src );
    var expected = buf( [ 0, 1, 2, 3, 2, 3 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'src = unroll';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var src = _.unrollMake( [ 1, 2, 3 ] );
    var got = _.bufferBut( dst, [ 1, 2 ], src );
    var expected = buf( [ 0, 1, 2, 3, 2, 3 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'src = argumentsArray';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var src = _.argumentsArrayMake( [ 1, 2, 3 ] );
    var got = _.bufferBut( dst, [ 1, 2 ], src );
    var expected = buf( [ 0, 1, 2, 3, 2, 3 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    if( Config.interpreter === 'njs' )
    {
      test.case = 'src = bufferNode';
      var dst = buf( [ 0, 1, 2, 3 ] );
      var src = BufferNode.from( [ 1, 2, 3 ] );
      var got = _.bufferBut( dst, [ 1, 2 ], src );
      var expected = buf( [ 0, 1, 2, 3, 2, 3 ] );
      test.identical( got, expected );
      test.is( got !== dst );
    }

    test.case = 'src = bufferTyped';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var src = new I32x( 2 );
    var got = _.bufferBut( dst, [ 1, 2 ], src );
    var expected = buf( [ 0, 0, 0, 2, 3 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range = number';
    var dst = buf( [ 0, 1, 2, 3 ] ); /* xxx qqq : replace name */
    var got = _.bufferBut( dst, 2, [ 5 ] );
    var expected = buf( [ 0, 1, 5, 3 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range = negative number';
    var dst = buf( [ 0, 1, 2, 3 ] ); /* xxx qqq : replace name */
    var got = _.bufferBut( dst, -2, [ 5 ] );
    var expected = buf( [ 5, 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range[ 0 ] === range[ 1 ], src = array'; /* qqq : poor descriptions of cases | Dmytro : corrected */
    var dst = buf( [ 0, 1, 2, 3 ] ); /* xxx qqq : replace name */
    var got = _.bufferBut( dst, [ 2, 2 ], [ 5 ] );
    var expected = buf( [ 0, 1, 5, 2, 3 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range[ 0 ] = 0, range[ 1 ] = dst.length, src';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferBut( dst, [ 0, dst.length ], [ 1 ] );
    var expected = buf( [ 1 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range[ 0 ] < 0, range[ 1 ] < 0, src';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferBut( dst, [ -5, -2 ], [ 1 ] );
    var expected = buf( [ 1, 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range[ 0 ] > range[ 1 ], src';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferBut( dst, [ 4, 1 ], [ 1 ] );
    var expected = buf( [ 0, 1, 2, 3, 1 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range[ 0 ] > 0, range[ 1 ] > dst.length, src';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferBut( dst, [ 1, 8 ], [ 1 ] );
    var expected = buf( [ 0, 1 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'dst = empty BufferTyped, src';
    var dst = buf( [] );
    var got = _.bufferBut( dst, [ 0, 0 ], [ 2 ] );
    var expected = buf( [ 2 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    var dst = buf( [] );
    var got = _.bufferBut( dst, [ 0, 0 ], [ 2 ] );
    var expected = buf( [ 2 ] );
    test.identical( got, expected );
    test.is( got !== dst );
  }

  /* BufferRaw and BufferView */

  /* qqq : should work */
  /* Dmytro : works. Previus 'qqq' implemented */

  var bufferRaw = ( src ) => new BufferRaw( src );
  var bufferView = ( src ) => new BufferView( new BufferRaw( src ) );

  var bufferExpected = function( dst, src )
  {
    if( _.bufferRawIs( dst ) )
    return new U8x( src ).buffer;
    else if( _.bufferViewIs( dst ) )
    return new BufferView( new U8x( src ).buffer );
  };

  /* - */

  test.open( 'bufferRaw' );
  run2( bufferRaw );
  test.close( 'bufferRaw' );

  /* - */

  test.open( 'bufferView' );
  run2( bufferView );
  test.close( 'bufferView' );

  /* - */

  function run2( buf )
  {
    test.case = 'src = undefined';
    var dst = buf( 4 );
    var got = _.bufferBut( dst, [ 1, 2 ] );
    var expected = bufferExpected( dst, [ 0, 0, 0 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'src = undefined, range = undefined';
    var dst = buf( 4 );
    var got = _.bufferBut( dst );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'src = undefined, range[ 0 ] === range[ 1 ]';
    var dst = buf( 4 );
    var got = _.bufferBut( dst, [ 1, 1 ] );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'src = undefined, range[ 0 ] < 0, range[ 1 ] < 0';
    var dst = buf( 4 );
    var got = _.bufferBut( dst, [ -1, -5 ] );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'src = array';
    var dst = buf( 4 );
    var src = new Array( 1, 2, 3 );
    var got = _.bufferBut( dst, [ 1, 2 ], src );
    var expected = bufferExpected( dst, [ 0, 1, 2, 3, 0, 0 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'src = unroll';
    var dst = buf( 4 );
    var src = _.unrollMake( [ 1, 2, 3 ] );
    var got = _.bufferBut( dst, [ 1, 2 ], src );
    var expected = bufferExpected( dst, [ 0, 1, 2, 3, 0, 0 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'src = argumentsArray';
    var dst = buf( 4 );
    var src = _.argumentsArrayMake( [ 1, 2, 3 ] );
    var got = _.bufferBut( dst, [ 1, 2 ], src );
    var expected = bufferExpected( dst, [ 0, 1, 2, 3, 0, 0 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    if( Config.interpreter === 'njs' )
    {
      test.case = 'src = bufferNode';
      var dst = buf( 4 );
      var src = BufferNode.from( [ 1, 2, 3 ] );
      var got = _.bufferBut( dst, [ 1, 2 ], src );
      var expected = bufferExpected( dst, [ 0, 1, 2, 3, 0, 0 ] );
      test.identical( got, expected );
      test.is( got !== dst );
    }

    test.case = 'src = bufferTyped';
    var dst = buf( 4 );
    var src = new I32x( 2 );
    var got = _.bufferBut( dst, [ 1, 2 ], src );
    var expected = bufferExpected( dst, [ 0, 0, 0, 0, 0 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range = number';
    var dst = buf( 4 );
    var got = _.bufferBut( dst, 2, [ 5 ] );
    var expected = bufferExpected( dst, [ 0, 0, 5, 0 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range = negative number';
    var dst = buf( 4 );
    var got = _.bufferBut( dst, -2, [ 5 ] );
    var expected = bufferExpected( dst, [ 5, 0, 0, 0, 0 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range[ 0 ] === range[ 1 ], src = array';
    var dst = buf( 4 );
    var got = _.bufferBut( dst, [ 2, 2 ], [ 5 ] );
    var expected = bufferExpected( dst, [ 0, 0, 5, 0, 0 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range[ 0 ] = 0, range[ 1 ] = dst.length, src';
    var dst = buf( 4 );
    var got = _.bufferBut( dst, [ 0, 4 ], [ 1 ] );
    var expected = bufferExpected( dst, [ 1 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range[ 0 ] < 0, range[ 1 ] < 0, src';
    var dst = buf( 4 );
    var got = _.bufferBut( dst, [ -5, -2 ], [ 1 ] );
    var expected = bufferExpected( dst, [ 1, 0, 0, 0, 0 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range[ 0 ] > range[ 1 ], src';
    var dst = buf( 4 );
    var got = _.bufferBut( dst, [ 4, 1 ], [ 1 ] );
    var expected = bufferExpected( dst, [ 0, 0, 0, 0, 1 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range[ 0 ] > 0, range[ 1 ] > dst.length, src';
    var dst = buf( 4 );
    var got = _.bufferBut( dst, [ 1, 8 ], [ 1 ] );
    var expected = bufferExpected( dst, [ 0, 1 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'dst = empty BufferTyped, src';
    var dst = buf( [] );
    var got = _.bufferBut( dst, [ 0, 0 ], [ 2 ] );
    var expected = bufferExpected( dst, [ 2 ] );
    test.identical( got, expected );
    test.is( got !== dst );
  }

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.bufferBut() );

  test.case = 'extra arguments';
  var dst = new I16x( 10 );
  test.shouldThrowErrorSync( () => _.bufferBut( dst, [ 1, 2 ], [ 1 ], [ 4 ] ) );

  test.case = 'wrong value in range';
  var dst = new I16x( 10 );
  test.shouldThrowErrorSync( () => _.bufferBut( dst, true, [ 2 ] ) );
  test.shouldThrowErrorSync( () => _.bufferBut( dst, null, [ 2 ] ) );
  test.shouldThrowErrorSync( () => _.bufferBut( dst, 'str', [ 2 ] ) );
  test.shouldThrowErrorSync( () => _.bufferBut( dst, [ 'str', 1 ], [ 2 ] ) );
  test.shouldThrowErrorSync( () => _.bufferBut( dst, [], [ 2 ] ) );

  test.case = 'wrong value in dst';
  test.shouldThrowErrorSync( () => _.bufferBut( dst, [ 1, 3 ], 'str' ) );
  test.shouldThrowErrorSync( () => _.bufferBut( dst, [ 1, 3 ], { a : 1 } ) );

  test.case = 'wrong type of dst';
  test.shouldThrowErrorSync( () => _.bufferBut( 'str', [ 1, 3 ], [ 1 ] ) );

}

//

function bufferButInplace( test )
{
  /* not a buffer, trivial */

  test.case = 'dst = array, src = array, range = negative number';
  var dst = [ 1, 2, 3, 4 ];
  var got = _.bufferButInplace( dst, -5, [ 0 ] );
  test.identical( got, [ 0, 1, 2, 3, 4 ] );
  test.is( got === dst );

  test.case = 'dst = empty array, src = array, range[ 0 ] === range[ 1 ]';
  var dst = [];
  var got = _.bufferButInplace( dst, [ 0, 0 ], [ 2 ] );
  test.identical( got, [ 2 ] );
  test.is( got === dst );

  test.case = 'dst = array, src = array';
  var dst = [ 1, 2, 3, 4 ];
  var got = _.bufferButInplace( dst, [ 1, 3 ], [ 2 ] );
  test.identical( got, [ 1, 2, 4 ] );
  test.is( got === dst );

  /* */

  test.case = 'dst = unroll, src = array, range = negative number';
  var dst = _.unrollFrom( [ 1, 2, 3, 4 ] );
  var got = _.bufferButInplace( dst, -5, [ 2 ] );
  test.identical( got, [ 2, 1, 2, 3, 4 ] );
  test.is( got === dst );

  test.case = 'dst = empty unroll, src = array, range[ 0 ] === range[ 1 ]';
  var dst = _.unrollFrom( [] );
  var got = _.bufferButInplace( dst, [ 0, 0 ], [ 2 ] );
  test.identical( got, [ 2 ] );
  test.is( got === dst );

  test.case = 'dst = unroll, src = array';
  var dst = _.unrollFrom( [ 1, 2, 3, 4 ] );
  var got = _.bufferButInplace( dst, [ 1, 3 ], [ 2 ] );
  test.identical( got, [ 1, 2, 4 ] );
  test.is( got === dst );

  /* */

  test.case = 'dst = argumentsArray, src = array, range = negative number';
  var dst = _.argumentsArrayFrom( [ 1, 2, 3, 4 ] );
  var got = _.bufferButInplace( dst, -5, [ 2 ] );
  test.identical( got, [ 2, 1, 2, 3, 4 ] );
  test.is( got !== dst );

  test.case = 'dst = empty argumentsArray, src = array, range[ 0 ] === range[ 1 ]';
  var dst = _.argumentsArrayFrom( [] );
  var got = _.bufferButInplace( dst, [ 0, 0 ], [ 2 ] );
  test.identical( got, [ 2 ] );
  test.is( got !== dst );

  test.case = 'dst = argumentsArray, src = array';
  var dst = _.argumentsArrayFrom( [ 1, 2, 3, 4 ] );
  var got = _.bufferButInplace( dst, [ 1, 3 ], [ 2 ] );
  test.identical( got, [ 1, 2, 4 ] );
  test.is( got !== dst );

  /* BufferTyped and BufferNode */

  var bufferTyped = function( buf )
  {
    let name = buf.name;
    return { [ name ] : function( src ){ return new buf( src ) } } [ name ];
  };

  var bufferNode = function( src )
  {
    if( _.numberIs( src ) )
    return BufferNode.alloc( src );
    else
    return BufferNode.from( src );
  };

  /* - */

  var list =
  [
    I8x,
    U16x,
    F32x,
    F64x,

    // I8x,
    // U8x,
    // U8ClampedX,
    // I16x,
    // U16x,
    // I32x,
    // U32x,
    // F32x,
    // F64x,
  ];

  for( let i = 0; i < list.length; i++ )
  {
    test.open( list[ i ].name );
    run( bufferTyped( list[ i ] ) );
    test.close( list[ i ].name );
  }

  /* - */

  if( Config.interpreter === 'njs' )
  {
    test.open( 'bufferNode' );
    run( bufferNode );
    test.close( 'bufferNode' );
  }

  /* - */

  function run( buf )
  {
    test.case = 'src = undefined';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferButInplace( dst, [ 1, 2 ] );
    var expected = buf( [ 0, 2, 3 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'src = undefined, range = undefined';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferButInplace( dst );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'src = undefined, range[ 0 ] === range[ 1 ]';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferButInplace( dst, [ 1, 1 ] );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'src = undefined, range[ 0 ] < 0, range[ 1 ] < 0';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferButInplace( dst, [ -1, -5 ] );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'src = array';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var src = new Array( 1, 2, 3 );
    var got = _.bufferButInplace( dst, [ 1, 2 ], src );
    var expected = buf( [ 0, 1, 2, 3, 2, 3 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'src = unroll';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var src = _.unrollMake( [ 1, 2, 3 ] );
    var got = _.bufferButInplace( dst, [ 1, 2 ], src );
    var expected = buf( [ 0, 1, 2, 3, 2, 3 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'src = argumentsArray';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var src = _.argumentsArrayMake( [ 1, 2, 3 ] );
    var got = _.bufferButInplace( dst, [ 1, 2 ], src );
    var expected = buf( [ 0, 1, 2, 3, 2, 3 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    if( Config.interpreter === 'njs' )
    {
      test.case = 'src = bufferNode';
      var dst = buf( [ 0, 1, 2, 3 ] );
      var src = BufferNode.from( [ 1, 2, 3 ] );
      var got = _.bufferButInplace( dst, [ 1, 2 ], src );
      var expected = buf( [ 0, 1, 2, 3, 2, 3 ] );
      test.identical( got, expected );
      test.is( got !== dst );
    }

    test.case = 'src = bufferTyped';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var src = new I32x( 2 );
    var got = _.bufferButInplace( dst, [ 1, 2 ], src );
    var expected = buf( [ 0, 0, 0, 2, 3 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range = number';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferButInplace( dst, 2, [ 5 ] );
    var expected = buf( [ 0, 1, 5, 3 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range = negative number';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferButInplace( dst, -2, [ 5 ] );
    var expected = buf( [ 5, 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range[ 0 ] === range[ 1 ], src = array';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferButInplace( dst, [ 2, 2 ], [ 5 ] );
    var expected = buf( [ 0, 1, 5, 2, 3 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range[ 0 ] = 0, range[ 1 ] = dst.length, src';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferButInplace( dst, [ 0, dst.length ], [ 1 ] );
    var expected = buf( [ 1 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range[ 0 ] < 0, range[ 1 ] < 0, src';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferButInplace( dst, [ -5, -2 ], [ 1 ] );
    var expected = buf( [ 1, 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range[ 0 ] > range[ 1 ], src';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferButInplace( dst, [ 4, 1 ], [ 1 ] );
    var expected = buf( [ 0, 1, 2, 3, 1 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range[ 0 ] > 0, range[ 1 ] > dst.length, src';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferButInplace( dst, [ 1, 8 ], [ 1 ] );
    var expected = buf( [ 0, 1 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'dst = empty BufferTyped, src';
    var dst = buf( [] );
    var got = _.bufferButInplace( dst, [ 0, 0 ], [ 2 ] );
    var expected = buf( [ 2 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    var dst = buf( [] );
    var got = _.bufferButInplace( dst, [ 0, 0 ], [ 2 ] );
    var expected = buf( [ 2 ] );
    test.identical( got, expected );
    test.is( got !== dst );
  }

  /* BufferRaw and BufferView */

  var bufferRaw = ( src ) => new BufferRaw( src );
  var bufferView = ( src ) => new BufferView( new BufferRaw( src ) );

  var bufferExpected = function( dst, src )
  {
    if( _.bufferRawIs( dst ) )
    return new U8x( src ).buffer;
    else if( _.bufferViewIs( dst ) )
    return new BufferView( new U8x( src ).buffer );
  };

  /* - */

  test.open( 'bufferRaw' );
  run2( bufferRaw );
  test.close( 'bufferRaw' );

  /* - */

  test.open( 'bufferView' );
  run2( bufferView );
  test.close( 'bufferView' );

  /* - */

  function run2( buf )
  {
    test.case = 'src = undefined';
    var dst = buf( 4 );
    var got = _.bufferButInplace( dst, [ 1, 2 ] );
    var expected = bufferExpected( dst, [ 0, 0, 0 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'src = undefined, range = undefined';
    var dst = buf( 4 );
    var got = _.bufferButInplace( dst );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'src = undefined, range[ 0 ] === range[ 1 ]';
    var dst = buf( 4 );
    var got = _.bufferButInplace( dst, [ 1, 1 ] );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'src = undefined, range[ 0 ] < 0, range[ 1 ] < 0';
    var dst = buf( 4 );
    var got = _.bufferButInplace( dst, [ -1, -5 ] );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'src = array';
    var dst = buf( 4 );
    var src = new Array( 1, 2, 3 );
    var got = _.bufferButInplace( dst, [ 1, 2 ], src );
    var expected = bufferExpected( dst, [ 0, 1, 2, 3, 0, 0 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'src = unroll';
    var dst = buf( 4 );
    var src = _.unrollMake( [ 1, 2, 3 ] );
    var got = _.bufferButInplace( dst, [ 1, 2 ], src );
    var expected = bufferExpected( dst, [ 0, 1, 2, 3, 0, 0 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'src = argumentsArray';
    var dst = buf( 4 );
    var src = _.argumentsArrayMake( [ 1, 2, 3 ] );
    var got = _.bufferButInplace( dst, [ 1, 2 ], src );
    var expected = bufferExpected( dst, [ 0, 1, 2, 3, 0, 0 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    if( Config.interpreter === 'njs' )
    {
      test.case = 'src = bufferNode';
      var dst = buf( 4 );
      var src = BufferNode.from( [ 1, 2, 3 ] );
      var got = _.bufferButInplace( dst, [ 1, 2 ], src );
      var expected = bufferExpected( dst, [ 0, 1, 2, 3, 0, 0 ] );
      test.identical( got, expected );
      test.is( got !== dst );
    }

    test.case = 'src = bufferTyped';
    var dst = buf( 4 );
    var src = new I32x( 2 );
    var got = _.bufferButInplace( dst, [ 1, 2 ], src );
    var expected = bufferExpected( dst, [ 0, 0, 0, 0, 0 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range = number';
    var dst = buf( 4 );
    var got = _.bufferButInplace( dst, 2, [ 5 ] );
    var expected = bufferExpected( dst, [ 0, 0, 5, 0 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range = negative number';
    var dst = buf( 4 );
    var got = _.bufferButInplace( dst, -2, [ 5 ] );
    var expected = bufferExpected( dst, [ 5, 0, 0, 0, 0 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range[ 0 ] === range[ 1 ], src = array';
    var dst = buf( 4 );
    var got = _.bufferButInplace( dst, [ 2, 2 ], [ 5 ] );
    var expected = bufferExpected( dst, [ 0, 0, 5, 0, 0 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range[ 0 ] = 0, range[ 1 ] = dst.length, src';
    var dst = buf( 4 );
    var got = _.bufferButInplace( dst, [ 0, 4 ], [ 1 ] );
    var expected = bufferExpected( dst, [ 1 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range[ 0 ] < 0, range[ 1 ] < 0, src';
    var dst = buf( 4 );
    var got = _.bufferButInplace( dst, [ -5, -2 ], [ 1 ] );
    var expected = bufferExpected( dst, [ 1, 0, 0, 0, 0 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range[ 0 ] > range[ 1 ], src';
    var dst = buf( 4 );
    var got = _.bufferButInplace( dst, [ 4, 1 ], [ 1 ] );
    var expected = bufferExpected( dst, [ 0, 0, 0, 0, 1 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range[ 0 ] > 0, range[ 1 ] > dst.length, src';
    var dst = buf( 4 );
    var got = _.bufferButInplace( dst, [ 1, 8 ], [ 1 ] );
    var expected = bufferExpected( dst, [ 0, 1 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'dst = empty BufferTyped, src';
    var dst = buf( [] );
    var got = _.bufferButInplace( dst, [ 0, 0 ], [ 2 ] );
    var expected = bufferExpected( dst, [ 2 ] );
    test.identical( got, expected );
    test.is( got !== dst );
  }

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.bufferButInplace() );

  test.case = 'extra arguments';
  var dst = new I16x( 10 );
  test.shouldThrowErrorSync( () => _.bufferButInplace( dst, [ 1, 2 ], [ 1 ], [ 4 ] ) );

  test.case = 'wrong value in range';
  var dst = new I16x( 10 );
  test.shouldThrowErrorSync( () => _.bufferButInplace( dst, true, [ 2 ] ) );
  test.shouldThrowErrorSync( () => _.bufferButInplace( dst, null, [ 2 ] ) );
  test.shouldThrowErrorSync( () => _.bufferButInplace( dst, 'str', [ 2 ] ) );
  test.shouldThrowErrorSync( () => _.bufferButInplace( dst, [ 'str', 1 ], [ 2 ] ) );
  test.shouldThrowErrorSync( () => _.bufferButInplace( dst, [], [ 2 ] ) );

  test.case = 'wrong value in dst';
  test.shouldThrowErrorSync( () => _.bufferButInplace( dst, [ 1, 3 ], 'str' ) );
  test.shouldThrowErrorSync( () => _.bufferButInplace( dst, [ 1, 3 ], { a : 1 } ) );

  test.case = 'wrong type of dst';
  test.shouldThrowErrorSync( () => _.bufferButInplace( 'str', [ 1, 3 ], [ 1 ] ) );

}

//

function bufferSelect( test )
{
  /* not a buffer, trivial */

  test.case = 'dst = array, src = array, range = negative number';
  var dst = [ 1, 2, 3, 4 ];
  var got = _.bufferSelect( dst, -5, [ 0 ] );
  test.identical( got, [ 1, 2, 3, 4 ] );
  test.is( got !== dst );

  test.case = 'dst = empty array, src = array, range[ 0 ] === range[ 1 ]';
  var dst = [];
  var got = _.bufferSelect( dst, [ 0, 0 ], [ 2 ] );
  test.identical( got, [] );
  test.is( got !== dst );

  test.case = 'dst = array, src = array';
  var dst = [ 1, 2, 3, 4 ];
  var got = _.bufferSelect( dst, [ 1, 3 ], [ 2 ] );
  test.identical( got, [ 2, 3 ] );
  test.is( got !== dst );

  /* */

  test.case = 'dst = unroll, src = array, range = negative number';
  var dst = _.unrollFrom( [ 1, 2, 3, 4 ] );
  var got = _.bufferSelect( dst, -5, [ 2 ] );
  test.identical( got, [ 1, 2, 3, 4 ] );
  test.is( got !== dst );

  test.case = 'dst = empty unroll, src = array, range[ 0 ] === range[ 1 ]';
  var dst = _.unrollFrom( [] );
  var got = _.bufferSelect( dst, [ 0, 0 ], [ 2 ] );
  test.identical( got, [] );
  test.is( got !== dst );

  test.case = 'dst = unroll, src = array';
  var dst = _.unrollFrom( [ 1, 2, 3, 4 ] );
  var got = _.bufferSelect( dst, [ 1, 3 ], [ 2 ] );
  test.identical( got, [ 2, 3 ] );
  test.is( got !== dst );

  /* */

  test.case = 'dst = argumentsArray, src = array, range = negative number';
  var dst = _.argumentsArrayFrom( [ 1, 2, 3, 4 ] );
  var got = _.bufferSelect( dst, -5, [ 2 ] );
  test.identical( got, [ 1, 2, 3, 4 ] );
  test.is( got !== dst );

  test.case = 'dst = empty argumentsArray, src = array, range[ 0 ] === range[ 1 ]';
  var dst = _.argumentsArrayFrom( [] );
  var got = _.bufferSelect( dst, [ 0, 0 ], [ 2 ] );
  test.identical( got, [] );
  test.is( got !== dst );

  test.case = 'dst = argumentsArray, src = array';
  var dst = _.argumentsArrayFrom( [ 1, 2, 3, 4 ] );
  var got = _.bufferSelect( dst, [ 1, 3 ], [ 2 ] );
  test.identical( got, [ 2, 3 ] );
  test.is( got !== dst );

  /* - */

  /* BufferTyped and BufferNode */

  var bufferTyped = function( buf )
  {
    let name = buf.name;
    return { [ name ] : function( src ){ return new buf( src ) } } [ name ];
  };

  var bufferNode = function( src )
  {
    if( _.numberIs( src ) )
    return BufferNode.alloc( src );
    else
    return BufferNode.from( src );
  };

  /* - */

  var list =
  [
    I8x,
    U16x,
    F32x,
    F64x,

    // I8x,
    // U8x,
    // U8ClampedX,
    // I16x,
    // U16x,
    // I32x,
    // U32x,
    // F32x,
    // F64x,
  ];

  for( let i = 0; i < list.length; i++ )
  {
    test.open( list[ i ].name );
    run( bufferTyped( list[ i ] ) );
    test.close( list[ i ].name );
  }

  /* - */

  if( Config.interpreter === 'njs' )
  {
    test.open( 'bufferNode' );
    run( bufferNode );
    test.close( 'bufferNode' );
  }

  /* - */

  function run( buf )
  {
    test.case = 'src = undefined';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferSelect( dst, [ 1, 2 ] );
    var expected = buf( [ 1 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'src = undefined, range = undefined';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferSelect( dst );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'src = undefined, range = 0';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferSelect( dst, 0 );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'src = undefined, rang = negative number';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferSelect( dst, -5 );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range = undefined, src = undefined';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferSelect( dst );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'src = array';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var src = new Array( 1, 2, 3 );
    var got = _.bufferSelect( dst, [ 1, 2 ], src );
    var expected = buf( [ 1 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'src = unroll';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var src = _.unrollMake( [ 1, 2, 3 ] );
    var got = _.bufferSelect( dst, [ 1, 3 ], src );
    var expected = buf( [ 1, 2 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'src = argumentsArray';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var src = _.argumentsArrayMake( [ 1, 2, 3 ] );
    var got = _.bufferSelect( dst, [ 1, 3 ], src );
    var expected = buf( [ 1, 2 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    if( Config.interpreter === 'njs' )
    {
      test.case = 'src = bufferNode';
      var dst = buf( [ 0, 1, 2, 3 ] );
      var src = BufferNode.from( [ 1, 2, 3 ] );
      var got = _.bufferSelect( dst, [ 1, 3 ], src );
      var expected = buf( [ 1, 2 ] );
      test.identical( got, expected );
      test.is( got !== dst );
    }

    test.case = 'src = bufferTyped';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var src = new I32x( 2 );
    var got = _.bufferSelect( dst, [ 1, 2 ], src );
    var expected = buf( [ 1 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range = number';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferSelect( dst, 2, [ 5 ] );
    var expected = buf( [ 2, 3 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range = negative number';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferSelect( dst, -2, [ 5 ] );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range[ 0 ] === range[ 1 ], src = array';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferSelect( dst, [ 2, 2 ], [ 5 ] );
    var expected = buf( [] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range[ 0 ] = 0, range[ 1 ] = dst.length, src';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferSelect( dst, [ 0, dst.length ], [ 1 ] );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range[ 0 ] < 0, range[ 1 ] < 0, src';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferSelect( dst, [ -5, -2 ], [ 1 ] );
    var expected = buf( [] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range[ 0 ] > range[ 1 ], src';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferSelect( dst, [ 4, 1 ], [ 1 ] );
    var expected = buf( [] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range[ 0 ] > 0, range[ 1 ] > dst.length, src';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferSelect( dst, [ 1, 8 ], [ 1 ] );
    var expected = buf( [ 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'dst = empty BufferTyped, src';
    var dst = buf( [] );
    var got = _.bufferSelect( dst, [ 0, 0 ], [ 2 ] );
    var expected = buf( [] );
    test.identical( got, expected );
    test.is( got !== dst );

    var dst = buf( [] );
    var got = _.bufferSelect( dst, [ 0, 0 ], [ 2 ] );
    var expected = buf( [] );
    test.identical( got, expected );
    test.is( got !== dst );
  }

  /* BufferRaw and BufferView */

  var bufferRaw = ( src ) => new BufferRaw( src );
  var bufferView = ( src ) => new BufferView( new BufferRaw( src ) );

  var bufferExpected = function( dst, src )
  {
    if( _.bufferRawIs( dst ) )
    return new U8x( src ).buffer;
    else if( _.bufferViewIs( dst ) )
    return new BufferView( new U8x( src ).buffer );
  };

  /* - */

  test.open( 'bufferRaw' );
  run2( bufferRaw );
  test.close( 'bufferRaw' );

  /* - */

  test.open( 'bufferView' );
  run2( bufferView );
  test.close( 'bufferView' );

  /* - */

  function run2( buf )
  {
    test.case = 'src = undefined';
    var dst = buf( 4 );
    var got = _.bufferSelect( dst, [ 1, 2 ] );
    var expected = bufferExpected( dst, [ 0 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'src = undefined, range = undefined';
    var dst = buf( 4 );
    var got = _.bufferSelect( dst );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'src = undefined, range = 0';
    var dst = buf( 4 );
    var got = _.bufferSelect( dst, 0 );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'src = undefined, rang = negative number';
    var dst = buf( 4 );
    var got = _.bufferSelect( dst, -5 );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range = undefined, src = undefined';
    var dst = buf( 4 );
    var got = _.bufferSelect( dst );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'src = array';
    var dst = buf( 4 );
    var src = new Array( 1, 2, 3 );
    var got = _.bufferSelect( dst, [ 1, 2 ], src );
    var expected = bufferExpected( dst, [ 0 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'src = unroll';
    var dst = buf( 4 );
    var src = _.unrollMake( [ 1, 2, 3 ] );
    var got = _.bufferSelect( dst, [ 1, 3 ], src );
    var expected = bufferExpected( dst, [ 0, 0 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'src = argumentsArray';
    var dst = buf( 4 );
    var src = _.argumentsArrayMake( [ 1, 2, 3 ] );
    var got = _.bufferSelect( dst, [ 1, 3 ], src );
    var expected = bufferExpected( dst, [ 0, 0 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    if( Config.interpreter === 'njs' )
    {
      test.case = 'src = bufferNode';
      var dst = buf( 4 );
      var src = BufferNode.from( [ 1, 2, 3 ] );
      var got = _.bufferSelect( dst, [ 1, 2 ], src );
      var expected = bufferExpected( dst, [ 0 ] );
      test.identical( got, expected );
      test.is( got !== dst );
    }

    test.case = 'src = bufferTyped';
    var dst = buf( 4 );
    var src = new I32x( 2 );
    var got = _.bufferSelect( dst, [ 1, 3 ], src );
    var expected = bufferExpected( dst, [ 0, 0 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range = number';
    var dst = buf( 4 );
    var got = _.bufferSelect( dst, 2, [ 5 ] );
    var expected = bufferExpected( dst, [ 0, 0 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range = negative number';
    var dst = buf( 4 );
    var got = _.bufferSelect( dst, -2, [ 5 ] );
    var expected = bufferExpected( dst, [ 0, 0, 0, 0 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range[ 0 ] === range[ 1 ], src = array';
    var dst = buf( 4 );
    var got = _.bufferSelect( dst, [ 2, 2 ], [ 5 ] );
    var expected = bufferExpected( dst, [] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range[ 0 ] = 0, range[ 1 ] = dst.length, src';
    var dst = buf( 4 );
    var got = _.bufferSelect( dst, [ 0, 4 ], [ 1 ] );
    var expected = bufferExpected( dst, [ 0, 0, 0, 0 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range[ 0 ] < 0, range[ 1 ] < 0, src';
    var dst = buf( 4 );
    var got = _.bufferSelect( dst, [ -5, -2 ], [ 1 ] );
    var expected = bufferExpected( dst, [] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range[ 0 ] > range[ 1 ], src';
    var dst = buf( 4 );
    var got = _.bufferSelect( dst, [ 4, 1 ], [ 1 ] );
    var expected = bufferExpected( dst, [] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range[ 0 ] > 0, range[ 1 ] > dst.length, src';
    var dst = buf( 4 );
    var got = _.bufferSelect( dst, [ 1, 8 ], [ 1 ] );
    var expected = bufferExpected( dst, [ 0, 0, 0 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'dst = empty BufferTyped, src';
    var dst = buf( [] );
    var got = _.bufferSelect( dst, [ 0, 0 ], [ 2 ] );
    var expected = bufferExpected( dst, [] );
    test.identical( got, expected );
    test.is( got !== dst );
  }

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.bufferSelect() );

  test.case = 'extra arguments';
  var dst = new I16x( 10 );
  test.shouldThrowErrorSync( () => _.bufferSelect( dst, [ 1, 2 ], [ 1, 2 ], [ 4 ], 'extra' ) );

  test.case = 'wrong value in range';
  var dst = new I16x( 10 );
  test.shouldThrowErrorSync( () => _.bufferSelect( dst, true, [ 2 ] ) );
  test.shouldThrowErrorSync( () => _.bufferSelect( dst, null, [ 2 ] ) );
  test.shouldThrowErrorSync( () => _.bufferSelect( dst, 'str', [ 2 ] ) );
  test.shouldThrowErrorSync( () => _.bufferSelect( dst, [ 'str', 1 ], [ 2 ] ) );
  test.shouldThrowErrorSync( () => _.bufferSelect( dst, [], [ 2 ] ) );

  test.case = 'wrong value in src';
  test.shouldThrowErrorSync( () => _.bufferSelect( dst, [ 1, 3 ], 'str' ) );
  test.shouldThrowErrorSync( () => _.bufferSelect( dst, [ 1, 3 ], { a : 1 } ) );

  test.case = 'wrong type of dst';
  test.shouldThrowErrorSync( () => _.bufferSelect( 'str', [ 1, 3 ], [ 1 ] ) );

}

//

function bufferSelectInplace( test )
{
  /* not a buffer, trivial */

  test.case = 'dst = array, src = array, range = negative number';
  var dst = [ 1, 2, 3, 4 ];
  var got = _.bufferSelectInplace( dst, -5, [ 0 ] );
  test.identical( got, [ 1, 2, 3, 4 ] );
  test.is( got === dst );

  test.case = 'dst = empty array, src = array, range[ 0 ] === range[ 1 ]';
  var dst = [];
  var got = _.bufferSelectInplace( dst, [ 0, 0 ], [ 2 ] );
  test.identical( got, [] );
  test.is( got === dst );

  test.case = 'dst = array, src = array';
  var dst = [ 1, 2, 3, 4 ];
  var got = _.bufferSelectInplace( dst, [ 1, 3 ], [ 2 ] );
  test.identical( got, [ 2, 3 ] );
  test.is( got === dst );

  /* */

  test.case = 'dst = unroll, src = array, range = negative number';
  var dst = _.unrollFrom( [ 1, 2, 3, 4 ] );
  var got = _.bufferSelectInplace( dst, -5, [ 2 ] );
  test.identical( got, [ 1, 2, 3, 4 ] );
  test.is( got === dst );

  test.case = 'dst = empty unroll, src = array, range[ 0 ] === range[ 1 ]';
  var dst = _.unrollFrom( [] );
  var got = _.bufferSelectInplace( dst, [ 0, 0 ], [ 2 ] );
  test.identical( got, [] );
  test.is( got === dst );

  test.case = 'dst = unroll, src = array';
  var dst = _.unrollFrom( [ 1, 2, 3, 4 ] );
  var got = _.bufferSelectInplace( dst, [ 1, 3 ], [ 2 ] );
  test.identical( got, [ 2, 3 ] );
  test.is( got === dst );

  /* */

  test.case = 'dst = argumentsArray, src = array, range = negative number';
  var dst = _.argumentsArrayFrom( [ 1, 2, 3, 4 ] );
  var got = _.bufferSelectInplace( dst, -5, [ 2 ] );
  test.identical( got, _.argumentsArrayFrom( [ 1, 2, 3, 4 ] ) );
  test.is( got === dst );

  test.case = 'dst = empty argumentsArray, src = array, range[ 0 ] === range[ 1 ]';
  var dst = _.argumentsArrayFrom( [] );
  var got = _.bufferSelectInplace( dst, [ 0, 0 ], [ 2 ] );
  test.identical( got, _.argumentsArrayFrom( [] ) );
  test.is( got === dst );

  test.case = 'dst = argumentsArray, src = array';
  var dst = _.argumentsArrayFrom( [ 1, 2, 3, 4 ] );
  var got = _.bufferSelectInplace( dst, [ 1, 3 ], [ 2 ] );
  test.identical( got, [ 2, 3 ] );
  test.is( got !== dst );

  /* - */

  /* BufferTyped and BufferNode */

  var bufferTyped = function( buf )
  {
    let name = buf.name;
    return { [ name ] : function( src ){ return new buf( src ) } } [ name ];
  };

  var bufferNode = function( src )
  {
    if( _.numberIs( src ) )
    return BufferNode.alloc( src );
    else
    return BufferNode.from( src );
  };

  /* - */

  var list =
  [
    I8x,
    U16x,
    F32x,
    F64x,

    // I8x,
    // U8x,
    // U8ClampedX,
    // I16x,
    // U16x,
    // I32x,
    // U32x,
    // F32x,
    // F64x,
  ];

  for( let i = 0; i < list.length; i++ )
  {
    test.open( list[ i ].name );
    run( bufferTyped( list[ i ] ) );
    test.close( list[ i ].name );
  }

  /* - */

  if( Config.interpreter === 'njs' )
  {
    test.open( 'bufferNode' );
    run( bufferNode );
    test.close( 'bufferNode' );
  }

  /* - */

  function run( buf )
  {
    test.case = 'src = undefined';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferSelectInplace( dst, [ 1, 2 ] );
    var expected = buf( [ 1 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'src = undefined, range = undefined';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferSelectInplace( dst );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'src = undefined, range = 0';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferSelectInplace( dst, 0 );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'src = undefined, rang = negative number';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferSelectInplace( dst, -5 );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'range = undefined, src = undefined';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferSelectInplace( dst );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'src = array';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var src = new Array( 1, 2, 3 );
    var got = _.bufferSelectInplace( dst, [ 1, 2 ], src );
    var expected = buf( [ 1 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'src = unroll';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var src = _.unrollMake( [ 1, 2, 3 ] );
    var got = _.bufferSelectInplace( dst, [ 1, 3 ], src );
    var expected = buf( [ 1, 2 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'src = argumentsArray';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var src = _.argumentsArrayMake( [ 1, 2, 3 ] );
    var got = _.bufferSelectInplace( dst, [ 1, 3 ], src );
    var expected = buf( [ 1, 2 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    if( Config.interpreter === 'njs' )
    {
      test.case = 'src = bufferNode';
      var dst = buf( [ 0, 1, 2, 3 ] );
      var src = BufferNode.from( [ 1, 2, 3 ] );
      var got = _.bufferSelectInplace( dst, [ 1, 3 ], src );
      var expected = buf( [ 1, 2 ] );
      test.identical( got, expected );
      test.is( got !== dst );
    }

    test.case = 'src = bufferTyped';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var src = new I32x( 2 );
    var got = _.bufferSelectInplace( dst, [ 1, 2 ], src );
    var expected = buf( [ 1 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range = number';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferSelectInplace( dst, 2, [ 5 ] );
    var expected = buf( [ 2, 3 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range = negative number';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferSelectInplace( dst, -2, [ 5 ] );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'range[ 0 ] === range[ 1 ], src = array';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferSelectInplace( dst, [ 2, 2 ], [ 5 ] );
    var expected = buf( [] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range[ 0 ] = 0, range[ 1 ] = dst.length, src';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferSelectInplace( dst, [ 0, dst.length ], [ 1 ] );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'range[ 0 ] < 0, range[ 1 ] < 0, src';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferSelectInplace( dst, [ -5, -2 ], [ 1 ] );
    var expected = buf( [] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range[ 0 ] > range[ 1 ], src';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferSelectInplace( dst, [ 4, 1 ], [ 1 ] );
    var expected = buf( [] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range[ 0 ] > 0, range[ 1 ] > dst.length, src';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferSelectInplace( dst, [ 1, 8 ], [ 1 ] );
    var expected = buf( [ 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'dst = empty BufferTyped, src';
    var dst = buf( [] );
    var got = _.bufferSelectInplace( dst, [ 0, 0 ], [ 2 ] );
    var expected = buf( [] );
    test.identical( got, expected );
    test.is( got === dst );

    var dst = buf( [] );
    var got = _.bufferSelectInplace( dst, [ 0, 0 ], [ 2 ] );
    var expected = buf( [] );
    test.identical( got, expected );
    test.is( got === dst );
  }

  /* BufferRaw and BufferView */

  var bufferRaw = ( src ) => new BufferRaw( src );
  var bufferView = ( src ) => new BufferView( new BufferRaw( src ) );

  var bufferExpected = function( dst, src )
  {
    if( _.bufferRawIs( dst ) )
    return new U8x( src ).buffer;
    else if( _.bufferViewIs( dst ) )
    return new BufferView( new U8x( src ).buffer );
  };

  /* - */

  test.open( 'bufferRaw' );
  run2( bufferRaw );
  test.close( 'bufferRaw' );

  /* - */

  test.open( 'bufferView' );
  run2( bufferView );
  test.close( 'bufferView' );

  /* - */

  function run2( buf )
  {
    test.case = 'src = undefined';
    var dst = buf( 4 );
    var got = _.bufferSelectInplace( dst, [ 1, 2 ] );
    var expected = bufferExpected( dst, [ 0 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'src = undefined, range = undefined';
    var dst = buf( 4 );
    var got = _.bufferSelectInplace( dst );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'src = undefined, range = 0';
    var dst = buf( 4 );
    var got = _.bufferSelectInplace( dst, 0 );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'src = undefined, rang = negative number';
    var dst = buf( 4 );
    var got = _.bufferSelectInplace( dst, -5 );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'range = undefined, src = undefined';
    var dst = buf( 4 );
    var got = _.bufferSelectInplace( dst );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'src = array';
    var dst = buf( 4 );
    var src = new Array( 1, 2, 3 );
    var got = _.bufferSelectInplace( dst, [ 1, 2 ], src );
    var expected = bufferExpected( dst, [ 0 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'src = unroll';
    var dst = buf( 4 );
    var src = _.unrollMake( [ 1, 2, 3 ] );
    var got = _.bufferSelectInplace( dst, [ 1, 3 ], src );
    var expected = bufferExpected( dst, [ 0, 0 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'src = argumentsArray';
    var dst = buf( 4 );
    var src = _.argumentsArrayMake( [ 1, 2, 3 ] );
    var got = _.bufferSelectInplace( dst, [ 1, 3 ], src );
    var expected = bufferExpected( dst, [ 0, 0 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    if( Config.interpreter === 'njs' )
    {
      test.case = 'src = bufferNode';
      var dst = buf( 4 );
      var src = BufferNode.from( [ 1, 2, 3 ] );
      var got = _.bufferSelectInplace( dst, [ 1, 2 ], src );
      var expected = bufferExpected( dst, [ 0 ] );
      test.identical( got, expected );
      test.is( got !== dst );
    }

    test.case = 'src = bufferTyped';
    var dst = buf( 4 );
    var src = new I32x( 2 );
    var got = _.bufferSelectInplace( dst, [ 1, 3 ], src );
    var expected = bufferExpected( dst, [ 0, 0 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range = number';
    var dst = buf( 4 );
    var got = _.bufferSelectInplace( dst, 2, [ 5 ] );
    var expected = bufferExpected( dst, [ 0, 0 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range = negative number';
    var dst = buf( 4 );
    var got = _.bufferSelectInplace( dst, -2, [ 5 ] );
    var expected = bufferExpected( dst, [ 0, 0, 0, 0 ] );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'range[ 0 ] === range[ 1 ], src = array';
    var dst = buf( 4 );
    var got = _.bufferSelectInplace( dst, [ 2, 2 ], [ 5 ] );
    var expected = bufferExpected( dst, [] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range[ 0 ] = 0, range[ 1 ] = dst.length, src';
    var dst = buf( 4 );
    var got = _.bufferSelectInplace( dst, [ 0, 4 ], [ 1 ] );
    var expected = bufferExpected( dst, [ 0, 0, 0, 0 ] );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'range[ 0 ] < 0, range[ 1 ] < 0, src';
    var dst = buf( 4 );
    var got = _.bufferSelectInplace( dst, [ -5, -2 ], [ 1 ] );
    var expected = bufferExpected( dst, [] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range[ 0 ] > range[ 1 ], src';
    var dst = buf( 4 );
    var got = _.bufferSelectInplace( dst, [ 4, 1 ], [ 1 ] );
    var expected = bufferExpected( dst, [] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range[ 0 ] > 0, range[ 1 ] > dst.length, src';
    var dst = buf( 4 );
    var got = _.bufferSelectInplace( dst, [ 1, 8 ], [ 1 ] );
    var expected = bufferExpected( dst, [ 0, 0, 0 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'dst = empty BufferTyped, src';
    var dst = buf( [] );
    var got = _.bufferSelectInplace( dst, [ 0, 0 ], [ 2 ] );
    var expected = bufferExpected( dst, [] );
    test.identical( got, expected );
    test.is( got === dst );
  }

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.bufferSelectInplace() );

  test.case = 'extra arguments';
  var dst = new I16x( 10 );
  test.shouldThrowErrorSync( () => _.bufferSelectInplace( dst, [ 1, 2 ], [ 1, 2 ], [ 4 ], 'extra' ) );

  test.case = 'wrong value in range';
  var dst = new I16x( 10 );
  test.shouldThrowErrorSync( () => _.bufferSelectInplace( dst, true, [ 2 ] ) );
  test.shouldThrowErrorSync( () => _.bufferSelectInplace( dst, null, [ 2 ] ) );
  test.shouldThrowErrorSync( () => _.bufferSelectInplace( dst, 'str', [ 2 ] ) );
  test.shouldThrowErrorSync( () => _.bufferSelectInplace( dst, [ 'str', 1 ], [ 2 ] ) );
  test.shouldThrowErrorSync( () => _.bufferSelectInplace( dst, [], [ 2 ] ) );

  test.case = 'wrong value in src';
  test.shouldThrowErrorSync( () => _.bufferSelectInplace( dst, [ 1, 3 ], 'str' ) );
  test.shouldThrowErrorSync( () => _.bufferSelectInplace( dst, [ 1, 3 ], { a : 1 } ) );

  test.case = 'wrong type of dst';
  test.shouldThrowErrorSync( () => _.bufferSelectInplace( 'str', [ 1, 3 ], [ 1 ] ) );

}

//

function bufferGrow( test )
{
  /* not a buffer, trivial */

  test.case = 'dst = array, src = array, range = negative number';
  var dst = [ 1, 2, 3, 4 ];
  var got = _.bufferGrow( dst, -5, [ 0 ] );
  test.identical( got, [ 1, 2, 3, 4 ] );
  test.is( got !== dst );

  test.case = 'dst = empty array, src = array, range[ 0 ] === range[ 1 ]';
  var dst = [];
  var got = _.bufferGrow( dst, [ 0, 0 ], [ 2 ] );
  test.identical( got, [] );
  test.is( got !== dst );

  test.case = 'dst = array, range[ 1 ] > dst.length, src = array';
  var dst = [ 1, 2, 3, 4 ];
  var got = _.bufferGrow( dst, [ 1, 5 ], [ 2 ] );
  test.identical( got, [ 1, 2, 3, 4, [ 2 ] ] );
  test.is( got !== dst );

  /* */

  test.case = 'dst = unroll, src = array, range = negative number';
  var dst = _.unrollFrom( [ 1, 2, 3, 4 ] );
  var got = _.bufferGrow( dst, -5, [ 2 ] );
  test.identical( got, [ 1, 2, 3, 4 ] );
  test.is( got !== dst );

  test.case = 'dst = empty unroll, src = array, range[ 0 ] === range[ 1 ]';
  var dst = _.unrollFrom( [] );
  var got = _.bufferGrow( dst, [ 0, 0 ], [ 2 ] );
  test.identical( got, [] );
  test.is( got !== dst );

  test.case = 'dst = unroll, src = array';
  var dst = _.unrollFrom( [ 1, 2, 3, 4 ] );
  var got = _.bufferGrow( dst, [ 1, 5 ], [ 2 ] );
  test.identical( got, [ 1, 2, 3, 4, [ 2 ] ] );
  test.is( got !== dst );

  /* */

  test.case = 'dst = argumentsArray, src = array, range = negative number';
  var dst = _.argumentsArrayFrom( [ 1, 2, 3, 4 ] );
  var got = _.bufferGrow( dst, -5, [ 2 ] );
  test.identical( got, [ 1, 2, 3, 4 ] );
  test.is( got !== dst );

  test.case = 'dst = empty argumentsArray, src = array, range[ 0 ] === range[ 1 ]';
  var dst = _.argumentsArrayFrom( [] );
  var got = _.bufferGrow( dst, [ 0, 0 ], [ 2 ] );
  test.identical( got, [] );
  test.is( got !== dst );

  test.case = 'dst = argumentsArray, src = array';
  var dst = _.argumentsArrayFrom( [ 1, 2, 3, 4 ] );
  var got = _.bufferGrow( dst, [ 1, 5 ], [ 2 ] );
  test.identical( got, [ 1, 2, 3, 4, [ 2 ] ] );
  test.is( got !== dst );

  /* BufferTyped and BufferNode */

  var bufferTyped = function( buf )
  {
    let name = buf.name;
    return { [ name ] : function( src ){ return new buf( src ) } } [ name ];
  };

  var bufferNode = function( src )
  {
    if( _.numberIs( src ) )
    return BufferNode.alloc( src );
    else
    return BufferNode.from( src );
  };

  /* - */

  var list =
  [
    I8x,
    U16x,
    F32x,
    F64x,

    // I8x,
    // U8x,
    // U8ClampedX,
    // I16x,
    // U16x,
    // I32x,
    // U32x,
    // F32x,
    // F64x,
  ];

  for( let i = 0; i < list.length; i++ )
  {
    test.open( list[ i ].name );
    run( bufferTyped( list[ i ] ) );
    test.close( list[ i ].name );
  }

  /* - */

  if( Config.interpreter === 'njs' )
  {
    test.open( 'bufferNode' );
    run( bufferNode );
    test.close( 'bufferNode' );
  }

  /* - */

  function run( buf )
  {
    test.case = 'src = undefined';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferGrow( dst, [ 1, 2 ] );
    var expected = buf( [ 0, 1, 2, 3 ] )
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'src = undefined, range = undefined';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferGrow( dst );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'src = undefined, range = 0';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferGrow( dst, 0 );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'src = undefined, rang = negative number';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferGrow( dst, -5 );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range = undefined, src = undefined';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferGrow( dst );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'src = array';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var src = new Array( 1, 2, 3 );
    var got = _.bufferGrow( dst, [ 1, 2 ], src );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'src = unroll';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var src = _.unrollMake( [ 1, 2, 3 ] );
    var got = _.bufferGrow( dst, [ 1, 5 ], src );
    var expected = buf( [ 0, 1, 2, 3, NaN ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'src = argumentsArray';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var src = _.argumentsArrayMake( [ 1, 2, 3 ] );
    var got = _.bufferGrow( dst, [ 1, 6 ], src );
    var expected = buf( [ 0, 1, 2, 3, NaN, NaN ] );
    test.identical( got, expected );
    test.is( got !== dst );

    if( Config.interpreter === 'njs' )
    {
      test.case = 'src = bufferNode';
      var dst = buf( [ 0, 1, 2, 3 ] );
      var src = BufferNode.from( [ 1, 2, 3 ] );
      var got = _.bufferGrow( dst, [ 1, 3 ], src );
      var expected = buf( [ 0, 1, 2, 3 ] );
      test.identical( got, expected );
      test.is( got !== dst );
    }

    test.case = 'src = bufferTyped';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var src = new I32x( 2 );
    var got = _.bufferGrow( dst, [ 1, 5 ], src );
    var expected = buf( [ 0, 1, 2, 3, NaN ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range = number';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferGrow( dst, 6, [ 5 ] );
    var expected = buf( [ 0, 1, 2, 3, 5, 5 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range = negative number';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferGrow( dst, -2, [ 5 ] );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range[ 0 ] === range[ 1 ], src = array';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferGrow( dst, [ 2, 2 ], [ 5 ] );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range[ 0 ] = 0, range[ 1 ] = dst.length, src';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferGrow( dst, [ 0, dst.length ], [ 1 ] );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range[ 0 ] < 0, range[ 1 ] < 0, src';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferGrow( dst, [ -5, -2 ], [ 1 ] );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range[ 0 ] > range[ 1 ], src';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferGrow( dst, [ 4, 1 ], [ 1 ] );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range[ 0 ] > 0, range[ 1 ] > dst.length, src = number';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferGrow( dst, [ 1, 8 ], 1 );
    var expected = buf( [ 0, 1, 2, 3, 1, 1, 1, 1 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'dst = empty BufferTyped, src';
    var dst = buf( [] );
    var got = _.bufferGrow( dst, [ 0, 0 ], [ 2 ] );
    var expected = buf( [] );
    test.identical( got, expected );
    test.is( got !== dst );

    var dst = buf( [] );
    var got = _.bufferGrow( dst, [ 0, 0 ], [ 2 ] );
    var expected = buf( [] );
    test.identical( got, expected );
    test.is( got !== dst );
  }

  /* BufferRaw and BufferView */

  var bufferRaw = ( src ) => new BufferRaw( src );
  var bufferView = ( src ) => new BufferView( new BufferRaw( src ) );

  var bufferExpected = function( dst, src )
  {
    if( _.bufferRawIs( dst ) )
    return new U8x( src ).buffer;
    else if( _.bufferViewIs( dst ) )
    return new BufferView( new U8x( src ).buffer );
  };

  /* - */

  test.open( 'bufferRaw' );
  run2( bufferRaw );
  test.close( 'bufferRaw' );

  /* - */

  test.open( 'bufferView' );
  run2( bufferView );
  test.close( 'bufferView' );

  /* - */

  function run2( buf )
  {
    test.case = 'src = undefined';
    var dst = buf( 4 );
    var got = _.bufferGrow( dst, [ 1, 2 ] );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'src = undefined, range = undefined';
    var dst = buf( 4 );
    var got = _.bufferGrow( dst );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'src = undefined, range = 0';
    var dst = buf( 4 );
    var got = _.bufferGrow( dst, 0 );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'src = undefined, rang = negative number';
    var dst = buf( 4 );
    var got = _.bufferGrow( dst, -5 );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range = undefined, src = undefined';
    var dst = buf( 4 );
    var got = _.bufferGrow( dst );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'src = array';
    var dst = buf( 4 );
    var src = new Array( 1, 2, 3 );
    var got = _.bufferGrow( dst, [ 1, 2 ], src );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'src = unroll';
    var dst = buf( 4 );
    var src = _.unrollMake( [ 1, 2, 3 ] );
    var got = _.bufferGrow( dst, [ 1, 5 ], src );
    var expected = bufferExpected( dst, 5 );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'src = argumentsArray';
    var dst = buf( 4 );
    var src = _.argumentsArrayMake( [ 1, 2, 3 ] );
    var got = _.bufferGrow( dst, [ 1, 6 ], src );
    var expected = bufferExpected( dst, 6 );
    test.identical( got, expected );
    test.is( got !== dst );

    if( Config.interpreter === 'njs' )
    {
      test.case = 'src = bufferNode';
      var dst = buf( 4 );
      var src = BufferNode.from( [ 1, 2, 3 ] );
      var got = _.bufferGrow( dst, [ 1, 2 ], src );
      var expected = bufferExpected( dst, 4 );
      test.identical( got, expected );
      test.is( got !== dst );
    }

    test.case = 'src = bufferTyped';
    var dst = buf( 4 );
    var src = new I32x( 2 );
    var got = _.bufferGrow( dst, [ 1, 3 ], src );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range = number, src = number';
    var dst = buf( 4 );
    var got = _.bufferGrow( dst, 6, 1 );
    var expected = bufferExpected( dst, [ 0, 0, 0, 0, 1, 1 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range = negative number';
    var dst = buf( 4 );
    var got = _.bufferGrow( dst, -2, [ 5 ] );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range[ 0 ] === range[ 1 ], src = array';
    var dst = buf( 4 );
    var got = _.bufferGrow( dst, [ 2, 2 ], [ 5 ] );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range[ 0 ] = 0, range[ 1 ] = dst.length, src';
    var dst = buf( 4 );
    var got = _.bufferGrow( dst, [ 0, 4 ], [ 1 ] );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range[ 0 ] < 0, range[ 1 ] < 0, src';
    var dst = buf( 4 );
    var got = _.bufferGrow( dst, [ -5, -2 ], [ 1 ] );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range[ 0 ] > range[ 1 ], src';
    var dst = buf( 4 );
    var got = _.bufferGrow( dst, [ 4, 1 ], [ 1 ] );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range[ 0 ] > 0, range[ 1 ] > dst.length, src';
    var dst = buf( 4 );
    var got = _.bufferGrow( dst, [ 1, 8 ], 1 );
    var expected = bufferExpected( dst, [ 0, 0, 0, 0, 1, 1, 1, 1 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'dst = empty BufferTyped, src';
    var dst = buf( [] );
    var got = _.bufferGrow( dst, [ 0, 0 ], [ 2 ] );
    var expected = bufferExpected( dst, [] );
    test.identical( got, expected );
    test.is( got !== dst );
  }

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.bufferGrow() );

  test.case = 'extra arguments';
  var dst = new I16x( 10 );
  test.shouldThrowErrorSync( () => _.bufferGrow( dst, [ 1, 2 ], [ 1, 2 ], [ 4 ], 'extra' ) );

  test.case = 'wrong value in range';
  var dst = new I16x( 10 );
  test.shouldThrowErrorSync( () => _.bufferGrow( dst, true, [ 2 ] ) );
  test.shouldThrowErrorSync( () => _.bufferGrow( dst, null, [ 2 ] ) );
  test.shouldThrowErrorSync( () => _.bufferGrow( dst, 'str', [ 2 ] ) );
  test.shouldThrowErrorSync( () => _.bufferGrow( dst, [ 'str', 1 ], [ 2 ] ) );
  test.shouldThrowErrorSync( () => _.bufferGrow( dst, [], [ 2 ] ) );

  test.case = 'wrong type of dst';
  test.shouldThrowErrorSync( () => _.bufferGrow( 'str', [ 1, 3 ], [ 1 ] ) );

}

//

function bufferGrowInplace( test )
{
  /* not a buffer, trivial */

  test.case = 'dst = array, src = array, range = negative number';
  var dst = [ 1, 2, 3, 4 ];
  var got = _.bufferGrowInplace( dst, -5, [ 0 ] );
  test.identical( got, [ 1, 2, 3, 4 ] );
  test.is( got === dst );

  test.case = 'dst = empty array, src = array, range[ 0 ] === range[ 1 ]';
  var dst = [];
  var got = _.bufferGrowInplace( dst, [ 0, 0 ], [ 2 ] );
  test.identical( got, [] );
  test.is( got === dst );

  test.case = 'dst = array, range[ 1 ] > dst.length, src = array';
  var dst = [ 1, 2, 3, 4 ];
  var got = _.bufferGrowInplace( dst, [ 1, 5 ], [ 2 ] );
  test.identical( got, [ 1, 2, 3, 4, [ 2 ] ] );
  test.is( got === dst );

  /* */

  test.case = 'dst = unroll, src = array, range = negative number';
  var dst = _.unrollFrom( [ 1, 2, 3, 4 ] );
  var got = _.bufferGrowInplace( dst, -5, [ 2 ] );
  test.identical( got, [ 1, 2, 3, 4 ] );
  test.is( got === dst );

  test.case = 'dst = empty unroll, src = array, range[ 0 ] === range[ 1 ]';
  var dst = _.unrollFrom( [] );
  var got = _.bufferGrowInplace( dst, [ 0, 0 ], [ 2 ] );
  test.identical( got, [] );
  test.is( got === dst );

  test.case = 'dst = unroll, src = array';
  var dst = _.unrollFrom( [ 1, 2, 3, 4 ] );
  var got = _.bufferGrowInplace( dst, [ 1, 5 ], [ 2 ] );
  test.identical( got, [ 1, 2, 3, 4, [ 2 ] ] );
  test.is( got === dst );

  /* */

  test.case = 'dst = argumentsArray, src = array, range = negative number';
  var dst = _.argumentsArrayFrom( [ 1, 2, 3, 4 ] );
  var got = _.bufferGrowInplace( dst, -5, [ 2 ] );
  test.identical( got, _.argumentsArrayFrom( [ 1, 2, 3, 4 ] ) );
  test.is( got === dst );

  test.case = 'dst = empty argumentsArray, src = array, range[ 0 ] === range[ 1 ]';
  var dst = _.argumentsArrayFrom( [] );
  var got = _.bufferGrowInplace( dst, [ 0, 0 ], [ 2 ] );
  test.identical( got, _.argumentsArrayFrom( [] ) );
  test.is( got === dst );

  test.case = 'dst = argumentsArray, src = array';
  var dst = _.argumentsArrayFrom( [ 1, 2, 3, 4 ] );
  var got = _.bufferGrowInplace( dst, [ 1, 5 ], [ 2 ] );
  test.identical( got, [ 1, 2, 3, 4, [ 2 ] ] );
  test.is( got !== dst );

  /* BufferTyped and BufferNode */

  var bufferTyped = function( buf )
  {
    let name = buf.name;
    return { [ name ] : function( src ){ return new buf( src ) } } [ name ];
  };

  var bufferNode = function( src )
  {
    if( _.numberIs( src ) )
    return BufferNode.alloc( src );
    else
    return BufferNode.from( src );
  };

  /* - */

  var list =
  [
    I8x,
    U16x,
    F32x,
    F64x,

    // I8x,
    // U8x,
    // U8ClampedX,
    // I16x,
    // U16x,
    // I32x,
    // U32x,
    // F32x,
    // F64x,
  ];

  for( let i = 0; i < list.length; i++ )
  {
    test.open( list[ i ].name );
    run( bufferTyped( list[ i ] ) );
    test.close( list[ i ].name );
  }

  /* - */

  if( Config.interpreter === 'njs' )
  {
    test.open( 'bufferNode' );
    run( bufferNode );
    test.close( 'bufferNode' );
  }

  /* - */

  function run( buf )
  {
    test.case = 'src = undefined';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferGrowInplace( dst, [ 1, 2 ] );
    var expected = buf( [ 0, 1, 2, 3 ] )
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'src = undefined, range = undefined';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferGrowInplace( dst );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'src = undefined, range = 0';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferGrowInplace( dst, 0 );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'src = undefined, rang = negative number';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferGrowInplace( dst, -5 );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'range = undefined, src = undefined';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferGrowInplace( dst );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'src = array';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var src = new Array( 1, 2, 3 );
    var got = _.bufferGrowInplace( dst, [ 1, 2 ], src );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'src = unroll';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var src = _.unrollMake( [ 1, 2, 3 ] );
    var got = _.bufferGrowInplace( dst, [ 1, 5 ], src );
    var expected = buf( [ 0, 1, 2, 3, NaN ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'src = argumentsArray';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var src = _.argumentsArrayMake( [ 1, 2, 3 ] );
    var got = _.bufferGrowInplace( dst, [ 1, 6 ], src );
    var expected = buf( [ 0, 1, 2, 3, NaN, NaN ] );
    test.identical( got, expected );
    test.is( got !== dst );

    if( Config.interpreter === 'njs' )
    {
      test.case = 'src = bufferNode';
      var dst = buf( [ 0, 1, 2, 3 ] );
      var src = BufferNode.from( [ 1, 2, 3 ] );
      var got = _.bufferGrowInplace( dst, [ 1, 3 ], src );
      var expected = buf( [ 0, 1, 2, 3 ] );
      test.identical( got, expected );
      test.is( got === dst );
    }

    test.case = 'src = bufferTyped';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var src = new I32x( 2 );
    var got = _.bufferGrowInplace( dst, [ 1, 5 ], src );
    var expected = buf( [ 0, 1, 2, 3, NaN ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range = number';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferGrowInplace( dst, 6, [ 5 ] );
    var expected = buf( [ 0, 1, 2, 3, 5, 5 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range = negative number';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferGrowInplace( dst, -2, [ 5 ] );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'range[ 0 ] === range[ 1 ], src = array';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferGrowInplace( dst, [ 2, 2 ], [ 5 ] );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'range[ 0 ] = 0, range[ 1 ] = dst.length, src';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferGrowInplace( dst, [ 0, dst.length ], [ 1 ] );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'range[ 0 ] < 0, range[ 1 ] < 0, src';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferGrowInplace( dst, [ -5, -2 ], [ 1 ] );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'range[ 0 ] > range[ 1 ], src';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferGrowInplace( dst, [ 4, 1 ], [ 1 ] );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'range[ 0 ] > 0, range[ 1 ] > dst.length, src = number';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferGrowInplace( dst, [ 1, 8 ], 1 );
    var expected = buf( [ 0, 1, 2, 3, 1, 1, 1, 1 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'dst = empty BufferTyped, src';
    var dst = buf( [] );
    var got = _.bufferGrowInplace( dst, [ 0, 0 ], [ 2 ] );
    var expected = buf( [] );
    test.identical( got, expected );
    test.is( got === dst );

    var dst = buf( [] );
    var got = _.bufferGrowInplace( dst, [ 0, 0 ], [ 2 ] );
    var expected = buf( [] );
    test.identical( got, expected );
    test.is( got === dst );
  }

  /* BufferRaw and BufferView */

  var bufferRaw = ( src ) => new BufferRaw( src );
  var bufferView = ( src ) => new BufferView( new BufferRaw( src ) );

  var bufferExpected = function( dst, src )
  {
    if( _.bufferRawIs( dst ) )
    return new U8x( src ).buffer;
    else if( _.bufferViewIs( dst ) )
    return new BufferView( new U8x( src ).buffer );
  };

  /* - */

  test.open( 'bufferRaw' );
  run2( bufferRaw );
  test.close( 'bufferRaw' );

  /* - */

  test.open( 'bufferView' );
  run2( bufferView );
  test.close( 'bufferView' );

  /* - */

  function run2( buf )
  {
    test.case = 'src = undefined';
    var dst = buf( 4 );
    var got = _.bufferGrowInplace( dst, [ 1, 2 ] );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'src = undefined, range = undefined';
    var dst = buf( 4 );
    var got = _.bufferGrowInplace( dst );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'src = undefined, range = 0';
    var dst = buf( 4 );
    var got = _.bufferGrowInplace( dst, 0 );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'src = undefined, rang = negative number';
    var dst = buf( 4 );
    var got = _.bufferGrowInplace( dst, -5 );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'range = undefined, src = undefined';
    var dst = buf( 4 );
    var got = _.bufferGrowInplace( dst );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'src = array';
    var dst = buf( 4 );
    var src = new Array( 1, 2, 3 );
    var got = _.bufferGrowInplace( dst, [ 1, 2 ], src );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'src = unroll';
    var dst = buf( 4 );
    var src = _.unrollMake( [ 1, 2, 3 ] );
    var got = _.bufferGrowInplace( dst, [ 1, 5 ], src );
    var expected = bufferExpected( dst, 5 );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'src = argumentsArray';
    var dst = buf( 4 );
    var src = _.argumentsArrayMake( [ 1, 2, 3 ] );
    var got = _.bufferGrowInplace( dst, [ 1, 6 ], src );
    var expected = bufferExpected( dst, 6 );
    test.identical( got, expected );
    test.is( got !== dst );

    if( Config.interpreter === 'njs' )
    {
      test.case = 'src = bufferNode';
      var dst = buf( 4 );
      var src = BufferNode.from( [ 1, 2, 3 ] );
      var got = _.bufferGrowInplace( dst, [ 1, 2 ], src );
      var expected = bufferExpected( dst, 4 );
      test.identical( got, expected );
      test.is( got === dst );
    }

    test.case = 'src = bufferTyped';
    var dst = buf( 4 );
    var src = new I32x( 2 );
    var got = _.bufferGrowInplace( dst, [ 1, 3 ], src );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'range = number, src = number';
    var dst = buf( 4 );
    var got = _.bufferGrowInplace( dst, 6, 1 );
    var expected = bufferExpected( dst, [ 0, 0, 0, 0, 1, 1 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range = negative number';
    var dst = buf( 4 );
    var got = _.bufferGrowInplace( dst, -2, [ 5 ] );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'range[ 0 ] === range[ 1 ], src = array';
    var dst = buf( 4 );
    var got = _.bufferGrowInplace( dst, [ 2, 2 ], [ 5 ] );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'range[ 0 ] = 0, range[ 1 ] = dst.length, src';
    var dst = buf( 4 );
    var got = _.bufferGrowInplace( dst, [ 0, 4 ], [ 1 ] );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'range[ 0 ] < 0, range[ 1 ] < 0, src';
    var dst = buf( 4 );
    var got = _.bufferGrowInplace( dst, [ -5, -2 ], [ 1 ] );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'range[ 0 ] > range[ 1 ], src';
    var dst = buf( 4 );
    var got = _.bufferGrowInplace( dst, [ 4, 1 ], [ 1 ] );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'range[ 0 ] > 0, range[ 1 ] > dst.length, src';
    var dst = buf( 4 );
    var got = _.bufferGrowInplace( dst, [ 1, 8 ], 1 );
    var expected = bufferExpected( dst, [ 0, 0, 0, 0, 1, 1, 1, 1 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'dst = empty BufferTyped, src';
    var dst = buf( [] );
    var got = _.bufferGrowInplace( dst, [ 0, 0 ], [ 2 ] );
    var expected = bufferExpected( dst, [] );
    test.identical( got, expected );
    test.is( got === dst );
  }

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.bufferGrowInplace() );

  test.case = 'extra arguments';
  var dst = new I16x( 10 );
  test.shouldThrowErrorSync( () => _.bufferGrowInplace( dst, [ 1, 2 ], [ 1, 2 ], [ 4 ], 'extra' ) );

  test.case = 'wrong value in range';
  var dst = new I16x( 10 );
  test.shouldThrowErrorSync( () => _.bufferGrowInplace( dst, true, [ 2 ] ) );
  test.shouldThrowErrorSync( () => _.bufferGrowInplace( dst, null, [ 2 ] ) );
  test.shouldThrowErrorSync( () => _.bufferGrowInplace( dst, 'str', [ 2 ] ) );
  test.shouldThrowErrorSync( () => _.bufferGrowInplace( dst, [ 'str', 1 ], [ 2 ] ) );
  test.shouldThrowErrorSync( () => _.bufferGrowInplace( dst, [], [ 2 ] ) );

  test.case = 'wrong type of dst';
  test.shouldThrowErrorSync( () => _.bufferGrowInplace( 'str', [ 1, 3 ], [ 1 ] ) );

}

//

function bufferRelength( test )
{
  /* not a buffer, trivial */

  test.case = 'dst = array, src = array, range = negative number';
  var dst = [ 1, 2, 3, 4 ];
  var got = _.bufferRelength( dst, -5, [ 0 ] );
  test.identical( got, [ 1, 2, 3, 4 ] );
  test.is( got !== dst );

  test.case = 'dst = empty array, src = array, range[ 0 ] === range[ 1 ]';
  var dst = [];
  var got = _.bufferRelength( dst, [ 0, 0 ], [ 2 ] );
  test.identical( got, [] );
  test.is( got !== dst );

  test.case = 'dst = array, range[ 1 ] > dst.length, src = array';
  var dst = [ 1, 2, 3, 4 ];
  var got = _.bufferRelength( dst, [ 1, 5 ], [ 2 ] );
  test.identical( got, [ 2, 3, 4, [ 2 ] ] );
  test.is( got !== dst );

  /* */

  test.case = 'dst = unroll, src = array, range = negative number';
  var dst = _.unrollFrom( [ 1, 2, 3, 4 ] );
  var got = _.bufferRelength( dst, -5, [ 2 ] );
  test.identical( got, [ 1, 2, 3, 4 ] );
  test.is( got !== dst );

  test.case = 'dst = empty unroll, src = array, range[ 0 ] === range[ 1 ]';
  var dst = _.unrollFrom( [] );
  var got = _.bufferRelength( dst, [ 0, 0 ], [ 2 ] );
  test.identical( got, [] );
  test.is( got !== dst );

  test.case = 'dst = unroll, src = array';
  var dst = _.unrollFrom( [ 1, 2, 3, 4 ] );
  var got = _.bufferRelength( dst, [ 1, 5 ], [ 2 ] );
  test.identical( got, [ 2, 3, 4, [ 2 ] ] );
  test.is( got !== dst );

  /* */

  test.case = 'dst = argumentsArray, src = array, range = negative number';
  var dst = _.argumentsArrayFrom( [ 1, 2, 3, 4 ] );
  var got = _.bufferRelength( dst, -5, [ 2 ] );
  test.identical( got, [ 1, 2, 3, 4 ] );
  test.is( got !== dst );

  test.case = 'dst = empty argumentsArray, src = array, range[ 0 ] === range[ 1 ]';
  var dst = _.argumentsArrayFrom( [] );
  var got = _.bufferRelength( dst, [ 0, 0 ], [ 2 ] );
  test.identical( got, [] );
  test.is( got !== dst );

  test.case = 'dst = argumentsArray, src = array';
  var dst = _.argumentsArrayFrom( [ 1, 2, 3, 4 ] );
  var got = _.bufferRelength( dst, [ 1, 5 ], [ 2 ] );
  test.identical( got, [ 2, 3, 4, [ 2 ] ] );
  test.is( got !== dst );

  /* BufferTyped and BufferNode */

  var bufferTyped = function( buf )
  {
    let name = buf.name;
    return { [ name ] : function( src ){ return new buf( src ) } } [ name ];
  };

  var bufferNode = function( src )
  {
    if( _.numberIs( src ) )
    return BufferNode.alloc( src );
    else
    return BufferNode.from( src );
  };

  /* - */

  var list =
  [
    I8x,
    U16x,
    F32x,
    F64x,

    // I8x,
    // U8x,
    // U8ClampedX,
    // I16x,
    // U16x,
    // I32x,
    // U32x,
    // F32x,
    // F64x,
  ];

  for( let i = 0; i < list.length; i++ )
  {
    test.open( list[ i ].name );
    run( bufferTyped( list[ i ] ) );
    test.close( list[ i ].name );
  }

  /* - */

  if( Config.interpreter === 'njs' )
  {
    test.open( 'bufferNode' );
    run( bufferNode );
    test.close( 'bufferNode' );
  }

  /* - */

  function run( buf )
  {
    test.case = 'src = undefined';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferRelength( dst, [ 1, 3 ] );
    var expected = buf( [ 1, 2 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'src = undefined, range = undefined';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferRelength( dst );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'src = undefined, range = 0';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferRelength( dst, 0 );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'src = undefined, rang = negative number';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferRelength( dst, -5 );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range = undefined, src = undefined';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferRelength( dst );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'src = array';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var src = new Array( 1, 2, 3 );
    var got = _.bufferRelength( dst, [ 1, 5 ], src );
    var expected = buf( [ 1, 2, 3, NaN ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'src = unroll';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var src = _.unrollMake( [ 1, 2, 3 ] );
    var got = _.bufferRelength( dst, [ -1, 5 ], src );
    var expected = buf( [ 0, 1, 2, 3, NaN ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'src = argumentsArray';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var src = _.argumentsArrayMake( [ 1, 2, 3 ] );
    var got = _.bufferRelength( dst, [ 1, 6 ], src );
    var expected = buf( [ 1, 2, 3, NaN, NaN ] );
    test.identical( got, expected );
    test.is( got !== dst );

    if( Config.interpreter === 'njs' )
    {
      test.case = 'src = bufferNode';
      var dst = buf( [ 0, 1, 2, 3 ] );
      var src = BufferNode.from( [ 1, 2, 3 ] );
      var got = _.bufferRelength( dst, [ 1, 3 ], src );
      var expected = buf( [ 1, 2 ] );
      test.identical( got, expected );
      test.is( got !== dst );
    }

    test.case = 'src = bufferTyped';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var src = new I32x( 2 );
    var got = _.bufferRelength( dst, [ 1, 5 ], src );
    var expected = buf( [ 1, 2, 3, NaN ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range = number, number > dst.length';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferRelength( dst, 6, [ 5 ] );
    var expected = buf( [] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range = negative number';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferRelength( dst, -2, [ 5 ] );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range[ 0 ] === range[ 1 ], src = array';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferRelength( dst, [ 2, 2 ], [ 5 ] );
    var expected = buf( [] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range[ 0 ] = 0, range[ 1 ] = dst.length, src';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferRelength( dst, [ 0, dst.length ], [ 1 ] );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range[ 0 ] < 0, range[ 1 ] < 0, src';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferRelength( dst, [ -5, -2 ], [ 1 ] );
    var expected = buf( [] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range[ 0 ] > range[ 1 ], src';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferRelength( dst, [ 4, 1 ], [ 1 ] );
    var expected = buf( [] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range[ 0 ] > 0, range[ 1 ] > dst.length, src = number';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferRelength( dst, [ 1, 8 ], 1 );
    var expected = buf( [ 1, 2, 3, 1, 1, 1, 1 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'dst = empty BufferTyped, src';
    var dst = buf( [] );
    var got = _.bufferRelength( dst, [ 0, 0 ], [ 2 ] );
    var expected = buf( [] );
    test.identical( got, expected );
    test.is( got !== dst );

    var dst = buf( [] );
    var got = _.bufferRelength( dst, [ 0, 0 ], [ 2 ] );
    var expected = buf( [] );
    test.identical( got, expected );
    test.is( got !== dst );
  }

  /* - */

  /* BufferRaw and BufferView */

  var bufferRaw = ( src ) => new BufferRaw( src );
  var bufferView = ( src ) => new BufferView( new BufferRaw( src ) );

  var bufferExpected = function( dst, src )
  {
    if( _.bufferRawIs( dst ) )
    return new U8x( src ).buffer;
    else if( _.bufferViewIs( dst ) )
    return new BufferView( new U8x( src ).buffer );
  };

  /* - */

  test.open( 'bufferRaw' );
  run2( bufferRaw );
  test.close( 'bufferRaw' );

  /* - */

  test.open( 'bufferView' );
  run2( bufferView );
  test.close( 'bufferView' );

  /* - */

  function run2( buf )
  {
    test.case = 'src = undefined';
    var dst = buf( 4 );
    var got = _.bufferRelength( dst, [ 1, 3 ] );
    var expected = bufferExpected( dst, 2 );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'src = undefined, range = undefined';
    var dst = buf( 4 );
    var got = _.bufferRelength( dst );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'src = undefined, range = 0';
    var dst = buf( 4 );
    var got = _.bufferRelength( dst, 0 );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'src = undefined, rang = negative number';
    var dst = buf( 4 );
    var got = _.bufferRelength( dst, -5 );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range = undefined, src = undefined';
    var dst = buf( 4 );
    var got = _.bufferRelength( dst );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'src = array';
    var dst = buf( 4 );
    var src = new Array( 1, 2, 3 );
    var got = _.bufferRelength( dst, [ 1, 3 ], src );
    var expected = bufferExpected( dst, 2 );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'src = unroll';
    var dst = buf( 4 );
    var src = _.unrollMake( [ 1, 2, 3 ] );
    var got = _.bufferRelength( dst, [ 1, 5 ], src );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'src = argumentsArray';
    var dst = buf( 4 );
    var src = _.argumentsArrayMake( [ 1, 2, 3 ] );
    var got = _.bufferRelength( dst, [ 1, 6 ], src );
    var expected = bufferExpected( dst, 5 );
    test.identical( got, expected );
    test.is( got !== dst );

    if( Config.interpreter === 'njs' )
    {
      test.case = 'src = bufferNode';
      var dst = buf( 4 );
      var src = BufferNode.from( [ 1, 2, 3 ] );
      var got = _.bufferRelength( dst, [ 1, 6 ], src );
      var expected = bufferExpected( dst, 5 );
      test.identical( got, expected );
      test.is( got !== dst );
    }

    test.case = 'src = bufferTyped';
    var dst = buf( 4 );
    var src = new I32x( 2 );
    var got = _.bufferRelength( dst, [ 1, 3 ], src );
    var expected = bufferExpected( dst, 2 );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range = number, src = number';
    var dst = buf( 4 );
    var got = _.bufferRelength( dst, 6, 1 );
    var expected = bufferExpected( dst, [] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range = negative number';
    var dst = buf( 4 );
    var got = _.bufferRelength( dst, -2, [ 5 ] );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range[ 0 ] === range[ 1 ], src = array';
    var dst = buf( 4 );
    var got = _.bufferRelength( dst, [ 2, 2 ], [ 5 ] );
    var expected = bufferExpected( dst, [] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range[ 0 ] = 0, range[ 1 ] = dst.length, src';
    var dst = buf( 4 );
    var got = _.bufferRelength( dst, [ 0, 4 ], [ 1 ] );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range[ 0 ] < 0, range[ 1 ] < 0, src';
    var dst = buf( 4 );
    var got = _.bufferRelength( dst, [ -5, -2 ], [ 1 ] );
    var expected = bufferExpected( dst, [] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range[ 0 ] > range[ 1 ], src';
    var dst = buf( 4 );
    var got = _.bufferRelength( dst, [ 4, 1 ], [ 1 ] );
    var expected = bufferExpected( dst, [] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range[ 0 ] > 0, range[ 1 ] > dst.length, src';
    var dst = buf( 4 );
    var got = _.bufferRelength( dst, [ 1, 8 ], 1 );
    var expected = bufferExpected( dst, [ 0, 0, 0, 1, 1, 1, 1 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'dst = empty BufferTyped, src';
    var dst = buf( [] );
    var got = _.bufferRelength( dst, [ 0, 0 ], [ 2 ] );
    var expected = bufferExpected( dst, [] );
    test.identical( got, expected );
    test.is( got !== dst );
  }

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.bufferRelength() );

  test.case = 'extra arguments';
  var dst = new I16x( 10 );
  test.shouldThrowErrorSync( () => _.bufferRelength( dst, [ 1, 2 ], [ 1, 2 ], [ 4 ], 'extra' ) );

  test.case = 'wrong value in range';
  var dst = new I16x( 10 );
  test.shouldThrowErrorSync( () => _.bufferRelength( dst, true, [ 2 ] ) );
  test.shouldThrowErrorSync( () => _.bufferRelength( dst, null, [ 2 ] ) );
  test.shouldThrowErrorSync( () => _.bufferRelength( dst, 'str', [ 2 ] ) );
  test.shouldThrowErrorSync( () => _.bufferRelength( dst, [ 'str', 1 ], [ 2 ] ) );
  test.shouldThrowErrorSync( () => _.bufferRelength( dst, [], [ 2 ] ) );

  test.case = 'wrong type of dst';
  test.shouldThrowErrorSync( () => _.bufferRelength( 'str', [ 1, 3 ], [ 1 ] ) );

}

//

function bufferRelengthInplace( test )
{
  /* not a buffer, trivial */

  test.case = 'dst = array, src = array, range = negative number';
  var dst = [ 1, 2, 3, 4 ];
  var got = _.bufferRelengthInplace( dst, -5, [ 0 ] );
  test.identical( got, [ 1, 2, 3, 4 ] );
  test.is( got === dst );

  test.case = 'dst = empty array, src = array, range[ 0 ] === range[ 1 ]';
  var dst = [];
  var got = _.bufferRelengthInplace( dst, [ 0, 0 ], [ 2 ] );
  test.identical( got, [] );
  test.is( got === dst );

  test.case = 'dst = array, range[ 1 ] > dst.length, src = array';
  var dst = [ 1, 2, 3, 4 ];
  var got = _.bufferRelengthInplace( dst, [ 1, 5 ], [ 2 ] );
  test.identical( got, [ 2, 3, 4, [ 2 ] ] );
  test.is( got === dst );

  /* */

  test.case = 'dst = unroll, src = array, range = negative number';
  var dst = _.unrollFrom( [ 1, 2, 3, 4 ] );
  var got = _.bufferRelengthInplace( dst, -5, [ 2 ] );
  test.identical( got, [ 1, 2, 3, 4 ] );
  test.is( got === dst );

  test.case = 'dst = empty unroll, src = array, range[ 0 ] === range[ 1 ]';
  var dst = _.unrollFrom( [] );
  var got = _.bufferRelengthInplace( dst, [ 0, 0 ], [ 2 ] );
  test.identical( got, [] );
  test.is( got === dst );

  test.case = 'dst = unroll, src = array';
  var dst = _.unrollFrom( [ 1, 2, 3, 4 ] );
  var got = _.bufferRelengthInplace( dst, [ 1, 5 ], [ 2 ] );
  test.identical( got, [ 2, 3, 4, [ 2 ] ] );
  test.is( got === dst );

  /* */

  test.case = 'dst = argumentsArray, src = array, range = negative number';
  var dst = _.argumentsArrayFrom( [ 1, 2, 3, 4 ] );
  var got = _.bufferRelengthInplace( dst, -5, [ 2 ] );
  test.identical( got, _.argumentsArrayMake( [ 1, 2, 3, 4 ] ) );
  test.is( got === dst );

  test.case = 'dst = empty argumentsArray, src = array, range[ 0 ] === range[ 1 ]';
  var dst = _.argumentsArrayFrom( [] );
  var got = _.bufferRelengthInplace( dst, [ 0, 0 ], [ 2 ] );
  test.identical( got, _.argumentsArrayMake( [] ) );
  test.is( got === dst );

  test.case = 'dst = argumentsArray, src = array';
  var dst = _.argumentsArrayFrom( [ 1, 2, 3, 4 ] );
  var got = _.bufferRelengthInplace( dst, [ 1, 5 ], [ 2 ] );
  test.identical( got, [ 2, 3, 4, [ 2 ] ] );
  test.is( got !== dst );

  /* BufferTyped and BufferNode */

  var bufferTyped = function( buf )
  {
    let name = buf.name;
    return { [ name ] : function( src ){ return new buf( src ) } } [ name ];
  };

  var bufferNode = function( src )
  {
    if( _.numberIs( src ) )
    return BufferNode.alloc( src );
    else
    return BufferNode.from( src );
  };

  /* - */

  var list =
  [
    I8x,
    U16x,
    F32x,
    F64x,

    // I8x,
    // U8x,
    // U8ClampedX,
    // I16x,
    // U16x,
    // I32x,
    // U32x,
    // F32x,
    // F64x,
  ];

  for( let i = 0; i < list.length; i++ )
  {
    test.open( list[ i ].name );
    run( bufferTyped( list[ i ] ) );
    test.close( list[ i ].name );
  }

  /* - */

  if( Config.interpreter === 'njs' )
  {
    test.open( 'bufferNode' );
    run( bufferNode );
    test.close( 'bufferNode' );
  }

  /* - */

  function run( buf )
  {
    test.case = 'src = undefined';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferRelengthInplace( dst, [ 1, 3 ] );
    var expected = buf( [ 1, 2 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'src = undefined, range = undefined';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferRelengthInplace( dst );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'src = undefined, range = 0';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferRelengthInplace( dst, 0 );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'src = undefined, rang = negative number';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferRelengthInplace( dst, -5 );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'range = undefined, src = undefined';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferRelengthInplace( dst );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'src = array';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var src = new Array( 1, 2, 3 );
    var got = _.bufferRelengthInplace( dst, [ 1, 5 ], src );
    var expected = buf( [ 1, 2, 3, NaN ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'src = unroll';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var src = _.unrollMake( [ 1, 2, 3 ] );
    var got = _.bufferRelengthInplace( dst, [ -1, 5 ], src );
    var expected = buf( [ 0, 1, 2, 3, NaN ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'src = argumentsArray';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var src = _.argumentsArrayMake( [ 1, 2, 3 ] );
    var got = _.bufferRelengthInplace( dst, [ 1, 6 ], src );
    var expected = buf( [ 1, 2, 3, NaN, NaN ] );
    test.identical( got, expected );
    test.is( got !== dst );

    if( Config.interpreter === 'njs' )
    {
      test.case = 'src = bufferNode';
      var dst = buf( [ 0, 1, 2, 3 ] );
      var src = BufferNode.from( [ 1, 2, 3 ] );
      var got = _.bufferRelengthInplace( dst, [ 1, 3 ], src );
      var expected = buf( [ 1, 2 ] );
      test.identical( got, expected );
      test.is( got !== dst );
    }

    test.case = 'src = bufferTyped';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var src = new I32x( 2 );
    var got = _.bufferRelengthInplace( dst, [ 1, 5 ], src );
    var expected = buf( [ 1, 2, 3, NaN ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range = number, number > dst.length';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferRelengthInplace( dst, 6, [ 5 ] );
    var expected = buf( [] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range = negative number';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferRelengthInplace( dst, -2, [ 5 ] );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'range[ 0 ] === range[ 1 ], src = array';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferRelengthInplace( dst, [ 2, 2 ], [ 5 ] );
    var expected = buf( [] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range[ 0 ] = 0, range[ 1 ] = dst.length, src';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferRelengthInplace( dst, [ 0, dst.length ], [ 1 ] );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'range[ 0 ] < 0, range[ 1 ] < 0, src';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferRelengthInplace( dst, [ -5, -2 ], [ 1 ] );
    var expected = buf( [] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range[ 0 ] > range[ 1 ], src';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferRelengthInplace( dst, [ 4, 1 ], [ 1 ] );
    var expected = buf( [] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range[ 0 ] > 0, range[ 1 ] > dst.length, src = number';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferRelengthInplace( dst, [ 1, 8 ], 1 );
    var expected = buf( [ 1, 2, 3, 1, 1, 1, 1 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'dst = empty BufferTyped, src';
    var dst = buf( [] );
    var got = _.bufferRelengthInplace( dst, [ 0, 0 ], [ 2 ] );
    var expected = buf( [] );
    test.identical( got, expected );
    test.is( got === dst );

    var dst = buf( [] );
    var got = _.bufferRelengthInplace( dst, [ 0, 0 ], [ 2 ] );
    var expected = buf( [] );
    test.identical( got, expected );
    test.is( got === dst );
  }

  /* - */

  /* BufferRaw and BufferView */

  var bufferRaw = ( src ) => new BufferRaw( src );
  var bufferView = ( src ) => new BufferView( new BufferRaw( src ) );

  var bufferExpected = function( dst, src )
  {
    if( _.bufferRawIs( dst ) )
    return new U8x( src ).buffer;
    else if( _.bufferViewIs( dst ) )
    return new BufferView( new U8x( src ).buffer );
  };

  /* - */

  test.open( 'bufferRaw' );
  run2( bufferRaw );
  test.close( 'bufferRaw' );

  /* - */

  test.open( 'bufferView' );
  run2( bufferView );
  test.close( 'bufferView' );

  /* - */

  function run2( buf )
  {
    test.case = 'src = undefined';
    var dst = buf( 4 );
    var got = _.bufferRelengthInplace( dst, [ 1, 3 ] );
    var expected = bufferExpected( dst, 2 );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'src = undefined, range = undefined';
    var dst = buf( 4 );
    var got = _.bufferRelengthInplace( dst );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'src = undefined, range = 0';
    var dst = buf( 4 );
    var got = _.bufferRelengthInplace( dst, 0 );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'src = undefined, rang = negative number';
    var dst = buf( 4 );
    var got = _.bufferRelengthInplace( dst, -5 );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'range = undefined, src = undefined';
    var dst = buf( 4 );
    var got = _.bufferRelengthInplace( dst );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'src = array';
    var dst = buf( 4 );
    var src = new Array( 1, 2, 3 );
    var got = _.bufferRelengthInplace( dst, [ 1, 3 ], src );
    var expected = bufferExpected( dst, 2 );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'src = unroll';
    var dst = buf( 4 );
    var src = _.unrollMake( [ 1, 2, 3 ] );
    var got = _.bufferRelengthInplace( dst, [ 1, 5 ], src );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'src = argumentsArray';
    var dst = buf( 4 );
    var src = _.argumentsArrayMake( [ 1, 2, 3 ] );
    var got = _.bufferRelengthInplace( dst, [ 1, 6 ], src );
    var expected = bufferExpected( dst, 5 );
    test.identical( got, expected );
    test.is( got !== dst );

    if( Config.interpreter === 'njs' )
    {
      test.case = 'src = bufferNode';
      var dst = buf( 4 );
      var src = BufferNode.from( [ 1, 2, 3 ] );
      var got = _.bufferRelengthInplace( dst, [ 1, 6 ], src );
      var expected = bufferExpected( dst, 5 );
      test.identical( got, expected );
      test.is( got !== dst );
    }

    test.case = 'src = bufferTyped';
    var dst = buf( 4 );
    var src = new I32x( 2 );
    var got = _.bufferRelengthInplace( dst, [ 1, 3 ], src );
    var expected = bufferExpected( dst, 2 );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range = number, src = number';
    var dst = buf( 4 );
    var got = _.bufferRelengthInplace( dst, 6, 1 );
    var expected = bufferExpected( dst, [] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range = negative number';
    var dst = buf( 4 );
    var got = _.bufferRelengthInplace( dst, -2, [ 5 ] );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'range[ 0 ] === range[ 1 ], src = array';
    var dst = buf( 4 );
    var got = _.bufferRelengthInplace( dst, [ 2, 2 ], [ 5 ] );
    var expected = bufferExpected( dst, [] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range[ 0 ] = 0, range[ 1 ] = dst.length, src';
    var dst = buf( 4 );
    var got = _.bufferRelengthInplace( dst, [ 0, 4 ], [ 1 ] );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'range[ 0 ] < 0, range[ 1 ] < 0, src';
    var dst = buf( 4 );
    var got = _.bufferRelengthInplace( dst, [ -5, -2 ], [ 1 ] );
    var expected = bufferExpected( dst, [] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range[ 0 ] > range[ 1 ], src';
    var dst = buf( 4 );
    var got = _.bufferRelengthInplace( dst, [ 4, 1 ], [ 1 ] );
    var expected = bufferExpected( dst, [] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range[ 0 ] > 0, range[ 1 ] > dst.length, src';
    var dst = buf( 4 );
    var got = _.bufferRelengthInplace( dst, [ 1, 8 ], 1 );
    var expected = bufferExpected( dst, [ 0, 0, 0, 1, 1, 1, 1 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'dst = empty BufferTyped, src';
    var dst = buf( [] );
    var got = _.bufferRelengthInplace( dst, [ 0, 0 ], [ 2 ] );
    var expected = bufferExpected( dst, [] );
    test.identical( got, expected );
    test.is( got === dst );
  }

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.bufferRelengthInplace() );

  test.case = 'extra arguments';
  var dst = new I16x( 10 );
  test.shouldThrowErrorSync( () => _.bufferRelengthInplace( dst, [ 1, 2 ], [ 1, 2 ], [ 4 ], 'extra' ) );

  test.case = 'wrong value in range';
  var dst = new I16x( 10 );
  test.shouldThrowErrorSync( () => _.bufferRelengthInplace( dst, true, [ 2 ] ) );
  test.shouldThrowErrorSync( () => _.bufferRelengthInplace( dst, null, [ 2 ] ) );
  test.shouldThrowErrorSync( () => _.bufferRelengthInplace( dst, 'str', [ 2 ] ) );
  test.shouldThrowErrorSync( () => _.bufferRelengthInplace( dst, [ 'str', 1 ], [ 2 ] ) );
  test.shouldThrowErrorSync( () => _.bufferRelengthInplace( dst, [], [ 2 ] ) );

  test.case = 'wrong type of dst';
  test.shouldThrowErrorSync( () => _.bufferRelengthInplace( 'str', [ 1, 3 ], [ 1 ] ) );

}

//

function bufferRelen( test )
{

  test.case = 'second argument is more than ints.length';
  var ints = new I8x( [ 3, 7, 13 ] );
  var got = _.bufferRelen( ints, 4 );
  var expected = got; // [ 3, 7, 13, 0 ];
  test.identical( got, expected );

  test.case = 'second argument is less than ints2.length';
  var ints2 = new I16x( [ 3, 7, 13, 33, 77 ] );
  var got = _.bufferRelen( ints2, 3 );
  var expected = got; // [ 3, 7, 13 ];
  test.identical( got, expected );

  test.case = 'invalid values are replaced by zero';
  var ints3 = new I32x( [ 3, 'a', 13, 'b', 77 ] );
  var got = _.bufferRelen( ints3, 6 );
  var expected = got; // [ 3, 0, 13, 0, 77, 0 ];
  test.identical( got, expected );

  test.case = 'returns the initial typed array';
  var floats = new F32x( [ 3.35, 7.5, 13.35, 33.75, 77.25 ] );
  var got = _.bufferRelen( floats, 5 );
  var expected = got; // [ 3.3499999046325684, 7.5, 13.350000381469727, 33.75, 77.25 ];
  test.identical( got, expected );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'no arguments';
  test.shouldThrowErrorSync( function()
  {
    _.bufferRelen();
  });
};

//

function bufferResize( test )
{
  /* raw buffer */

  test.case = 'size = number, new size = buffer size';
  var src = new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ] ).buffer;
  var got = _.bufferResize( src, src.byteLength );
  var expected = new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ] ).buffer;
  test.identical( got, expected );
  test.is( got !== src );
  test.is( _.bufferRawIs( got ) );

  test.case = 'size = number, new size < buffer size';
  var src = new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ] ).buffer;
  var got = _.bufferResize( src, 5 );
  var expected = new U8x( [ 1, 2, 3, 4, 5 ] ).buffer;
  test.identical( got, expected );
  test.is( got !== src );
  test.is( _.bufferRawIs( got ) );

  test.case = 'size = number, new size > buffer size';
  var src = new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ] ).buffer;
  var got = _.bufferResize( src, 15 );
  var expected = new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 0, 0, 0, 0, 0 ] ).buffer;
  test.identical( got, expected );
  test.is( got !== src );
  test.is( _.bufferRawIs( got ) );

  /* */

  test.case = 'size = range, new offset = buffer offset, new size = buffer size';
  var src = new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ] ).buffer;
  var got = _.bufferResize( src, [ 0, src.byteLength ] );
  var expected = new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ] ).buffer;
  test.identical( got, expected );
  test.is( got !== src );
  test.is( _.bufferRawIs( got ) );

  test.case = 'size = range, new offset = 0, new size < buffer size';
  var src = new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ] ).buffer;
  var got = _.bufferResize( src, [ 0, 8 ] );
  var expected = new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8 ] ).buffer;
  test.identical( got, expected );
  test.is( got !== src );
  test.is( _.bufferRawIs( got ) );

  test.case = 'size = range, new offset < buffer offset, new size > buffer size';
  var src = new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ] ).buffer;
  var got = _.bufferResize( src, [ -3, 11 ] );
  var expected = new U8x( [ 0, 0, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 0 ] ).buffer;
  test.identical( got, expected );
  test.is( got !== src );
  test.is( _.bufferRawIs( got ) );

  test.case = 'size = range, new offset > buffer offset, new size > buffer size';
  var src = new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ] ).buffer;
  var got = _.bufferResize( src, [ 5, 12 ] );
  var expected = new U8x( [ 6, 7, 8, 9, 10, 0, 0 ] ).buffer;
  test.identical( got, expected );
  test.is( got !== src );
  test.is( _.bufferRawIs( got ) );

  /* buffer constructors */

  var bufferNode = ( buf, offset, length ) => BufferNode.from( buf, offset, length );
  var bufferView = ( buf, offset, length ) => new BufferView( buf, offset, length );
  var bufferTyped = function( buf )
  {
    let name = buf.name;
    return { [ name ] : function( src, offset, length ){ return new buf( src, offset, length ) } } [ name ];
  };

  /* expected result */

  var expect = function( buf, offset, length )
  {
    let buffer = _.bufferRelength( buf.buffer, [ offset, offset + length ] );
    if( _.bufferViewIs( buf ) )
    return bufferView( buffer );
    else
    return new buf.constructor( buffer );
  }

  /* tests */

  var typedList =
  [
    I8x,
    U16x,
    F32x,
    F64x,

    // I8x,
    // U8x,
    // U8ClampedX,
    // I16x,
    // U16x,
    // I32x,
    // U32x,
    // F32x,
    // F64x,
  ];

  var list =
  [
    bufferView,
  ];
  if( Config.interpreter === 'njs' )
  list.push( bufferNode );
  for( let i = 0; i < typedList.length; i++ )
  list.push( bufferTyped( typedList[ i ] ) );


  for( let r = 0; r < list.length; r++ )
  {
    test.open( list[ r ].name );
    run( list[ r ] );
    test.close( list[ r ].name );
  }

  /* - */

  function run( buf )
  {
    var filledBuf = new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 1, 2, 3, 4, 5 ] ).buffer;

    /* */

    test.case = 'size = number, new size = buffer size';
    var src = buf( filledBuf, 8, 2 );
    var got = _.bufferResize( src, src.byteLength );
    var expected = expect( src, 8, src.byteLength );
    test.identical( got, expected );
    test.is( got !== src );
    test.is( src.constructor.name === got.constructor.name );

    test.case = 'size = number, new size < buffer size';
    var src = buf( filledBuf, 0, 3 );
    var got = _.bufferResize( src, 16 );
    var expected = expect( src, 0, 16 );
    test.identical( got, expected );
    test.is( got !== src );
    test.is( src.constructor.name === got.constructor.name );

    test.case = 'size = number, new size > buffer size';
    var src = buf( filledBuf, 16, 1 );
    var got = _.bufferResize( src, 32 );
    var expected = expect( src, 16, 32 );
    test.identical( got, expected );
    test.is( got !== src );
    test.is( src.constructor.name === got.constructor.name );

    /* */

    test.case = 'size = range, new offset = buffer offset, new size = buffer size';
    var src = buf( filledBuf, 8, 2 );
    var got = _.bufferResize( src, [ 0, src.byteLength ] );
    var expected = expect( src, 8, src.byteLength );
    test.identical( got, expected );
    test.is( got !== src );
    test.is( src.constructor.name === got.constructor.name );

    test.case = 'size = range, new offset = 0, new size < buffer size';
    var src = buf( filledBuf, 8, 2 );
    var got = _.bufferResize( src, [ -8, 8 ] );
    var expected = expect( src, 0, 16 );
    test.identical( got, expected );
    test.is( got !== src );
    test.is( src.constructor.name === got.constructor.name );

    test.case = 'size = range, new offset < buffer offset, new size > buffer size';
    var src = buf( filledBuf, 16, 1 );
    var got = _.bufferResize( src, [ -8, 24 ] );
    var expected = expect( src, 8, 32 );
    test.identical( got, expected );
    test.is( got !== src );
    test.is( src.constructor.name === got.constructor.name );

    test.case = 'size = range, new offset > buffer offset, new size > buffer size';
    var src = buf( filledBuf, 8, 1 );
    var got = _.bufferResize( src, [ -16, 0 ] );
    var expectedBuf = new U8x( [ 0, 0, 0, 0, 0, 0, 0, 0, 1, 2, 3, 4, 5, 6, 7, 8 ] ).buffer;
    var expected = buf( expectedBuf );
    test.identical( got, expected );
    test.is( got !== src );
    test.is( src.constructor.name === got.constructor.name );
  }

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.bufferResize() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.bufferResize( new BufferRaw( 5 ), 1 , 2 ) );

  test.case = 'not a buffer';
  test.shouldThrowErrorSync( () => _.bufferResize( [ 1, 2 ], 1 ) );

  test.case = 'not a range';
  test.shouldThrowErrorSync( () => _.bufferResize( new Fx(), 'not a range' ) );
  test.shouldThrowErrorSync( () => _.bufferResize( new U8x( 1 ), [ 1 ] ) );
  test.shouldThrowErrorSync( () => _.bufferResize( new I16x( 2 ), undefined ) );
}

//

function bufferResizeInplace( test )
{
  /* raw buffer */

  test.case = 'size = number, new size = buffer size';
  var src = new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ] ).buffer;
  var got = _.bufferResizeInplace( src, src.byteLength );
  var expected = new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ] ).buffer;
  test.identical( got, expected );
  test.is( got === src );
  test.is( _.bufferRawIs( got ) );

  test.case = 'size = number, new size < buffer size';
  var src = new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ] ).buffer;
  var got = _.bufferResizeInplace( src, 5 );
  var expected = new U8x( [ 1, 2, 3, 4, 5 ] ).buffer;
  test.identical( got, expected );
  test.is( got !== src );
  test.is( _.bufferRawIs( got ) );

  test.case = 'size = number, new size > buffer size';
  var src = new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ] ).buffer;
  var got = _.bufferResizeInplace( src, 15 );
  var expected = new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 0, 0, 0, 0, 0 ] ).buffer;
  test.identical( got, expected );
  test.is( got !== src );
  test.is( _.bufferRawIs( got ) );

  /* */

  test.case = 'size = range, new offset = buffer offset, new size = buffer size';
  var src = new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ] ).buffer;
  var got = _.bufferResizeInplace( src, [ 0, src.byteLength ] );
  var expected = new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ] ).buffer;
  test.identical( got, expected );
  test.is( got === src );
  test.is( _.bufferRawIs( got ) );

  test.case = 'size = range, new offset = 0, new size < buffer size';
  var src = new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ] ).buffer;
  var got = _.bufferResizeInplace( src, [ 0, 8 ] );
  var expected = new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8 ] ).buffer;
  test.identical( got, expected );
  test.is( got !== src );
  test.is( _.bufferRawIs( got ) );

  test.case = 'size = range, new offset < buffer offset, new size > buffer size';
  var src = new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ] ).buffer;
  var got = _.bufferResizeInplace( src, [ -3, 11 ] );
  var expected = new U8x( [ 0, 0, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 0 ] ).buffer;
  test.identical( got, expected );
  test.is( got !== src );
  test.is( _.bufferRawIs( got ) );

  test.case = 'size = range, new offset > buffer offset, new size > buffer size';
  var src = new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ] ).buffer;
  var got = _.bufferResizeInplace( src, [ 5, 12 ] );
  var expected = new U8x( [ 6, 7, 8, 9, 10, 0, 0 ] ).buffer;
  test.identical( got, expected );
  test.is( got !== src );
  test.is( _.bufferRawIs( got ) );

  /* buffer constructors */

  var bufferNode = ( buf, offset, length ) => BufferNode.from( buf, offset, length );
  var bufferView = ( buf, offset, length ) => new BufferView( buf, offset, length );
  var bufferTyped = function( buf )
  {
    let name = buf.name;
    return { [ name ] : function( src, offset, length ){ return new buf( src, offset, length ) } } [ name ];
  };

  /* expected result */

  var expect = function( buf, offset, length )
  {
    let buffer = _.bufferRelength( buf.buffer, [ offset, offset + length ] );
    if( _.bufferViewIs( buf ) )
    return bufferView( buffer );
    else
    return new buf.constructor( buffer );
  }

  /* tests */

  var typedList =
  [
    I8x,
    U16x,
    F32x,
    F64x,

    // I8x,
    // U8x,
    // U8ClampedX,
    // I16x,
    // U16x,
    // I32x,
    // U32x,
    // F32x,
    // F64x,
  ];

  var list =
  [
    bufferView,
  ];
  if( Config.interpreter === 'njs' )
  list.push( bufferNode );
  for( let i = 0; i < typedList.length; i++ )
  list.push( bufferTyped( typedList[ i ] ) );


  for( let r = 0; r < list.length; r++ )
  {
    test.open( list[ r ].name );
    run( list[ r ] );
    test.close( list[ r ].name );
  }

  /* - */

  function run( buf )
  {
    var filledBuf = new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 1, 2, 3, 4, 5 ] ).buffer;

    /* */

    test.case = 'size = number, new size = buffer size';
    var src = buf( filledBuf, 8, 2 );
    var got = _.bufferResizeInplace( src, src.byteLength );
    var expected = expect( src, 8, src.byteLength );
    test.identical( got, expected );
    test.is( got === src );
    test.is( src.constructor.name === got.constructor.name );

    test.case = 'size = number, new size < buffer size';
    var src = buf( filledBuf, 0, 3 );
    var got = _.bufferResizeInplace( src, 16 );
    var expected = expect( src, 0, 16 );
    test.identical( got, expected );
    test.is( got !== src );
    test.is( src.constructor.name === got.constructor.name );

    test.case = 'size = number, new size > buffer size';
    var src = buf( filledBuf, 16, 1 );
    var got = _.bufferResizeInplace( src, 32 );
    var expected = expect( src, 16, 32 );
    test.identical( got, expected );
    test.is( got !== src );
    test.is( src.constructor.name === got.constructor.name );

    /* */

    test.case = 'size = range, new offset = buffer offset, new size = buffer size';
    var src = buf( filledBuf, 8, 2 );
    var got = _.bufferResizeInplace( src, [ 0, src.byteLength ] );
    var expected = expect( src, 8, src.byteLength );
    test.identical( got, expected );
    test.is( got === src );
    test.is( src.constructor.name === got.constructor.name );

    test.case = 'size = range, new offset = 0, new size < buffer size';
    var src = buf( filledBuf, 8, 2 );
    var got = _.bufferResizeInplace( src, [ -8, 8 ] );
    var expected = expect( src, 0, 16 );
    test.identical( got, expected );
    test.is( got !== src );
    test.is( src.constructor.name === got.constructor.name );

    test.case = 'size = range, new offset < buffer offset, new size > buffer size';
    var src = buf( filledBuf, 16, 1 );
    var got = _.bufferResizeInplace( src, [ -8, 24 ] );
    var expected = expect( src, 8, 32 );
    test.identical( got, expected );
    test.is( got !== src );
    test.is( src.constructor.name === got.constructor.name );

    test.case = 'size = range, new offset > buffer offset, new size > buffer size';
    var src = buf( filledBuf, 8, 1 );
    var got = _.bufferResizeInplace( src, [ -16, 0 ] );
    var expectedBuf = new U8x( [ 0, 0, 0, 0, 0, 0, 0, 0, 1, 2, 3, 4, 5, 6, 7, 8 ] ).buffer;
    var expected = buf( expectedBuf );
    test.identical( got, expected );
    test.is( got !== src );
    test.is( src.constructor.name === got.constructor.name );
  }

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.bufferResizeInplace() );

  test.case = 'extra arguments';
  var buffer = new BufferRaw( 5 );
  test.shouldThrowErrorSync( () => _.bufferResizeInplace( buffer, 1 , 2 ) );

  test.case = 'not a buffer';
  test.shouldThrowErrorSync( () => _.bufferResizeInplace( [ 1, 2 ], 1 ) );

  test.case = 'not a range';
  test.shouldThrowErrorSync( () => _.bufferResizeInplace( new Fx(), 'not a range' ) );
  test.shouldThrowErrorSync( () => _.bufferResizeInplace( new U8x( 1 ), [ 1 ] ) );
  test.shouldThrowErrorSync( () => _.bufferResizeInplace( new I16x( 2 ), undefined ) );
}

//

function bufferRetype( test )
{

  test.case = 'converts and returns the new type of I16x';
  var view1 = new I8x( [ 1, 2, 3, 4, 5, 6 ] );
  var got = _.bufferRetype(view1, I16x);
  var expected = got; // [ 513, 1027, 1541 ];
  test.identical( got, expected );

  test.case = 'converts and returns the new type of I8x';
  var view1 = new I16x( [ 513, 1027, 1541 ] );
  var got = _.bufferRetype(view1, I8x);
  var expected = got; // [ 1, 2, 3, 4, 5, 6 ];
  test.identical( got, expected );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'no arguments';
  test.shouldThrowErrorSync( function()
  {
    _.bufferRetype();
  });

  test.case = 'arguments are wrong';
  test.shouldThrowErrorSync( function()
  {
    _.bufferRetype( 'wrong argument', 'wrong argument' );
  });

};

//

// function bufferJoin( test )
// {
//  test.case = 'empty call';
//  test.identical( _.bufferJoin(), null );
//
//  test.case = 'empty arrays';
//  test.identical( _.bufferJoin( [], [] ), null );
//
//  test.case = 'simple';
//
//  var src = [ 1 ];
//  var got = _.bufferJoin( src );
//  var expected = src;
//  test.identical( got, expected );
//
//  var src = [ 1 ];
//  var got = _.bufferJoin( src, src );
//  var expected = [ 1, 1 ];
//  test.identical( got, expected );
//
//  test.case = 'array + typedArray';
//  var got = _.bufferJoin( [ 1 ], new U8x( [ 1, 2 ] ) );
//  var expected = [ 1, 1, 2 ];
//  test.identical( got, expected );
//
//  var got = _.bufferJoin( new U8x( [ 1, 2 ] ), [ 1 ] );
//  var expected = new U8x( [ 1, 2, 1 ] );
//  test.identical( got, expected );
//
//  test.case = 'typedArray + typedArray';
//  var got = _.bufferJoin( new U8x( [ 1, 2 ] ), new U8x( [ 1, 2 ] ) );
//  var expected = new U8x( [ 1, 2, 1, 2 ] );
//  test.identical( got, expected );
//
//  var got = _.bufferJoin( new U8x( [ 1, 2 ] ), new U16x( [ 1, 2 ] ) );
//  var expected = new U8x( [ 1, 2, 1, 0, 2, 0 ] );
//  test.identical( got, expected );
//
//  test.case = 'arrayBuffer + arrayBuffer';
//  var src = new U8x( [ 1, 2 ] );
//  var got = _.bufferJoin( src.buffer, src.buffer );
//  test.is( _.bufferRawIs( got ) );
//  var expected = new U8x( [ 1, 2, 1, 2 ] );
//  test.identical( new U8x( got ), expected );
//
//  test.case = 'arrayBuffer + array';
//  var src = new U8x( [ 1, 2 ] );
//  var got = _.bufferJoin( src.buffer, [ 1, 2 ] );
//  test.is( _.bufferRawIs( got ) );
//  var expected = new U8x( [ 1, 2, 1, 2 ] );
//  test.identical( new U8x( got ), expected );
//
//  test.case = 'arrayBuffer + typedArray';
//  var src = new U8x( [ 1, 2 ] );
//  var got = _.bufferJoin( src.buffer, src );
//  test.is( _.bufferRawIs( got ) );
//  var expected = new U8x( [ 1, 2, 1, 2 ] );
//  test.identical( new U8x( got ), expected );
//
//  test.case = 'typedArray + arrayBuffer';
//  var src = new U8x( [ 1, 2 ] );
//  var got = _.bufferJoin( src, src.buffer );
//  var expected = new U8x( [ 1, 2, 1, 2 ] );
//  test.identical( got, expected );
//
//  test.case = 'typedArray + arrayBuffer + array';
//  var src = new U8x( [ 1 ] );
//  var got = _.bufferJoin( src, src.buffer, [ 1 ] );
//  var expected = new U8x( [ 1, 1, 1 ] );
//  test.identical( got, expected );
//
//  test.case = 'array + typedArray + arrayBuffer';
//  var src = new U8x( [ 1 ] );
//  var got = _.bufferJoin( [ 1 ], src, src.buffer );
//  var expected = [ 1, 1, 1 ];
//  test.identical( got, expected );
//
//  test.case = 'arrayBuffer + array + typedArray';
//  var src = new U8x( [ 1 ] );
//  var got = _.bufferJoin( src.buffer, [ 1 ], src  );
//  test.is( _.bufferRawIs( got ) );
//  var expected = new U8x( [ 1, 1, 1 ] );
//  test.identical( new U8x( got ), expected );
//
//  if( Config.interpreter === 'njs' )
//  {
//    test.case = 'buffer';
//    var got = _.bufferJoin( BufferNode.from( '1' ), [ 1 ] );
//    var expected = BufferNode.from( [ 49, 1 ] );
//    test.identical( got, expected );
//
//    test.case = 'buffer + arrayBuffer';
//    var raw = new U8x( [ 1 ] ).buffer;
//    var got = _.bufferJoin( BufferNode.from( '1' ), raw );
//    var expected = BufferNode.from( [ 49, 1 ] );
//    test.identical( got, expected );
//
//    test.case = 'buffer + typedArray';
//    var typed = new U8x( [ 1 ] );
//    var got = _.bufferJoin( BufferNode.from( '1' ), typed );
//    var expected = BufferNode.from( [ 49, 1 ] );
//    test.identical( got, expected );
//
//    test.case = 'buffer + typedArray + raw + array';
//    var typed = new U8x( [ 1 ] );
//    var got = _.bufferJoin( BufferNode.from( '1' ), typed, typed.buffer, [ 1 ] );
//    var expected = BufferNode.from( [ 49, 1, 1, 1 ] );
//    test.identical( got, expected );
//
//    test.case = 'typedArray + buffer + raw + array';
//    var typed = new U8x( [ 1 ] );
//    var got = _.bufferJoin( typed, BufferNode.from( '1' ), typed.buffer, [ 1 ] );
//    var expected = new U8x( [ 1, 49, 1, 1 ] );
//    test.identical( got, expected );
//
//    test.case = 'raw + typedArray + buffer + array';
//    var typed = new U8x( [ 1 ] );
//    var got = _.bufferJoin( typed.buffer, typed, BufferNode.from( '1' ), [ 1 ] );
//    var expected = new U8x( [ 1, 1, 49, 1 ] );
//    test.identical( new U8x( got ), expected );
//
//    test.case = 'array + raw + typedArray + buffer ';
//    var typed = new U8x( [ 1 ] );
//    var got = _.bufferJoin( [ 1 ], typed.buffer, typed, BufferNode.from( '1' )  );
//    var expected = new U8x( [ 1, 1, 1, 49 ] );
//    test.identical( new U8x( got ), expected );
//  }
//
//  if( !Config.debug )
//  return;
//
//  test.shouldThrowErrorSync( () => _.bufferJoin( [ 1 ], '1' ) );
//  test.shouldThrowErrorSync( () => _.bufferJoin( [ 1 ], { byteLength : 5 } ) );
//
// }

//

function bufferFrom( test )
{
  /*src: number, str, array, raw, typed, node */
  /*bufferConstructor: typed, raw, node */

  /* typed buffer */

  test.case = 'src:number, bufferConstructor:typed buffer';
  var src = 1;
  var got = _.bufferFrom({ /*ttt*/src, bufferConstructor : U8x });
  var expected = new U8x( [ src ] );
  test.identical( got, expected );

  test.case = 'src:str, bufferConstructor:typed buffer';
  var src = 'abc';
  var got = _.bufferFrom({ /*ttt*/src, bufferConstructor : U8x });
  var expected = new U8x( [ 97, 98, 99 ] );
  test.identical( got, expected );

  test.case = 'src:array, bufferConstructor:typed buffer';
  var src = [ 97, 98, 99 ];
  var got = _.bufferFrom({ /*ttt*/src, bufferConstructor : U8x });
  var expected = new U8x( [ 97, 98, 99 ] );
  test.identical( got, expected );

  test.case = 'src:raw buffer, bufferConstructor:typed buffer';
  var src = new BufferRaw( 3 );
  var got = _.bufferFrom({ /*ttt*/src, bufferConstructor : U8x });
  var expected = new U8x( [ 0, 0, 0 ] );
  test.identical( got, expected );

  test.case = 'src:typed, bufferConstructor:typed buffer';
  var src = new I32x( [ 97, 98, 99 ] );
  var got = _.bufferFrom({ /*ttt*/src, bufferConstructor : U8x });
  var expected = new U8x( [ 97, 98, 99 ] );
  test.identical( got, expected );

  if( Config.interpreter === 'njs' )
  {
    test.case = 'src:node buffer, bufferConstructor:typed buffer';
    var src = BufferNode.from( [ 97, 98, 99 ] );
    var got = _.bufferFrom({ /*ttt*/src, bufferConstructor : U8x });
    var expected = new U8x( [ 97, 98, 99 ] );
    test.identical( got, expected );
  }

  /* raw buffer */

  test.case = 'src:number, bufferConstructor:raw buffer';
  var src = 1;
  var got = _.bufferFrom({ /*ttt*/src, bufferConstructor : BufferRaw });
  var expected = new U8x( 1 ).buffer;
  test.identical( got, expected );

  test.case = 'src:str, bufferConstructor:raw buffer';
  var src = 'abc';
  var got = _.bufferFrom({ /*ttt*/src, bufferConstructor : BufferRaw });
  var expected = new U8x().buffer;
  test.identical( got, expected );

  test.case = 'src:array, bufferConstructor:raw buffer';
  var src = [ 97, 98, 99 ];
  var got = _.bufferFrom({ /*ttt*/src, bufferConstructor : BufferRaw });
  var expected = new U8x().buffer;
  test.identical( got, expected );

  test.case = 'src:raw buffer, bufferConstructor:raw buffer';
  var src = new BufferRaw( 3 );
  var got = _.bufferFrom({ /*ttt*/src, bufferConstructor : BufferRaw });
  var expected = new U8x( 3 ).buffer;
  test.identical( got, expected );

  test.case = 'src:typed, bufferConstructor:raw buffer';
  var src = new I32x( [ 97, 98, 99 ] );
  var got = _.bufferFrom({ /*ttt*/src, bufferConstructor : BufferRaw });
  var expected = new I32x().buffer;
  test.identical( got, expected );

  if( Config.interpreter === 'njs' )
  {
    test.case = 'src:node buffer, bufferConstructor:raw buffer';
    var src = BufferNode.from( [ 97, 98, 99 ] );
    var got = _.bufferFrom({ /*ttt*/src, bufferConstructor : BufferRaw });
    var expected = new U8x().buffer;
    test.identical( got, expected );
  }

  if( !Config.interpreter === 'njs' )
  return;

  /* node buffer */

  test.case = 'src:number, bufferConstructor:node buffer';
  var src = 1;
  var got = _.bufferFrom({ /*ttt*/src, bufferConstructor : BufferNode });
  var expected = BufferNode.from( [ src ] );
  test.identical( got, expected );

  test.case = 'src:str, bufferConstructor:node buffer';
  var src = 'abc';
  var got = _.bufferFrom({ /*ttt*/src, bufferConstructor : BufferNode });
  var expected = BufferNode.from( src );
  test.identical( got, expected );

  test.case = 'src:array, bufferConstructor:node buffer';
  var src = [ 97, 98, 99 ];
  var got = _.bufferFrom({ /*ttt*/src, bufferConstructor : BufferNode });
  var expected = BufferNode.from( src );
  test.identical( got, expected );

  test.case = 'src:raw buffer, bufferConstructor:node buffer';
  var src = new BufferRaw( 3 );
  var got = _.bufferFrom({ /*ttt*/src, bufferConstructor : BufferNode });
  var expected = BufferNode.from( src );
  test.identical( got, expected );

  test.case = 'src:typed, bufferConstructor:node buffer';
  var src = new I32x( [ 97, 98, 99 ] );
  var got = _.bufferFrom({ /*ttt*/src, bufferConstructor : BufferNode });
  var expected = BufferNode.from( src );
  test.identical( got, expected );

  test.case = 'src:node buffer, bufferConstructor:node buffer';
  var src = BufferNode.from( [ 97, 98, 99 ] );
  var got = _.bufferFrom({ /*ttt*/src, bufferConstructor : BufferNode });
  var expected = src;
  test.identical( got, expected );

}

//

function bufferRawFromTyped( test )
{

  var buffer1 = new BufferRaw(10);
  var view1 = new I8x( buffer1 );
  test.case = 'returns the same length of typed array';
  var got = _.bufferRawFromTyped( view1 );
  var expected = got; // [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ]
  test.identical( got, expected );

  var buffer2 = new BufferRaw(10);
  var view2 = new I8x( buffer2, 2 );
  test.case = 'returns the new sub typed array';
  var got = _.bufferRawFromTyped( view2 );
  var expected = got; // [ 0, 0, 0, 0, 0, 0 ]
  test.identical( got, expected );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'no arguments';
  test.shouldThrowErrorSync( function()
  {
    _.bufferRawFromTyped();
  });

  test.case = 'arguments are wrong';
  test.shouldThrowErrorSync( function()
  {
    _.bufferRawFromTyped( 'wrong argument' );
  });

}

//

function bufferRawFrom( test )
{
  test.case = 'from array';
  var src = [ 1, 2, 3, 4, 5 ];
  var got = _.bufferRawFrom( src );
  var expected = new U8x( src ).buffer;
  test.identical( got, expected );
  test.is( got !== src );

  var src = [ 1, 2, 3, 4, '5' ];
  var got = _.bufferRawFrom( src );
  var expected = new U8x( src ).buffer;
  test.identical( got, expected );
  test.is( got !== src );

  /* */

  test.case = 'from BufferRaw';
  var src = new BufferRaw( 3 );
  var got = _.bufferRawFrom( src );
  var expected = new BufferRaw( 3 );
  test.identical( got, expected );
  test.is( got === src );

  test.case = 'from BufferTyped.buffer';
  var src = new F32x( 3 ).buffer;
  var got = _.bufferRawFrom( src );
  var expected = new BufferRaw( 12 );
  test.identical( got, expected );
  test.is( got === src );

  /* */

  if( Config.interpreter === 'njs' )
  {
    test.case = 'empty BufferNode';
    var src = BufferNode.alloc( 10 );
    var got = _.bufferRawFrom( src );
    var expected = new BufferRaw( 10 );
    test.identical( got, expected );
    test.is( got !== src );

    test.case = 'BufferNode from string';
    var src = BufferNode.from( 'str' );
    var got = _.bufferRawFrom( src );
    var expected = new U8x( [ 115, 116, 114 ] ).buffer;
    test.identical( got, expected );
    test.is( got !== expected );

    test.case = 'BufferNode, buffer.length < result.length';
    var buffer = new U8x( [ 1, 2, 3, 4, 5 ] ).buffer;
    var src = BufferNode.from( buffer, 0, 3 );
    var got = _.bufferRawFrom( src );
    var expected = new U8x( [ 1, 2, 3 ] ).buffer;
    test.identical( got, expected );
    test.is( got !== expected );

    test.case = 'BufferNode, offset from src';
    var buffer = new U8x( [ 1, 2, 3, 4, 5 ] ).buffer;
    var src = BufferNode.from( buffer, 3 );
    var got = _.bufferRawFrom( src );
    var expected = new U8x( [ 4, 5 ] ).buffer;
    test.identical( got, expected );
    test.is( got !== expected );

    test.case = 'BufferNode, offset from src, buffer.length < result.length';
    var buffer = new U8x( [ 1, 2, 3, 4, 5 ] ).buffer;
    var src = BufferNode.from( buffer, 2, 2 );
    var got = _.bufferRawFrom( src );
    var expected = new U8x( [ 3, 4 ] ).buffer;
    test.identical( got, expected );
    test.is( got !== expected );
  }

  /* */

  test.case = 'from BufferTyped, not offset';
  var src = new U8x( 3 );
  var got = _.bufferRawFrom( src );
  var expected = new BufferRaw( 3 );
  test.identical( got, expected );
  test.is( got === src.buffer );

  test.case = 'from BufferTyped, offset';
  var buffer = new F32x( [ 1, 2, 3, 4, 5 ] ).buffer;
  var src = new I16x( buffer, 8 );
  var got = _.bufferRawFrom( src );
  var expected = new F32x( [ 3, 4, 5 ] ).buffer;
  test.identical( got, expected );
  test.is( got !== src.buffer );

  test.case = 'from BufferTyped, not offset, buffer.length < result.length';
  var buffer = new U16x( [ 1, 2, 3, 4, 5 ] ).buffer;
  var src = new F32x( buffer, 0, 2 );
  var got = _.bufferRawFrom( src );
  var expected = new U8x( [ 1, 0, 2, 0, 3, 0, 4, 0 ] ).buffer;
  test.identical( got, expected );
  test.is( got !== src.buffer );

  test.case = 'from BufferTyped, offset, buffer.length < result.length';
  var buffer = new U32x( [ 1, 2, 3, 4, 5 ] ).buffer;
  var src = new U8x( buffer, 4, 4 );
  var got = _.bufferRawFrom( src );
  var expected = new U8x( [ 2, 0, 0, 0 ] ).buffer;
  test.identical( got, expected );
  test.is( got !== src.buffer );

  /* */

  test.case = 'from BufferView, not offset';
  var src = new BufferView( new BufferRaw( 10 ) );
  var got = _.bufferRawFrom( src );
  var expected = new BufferRaw( 10 );
  test.identical( got, expected );
  test.is( got === src.buffer );

  test.case = 'from BufferView, not offset, buffer.length < result.length';
  var buffer = new F32x( [ 1, 2, 3, 4, 5 ] ).buffer;
  var src = new BufferView( buffer, 0, 4 );
  var got = _.bufferRawFrom( src );
  var expected = new F32x( [ 1 ] ).buffer;
  test.identical( got, expected );
  test.is( got !== src.buffer );

  test.case = 'from BufferView, offset';
  var buffer = new U32x( [ 1, 2, 3, 4, 5 ] ).buffer;
  var src = new BufferView( buffer, 4, 4 );
  var got = _.bufferRawFrom( src );
  var expected = new U8x( [ 2, 0, 0, 0 ] ).buffer;
  test.identical( got, expected );
  test.is( got !== src.buffer );

  /* */

  test.case = 'from string';
  var src = 'abc';
  var got = _.bufferRawFrom( src );
  var expected = new U8x( [ 97, 98, 99 ] ).buffer;
  test.identical( got, expected );

  /*
  Dmytro: making buffer from file need tests, now condition has _.assert( 0, 'not tested' )
   */

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.bufferRawFrom() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.bufferRawFrom( [ 1, 2 ], 2 ) );

  test.case = 'wrong buffer type';
  test.shouldThrowErrorSync( () => _.bufferRawFrom( 5 ) );
  test.shouldThrowErrorSync( () => _.bufferRawFrom( {} ) );
}

//

function bufferBytesFrom( test )
{
  test.case = 'from array';
  var src = [ 1, 2, 3, 4, 5 ];
  var got = _.bufferBytesFrom( src );
  var expected = new U8x( src );
  test.identical( got, expected );
  test.is( got !== src );

  var src = [ 1, 2, 3, 4, '5' ];
  var got = _.bufferBytesFrom( src );
  var expected = new U8x( src );
  test.identical( got, expected );
  test.is( got !== src );

  /* */

  test.case = 'from BufferRaw';
  var src = new BufferRaw( 3 );
  var got = _.bufferBytesFrom( src );
  var expected = new U8x( 3 );
  test.identical( got, expected );
  test.is( got !== src );

  test.case = 'from BufferTyped.buffer';
  var src = new F32x( 3 ).buffer;
  var got = _.bufferBytesFrom( src );
  var expected = new U8x( 12 );
  test.identical( got, expected );
  test.is( got !== src );

  /* */

  if( Config.interpreter === 'njs' )
  {
    test.case = 'empty BufferNode';
    var src = BufferNode.alloc( 10 );
    var got = _.bufferBytesFrom( src );
    var expected = new U8x( 10 );
    test.identical( got, expected );
    test.is( got !== src );

    test.case = 'BufferNode from string';
    var src = BufferNode.from( 'str' );
    var got = _.bufferBytesFrom( src );
    var expected = new U8x( [ 115, 116, 114 ] );
    test.identical( got, expected );
    test.is( got !== expected );

    test.case = 'BufferNode, buffer.length < result.length';
    var buffer = new U8x( [ 1, 2, 3, 4, 5 ] ).buffer;
    var src = BufferNode.from( buffer, 0, 3 );
    var got = _.bufferBytesFrom( src );
    var expected = new U8x( [ 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got !== expected );

    test.case = 'BufferNode, offset from src';
    var buffer = new U8x( [ 1, 2, 3, 4, 5 ] ).buffer;
    var src = BufferNode.from( buffer, 3 );
    var got = _.bufferBytesFrom( src );
    var expected = new U8x( [ 4, 5 ] );
    test.identical( got, expected );
    test.is( got !== expected );

    test.case = 'BufferNode, offset from src, buffer.length < result.length';
    var buffer = new U8x( [ 1, 2, 3, 4, 5 ] ).buffer;
    var src = BufferNode.from( buffer, 2, 2 );
    var got = _.bufferBytesFrom( src );
    var expected = new U8x( [ 3, 4 ] );
    test.identical( got, expected );
    test.is( got !== expected );
  }

  /* */

  test.case = 'from BufferBytes';
  var src = new U8x( 3 );
  var got = _.bufferBytesFrom( src );
  var expected = new U8x( 3 );
  test.identical( got, expected );
  test.is( got === src );

  test.case = 'from BufferBytes, not offset';
  var src = new U8x( [ 1, 2, 3, 4, 5 ] );
  var got = _.bufferBytesFrom( src );
  var expected = new U8x( [ 1, 2, 3, 4, 5 ] );
  test.identical( got, expected );
  test.is( got === src );

  test.case = 'from BufferTyped, offset';
  var buffer = new F32x( [ 1, 2, 3, 4, 5 ] ).buffer;
  var src = new I16x( buffer, 8 );
  var got = _.bufferBytesFrom( src );
  var expected = new U8x( [ 0, 0, 64, 64, 0, 0, 128, 64, 0, 0, 160, 64 ] );
  test.identical( got, expected );
  test.is( got !== src );

  test.case = 'from BufferTyped, not offset, buffer.length < result.length';
  var buffer = new U16x( [ 1, 2, 3, 4, 5 ] ).buffer;
  var src = new F32x( buffer, 0, 2 );
  var got = _.bufferBytesFrom( src );
  var expected = new U8x( [ 1, 0, 2, 0, 3, 0, 4, 0 ] );
  test.identical( got, expected );
  test.is( got !== src );

  test.case = 'from BufferTyped, offset, buffer.length < result.length';
  var buffer = new U32x( [ 1, 2, 3, 4, 5 ] ).buffer;
  var src = new U8x( buffer, 4, 4 );
  var got = _.bufferBytesFrom( src );
  var expected = new U8x( [ 2, 0, 0, 0 ] );
  test.identical( got, expected );
  test.is( got === src );

  /* */

  test.case = 'from BufferView, not offset';
  var src = new BufferView( new BufferRaw( 10 ) );
  var got = _.bufferBytesFrom( src );
  var expected = new U8x( 10 );
  test.identical( got, expected );
  test.is( got !== src );

  test.case = 'from BufferView, not offset, buffer.length < result.length';
  var buffer = new F32x( [ 1, 2, 3, 4, 5 ] ).buffer;
  var src = new BufferView( buffer, 0, 4 );
  var got = _.bufferBytesFrom( src );
  var expected = new U8x( [ 0, 0, 128, 63 ] );
  test.identical( got, expected );
  test.is( got !== src );

  test.case = 'from BufferView, offset';
  var buffer = new U32x( [ 1, 2, 3, 4, 5 ] ).buffer;
  var src = new BufferView( buffer, 4, 4 );
  var got = _.bufferBytesFrom( src );
  var expected = new U8x( [ 2, 0, 0, 0 ] );
  test.identical( got, expected );
  test.is( got !== src );

  /* */

  test.case = 'from string';
  var src = 'abc';
  var got = _.bufferBytesFrom( src );
  var expected = new U8x( [ 97, 98, 99 ] );
  test.identical( got, expected );

  /*
  Dmytro: making buffer from file need tests, now condition has _.assert( 0, 'not tested' )
   */

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.bufferBytesFrom() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.bufferBytesFrom( [ 1, 2 ], 2 ) );

  test.case = 'wrong buffer type';
  test.shouldThrowErrorSync( () => _.bufferBytesFrom( 5 ) );
  test.shouldThrowErrorSync( () => _.bufferBytesFrom( {} ) );
}

//

function bufferNodeFrom( test )
{
  if( Config.interpreter !== 'njs' )
  return;

  test.case = 'from array';
  var src = [ 1, 2, 3, 4, 5 ];
  var got = _.bufferNodeFrom( src );
  var expected = new BufferNode( src );
  test.identical( got, expected );
  test.is( got !== src );

  var src = [ 1, 2, 3, 4, '5' ];
  var got = _.bufferNodeFrom( src );
  var expected = new BufferNode( src );
  test.identical( got, expected );
  test.is( got !== src );

  /* */

  test.case = 'from BufferRaw, buffer.byteLength = 0';
  var src = new BufferRaw();
  var got = _.bufferNodeFrom( src );
  var expected = new BufferNode( 0 );
  test.identical( got, expected );
  test.is( got !== src );

  test.case = 'from BufferRaw';
  var src = new BufferRaw( 3 );
  var got = _.bufferNodeFrom( src );
  var expected = new BufferNode( 3 );
  test.identical( got, expected );
  test.is( got !== src );

  test.case = 'from BufferTyped.buffer';
  var src = new F32x( 3 ).buffer;
  var got = _.bufferNodeFrom( src );
  var expected = new BufferNode( 12 );
  test.identical( got, expected );
  test.is( got !== src );

  /* */

  test.case = 'empty BufferNode';
  var src = BufferNode.alloc( 10 );
  var got = _.bufferNodeFrom( src );
  var expected = new BufferNode( 10 );
  test.identical( got, expected );
  test.is( got === src );

  test.case = 'BufferNode from string';
  var src = BufferNode.from( 'str' );
  var got = _.bufferNodeFrom( src );
  var expected = new BufferNode( [ 115, 116, 114 ] );
  test.identical( got, expected );
  test.is( got !== expected );

  test.case = 'BufferNode, buffer.length < result.length';
  var buffer = new U8x( [ 1, 2, 3, 4, 5 ] ).buffer;
  var src = BufferNode.from( buffer, 0, 3 );
  var got = _.bufferNodeFrom( src );
  var expected = new BufferNode( [ 1, 2, 3 ] );
  test.identical( got, expected );
  test.is( got !== expected );

  test.case = 'BufferNode, offset from src';
  var buffer = new U8x( [ 1, 2, 3, 4, 5 ] ).buffer;
  var src = BufferNode.from( buffer, 3 );
  var got = _.bufferNodeFrom( src );
  var expected = new BufferNode( [ 4, 5 ] );
  test.identical( got, expected );
  test.is( got !== expected );

  test.case = 'BufferNode, offset from src, buffer.length < result.length';
  var buffer = new U8x( [ 1, 2, 3, 4, 5 ] ).buffer;
  var src = BufferNode.from( buffer, 2, 2 );
  var got = _.bufferNodeFrom( src );
  var expected = new BufferNode( [ 3, 4 ] );
  test.identical( got, expected );
  test.is( got !== expected );

  /* */

  test.case = 'from empty BufferBytes';
  var src = new U8x();
  var got = _.bufferNodeFrom( src );
  var expected = new BufferNode( 0 );
  test.identical( got, expected );
  test.is( got !== src );

  test.case = 'from BufferBytes';
  var src = new U8x( 3 );
  var got = _.bufferNodeFrom( src );
  var expected = new BufferNode( 3 );
  test.identical( got, expected );
  test.is( got !== src );

  test.case = 'from BufferBytes, not offset';
  var src = new U8x( [ 1, 2, 3, 4, 5 ] );
  var got = _.bufferNodeFrom( src );
  var expected = new BufferNode( [ 1, 2, 3, 4, 5 ] );
  test.identical( got, expected );
  test.is( got !== src );

  test.case = 'from BufferTyped, offset';
  var buffer = new F32x( [ 1, 2, 3, 4, 5 ] ).buffer;
  var src = new I16x( buffer, 8 );
  var got = _.bufferNodeFrom( src );
  var expected = new BufferNode( [ 0, 0, 64, 64, 0, 0, 128, 64, 0, 0, 160, 64 ] );
  test.identical( got, expected );
  test.is( got !== src );

  test.case = 'from BufferTyped, not offset, buffer.length < result.length';
  var buffer = new U16x( [ 1, 2, 3, 4, 5 ] ).buffer;
  var src = new F32x( buffer, 0, 2 );
  var got = _.bufferNodeFrom( src );
  var expected = new BufferNode( [ 1, 0, 2, 0, 3, 0, 4, 0 ] );
  test.identical( got, expected );
  test.is( got !== src );

  test.case = 'from BufferTyped, offset, buffer.length < result.length';
  var buffer = new U32x( [ 1, 2, 3, 4, 5 ] ).buffer;
  var src = new U8x( buffer, 4, 4 );
  var got = _.bufferNodeFrom( src );
  var expected = new BufferNode( [ 2, 0, 0, 0 ] );
  test.identical( got, expected );
  test.is( got !== src );

  /* */

  test.case = 'from BufferView, not offset';
  var src = new BufferView( new BufferRaw( 10 ) );
  var got = _.bufferNodeFrom( src );
  var expected = new BufferNode( 10 );
  test.identical( got, expected );
  test.is( got !== src );

  test.case = 'from BufferView, not offset, buffer.length < result.length';
  var buffer = new F32x( [ 1, 2, 3, 4, 5 ] ).buffer;
  var src = new BufferView( buffer, 0, 4 );
  var got = _.bufferNodeFrom( src );
  var expected = new BufferNode( [ 0, 0, 128, 63 ] );
  test.identical( got, expected );
  test.is( got !== src );

  test.case = 'from BufferView, offset';
  var buffer = new U32x( [ 1, 2, 3, 4, 5 ] ).buffer;
  var src = new BufferView( buffer, 4, 4 );
  var got = _.bufferNodeFrom( src );
  var expected = new BufferNode( [ 2, 0, 0, 0 ] );
  test.identical( got, expected );
  test.is( got !== src );

  /* */

  test.case = 'from string';
  var src = 'abc';
  var got = _.bufferNodeFrom( src );
  var expected = new BufferNode( [ 97, 98, 99 ] );
  test.identical( got, expected );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.bufferNodeFrom() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.bufferNodeFrom( [ 1, 2 ], 2 ) );

  test.case = 'wrong buffer type';
  test.shouldThrowErrorSync( () => _.bufferNodeFrom( 5 ) );
  test.shouldThrowErrorSync( () => _.bufferNodeFrom( {} ) );

}

// --
// declaration
// --

var Self =
{

  name : 'Tools.base.Buffer',
  silencing : 1,
  enabled : 1,

  tests :
  {

    // buffer, layer0

    bufferRawIs,
    bufferTypedIs,
    bufferNodeIs,
    bufferViewIs,

    // buffer, layer1

    bufferMake,
    bufferMakeUndefined,

    bufferBut,
    bufferButInplace,
    bufferSelect,
    bufferSelectInplace,
    bufferGrow,
    bufferGrowInplace,
    bufferRelength,
    bufferRelengthInplace,
    bufferRelen,
    bufferResize,
    bufferResizeInplace,
    bufferRetype,
    // bufferJoin, /* Dmytro : extend test routine, extend routine */
    bufferFrom,
    bufferRawFromTyped,
    bufferRawFrom,
    bufferBytesFrom,
    bufferNodeFrom,

  }

}

Self = wTestSuite( Self );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

})();
