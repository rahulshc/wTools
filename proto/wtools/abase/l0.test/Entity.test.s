( function _Entity_test_s_()
{

'use strict';

if( typeof module !== 'undefined' )
{

  let _ = require( '../Layer1.s' );
  _.include( 'wTesting' );

  // try
  // {
  //   _.include( 'wLooker' );
  // }
  // catch( err )
  // {
  // }

}

let _global = _global_;
let _ = _global_.wTools;

// --
// tests
// --
//
// function entityMakeConstructing( test )
// {
//   test.case = 'null';
//   var got = _.entity.cloneShallow( null );
//   test.identical( got, null );
//
//   test.case = 'undefined';
//   var got = _.entity.cloneShallow( undefined );
//   test.identical( got, undefined );
//
//   test.case = 'zero';
//   var got = _.entity.cloneShallow( 0 );
//   test.identical( got, 0 );
//
//   test.case = 'number';
//   var got = _.entity.cloneShallow( 3 );
//   test.identical( got, 3 );
//
//   test.case = 'bigInt';
//   var got = _.entity.cloneShallow( 1n );
//   test.identical( got, 1n );
//
//   test.case = 'empty string';
//   var got = _.entity.cloneShallow( '' );
//   test.identical( got, '' );
//
//   test.case = 'string';
//   var got = _.entity.cloneShallow( 'str' );
//   test.identical( got, 'str' );
//
//   test.case = 'false';
//   var got = _.entity.cloneShallow( false );
//   test.identical( got, false );
//
//   test.case = 'NaN';
//   var got = _.entity.cloneShallow( NaN );
//   test.identical( got, NaN );
//
//   test.case = 'Symbol';
//   var src = Symbol( 'a' );
//   var got = _.entity.cloneShallow( src );
//   test.identical( got, src );
//
//   test.case = '_.null';
//   var got = _.entity.cloneShallow( _.null );
//   test.identical( got, null );
//
//   test.case = '_.undefined';
//   var got = _.entity.cloneShallow( _.undefined );
//   test.identical( got, undefined );
//
//   test.case = '_.nothing';
//   var got = _.entity.cloneShallow( _.nothing );
//   test.identical( got, _.nothing );
//
//   test.case = 'empty array';
//   var got = _.entity.cloneShallow( [] );
//   test.identical( got, [] );
//
//   test.case = 'empty array, length';
//   var got = _.entity.cloneShallow( [], 4 );
//   test.identical( got, [ undefined, undefined, undefined, undefined ] );
//
//   test.case = 'not empty array';
//   var got = _.entity.cloneShallow( [ null, undefined, 1, 2 ] );
//   test.identical( got, [ undefined, undefined, undefined, undefined ] );
//
//   test.case = 'not empty array, length';
//   var got = _.entity.cloneShallow( [ null, undefined, 1, 2 ], 2 );
//   test.identical( got, [ undefined, undefined ] );
//
//   test.case = 'empty arguments array';
//   var got = _.entity.cloneShallow( _.argumentsArrayMake( [] ) );
//   test.identical( got, [] );
//   test.true( _.arrayIs( got ) );
//
//   test.case = 'empty arguments array, length';
//   var got = _.entity.cloneShallow( _.argumentsArrayMake( [] ), 4 );
//   test.identical( got, [ undefined, undefined, undefined, undefined ] );
//   test.true( _.arrayIs( got ) );
//
//   test.case = 'not empty argumentsArray';
//   var got = _.entity.cloneShallow( _.argumentsArrayMake( [ null, undefined, 1, 2 ] ) );
//   test.identical( got, [ null, undefined, 1, 2 ] );
//   test.true( _.arrayIs( got ) );
//
//   test.case = 'not empty argumentsArray, length';
//   var got = _.entity.cloneShallow( _.argumentsArrayMake( [ null, undefined, 1, 2 ] ), 2 );
//   test.identical( got, [ null, undefined ] );
//   test.true( _.arrayIs( got ) );
//
//   test.case = 'empty unroll';
//   var got = _.entity.cloneShallow( _.unrollMake( [] ) );
//   test.identical( got, [] );
//   test.true( !_.unrollIs( got ) && _.arrayIs( got ) );
//
//   test.case = 'empty unroll, length';
//   var got = _.entity.cloneShallow( _.unrollMake( [] ), 4 );
//   test.identical( got, [ undefined, undefined, undefined, undefined ] );
//   test.true( !_.unrollIs( got ) && _.arrayIs( got ) );
//
//   test.case = 'not empty unroll';
//   var got = _.entity.cloneShallow( _.argumentsArrayMake( [ null, undefined, 1, 2 ] ) );
//   test.identical( got, [ null, undefined, 1, 2 ] );
//   test.true( !_.unrollIs( got ) && _.arrayIs( got ) );
//
//   test.case = 'not empty unroll, length';
//   var got = _.entity.cloneShallow( _.argumentsArrayMake( [ null, undefined, 1, 2 ] ), 2 );
//   test.identical( got, [ null, undefined ] );
//   test.true( !_.unrollIs( got ) && _.arrayIs( got ) );
//
//   test.case = 'BufferTyped';
//   var got = _.entity.cloneShallow( new U8x( 10 ) );
//   test.identical( got, new U8x( 10 ) );
//
//   test.case = 'BufferTyped, length';
//   var got = _.entity.cloneShallow( new U8x( 10 ), 4 );
//   test.identical( got, new U8x( 4 ) );
//
//   test.case = 'empty map';
//   var got = _.entity.cloneShallow( {} );
//   test.identical( got, {} );
//   test.true( _.mapIsPure( got ) );
//
//   test.case = 'empty map, length';
//   var got = _.entity.cloneShallow( {}, 4 );
//   test.identical( got, {} );
//   test.true( _.mapIsPure( got ) );
//
//   test.case = 'not empty map';
//   var got = _.entity.cloneShallow( { '' : null } );
//   test.identical( got, {} );
//   test.true( _.mapIsPure( got ) );
//
//   test.case = 'not empty map, length';
//   var got = _.entity.cloneShallow( { '' : null }, 4 );
//   test.identical( got, {} );
//   test.true( _.mapIsPure( got ) );
//
//   test.case = 'empty pure map';
//   var got = _.entity.cloneShallow( Object.create( null ) );
//   test.identical( got, {} );
//   test.true( _.mapIsPure( got ) );
//
//   test.case = 'empty pure map, length';
//   var got = _.entity.cloneShallow( Object.create( null ) );
//   test.identical( got, {} );
//   test.true( _.mapIsPure( got ) );
//
//   test.case = 'instance of constructor';
//   function Constr( src )
//   {
//     this.x = src || 1;
//     return this;
//   };
//   var src = new Constr( 2 );
//   var got = _.entity.cloneShallow( src );
//   test.identical( got.x, 1 );
//   test.true( got !== src );
//
//   test.case = 'instance of constructor, length';
//   function Constr2( src )
//   {
//     this.x = src || 1;
//     return this;
//   };
//   var src = new Constr2( 2 );
//   var got = _.entity.cloneShallow( src, 2 );
//   test.identical( got.x, 1 );
//   test.true( got !== src );
//
//   /* - */
//
//   if( !Config.debug )
//   return;
//
//   test.case = 'without arguments';
//   test.shouldThrowErrorSync( () => _.entity.cloneShallow() );
//
//   test.case = 'extra arguments';
//   test.shouldThrowErrorSync( () => _.entity.cloneShallow( [], 1, 1 ) );
//
//   test.case = 'unknown type of entity';
//   test.shouldThrowErrorSync( () => _.entity.cloneShallow( new Set( [ 1, 'str', false ] ) ) );
//   test.shouldThrowErrorSync( () => _.entity.cloneShallow( new Map( [ [ 'a', 1 ], [ 'b', 2 ] ] ) ) );
//   test.shouldThrowErrorSync( () => _.entity.cloneShallow( new BufferRaw() ) );
// }
//
// //
//
// function entityMakeConstructingArgumentsArray( test )
// {
//   test.case = 'src = empty long, not ins';
//   var src = _.argumentsArrayMake( [] );
//   var got = _.entity.cloneShallow( src );
//   var expected = _.longDescriptor.make( [] );
//   test.identical( got, expected );
//
//   test.case = 'src = long, not ins';
//   var src = _.argumentsArrayMake( [ 1, 2, 3 ] );
//   var got = _.entity.cloneShallow( src );
//   var expected = _.longDescriptor.make( [ 1, 2, 3 ] );
//   test.identical( got, expected );
//   test.true( got !== src );
//
//   test.case = 'src = empty long, ins = null';
//   var src = _.argumentsArrayMake( [] );
//   var got = _.entity.cloneShallow( src, null );
//   var expected = _.longDescriptor.make( 0 );
//   test.identical( got, expected );
//   test.true( got !== src );
//
//   test.case = 'src = empty long, ins = number';
//   var src = _.argumentsArrayMake( [] );
//   var got = _.entity.cloneShallow( src, 2 );
//   var expected = _.longDescriptor.make( 2 );
//   test.identical( got, expected );
//   test.true( got !== src );
//
//   test.case = 'src = long, ins = number, ins < src.length';
//   var src = _.argumentsArrayMake( [ 1, 2, 3 ] );
//   var got = _.entity.cloneShallow( src, 2 );
//   var expected = _.longDescriptor.make( [ 1, 2 ] );
//   test.identical( got, expected );
//   test.true( got !== src );
//
//   test.case = 'src = long with an element, ins = empty array';
//   var src = new F64x( 10 );
//   var got = _.entity.cloneShallow( src, [] );
//   var expected = new F64x( 0 );
//   test.identical( got, expected );
//   test.true( got !== src );
//
//   test.case = 'src = long, ins = number, ins > src.length';
//   var src = _.argumentsArrayMake( [ 1, 2, 3 ] );
//   var got = _.entity.cloneShallow( src, 4 );
//   var expected = _.longDescriptor.make( [ 1, 2, 3, undefined ] );
//   test.identical( got, expected );
//   test.true( got !== src );
//
//   test.case = 'src = long, ins = array, ins.length > src.length';
//   var src = _.argumentsArrayMake( [ 0, 1 ] );
//   var ins = [ 1, 2, 3 ];
//   var got = _.entity.cloneShallow( src, ins );
//   var expected = _.longDescriptor.make( [ 1, 2, 3 ] );
//   test.identical( got, expected );
//   test.true( got !== ins );
//   test.true( got !== src );
//
//   test.case = 'src = long, ins = array, ins.length === src.length'
//   var src = _.argumentsArrayMake( 5 );
//   var ins = [ 1, 2, 3, 4, 5 ];
//   var got = _.entity.cloneShallow( src, ins );
//   var expected = _.longDescriptor.make( [ 1, 2, 3, 4, 5 ] );
//   test.identical( got, expected );
//   test.true( got !== src );
// }
//
// //
//
// function entityMakeConstructingBufferTyped( test )
// {
//   var list =
//   [
//     I8x,
//     U16x,
//     U16x,
//     F32x,
//   ];
//
//   /* tests */
//
//   for( let t = 0; t < list.length; t++ )
//   {
//     test.open( list[ t ].name );
//     testRun( list[ t ] );
//     test.close( list[ t ].name );
//   }
//
//   /* test subroutine */
//
//   function testRun( long )
//   {
//     test.case = 'src = empty long, not ins';
//     var src = new long( [] );
//     var got = _.entity.cloneShallow( src );
//     var expected = new long( [] );
//     test.identical( got, expected );
//
//     test.case = 'src = long, not ins';
//     var src = new long( [ 1, 2, 3 ] );
//     var got = _.entity.cloneShallow( src );
//     var expected = new long( [ 1, 2, 3 ] );
//     test.identical( got, expected );
//     test.true( got !== src );
//     test.true( src.constructor.name === got.constructor.name );
//
//     test.case = 'src = empty long, ins = null';
//     var src = new long( [] );
//     var got = _.entity.cloneShallow( src, null );
//     var expected = new long( 0 );
//     test.identical( got, expected );
//     test.true( got !== src );
//     test.true( src.constructor.name === got.constructor.name );
//
//     test.case = 'src = empty long, ins = number';
//     var src = new long( [] );
//     var got = _.entity.cloneShallow( src, 2 );
//     var expected = new long( 2 );
//     test.identical( got, expected );
//     test.true( got !== src );
//     test.true( src.constructor.name === got.constructor.name );
//
//     test.case = 'src = long, ins = number, ins < src.length';
//     var src = new long( [ 1, 2, 3 ] );
//     var got = _.entity.cloneShallow( src, 2 );
//     var expected = new long( [ 1, 2 ] );
//     test.identical( got, expected );
//     test.true( got !== src );
//     test.true( src.constructor.name === got.constructor.name );
//
//     test.case = 'src = long with an element, ins = empty array';
//     var src = new F64x( 10 );
//     var got = _.entity.cloneShallow( src, [] );
//     var expected = new F64x( 0 );
//     test.identical( got, expected );
//     test.true( got !== src );
//
//     test.case = 'src = long, ins = number, ins > src.length';
//     var src = new long( [ 1, 2, 3 ] );
//     var got = _.entity.cloneShallow( src, 4 );
//     var expected = new long( [ 1, 2, 3, 0 ] );
//     test.identical( got, expected );
//     test.true( got !== src );
//     test.true( src.constructor.name === got.constructor.name );
//
//     test.case = 'src = long, ins = array, ins.length > src.length';
//     var src = new long( [ 0, 1 ] );
//     var ins = [ 1, 2, 3 ];
//     var got = _.entity.cloneShallow( src, ins );
//     var expected = new long( [ 1, 2, 3 ] );
//     test.identical( got, expected );
//     test.true( got !== ins );
//     test.true( got !== src );
//     test.true( src.constructor.name === got.constructor.name );
//
//     test.case = 'src = long, ins = array, ins.length === src.length'
//     var src = new long( 5 );
//     var ins = [ 1, 2, 3, 4, 5 ];
//     var got = _.entity.cloneShallow( src, ins );
//     var expected = new long( [ 1, 2, 3, 4, 5 ] );
//     test.identical( got, expected );
//     test.true( got !== src );
//     test.true( src.constructor.name === got.constructor.name );
//   }
// }
//
// //
//
// function entityMakeConstructingLongDescriptor( test )
// {
//   let times = 4;
//   for( let e in _.LongDescriptors )
//   {
//     let name = _.LongDescriptors[ e ].name;
//     let descriptor = _.withDefaultLong[ name ];
//
//     test.open( `descriptor - ${ name }` );
//     testRun( descriptor );
//     test.close( `descriptor - ${ name }` );
//
//     if( times < 1 )
//     break;
//     times--;
//   }
//
//   /* - */
//
//   function testRun( descriptor )
//   {
//     test.case = 'null';
//     var got = descriptor.entityMakeConstructing( null );
//     test.identical( got, null );
//
//     test.case = 'undefined';
//     var got = descriptor.entityMakeConstructing( undefined );
//     test.identical( got, undefined );
//
//     test.case = 'zero';
//     var got = descriptor.entityMakeConstructing( 0 );
//     test.identical( got, 0 );
//
//     test.case = 'number';
//     var got = descriptor.entityMakeConstructing( 3 );
//     test.identical( got, 3 );
//
//     test.case = 'bigInt';
//     var got = descriptor.entityMakeConstructing( 1n );
//     test.identical( got, 1n );
//
//     test.case = 'empty string';
//     var got = descriptor.entityMakeConstructing( '' );
//     test.identical( got, '' );
//
//     test.case = 'string';
//     var got = descriptor.entityMakeConstructing( 'str' );
//     test.identical( got, 'str' );
//
//     test.case = 'false';
//     var got = descriptor.entityMakeConstructing( false );
//     test.identical( got, false );
//
//     test.case = 'NaN';
//     var got = descriptor.entityMakeConstructing( NaN );
//     test.identical( got, NaN );
//
//     test.case = 'Symbol';
//     var src = Symbol( 'a' );
//     var got = descriptor.entityMakeConstructing( src );
//     test.identical( got, src );
//
//     test.case = '_.null';
//     var got = descriptor.entityMakeConstructing( _.null );
//     test.identical( got, null );
//
//     test.case = '_.undefined';
//     var got = descriptor.entityMakeConstructing( _.undefined );
//     test.identical( got, undefined );
//
//     test.case = '_.nothing';
//     var got = descriptor.entityMakeConstructing( _.nothing );
//     test.identical( got, _.nothing );
//
//     test.case = 'empty array';
//     var got = descriptor.entityMakeConstructing( [] );
//     test.identical( got, [] );
//
//     test.case = 'empty array, length';
//     var got = descriptor.entityMakeConstructing( [], 4 );
//     test.identical( got, [ undefined, undefined, undefined, undefined ] );
//
//     test.case = 'not empty array';
//     var got = descriptor.entityMakeConstructing( [ null, undefined, 1, 2 ] );
//     test.identical( got, [ undefined, undefined, undefined, undefined ] );
//
//     test.case = 'not empty array, length';
//     var got = descriptor.entityMakeConstructing( [ null, undefined, 1, 2 ], 2 );
//     test.identical( got, [ undefined, undefined ] );
//
//     test.case = 'empty unroll';
//     var got = descriptor.entityMakeConstructing( _.unrollMake( [] ) );
//     test.identical( got, [] );
//     test.true( !_.unrollIs( got ) && _.arrayIs( got ) );
//
//     test.case = 'empty unroll, length';
//     var got = descriptor.entityMakeConstructing( _.unrollMake( [] ), 4 );
//     test.identical( got, [ undefined, undefined, undefined, undefined ] );
//     test.true( !_.unrollIs( got ) && _.arrayIs( got ) );
//
//     test.case = 'not empty unroll';
//     var got = descriptor.entityMakeConstructing( _.unrollMake( [ null, undefined, 1, 2 ] ) );
//     test.identical( got, [ undefined, undefined, undefined, undefined ] );
//     test.true( !_.unrollIs( got ) && _.arrayIs( got ) );
//
//     test.case = 'not empty unroll, length';
//     var got = descriptor.entityMakeConstructing( _.unrollMake( [ null, undefined, 1, 2 ] ), 2 );
//     test.identical( got, [ undefined, undefined ] );
//     test.true( !_.unrollIs( got ) && _.arrayIs( got ) );
//
//     test.case = 'empty map';
//     var got = descriptor.entityMakeConstructing( {} );
//     test.identical( got, {} );
//     test.true( _.mapIsPure( got ) );
//
//     test.case = 'empty map, length';
//     var got = descriptor.entityMakeConstructing( {}, 4 );
//     test.identical( got, {} );
//     test.true( _.mapIsPure( got ) );
//
//     test.case = 'not empty map';
//     var got = descriptor.entityMakeConstructing( { '' : null } );
//     test.identical( got, {} );
//     test.true( _.mapIsPure( got ) );
//
//     test.case = 'not empty map, length';
//     var got = descriptor.entityMakeConstructing( { '' : null }, 4 );
//     test.identical( got, {} );
//     test.true( _.mapIsPure( got ) );
//
//     test.case = 'empty pure map';
//     var got = descriptor.entityMakeConstructing( Object.create( null ) );
//     test.identical( got, {} );
//     test.true( _.mapIsPure( got ) );
//
//     test.case = 'empty pure map, length';
//     var got = descriptor.entityMakeConstructing( Object.create( null ) );
//     test.identical( got, {} );
//     test.true( _.mapIsPure( got ) );
//
//     test.case = 'instance of constructor';
//     function Constr( src )
//     {
//       this.x = src || 1;
//       return this;
//     };
//     var src = new Constr( 2 );
//     var got = descriptor.entityMakeConstructing( src );
//     test.identical( got.x, 1 );
//     test.true( got !== src );
//
//     test.case = 'instance of constructor, length';
//     function Constr2( src )
//     {
//       this.x = src || 1;
//       return this;
//     };
//     var src = new Constr2( 2 );
//     var got = descriptor.entityMakeConstructing( src, 2 );
//     test.identical( got.x, 1 );
//     test.true( got !== src );
//
//     /* - */
//
//     if( Config.debug )
//     {
//       test.case = 'without arguments';
//       test.shouldThrowErrorSync( () => descriptor.entityMakeConstructing() );
//
//       test.case = 'extra arguments';
//       test.shouldThrowErrorSync( () => descriptor.entityMakeConstructing( [], 1, 1 ) );
//
//       test.case = 'unknown type of entity';
//       test.shouldThrowErrorSync( () => descriptor.entityMakeConstructing( new Set( [ 1, 'str', false ] ) ) );
//       test.shouldThrowErrorSync( () => descriptor.entityMakeConstructing( new Map( [ [ 'a', 1 ], [ 'b', 2 ] ] ) ) );
//       test.shouldThrowErrorSync( () => descriptor.entityMakeConstructing( new BufferRaw() ) );
//     }
//   }
// }
//
// //
//
// function entityMakeConstructingArgumentsArrayLongDescriptor( test )
// {
//   let times = 4;
//   for( let e in _.LongDescriptors )
//   {
//     let name = _.LongDescriptors[ e ].name;
//     let descriptor = _.withDefaultLong[ name ];
//
//     test.open( `descriptor - ${ name }` );
//     testRun( descriptor );
//     test.close( `descriptor - ${ name }` );
//
//     if( times < 1 )
//     break;
//     times--;
//   }
//
//   /* - */
//
//   function testRun( descriptor )
//   {
//     test.case = 'src = empty long, not ins';
//     var src = _.argumentsArrayMake( [] );
//     var got = descriptor.entityMakeConstructing( src );
//     var expected = descriptor.longDescriptor.make( [] );
//     test.identical( got, expected );
//
//     test.case = 'src = long, not ins';
//     var src = _.argumentsArrayMake( [ 1, 2, 3 ] );
//     var got = descriptor.entityMakeConstructing( src );
//     var expected = descriptor.longDescriptor.make( [ 1, 2, 3 ] );
//     test.identical( got, expected );
//
//     test.case = 'src = empty long, ins = null';
//     var src = _.argumentsArrayMake( [] );
//     var got = descriptor.entityMakeConstructing( src, null );
//     var expected = descriptor.longDescriptor.make( 0 );
//     test.identical( got, expected );
//
//     test.case = 'src = empty long, ins = number';
//     var src = _.argumentsArrayMake( [] );
//     var got = descriptor.entityMakeConstructing( src, 2 );
//     var expected = descriptor.longDescriptor.make( 2 );
//     test.identical( got, expected );
//     test.true( got !== src );
//
//     test.case = 'src = long, ins = number, ins < src.length';
//     var src = _.argumentsArrayMake( [ 1, 2, 3 ] );
//     var got = descriptor.entityMakeConstructing( src, 2 );
//     var expected = descriptor.longDescriptor.make( [ 1, 2 ] );
//     test.identical( got, expected );
//     test.true( got !== src );
//
//     test.case = 'src = long with an element, ins = empty array';
//     var src = new F64x( 10 );
//     var got = descriptor.entityMakeConstructing( src, [] );
//     var expected = new F64x( 0 );
//     test.identical( got, expected );
//     test.true( got !== src );
//
//     test.case = 'src = long, ins = number, ins > src.length';
//     var src = _.argumentsArrayMake( [ 1, 2, 3 ] );
//     var got = descriptor.entityMakeConstructing( src, 4 );
//     var expected = descriptor.longDescriptor.make( [ 1, 2, 3, undefined ] );
//     test.identical( got, expected );
//     test.true( got !== src );
//
//     test.case = 'src = long, ins = array, ins.length > src.length';
//     var src = _.argumentsArrayMake( [ 0, 1 ] );
//     var ins = [ 1, 2, 3 ];
//     var got = descriptor.entityMakeConstructing( src, ins );
//     var expected = descriptor.longDescriptor.make( [ 1, 2, 3 ] );
//     test.identical( got, expected );
//     test.true( got !== ins );
//     test.true( got !== src );
//
//     test.case = 'src = long, ins = array, ins.length === src.length'
//     var src = _.argumentsArrayMake( 5 );
//     var ins = [ 1, 2, 3, 4, 5 ];
//     var got = descriptor.entityMakeConstructing( src, ins );
//     var expected = descriptor.longDescriptor.make( [ 1, 2, 3, 4, 5 ] );
//     test.identical( got, expected );
//     test.true( got !== src );
//   }
// }
//
// //
//
// function entityMakeConstructingBufferTypedLongDescriptor( test )
// {
//   var list =
//   [
//     I8x,
//     U16x,
//     U16x,
//     F32x,
//   ];
//
//   /* tests */
//
//   let times = 4;
//   for( let e in _.LongDescriptors )
//   {
//     let name = _.LongDescriptors[ e ].name;
//     let descriptor = _.withDefaultLong[ name ];
//
//     for( let i = 0; i < list.length; i++ )
//     {
//       test.open( `descriptor - ${ name }, long - ${ list[ i ].name }` );
//       testRun( descriptor, list[ i ] );
//       test.close( `descriptor - ${ name }, long - ${ list[ i ].name }` );
//     }
//
//     if( times < 1 )
//     break;
//     times--;
//   }
//
//   /* test subroutine */
//
//   function testRun( descriptor, long )
//   {
//     test.case = 'src = empty long, not ins';
//     var src = new long( [] );
//     var got = descriptor.entityMakeConstructing( src );
//     var expected = new long( [] );
//     test.identical( got, expected );
//
//     test.case = 'src = long, not ins';
//     var src = new long( [ 1, 2, 3 ] );
//     var got = descriptor.entityMakeConstructing( src );
//     var expected = new long( [ 1, 2, 3 ] );
//     test.identical( got, expected );
//     test.true( got !== src );
//
//     test.case = 'src = empty long, ins = null';
//     var src = new long( [] );
//     var got = descriptor.entityMakeConstructing( src, null );
//     var expected = new long( 0 );
//     test.identical( got, expected );
//     test.true( got !== src );
//     test.true( src.constructor.name === got.constructor.name );
//
//     test.case = 'src = empty long, ins = number';
//     var src = new long( [] );
//     var got = descriptor.entityMakeConstructing( src, 2 );
//     var expected = new long( 2 );
//     test.identical( got, expected );
//     test.true( got !== src );
//     test.true( src.constructor.name === got.constructor.name );
//
//     test.case = 'src = long, ins = number, ins < src.length';
//     var src = new long( [ 1, 2, 3 ] );
//     var got = descriptor.entityMakeConstructing( src, 2 );
//     var expected = new long( [ 1, 2 ] );
//     test.identical( got, expected );
//     test.true( got !== src );
//     test.true( src.constructor.name === got.constructor.name );
//
//     test.case = 'src = long with an element, ins = empty array';
//     var src = new long( 10 );
//     var got = descriptor.entityMakeConstructing( src, [] );
//     var expected = new long( 0 );
//     test.identical( got, expected );
//     test.true( got !== src );
//
//     test.case = 'src = long, ins = number, ins > src.length';
//     var src = new long( [ 1, 2, 3 ] );
//     var got = descriptor.entityMakeConstructing( src, 4 );
//     var expected = new long( [ 1, 2, 3, 0 ] );
//     test.identical( got, expected );
//     test.true( got !== src );
//     test.true( src.constructor.name === got.constructor.name );
//
//     test.case = 'src = long, ins = array, ins.length > src.length';
//     var src = new long( [ 0, 1 ] );
//     var ins = [ 1, 2, 3 ];
//     var got = descriptor.entityMakeConstructing( src, ins );
//     var expected = new long( [ 1, 2, 3 ] );
//     test.identical( got, expected );
//     test.true( got !== ins );
//     test.true( got !== src );
//     test.true( src.constructor.name === got.constructor.name );
//
//     test.case = 'src = long, ins = array, ins.length === src.length'
//     var src = new long( 5 );
//     var ins = [ 1, 2, 3, 4, 5 ];
//     var got = descriptor.entityMakeConstructing( src, ins );
//     var expected = new long( [ 1, 2, 3, 4, 5 ] );
//     test.identical( got, expected );
//     test.true( got !== src );
//     test.true( src.constructor.name === got.constructor.name );
//   }
// }

//

function entityMakeEmpty( test )
{
  test.case = 'null';
  var got = _.entity.makeEmpty( null );
  test.identical( got, null );

  test.case = 'undefined';
  var got = _.entity.makeEmpty( undefined );
  test.identical( got, undefined );

  test.case = 'zero';
  var got = _.entity.makeEmpty( 0 );
  test.identical( got, 0 );

  test.case = 'number';
  var got = _.entity.makeEmpty( 3 );
  test.identical( got, 3 );

  test.case = 'bigInt';
  var got = _.entity.makeEmpty( 1n );
  test.identical( got, 1n );

  test.case = 'empty string';
  var got = _.entity.makeEmpty( '' );
  test.identical( got, '' );

  test.case = 'string';
  var got = _.entity.makeEmpty( 'str' );
  test.identical( got, 'str' );

  test.case = 'false';
  var got = _.entity.makeEmpty( false );
  test.identical( got, false );

  test.case = 'NaN';
  var got = _.entity.makeEmpty( NaN );
  test.identical( got, NaN );

  test.case = 'Symbol';
  var src = Symbol( 'a' );
  var got = _.entity.makeEmpty( src );
  test.identical( got, src );

  test.case = '_.null';
  var got = _.entity.makeEmpty( _.null );
  test.identical( got, _.null );

  test.case = '_.undefined';
  var got = _.entity.makeEmpty( _.undefined );
  test.identical( got, _.undefined );

  test.case = '_.nothing';
  var got = _.entity.makeEmpty( _.nothing );
  test.identical( got, _.nothing );

  test.case = 'empty array';
  var got = _.entity.makeEmpty( [] );
  test.identical( got, [] );

  test.case = 'not empty array';
  var got = _.entity.makeEmpty( [ null, undefined, 1, 2 ] );
  test.identical( got, [] );

  test.case = 'empty argumentArray';
  var got = _.entity.makeEmpty( _.argumentsArrayMake( [] ) );
  test.identical( got, [] );
  test.true( _.arrayIs( got ) );

  test.case = 'not empty argumentsArray';
  var got = _.entity.makeEmpty( _.argumentsArrayMake( [ null, undefined, 1, 2 ] ) );
  test.identical( got, [] );
  test.true( _.arrayIs( got ) );

  test.case = 'empty unroll';
  var got = _.entity.makeEmpty( _.unrollMake( [] ) );
  test.identical( got, [] );
  test.true( !_.unrollIs( got ) && _.arrayIs( got ) );

  test.case = 'not empty unroll';
  var got = _.entity.makeEmpty( _.argumentsArrayMake( [ null, undefined, 1, 2 ] ) );
  test.identical( got, [] );
  test.true( !_.unrollIs( got ) && _.arrayIs( got ) );

  test.case = 'BufferTyped - U8x';
  var got = _.entity.makeEmpty( new U8x( 10 ) );
  test.identical( got, new U8x() );

  test.case = 'BufferTyped - I16x';
  var got = _.entity.makeEmpty( new I16x() );
  test.identical( got, new I16x() );

  test.case = 'BufferTyped - F64x';
  var got = _.entity.makeEmpty( new F64x( [ 1, 2 ] ) );
  test.identical( got, new F64x() );

  test.case = 'empty map';
  var got = _.entity.makeEmpty( {} );
  test.identical( got, {} );
  test.true( _.mapIsPure( got ) );

  test.case = 'not empty map';
  var got = _.entity.makeEmpty( { '' : null } );
  test.identical( got, {} );
  test.true( _.mapIsPure( got ) );

  test.case = 'empty pure map';
  var got = _.entity.makeEmpty( Object.create( null ) );
  test.identical( got, {} );
  test.true( _.mapIsPure( got ) );

  test.case = 'empty Set';
  var got = _.entity.makeEmpty( new Set( [] ) );
  test.identical( got, new Set( [] ) );

  test.case = 'Set';
  var got = _.entity.makeEmpty( new Set( [ 1, 'str', false ] ) );
  test.identical( got, new Set( [] ) );

  test.case = 'empty HashMap';
  var got = _.entity.makeEmpty( new Map( [] ) );
  test.identical( got, new Map( [] ) );

  test.case = 'HashMap';
  var got = _.entity.makeEmpty( new Map( [ [ 'a', 1 ], [ 'b', 2 ] ] ) );
  test.identical( got, new Map( [] ) );

  test.case = 'BufferRaw, has constructor';
  var got = _.entity.makeEmpty( new BufferRaw() );
  test.identical( got, new BufferRaw( [] ) );

  test.case = 'constructor';
  function func(){ return 0 };
  var got = _.entity.makeEmpty( func );
  var exp = new func.constructor();
  test.equivalent( got(), exp() );

  test.case = 'constructor';
  function Constr(){ this.x = 1; return this };
  var got = _.entity.makeEmpty( new Constr() );
  var exp = new Constr();
  test.identical( got.x, exp.x );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.entity.makeEmpty() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.entity.makeEmpty( [], 1 ) );
}

//

function entityMakeEmptyLongDescriptor( test )
{
  let times = 4;
  for( let e in _.LongDescriptors )
  {
    let name = _.LongDescriptors[ e ].name;
    let descriptor = _.withDefaultLong[ name ];

    test.open( `descriptor - ${ name }` );
    testRun( descriptor );
    test.close( `descriptor - ${ name }` );

    if( times < 1 )
    break;
    times--;
  }

  /* - */

  function testRun( descriptor )
  {
    test.case = 'null';
    var got = descriptor.entityMakeEmpty( null );
    test.identical( got, null );

    test.case = 'undefined';
    var got = descriptor.entityMakeEmpty( undefined );
    test.identical( got, undefined );

    test.case = 'zero';
    var got = descriptor.entityMakeEmpty( 0 );
    test.identical( got, 0 );

    test.case = 'number';
    var got = descriptor.entityMakeEmpty( 3 );
    test.identical( got, 3 );

    test.case = 'bigInt';
    var got = descriptor.entityMakeEmpty( 1n );
    test.identical( got, 1n );

    test.case = 'empty string';
    var got = descriptor.entityMakeEmpty( '' );
    test.identical( got, '' );

    test.case = 'string';
    var got = descriptor.entityMakeEmpty( 'str' );
    test.identical( got, 'str' );

    test.case = 'false';
    var got = descriptor.entityMakeEmpty( false );
    test.identical( got, false );

    test.case = 'NaN';
    var got = descriptor.entityMakeEmpty( NaN );
    test.identical( got, NaN );

    test.case = 'Symbol';
    var src = Symbol( 'a' );
    var got = descriptor.entityMakeEmpty( src );
    test.identical( got, src );

    test.case = '_.null';
    var got = descriptor.entityMakeEmpty( _.null );
    test.identical( got, _.null );

    test.case = '_.undefined';
    var got = descriptor.entityMakeEmpty( _.undefined );
    test.identical( got, _.undefined );

    test.case = '_.nothing';
    var got = descriptor.entityMakeEmpty( _.nothing );
    test.identical( got, _.nothing );

    test.case = 'empty array';
    var got = descriptor.entityMakeEmpty( [] );
    test.identical( got, [] );

    test.case = 'not empty array';
    var got = descriptor.entityMakeEmpty( [ null, undefined, 1, 2 ] );
    test.identical( got, [] );

    test.case = 'empty argumentArray';
    var got = descriptor.entityMakeEmpty( _.argumentsArrayMake( [] ) );
    test.identical( got, descriptor.longDescriptor.make( [] ) );

    test.case = 'not empty argumentsArray';
    var got = descriptor.entityMakeEmpty( _.argumentsArrayMake( [ null, undefined, 1, 2 ] ) );
    test.identical( got, descriptor.longDescriptor.make( [] ) );

    test.case = 'empty unroll';
    var got = descriptor.entityMakeEmpty( _.unrollMake( [] ) );
    test.identical( got, [] );
    test.true( !_.unrollIs( got ) && _.arrayIs( got ) );

    test.case = 'not empty unroll';
    var got = descriptor.entityMakeEmpty( _.argumentsArrayMake( [ null, undefined, 1, 2 ] ) );
    test.identical( got, descriptor.longDescriptor.make( [] ) );

    test.case = 'BufferTyped - U8x';
    var got = descriptor.entityMakeEmpty( new U8x( 10 ) );
    test.identical( got, new U8x() );

    test.case = 'BufferTyped - I16x';
    var got = descriptor.entityMakeEmpty( new I16x() );
    test.identical( got, new I16x() );

    test.case = 'BufferTyped - F64x';
    var got = descriptor.entityMakeEmpty( new F64x( [ 1, 2 ] ) );
    test.identical( got, new F64x() );

    test.case = 'empty map';
    var got = descriptor.entityMakeEmpty( {} );
    test.identical( got, {} );
    test.true( _.mapIsPure( got ) );

    test.case = 'not empty map';
    var got = descriptor.entityMakeEmpty( { '' : null } );
    test.identical( got, {} );
    test.true( _.mapIsPure( got ) );

    test.case = 'empty pure map';
    var got = descriptor.entityMakeEmpty( Object.create( null ) );
    test.identical( got, {} );
    test.true( _.mapIsPure( got ) );

    test.case = 'empty Set';
    var got = descriptor.entityMakeEmpty( new Set( [] ) );
    test.identical( got, new Set( [] ) );

    test.case = 'Set';
    var got = descriptor.entityMakeEmpty( new Set( [ 1, 'str', false ] ) );
    test.identical( got, new Set( [] ) );

    test.case = 'empty HashMap';
    var got = descriptor.entityMakeEmpty( new Map( [] ) );
    test.identical( got, new Map( [] ) );

    test.case = 'HashMap';
    var got = descriptor.entityMakeEmpty( new Map( [ [ 'a', 1 ], [ 'b', 2 ] ] ) );
    test.identical( got, new Map( [] ) );

    test.case = 'BufferRaw, has constructor';
    var got = descriptor.entityMakeEmpty( new BufferRaw() );
    test.identical( got, new BufferRaw( [] ) );

    test.case = 'constructor';
    function func(){ return 0 };
    var got = descriptor.entityMakeEmpty( func );
    var exp = new func.constructor();
    test.equivalent( got(), exp() );

    test.case = 'constructor';
    function Constr(){ this.x = 1; return this };
    var got = descriptor.entityMakeEmpty( new Constr() );
    var exp = new Constr();
    test.identical( got.x, exp.x );

    /* - */

    if( Config.debug )
    {
      test.case = 'without arguments';
      test.shouldThrowErrorSync( () => descriptor.entityMakeEmpty() );

      test.case = 'extra arguments';
      test.shouldThrowErrorSync( () => descriptor.entityMakeEmpty( [], 1 ) );
    }
  }

  /* */

  function Constr()
  {
    this.x = 1;
    return this;
  };
}

//

function entityMakeUndefined( test )
{
  test.case = 'null';
  var got = _.entity.makeUndefined( null );
  test.identical( got, null );

  test.case = 'undefined';
  var got = _.entity.makeUndefined( undefined );
  test.identical( got, undefined );

  test.case = 'zero';
  var got = _.entity.makeUndefined( 0 );
  test.identical( got, 0 );

  test.case = 'number';
  var got = _.entity.makeUndefined( 3 );
  test.identical( got, 3 );

  test.case = 'bigInt';
  var got = _.entity.makeUndefined( 1n );
  test.identical( got, 1n );

  test.case = 'empty string';
  var got = _.entity.makeUndefined( '' );
  test.identical( got, '' );

  test.case = 'string';
  var got = _.entity.makeUndefined( 'str' );
  test.identical( got, 'str' );

  test.case = 'false';
  var got = _.entity.makeUndefined( false );
  test.identical( got, false );

  test.case = 'NaN';
  var got = _.entity.makeUndefined( NaN );
  test.identical( got, NaN );

  test.case = 'Symbol';
  var src = Symbol( 'a' );
  var got = _.entity.makeUndefined( src );
  test.identical( got, src );

  test.case = '_.null';
  var got = _.entity.makeUndefined( _.null );
  test.identical( got, _.null );

  test.case = '_.undefined';
  var got = _.entity.makeUndefined( _.undefined );
  test.identical( got, _.undefined );

  test.case = '_.nothing';
  var got = _.entity.makeUndefined( _.nothing );
  test.identical( got, _.nothing );

  test.case = 'empty array';
  var got = _.entity.makeUndefined( [] );
  test.identical( got, [] );

  test.case = 'empty array, length';
  var got = _.entity.makeUndefined( [], 4 );
  test.identical( got, [ undefined, undefined, undefined, undefined ] );

  test.case = 'not empty array';
  var got = _.entity.makeUndefined( [ null, undefined, 1, 2 ] );
  test.identical( got, [ undefined, undefined, undefined, undefined ] );

  test.case = 'not empty array, length';
  var got = _.entity.makeUndefined( [ null, undefined, 1, 2 ], 2 );
  test.identical( got, [ undefined, undefined ] );

  test.case = 'empty arguments array';
  var got = _.entity.makeUndefined( _.argumentsArrayMake( [] ) );
  test.identical( got, [] );
  test.true( _.arrayIs( got ) );

  test.case = 'empty arguments array, length';
  var got = _.entity.makeUndefined( _.argumentsArrayMake( [] ), 4 );
  test.identical( got, [ undefined, undefined, undefined, undefined ] );
  test.true( _.arrayIs( got ) );

  test.case = 'not empty argumentsArray';
  var got = _.entity.makeUndefined( _.argumentsArrayMake( [ null, undefined, 1, 2 ] ) );
  test.identical( got, [ undefined, undefined, undefined, undefined ] );
  test.true( _.arrayIs( got ) );

  test.case = 'not empty argumentsArray, length';
  var got = _.entity.makeUndefined( _.argumentsArrayMake( [ null, undefined, 1, 2 ] ), 2 );
  test.identical( got, [ undefined, undefined ] );
  test.true( _.arrayIs( got ) );

  test.case = 'empty unroll';
  var got = _.entity.makeUndefined( _.unrollMake( [] ) );
  test.identical( got, [] );
  test.true( !_.unrollIs( got ) && _.arrayIs( got ) );

  test.case = 'empty unroll, length';
  var got = _.entity.makeUndefined( _.unrollMake( [] ), 4 );
  test.identical( got, [ undefined, undefined, undefined, undefined ] );
  test.true( !_.unrollIs( got ) && _.arrayIs( got ) );

  test.case = 'not empty unroll';
  var got = _.entity.makeUndefined( _.unrollMake( [ null, undefined, 1, 2 ] ) );
  test.identical( got, [ undefined, undefined, undefined, undefined ] );
  test.true( !_.unrollIs( got ) && _.arrayIs( got ) );

  test.case = 'not empty unroll, length';
  var got = _.entity.makeUndefined( _.unrollMake( [ null, undefined, 1, 2 ] ), 2 );
  test.identical( got, [ undefined, undefined ] );
  test.true( !_.unrollIs( got ) && _.arrayIs( got ) );

  test.case = 'empty BufferTyped - U8x';
  var got = _.entity.makeUndefined( new U8x() );
  test.identical( got, new U8x( 0 ) );

  test.case = 'empty BufferTyped - I16x, length';
  var got = _.entity.makeUndefined( new I16x(), 5 );
  test.identical( got, new I16x( 5 ) );

  test.case = 'BufferTyped - F32x';
  var got = _.entity.makeUndefined( new F32x( 5 ) );
  test.identical( got, new F32x( 5 ) );

  test.case = 'BufferTyped - F32x, length';
  var got = _.entity.makeUndefined( new F32x( 10 ), 5 );
  test.identical( got, new F32x( 5 ) );

  test.case = 'empty map';
  var got = _.entity.makeUndefined( {} );
  test.identical( got, {} );
  test.true( _.mapIsPure( got ) );

  test.case = 'empty map, length';
  var got = _.entity.makeUndefined( {}, 4 );
  test.identical( got, {} );
  test.true( _.mapIsPure( got ) );

  test.case = 'not empty map';
  var got = _.entity.makeUndefined( { '' : null } );
  test.identical( got, {} );
  test.true( _.mapIsPure( got ) );

  test.case = 'not empty map, length';
  var got = _.entity.makeUndefined( { '' : null }, 4 );
  test.identical( got, {} );
  test.true( _.mapIsPure( got ) );

  test.case = 'empty pure map';
  var got = _.entity.makeUndefined( Object.create( null ) );
  test.identical( got, {} );
  test.true( _.mapIsPure( got ) );

  test.case = 'empty pure map, length';
  var got = _.entity.makeUndefined( Object.create( null ) );
  test.identical( got, {} );
  test.true( _.mapIsPure( got ) );

  test.case = 'empty Set';
  var got = _.entity.makeUndefined( new Set( [] ) );
  test.identical( got, new Set( [] ) );

  test.case = 'empty Set, length';
  var got = _.entity.makeUndefined( new Set( [] ), 4 );
  test.identical( got, new Set( [] ) );

  test.case = 'Set';
  var got = _.entity.makeUndefined( new Set( [ 1, 'str', false ] ) );
  test.identical( got, new Set( [] ) );

  test.case = 'Set, length';
  var got = _.entity.makeUndefined( new Set( [ 1, 'str', false ] ), 4 );
  test.identical( got, new Set( [] ) );

  test.case = 'empty HashMap';
  var got = _.entity.makeUndefined( new Map( [] ) );
  test.identical( got, new Map( [] ) );

  test.case = 'empty HashMap, length';
  var got = _.entity.makeUndefined( new Map( [] ), 4 );
  test.identical( got, new Map( [] ) );

  test.case = 'HashMap';
  var got = _.entity.makeUndefined( new Map( [ [ 'a', 1 ], [ 'b', 2 ] ] ) );
  test.identical( got, new Map( [] ) );

  test.case = 'HashMap, length';
  var got = _.entity.makeUndefined( new Map( [ [ 'a', 1 ], [ 'b', 2 ] ] ) );
  test.identical( got, new Map( [] ) );

  test.case = 'BufferRaw, has constructor';
  var got = _.entity.makeUndefined( new BufferRaw() );
  test.identical( got, new BufferRaw( [] ) );

  test.case = 'constructor';
  function func(){ return 0 };
  var got = _.entity.makeUndefined( func );
  var exp = new func.constructor();
  test.equivalent( got(), exp() );

  test.case = 'constructor';
  function Constr(){ this.x = 1; return this };
  var got = _.entity.makeUndefined( new Constr() );
  var exp = new Constr();
  test.identical( got.x, exp.x );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.entity.makeUndefined() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.entity.makeUndefined( [], 1, 1 ) );
}

//

function entityMakeUndefinedLongDescriptor( test )
{
  let times = 4;
  for( let e in _.LongDescriptors )
  {
    let name = _.LongDescriptors[ e ].name;
    let descriptor = _.withDefaultLong[ name ];

    test.open( `descriptor - ${ name }` );
    testRun( descriptor );
    test.close( `descriptor - ${ name }` );

    if( times < 1 )
    break;
    times--;
  }

  /* - */

  function testRun( descriptor )
  {
    test.case = 'null';
    var got = descriptor.entityMakeUndefined( null );
    test.identical( got, null );

    test.case = 'undefined';
    var got = descriptor.entityMakeUndefined( undefined );
    test.identical( got, undefined );

    test.case = 'zero';
    var got = descriptor.entityMakeUndefined( 0 );
    test.identical( got, 0 );

    test.case = 'number';
    var got = descriptor.entityMakeUndefined( 3 );
    test.identical( got, 3 );

    test.case = 'bigInt';
    var got = descriptor.entityMakeUndefined( 1n );
    test.identical( got, 1n );

    test.case = 'empty string';
    var got = descriptor.entityMakeUndefined( '' );
    test.identical( got, '' );

    test.case = 'string';
    var got = descriptor.entityMakeUndefined( 'str' );
    test.identical( got, 'str' );

    test.case = 'false';
    var got = descriptor.entityMakeUndefined( false );
    test.identical( got, false );

    test.case = 'NaN';
    var got = descriptor.entityMakeUndefined( NaN );
    test.identical( got, NaN );

    test.case = 'Symbol';
    var src = Symbol( 'a' );
    var got = descriptor.entityMakeUndefined( src );
    test.identical( got, src );

    test.case = '_.null';
    var got = descriptor.entityMakeUndefined( _.null );
    test.identical( got, _.null );

    test.case = '_.undefined';
    var got = descriptor.entityMakeUndefined( _.undefined );
    test.identical( got, _.undefined );

    test.case = '_.nothing';
    var got = descriptor.entityMakeUndefined( _.nothing );
    test.identical( got, _.nothing );

    test.case = 'empty array';
    var got = descriptor.entityMakeUndefined( [] );
    test.identical( got, [] );

    test.case = 'empty array, length';
    var got = descriptor.entityMakeUndefined( [], 4 );
    test.identical( got, [ undefined, undefined, undefined, undefined ] );

    test.case = 'not empty array';
    var got = descriptor.entityMakeUndefined( [ null, undefined, 1, 2 ] );
    test.identical( got, [ undefined, undefined, undefined, undefined ] );

    test.case = 'not empty array, length';
    var got = descriptor.entityMakeUndefined( [ null, undefined, 1, 2 ], 2 );
    test.identical( got, [ undefined, undefined ] );

    test.case = 'empty arguments array';
    var got = descriptor.entityMakeUndefined( _.argumentsArrayMake( [] ) );
    test.identical( got, descriptor.longDescriptor.make( [] ) );

    test.case = 'empty arguments array, length';
    var got = descriptor.entityMakeUndefined( _.argumentsArrayMake( [] ), 4 );
    test.identical( got, descriptor.longDescriptor.make( 4 ) );

    test.case = 'not empty argumentsArray';
    var got = descriptor.entityMakeUndefined( _.argumentsArrayMake( [ null, undefined, 1, 2 ] ) );
    test.identical( got, descriptor.longDescriptor.make( 4 ) );

    test.case = 'not empty argumentsArray, length';
    var got = descriptor.entityMakeUndefined( _.argumentsArrayMake( [ null, undefined, 1, 2 ] ), 2 );
    test.identical( got, descriptor.longDescriptor.make( 2 ) );

    test.case = 'empty unroll';
    var got = descriptor.entityMakeUndefined( _.unrollMake( [] ) );
    test.identical( got, [] );

    test.case = 'empty unroll, length';
    var got = descriptor.entityMakeUndefined( _.unrollMake( [] ), 4 );
    test.identical( got, [ undefined, undefined, undefined, undefined ] );

    test.case = 'not empty unroll';
    var got = descriptor.entityMakeUndefined( _.unrollMake( [ null, undefined, 1, 2 ] ) );
    test.identical( got, [ undefined, undefined, undefined, undefined ] );

    test.case = 'not empty unroll, length';
    var got = descriptor.entityMakeUndefined( _.unrollMake( [ null, undefined, 1, 2 ] ), 2 );
    test.identical( got, [ undefined, undefined ] );

    test.case = 'empty BufferTyped - U8x';
    var got = descriptor.entityMakeUndefined( new U8x() );
    test.identical( got, new U8x( 0 ) );

    test.case = 'empty BufferTyped - I16x, length';
    var got = descriptor.entityMakeUndefined( new I16x(), 5 );
    test.identical( got, new I16x( 5 ) );

    test.case = 'BufferTyped - F32x';
    var got = descriptor.entityMakeUndefined( new F32x( 5 ) );
    test.identical( got, new F32x( 5 ) );

    test.case = 'BufferTyped - F32x, length';
    var got = descriptor.entityMakeUndefined( new F32x( 10 ), 5 );
    test.identical( got, new F32x( 5 ) );

    test.case = 'empty map';
    var got = descriptor.entityMakeUndefined( {} );
    test.identical( got, {} );
    test.true( _.mapIsPure( got ) );

    test.case = 'empty map, length';
    var got = descriptor.entityMakeUndefined( {}, 4 );
    test.identical( got, {} );
    test.true( _.mapIsPure( got ) );

    test.case = 'not empty map';
    var got = descriptor.entityMakeUndefined( { '' : null } );
    test.identical( got, {} );
    test.true( _.mapIsPure( got ) );

    test.case = 'not empty map, length';
    var got = descriptor.entityMakeUndefined( { '' : null }, 4 );
    test.identical( got, {} );
    test.true( _.mapIsPure( got ) );

    test.case = 'empty pure map';
    var got = descriptor.entityMakeUndefined( Object.create( null ) );
    test.identical( got, {} );
    test.true( _.mapIsPure( got ) );

    test.case = 'empty pure map, length';
    var got = descriptor.entityMakeUndefined( Object.create( null ) );
    test.identical( got, {} );
    test.true( _.mapIsPure( got ) );

    test.case = 'empty Set';
    var got = descriptor.entityMakeUndefined( new Set( [] ) );
    test.identical( got, new Set( [] ) );

    test.case = 'empty Set, length';
    var got = descriptor.entityMakeUndefined( new Set( [] ), 4 );
    test.identical( got, new Set( [] ) );

    test.case = 'Set';
    var got = descriptor.entityMakeUndefined( new Set( [ 1, 'str', false ] ) );
    test.identical( got, new Set( [] ) );

    test.case = 'Set, length';
    var got = descriptor.entityMakeUndefined( new Set( [ 1, 'str', false ] ), 4 );
    test.identical( got, new Set( [] ) );

    test.case = 'empty HashMap';
    var got = descriptor.entityMakeUndefined( new Map( [] ) );
    test.identical( got, new Map( [] ) );

    test.case = 'empty HashMap, length';
    var got = descriptor.entityMakeUndefined( new Map( [] ), 4 );
    test.identical( got, new Map( [] ) );

    test.case = 'HashMap';
    var got = descriptor.entityMakeUndefined( new Map( [ [ 'a', 1 ], [ 'b', 2 ] ] ) );
    test.identical( got, new Map( [] ) );

    test.case = 'HashMap, length';
    var got = descriptor.entityMakeUndefined( new Map( [ [ 'a', 1 ], [ 'b', 2 ] ] ) );
    test.identical( got, new Map( [] ) );

    test.case = 'BufferRaw, has constructor';
    var got = descriptor.entityMakeUndefined( new BufferRaw() );
    test.identical( got, new BufferRaw( [] ) );

    test.case = 'constructor';
    function func(){ return 0 };
    var got = descriptor.entityMakeUndefined( func );
    var exp = new func.constructor();
    test.equivalent( got(), exp() );

    test.case = 'constructor';
    function Constr(){ this.x = 1; return this };
    var got = descriptor.entityMakeUndefined( new Constr() );
    var exp = new Constr();
    test.identical( got.x, exp.x );

    /* - */

    if( Config.debug )
    {
      test.case = 'without arguments';
      test.shouldThrowErrorSync( () => descriptor.entityMakeUndefined() );

      test.case = 'extra arguments';
      test.shouldThrowErrorSync( () => descriptor.entityMakeUndefined( [], 1, 1 ) );
    }
  }

  /* */

  function Constr()
  {
    this.x = 1;
    return this;
  };
}

//

function entityMake( test )
{
  test.case = 'null';
  var got = _.entity.make( null );
  test.identical( got, null );

  test.case = 'undefined';
  var got = _.entity.make( undefined );
  test.identical( got, undefined );

  test.case = 'zero';
  var got = _.entity.make( 0 );
  test.identical( got, 0 );

  test.case = 'number';
  var got = _.entity.make( 3 );
  test.identical( got, 3 );

  test.case = 'bigInt';
  var got = _.entity.make( 1n );
  test.identical( got, 1n );

  test.case = 'empty string';
  var got = _.entity.make( '' );
  test.identical( got, '' );

  test.case = 'string';
  var got = _.entity.make( 'str' );
  test.identical( got, 'str' );

  test.case = 'false';
  var got = _.entity.make( false );
  test.identical( got, false );

  test.case = 'NaN';
  var got = _.entity.make( NaN );
  test.identical( got, NaN );

  test.case = 'Symbol';
  var src = Symbol( 'a' );
  var got = _.entity.make( src );
  test.identical( got, src );

  test.case = '_.null';
  var got = _.entity.make( _.null );
  test.identical( got, _.null );

  test.case = '_.undefined';
  var got = _.entity.make( _.undefined );
  test.identical( got, _.undefined );

  test.case = '_.nothing';
  var got = _.entity.make( _.nothing );
  test.identical( got, _.nothing );

  test.case = 'empty array';
  var src = [];
  var got = _.entity.make( src );
  test.identical( got, [] );
  test.true( got !== src );

  test.case = 'not empty array';
  var src = [ null, undefined, 1, 2 ];
  var got = _.entity.make( src );
  test.identical( got, [ null, undefined, 1, 2 ] );
  test.true( got !== src );

  test.case = 'empty argumentArray';
  var src = _.argumentsArrayMake( [] );
  var got = _.entity.make( src );
  test.identical( got, [] );
  test.true( _.arrayIs( got ) );
  test.true( got !== src );

  test.case = 'not empty argumentsArray';
  var src = _.argumentsArrayMake( [ null, undefined, 1, 2 ] );
  var got = _.entity.make( src );
  test.identical( got, [ null, undefined, 1, 2 ] );
  test.true( _.arrayIs( got ) );
  test.true( got !== src );

  test.case = 'empty unroll';
  var src = _.unrollMake( [] );
  var got = _.entity.make( src );
  test.identical( got, [] );
  test.true( _.arrayIs( got ) );
  test.true( got !== src );

  test.case = 'not empty unroll';
  var src = _.unrollMake( [ null, undefined, 1, 2 ] );
  var got = _.entity.make( src );
  test.identical( got, [ null, undefined, 1, 2 ] );
  test.true( _.arrayIs( got ) );
  test.true( got !== src );

  test.case = 'empty BufferTyped - U8x';
  var src = new U8x();
  var got = _.entity.make( src );
  test.identical( got, new U8x( [] ) );
  test.true( got instanceof U8x )
  test.true( got !== src );

  test.case = 'not empty BufferTyped - I16x';
  var src = new I16x( 5 );
  var got = _.entity.make( src );
  test.identical( got, new I16x( [ 0, 0, 0, 0, 0 ] ) );
  test.true( got instanceof I16x )
  test.true( got !== src );

  test.case = 'not empty BufferTyped - F32x';
  var src = new F32x( 5 );
  var got = _.entity.make( src );
  test.identical( got, new F32x( [ 0, 0, 0, 0, 0 ] ) );
  test.true( got instanceof F32x )
  test.true( got !== src );

  test.case = 'not empty BufferTyped - F64x';
  var src = new F64x( 5 );
  var got = _.entity.make( src );
  test.identical( got, new F64x( [ 0, 0, 0, 0, 0 ] ) );
  test.true( got instanceof F64x )
  test.true( got !== src );

  test.case = 'empty map';
  var src = {};
  var got = _.entity.make( src );
  test.identical( got, {} );
  test.true( _.mapIsPure( got ) );
  test.true( got !== src );

  test.case = 'not empty map';
  var src = { '' : null };
  var got = _.entity.make( src );
  test.identical( got, { '' : null } );
  test.true( _.mapIsPure( got ) );
  test.true( got !== src );

  test.case = 'empty pure map';
  var src = Object.create( null );
  var got = _.entity.make( src );
  test.identical( got, {} );
  test.true( _.mapIsPure( got ) );
  test.true( got !== src );

  test.case = 'pure map';
  var src = Object.create( null );
  src.a = 2;
  var got = _.entity.make( src );
  test.identical( got, { a : 2 } );
  test.true( _.mapIsPure( got ) );
  test.true( got !== src );

  test.case = 'empty Set';
  var src = new Set( [] );
  var got = _.entity.make( src );
  test.identical( got, new Set( [] ) );
  test.true( got !== src );

  test.case = 'Set';
  var src = new Set( [ 1, 'str', false ] );
  var got = _.entity.make( src );
  test.identical( got, new Set( [ 1, 'str', false ] ) );
  test.true( got !== src );

  test.case = 'empty HashMap';
  var src = new Map( [] );
  var got = _.entity.make( src );
  test.identical( got, new Map( [] ) );
  test.true( got !== src );

  test.case = 'HashMap';
  var src = new Map( [ [ 'a', 1 ], [ 'b', 2 ] ] );
  var got = _.entity.make( src );
  test.identical( got, new Map( [ [ 'a', 1 ], [ 'b', 2 ] ] ) );
  test.true( got !== src );

  test.case = 'BufferRaw, has constructor';
  var got = _.entity.make( new BufferRaw() );
  test.identical( got, new BufferRaw( [] ) );

  test.case = 'constructor';
  function func(){ return 0 };
  var got = _.entity.make( func );
  var exp = new func.constructor();
  test.equivalent( got(), exp() );

  test.case = 'constructor';
  function Constr(){ this.x = 1; return this };
  var got = _.entity.make( new Constr() );
  var exp = new Constr();
  test.identical( got.x, exp.x );

  /* */

  test.case = 'routine for key shallowSymbol';
  function Constr1(){ this.x = 1; return this };
  var src = new Constr1();
  src[ _.entity.shallowCloneSymbol ] = () => new Constr1();
  var got = _.entity.make( src );
  var exp = new Constr1();
  test.identical( got.x, exp.x );

  test.case = 'routine for key shallowSymbol';
  function Constr2(){ this.x = 1; return this };
  var src = new Constr2();
  src.cloneShallow = () => new Constr2();
  var got = _.entity.make( src );
  var exp = new Constr1();
  test.identical( got.x, exp.x );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.entity.make() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.entity.make( [], 1 ) );
}

//

function entityMakeLongDescriptor( test )
{
  let times = 4;
  for( let e in _.LongDescriptors )
  {
    let name = _.LongDescriptors[ e ].name;
    let descriptor = _.withDefaultLong[ name ];

    test.open( `descriptor - ${ name }` );
    testRun( descriptor );
    test.close( `descriptor - ${ name }` );

    if( times < 1 )
    break;
    times--;
  }

  /* - */

  function testRun( descriptor )
  {
    test.case = 'null';
    var got = descriptor.entityMake( null );
    test.identical( got, null );

    test.case = 'undefined';
    var got = descriptor.entityMake( undefined );
    test.identical( got, undefined );

    test.case = 'zero';
    var got = descriptor.entityMake( 0 );
    test.identical( got, 0 );

    test.case = 'number';
    var got = descriptor.entityMake( 3 );
    test.identical( got, 3 );

    test.case = 'bigInt';
    var got = descriptor.entityMake( 1n );
    test.identical( got, 1n );

    test.case = 'empty string';
    var got = descriptor.entityMake( '' );
    test.identical( got, '' );

    test.case = 'string';
    var got = descriptor.entityMake( 'str' );
    test.identical( got, 'str' );

    test.case = 'false';
    var got = descriptor.entityMake( false );
    test.identical( got, false );

    test.case = 'NaN';
    var got = descriptor.entityMake( NaN );
    test.identical( got, NaN );

    test.case = 'Symbol';
    var src = Symbol( 'a' );
    var got = descriptor.entityMake( src );
    test.identical( got, src );

    test.case = '_.null';
    var got = descriptor.entityMake( _.null );
    test.identical( got, _.null );

    test.case = '_.undefined';
    var got = descriptor.entityMake( _.undefined );
    test.identical( got, _.undefined );

    test.case = '_.nothing';
    var got = descriptor.entityMake( _.nothing );
    test.identical( got, _.nothing );

    test.case = 'empty array';
    var src = [];
    var got = descriptor.entityMake( src );
    test.identical( got, [] );
    test.true( got !== src );

    test.case = 'not empty array';
    var src = [ null, undefined, 1, 2 ];
    var got = descriptor.entityMake( src );
    test.identical( got, [ null, undefined, 1, 2 ] );
    test.true( got !== src );

    test.case = 'empty argumentArray';
    var src = _.argumentsArrayMake( [] );
    var got = descriptor.entityMake( src );
    test.identical( got, descriptor.longDescriptor.make( [] ) );

    test.case = 'not empty argumentsArray';
    var src = _.argumentsArrayMake( [ null, undefined, 1, 2 ] );
    var got = descriptor.entityMake( src );
    test.identical( got, descriptor.longDescriptor.make( [ null, undefined, 1, 2 ] ) );

    test.case = 'empty unroll';
    var src = _.unrollMake( [] );
    var got = descriptor.entityMake( src );
    test.identical( got, [] );
    test.true( got !== src );

    test.case = 'not empty unroll';
    var src = _.unrollMake( [ null, undefined, 1, 2 ] );
    var got = descriptor.entityMake( src );
    test.identical( got, [ null, undefined, 1, 2 ] );
    test.true( got !== src );

    test.case = 'empty BufferTyped - U8x';
    var src = new U8x();
    var got = descriptor.entityMake( src );
    test.identical( got, new U8x( [] ) );
    test.true( got !== src );

    test.case = 'not empty BufferTyped - I16x';
    var src = new I16x( 5 );
    var got = descriptor.entityMake( src );
    test.identical( got, new I16x( [ 0, 0, 0, 0, 0 ] ) );
    test.true( got !== src );

    test.case = 'not empty BufferTyped - F64x';
    var src = new F64x( 5 );
    var got = descriptor.entityMake( src );
    test.identical( got, new F64x( [ 0, 0, 0, 0, 0 ] ) );
    test.true( got !== src );

    test.case = 'empty map';
    var src = {};
    var got = descriptor.entityMake( src );
    test.identical( got, {} );
    test.true( _.mapIsPure( got ) );
    test.true( got !== src );

    test.case = 'not empty map';
    var src = { '' : null };
    var got = descriptor.entityMake( src );
    test.identical( got, { '' : null } );
    test.true( _.mapIsPure( got ) );
    test.true( got !== src );

    test.case = 'empty pure map';
    var src = Object.create( null );
    var got = descriptor.entityMake( src );
    test.identical( got, {} );
    test.true( _.mapIsPure( got ) );
    test.true( got !== src );

    test.case = 'pure map';
    var src = Object.create( null );
    src.a = 2;
    var got = descriptor.entityMake( src );
    test.identical( got, { a : 2 } );
    test.true( _.mapIsPure( got ) );
    test.true( got !== src );

    test.case = 'empty Set';
    var src = new Set( [] );
    var got = descriptor.entityMake( src );
    test.identical( got, new Set( [] ) );
    test.true( got !== src );

    test.case = 'Set';
    var src = new Set( [ 1, 'str', false ] );
    var got = descriptor.entityMake( src );
    test.identical( got, new Set( [ 1, 'str', false ] ) );
    test.true( got !== src );

    test.case = 'empty HashMap';
    var src = new Map( [] );
    var got = descriptor.entityMake( src );
    test.identical( got, new Map( [] ) );
    test.true( got !== src );

    test.case = 'HashMap';
    var src = new Map( [ [ 'a', 1 ], [ 'b', 2 ] ] );
    var got = descriptor.entityMake( src );
    test.identical( got, new Map( [ [ 'a', 1 ], [ 'b', 2 ] ] ) );
    test.true( got !== src );

    test.case = 'BufferRaw, has constructor';
    var got = descriptor.entityMake( new BufferRaw() );
    test.identical( got, new BufferRaw( [] ) );

    test.case = 'constructor';
    function func(){ return 0 };
    var got = descriptor.entityMake( func );
    var exp = new func.constructor();
    test.equivalent( got(), exp() );

    test.case = 'constructor';
    function Constr(){ this.x = 1; return this };
    var got = descriptor.entityMake( new Constr() );
    var exp = new Constr();
    test.identical( got.x, exp.x );

    /* */

    test.case = 'routine for key shallowSymbol';
    function Constr1(){ this.x = 1; return this };
    var src = new Constr1();
    src[ _.entity.shallowCloneSymbol ] = () => new Constr1();
    var got = descriptor.entityMake( src );
    var exp = new Constr1();
    test.identical( got.x, exp.x );

    test.case = 'routine for key shallowSymbol';
    function Constr2(){ this.x = 1; return this };
    var src = new Constr2();
    src.cloneShallow = () => new Constr2();
    var got = descriptor.entityMake( src );
    var exp = new Constr1();
    test.identical( got.x, exp.x );

    /* - */

    if( Config.debug )
    {
      test.case = 'without arguments';
      test.shouldThrowErrorSync( () => descriptor.entityMake() );

      test.case = 'extra arguments';
      test.shouldThrowErrorSync( () => descriptor.entityMake( [], 1 ) );
    }
  }

  /* */

  function Constr()
  {
    this.x = 1;
    return this;
  };
}

//

function entityEntityEqualize( test )
{
  test.open( 'without callbacks' );

  test.case = 'two undefined';
  var got = _.entity.equalize( undefined, undefined );
  test.identical( got, true );

  test.case = 'undefined and null';
  var got = _.entity.equalize( undefined, null );
  test.identical( got, false );

  test.case = 'nan and nan';
  var got = _.entity.equalize( NaN, NaN );
  test.identical( got, true );

  test.case = 'equal numbers';
  var got = _.entity.equalize( 1, 1 );
  test.identical( got, true );

  test.case = 'different numbers';
  var got = _.entity.equalize( 1, 2 );
  test.identical( got, false );

  test.case = 'equal strings';
  var got = _.entity.equalize( 'str', 'str' );
  test.identical( got, true );

  test.case = 'different strings';
  var got = _.entity.equalize( 'str', 'src' );
  test.identical( got, false );

  test.case = 'empty arrays';
  var got = _.entity.equalize( [], [] );
  test.identical( got, false );

  test.case = 'equal arrays';
  var got = _.entity.equalize( [ 1, 2, 'str', null, undefined ], [ 1, 2, 'str', null, undefined ] );
  test.identical( got, false );

  test.case = 'not equal arrays';
  var got = _.entity.equalize( [ 1 ], [ 2, 'str', null, undefined ] );
  test.identical( got, false );

  test.case = 'empty maps';
  var got = _.entity.equalize( {}, {} );
  test.identical( got, false );

  test.case = 'equal maps';
  var got = _.entity.equalize( { a : 2, b : 'str' }, { a : 2, b : 'str' } );
  test.identical( got, false );

  test.case = 'not equal maps';
  var got = _.entity.equalize( { a : 'str' }, { b : 'str' } );
  test.identical( got, false );

  test.close( 'without callbacks' );

  /* - */

  test.open( 'only onEvaluate1' );

  test.case = 'two undefined';
  var got = _.entity.equalize( undefined, undefined, ( e ) => e );
  test.identical( got, true );

  test.case = 'undefined and null';
  var got = _.entity.equalize( undefined, null, ( e ) => e );
  test.identical( got, false );

  test.case = 'equal numbers';
  var got = _.entity.equalize( 1, 1, ( e ) => e );
  test.identical( got, true );

  test.case = 'different numbers';
  var got = _.entity.equalize( 1, 2, ( e ) => e === 1 ? e : e - 1 );
  test.identical( got, true );

  test.case = 'equal strings';
  var got = _.entity.equalize( 'str', 'str', ( e ) => e );
  test.identical( got, true );

  test.case = 'different strings';
  var got = _.entity.equalize( 'str', 'src', ( e ) => typeof e );
  test.identical( got, true );

  test.case = 'empty arrays';
  var got = _.entity.equalize( [], [], ( e ) => e.length );
  test.identical( got, true );

  test.case = 'equal arrays';
  var got = _.entity.equalize( [ 1, 2, 'str', null, undefined ], [ 1, 2, 'str', null, undefined ], ( e ) => e[ 3 ] );
  test.identical( got, true );

  test.case = 'not equal arrays';
  var got = _.entity.equalize( [ 1 ], [ 2, 'str', null, undefined ], ( e ) => e[ 0 ] );
  test.identical( got, false );

  test.case = 'empty maps';
  var got = _.entity.equalize( {}, {}, ( e ) => _.mapIs( e ) );
  test.identical( got, true );

  test.case = 'equal maps';
  var got = _.entity.equalize( { a : 2, b : 'str' }, { a : 2, b : 'str' }, ( e ) => e.a );
  test.identical( got, true );

  test.case = 'not equal maps';
  var got = _.entity.equalize( { a : 'str' }, { b : 'str' }, ( e ) => typeof e.a );
  test.identical( got, false );

  test.close( 'only onEvaluate1' );

  /* - */

  test.open( 'onEvaluate1 is equalizer' );

  test.case = 'two undefined';
  var got = _.entity.equalize( undefined, undefined, ( e, ins ) => e === ins );
  test.identical( got, true );

  test.case = 'undefined and null';
  var got = _.entity.equalize( undefined, null, ( e, ins ) => e === ins );
  test.identical( got, false );

  test.case = 'equal numbers';
  var got = _.entity.equalize( 1, 1, ( e, ins ) => e === ins );
  test.identical( got, true );

  test.case = 'different numbers';
  var got = _.entity.equalize( 1, 2, ( e, ins ) => e === ins - 1 );
  test.identical( got, true );

  test.case = 'equal strings';
  var got = _.entity.equalize( 'str', 'str', ( e, ins ) => e !== ins );
  test.identical( got, false );

  test.case = 'different strings';
  var got = _.entity.equalize( 'str', 'src', ( e, ins ) => typeof e === typeof ins );
  test.identical( got, true );

  test.case = 'empty arrays';
  var got = _.entity.equalize( [], [], ( e, ins ) => e.length === ins.length );
  test.identical( got, true );

  test.case = 'equal arrays';
  var got = _.entity.equalize( [ 1, 2, 'str', null, undefined ], [ 1, 2, 'str', null, undefined ], ( e, ins ) => e[ 0 ] === ins[ 1 ] );
  test.identical( got, false );

  test.case = 'not equal arrays';
  var got = _.entity.equalize( [ 1 ], [ 2, 'str', null, undefined ], ( e, ins ) => e[ 0 ] === ins[ 0 ] - 1 );
  test.identical( got, true );

  test.case = 'empty maps';
  var got = _.entity.equalize( {}, {}, ( e, ins ) => _.mapIs( e ) === _.mapIs( ins ) );
  test.identical( got, true );

  test.case = 'equal maps';
  var got = _.entity.equalize( { a : 2, b : 'str' }, { a : 2, b : 'str' }, ( e, ins ) => e.a === ins.b );
  test.identical( got, false );

  test.case = 'not equal maps';
  var got = _.entity.equalize( { a : 'str' }, { b : 'str' }, ( e, ins ) => e.a === ins.b );
  test.identical( got, true );

  test.close( 'onEvaluate1 is equalizer' );

  /* - */

  test.open( 'onEvaluate1 and onEvaluate2' );

  test.case = 'two undefined';
  var got = _.entity.equalize( undefined, undefined, ( e ) => e, ( ins ) => ins );
  test.identical( got, true );

  test.case = 'undefined and null';
  var got = _.entity.equalize( undefined, null, ( e ) => e, ( ins ) => ins );
  test.identical( got, false );

  test.case = 'equal numbers';
  var got = _.entity.equalize( 1, 1, ( e ) => e, ( ins ) => ins );
  test.identical( got, true );

  test.case = 'different numbers';
  var got = _.entity.equalize( 1, 2, ( e ) => e, ( ins ) => ins - 1 );
  test.identical( got, true );

  test.case = 'equal strings';
  var got = _.entity.equalize( 'str', 'str', ( e ) => e, ( ins ) => !ins );
  test.identical( got, false );

  test.case = 'different strings';
  var got = _.entity.equalize( 'str', 'src', ( e ) => !!e, ( ins ) => !!ins );
  test.identical( got, true );

  test.case = 'empty arrays';
  var got = _.entity.equalize( [], [], ( e ) => e.length, ( ins ) => ins.length );
  test.identical( got, true );

  test.case = 'equal arrays';
  var got = _.entity.equalize( [ 1, 2, 'str', null, undefined ], [ 1, 2, 'str', null, undefined ], ( e ) => !!e[ 3 ], ( ins ) => !!ins[ 4 ] );
  test.identical( got, true );

  test.case = 'not equal arrays';
  var got = _.entity.equalize( [ 4 ], [ 2, 'str', null, undefined ], ( e ) => e[ 0 ], ( ins ) => ins.length );
  test.identical( got, true );

  test.case = 'empty maps';
  var got = _.entity.equalize( {}, {}, ( e ) => !!e, ( ins ) => !!ins );
  test.identical( got, true );

  test.case = 'equal maps';
  var got = _.entity.equalize( { a : 2, b : 'str' }, { a : 2, b : 'str' }, ( e ) => e.b, ( ins ) => ins.b );
  test.identical( got, true );

  test.case = 'not equal maps';
  var got = _.entity.equalize( { a : 'str' }, { b : 'str' }, ( e ) => e.a, ( ins ) => ins.b );
  test.identical( got, true );

  test.close( 'onEvaluate1 and onEvaluate2' );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.entity.equalize() );

  test.case = 'one argument';
  test.shouldThrowErrorSync( () => _.entity.equalize( 1 ) );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.entity.equalize( 1, 2, ( e ) => e, ( ins ) => ins, 'extra' ) );

  test.case = 'wrong length of onEvaluate1';
  test.shouldThrowErrorSync( () => _.entity.equalize( 1, 2, () => true ) );
  test.shouldThrowErrorSync( () => _.entity.equalize( 1, 2, ( a, b, c ) => a === b - c ) );

  test.case = 'wrong type of onEvaluate1';
  test.shouldThrowErrorSync( () => _.entity.equalize( 1, 2, [ 1 ] ) );
  test.shouldThrowErrorSync( () => _.entity.equalize( 1, 2, 3 ) );

  test.case = 'wrong length of onEvaluate2';
  test.shouldThrowErrorSync( () => _.entity.equalize( 1, 2, ( e ) => e, () => true ) );
  test.shouldThrowErrorSync( () => _.entity.equalize( 1, 2, ( e ) => e, ( a, b, c ) => a + b + c ) );

  test.case = 'wrong type of onEvaluate2';
  test.shouldThrowErrorSync( () => _.entity.equalize( 1, 2, ( e ) => e, [ 1 ] ) );
  test.shouldThrowErrorSync( () => _.entity.equalize( 1, 2, ( e ) => e, [ 2 ] ) );

  test.case = 'using onEvaluate2 without onEvaluate1';
  test.shouldThrowErrorSync( () => _.entity.equalize( 1, 2, undefined, ( e ) => e ) );
}

//

function entityAssign( test )
{
  test.case = 'src null';
  var dst = 'string';
  var src = null;
  var got = _.entity.assign2( dst, src );
  var expected = null;
  test.identical( got, expected );

  test.case = 'dst.copy';
  var dst =
  {
    copy : function( src )
    {
      for( var i in src )
      this[ i ] = src[ i ]
    }
  };
  var src = { src : 'string', num : 123 };
  _.entity.assign2( dst, src  );
  var got = dst;
  var expected =
  {
    copy : dst.copy,
    src : 'string',
    num : 123

  };
  test.identical( got, expected );

  test.case = 'src.clone';
  var dst = 1;
  var src = { src : 'string', num : 123, clone : function() { return { src : 'string', num : 123 } } }
  var got = _.entity.assign2( dst, src  );
  var expected = { src : 'string', num : 123 };
  test.identical( got, expected );
  test.true( got !== expected );
  test.true( got !== src );

  test.case = 'src.slice returns copy of array';
  var dst = [ ];
  var src = [ 1, 2, 3 ];
  var got = _.entity.assign2( dst, src  );
  var expected = src;
  test.identical( got, expected );

  test.case = 'dst.set ';
  var dst = { set : function( src ){ this.value = src[ 'value' ]; } };
  var src = { value : 100 };
  _.entity.assign2( dst, src  );
  var got = dst;
  var expected = { set : dst.set, value : 100 };
  test.identical( got, expected );

  test.case = 'onRecursive ';
  var dst = { };
  var src = { value : 100, a : {  b : 101 } };
  function onRecursive( dstContainer, srcContainer, key )
  {
    _.assert( _.strIs( key ) );
    dstContainer[ key ] = srcContainer[ key ];
  };
  _.entity.assign2( dst, src, onRecursive  );
  var got = dst;
  var expected = src;
  test.identical( got, expected );

  test.case = 'atomic ';
  var src = 2;
  var got = _.entity.assign2( null, src );
  var expected = src;
  test.identical( got, expected );

  if( !Config.debug )
  return;

  test.case = 'missed arguments';
  test.shouldThrowErrorSync( function()
  {
    _.entity.assign2( );
  });

  test.case = 'src.clone throws "unexpected"';
  test.shouldThrowErrorSync( function()
  {
    var dst = {};
    var src = { src : 'string', num : 123, clone : function() { var clone = _.cloneObject( { src : this } ); return clone; } }
    _.entity.assign2( dst, src  );
  });

}

//

function entityAssignFieldFromContainer( test )
{
  test.case = 'non recursive';
  var dst ={};
  var src = { a : 'string' };
  var name = 'a';
  var got = _.entity.assign2FieldFromContainer(dst, src, name );
  var expected = dst[ name ];
  test.identical( got, expected );

  test.case = 'undefined';
  var dst ={};
  var src = { a : undefined };
  var name = 'a';
  var got = _.entity.assign2FieldFromContainer(dst, src, name );
  var expected = undefined;
  test.identical( got, expected );

  test.case = 'recursive';
  var dst ={};
  var src = { a : 'string' };
  var name = 'a';
  function onRecursive( dstContainer, srcContainer, key )
  {
    _.assert( _.strIs( key ) );
    dstContainer[ key ] = srcContainer[ key ];
  };
  var got = _.entity.assign2FieldFromContainer( dst, src, name, onRecursive );
  var expected = dst[ name ];
  test.identical( got, expected );

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.entity.assign2FieldFromContainer() );
}

//

/*
  aaa : improve test entityLengthOf, normalize it, please | Dmytro : improved, normalized, extended
*/

function entityLengthOf( test )
{
  test.case = 'undefined';
  var got = _.entityLengthOf( undefined );
  test.identical( got, 0 );

  test.case = 'null';
  var got = _.entityLengthOf( null );
  test.identical( got, 1 );

  test.case = 'false';
  var got = _.entityLengthOf( false );
  test.identical( got, 1 );

  test.case = 'true';
  var got = _.entityLengthOf( true );
  test.identical( got, 1 );

  test.case = 'zero';
  var got = _.entityLengthOf( 0 );
  test.identical( got, 1 );

  test.case = 'number';
  var got = _.entityLengthOf( 34 );
  test.identical( got, 1 );

  test.case = 'NaN';
  var got = _.entityLengthOf( NaN );
  test.identical( got, 1 );

  test.case = 'Infinity';
  var got = _.entityLengthOf( Infinity );
  test.identical( got, 1 );

  test.case = 'empty string';
  var got = _.entityLengthOf( '' );
  test.identical( got, 1 );

  test.case = 'string';
  var got = _.entityLengthOf( 'str' );
  test.identical( got, 1 );

  test.case = 'symbol';
  var got = _.entityLengthOf( Symbol.for( 'x' ) );
  test.identical( got, 1 );

  test.case = 'empty array';
  var got = _.entityLengthOf( [] );
  test.identical( got, 0 );

  test.case = 'array';
  var got = _.entityLengthOf( [ [ 23, 17 ], undefined, 34 ] );
  test.identical( got, 3 );

  test.case = 'argumentsArray';
  var got = _.entityLengthOf( _.argumentsArrayMake( [ 1, [ 2, 3 ], 4 ] ) );
  test.identical( got, 3 );

  test.case = 'unroll';
  var got = _.entityLengthOf( _.argumentsArrayMake( [ 1, 2, [ 3, 4 ] ] ) );
  test.identical( got, 3 );

  test.case = 'BufferTyped';
  var got = _.entityLengthOf( new U8x([ 1, 2, 3 ]) );
  test.identical( got, 3 );

  test.case = 'F32x';
  var got = _.entityLengthOf( new F32x([ 1, 2, 3 ]) );
  test.identical( got, 3 );

  test.case = 'BufferRaw';
  var got = _.entityLengthOf( new BufferRaw( 10 ) );
  test.identical( got, 1 );

  test.case = 'BufferView';
  var got = _.entityLengthOf( new BufferView( new BufferRaw( 10 ) ) );
  test.identical( got, 1 );

  if( Config.interpreter === 'njs' )
  {
    test.case = 'BufferNode';
    var got1 = _.entityLengthOf( BufferNode.from([ 1, 2, 3, 4 ]) );
    test.identical( got1, 1 );
  }

  test.case = 'Set';
  var got = _.entityLengthOf( new Set( [ 1, 2, undefined, 4 ] ) );
  test.identical( got, 4 );

  test.case = 'map';
  var got = _.entityLengthOf( { a : 1, b : 2, c : { d : 3 } } );
  test.identical( got, 3 );

  test.case = 'HashMap';
  var got = _.entityLengthOf( new Map( [ [ undefined, undefined ], [ 1, 2 ], [ '', 'str' ] ] ) );
  test.identical( got, 3 );

  test.case = 'function';
  var got = _.entityLengthOf( function(){} );
  test.identical( got, 1 );

  test.case = 'object';
  var obj1 = new Obj1({});
  var got = _.entityLengthOf( obj1 );
  test.identical( got, 1 );

  test.case = 'object with iterator, empty';
  var obj1 = new Obj1({ elements : [] });
  obj1[ Symbol.iterator ] = _iterate;
  var got = _.entityLengthOf( obj1 );
  test.identical( got, 0 );

  test.case = 'object with iterator, empty';
  var obj1 = new Obj1({ elements : [ 'a', 'b', 'c' ] });
  obj1[ Symbol.iterator ] = _iterate;
  var got = _.entityLengthOf( obj1 );
  test.identical( got, 3 );

  test.case = 'instance of class';
  function Constr1()
  {
    this.a = 34;
    this.b = 's';
    this[ 100 ] = 'sms';
  };
  Constr1.prototype.toString = function()
  {
    console.log('some message');
  }
  Constr1.prototype.c = 99;
  var got = _.entityLengthOf( new Constr1() );
  test.identical( got, 1 );

  test.case = 'object, some properties are non enumerable';
  var src = Object.create( null );
  var o =
  {
    'property1' :
    {
      value : true,
      writable : true
    },
    'property2' : {
      value : 'Hello',
      writable : true
    },
    'property3' :
    {
      enumerable : true,
      value : 'World',
      writable : true
    }
  };
  Object.defineProperties( src, o );
  var got = _.entityLengthOf( src );
  test.identical( got, 1 );

  /* */

  function Obj1( o )
  {
    _.mapExtend( this, o );
    return this;
  }

  /* */

  function _iterate()
  {

    let iterator = Object.create( null );
    iterator.next = next;
    iterator.index = 0;
    iterator.instance = this;
    return iterator;

    function next()
    {
      let result = Object.create( null );
      result.done = this.index === this.instance.elements.length;
      if( result.done )
      return result;
      result.value = this.instance.elements[ this.index ];
      this.index += 1;
      return result;
    }

  }
}

//

function uncountableSize( test )
{
  test.case = 'undefined';
  var got = _.uncountableSize( undefined );
  test.identical( got, 8 );

  test.case = 'null';
  var got = _.uncountableSize( null );
  test.identical( got, 8 );

  test.case = 'false';
  var got = _.uncountableSize( false );
  test.identical( got,  8);

  test.case = 'true';
  var got = _.uncountableSize( true );
  test.identical( got, 8 );

  test.case = 'zero';
  var got = _.uncountableSize( 0 );
  test.identical( got, 8 );

  test.case = 'number';
  var got = _.uncountableSize( 34 );
  test.identical( got, 8 );

  test.case = 'NaN';
  var got = _.uncountableSize( NaN );
  test.identical( got, 8 );

  test.case = 'Infinity';
  var got = _.uncountableSize( Infinity );
  test.identical( got, 8 );

  test.case = 'empty string';
  var got = _.uncountableSize( '' );
  test.identical( got, 0 );

  test.case = 'string';
  var got = _.uncountableSize( 'str' );
  test.identical( got, 3 );

  test.case = 'symbol';
  var got = _.uncountableSize( Symbol.for( 'x' ) );
  test.identical( got, 8 );

  test.case = 'empty array';
  var got = _.uncountableSize( [] );
  test.identical( got, NaN );

  test.case = 'array';
  var got = _.uncountableSize( [ [ 23, 17 ], undefined, 34 ] );
  test.identical( got, NaN );

  test.case = 'argumentsArray';
  var got = _.uncountableSize( _.argumentsArrayMake( [ 1, [ 2, 3 ], 4 ] ) );
  test.identical( got, NaN );

  test.case = 'unroll';
  var got = _.uncountableSize( _.argumentsArrayMake( [ 1, 2, [ 3, 4 ] ] ) );
  test.identical( got, NaN );

  test.case = 'BufferTyped';
  var got = _.uncountableSize( new U8x( [ 1, 2, 3, 4 ] ) );
  test.identical( got, 4 );

  test.case = 'BufferRaw';
  var got = _.uncountableSize( new BufferRaw( 10 ) );
  test.identical( got, 10 );

  test.case = 'BufferView';
  var got = _.uncountableSize( new BufferView( new BufferRaw( 10 ) ) );
  test.identical( got, 10 );

  if( Config.interpreter === 'njs' )
  {
    test.case = 'BufferNode';
    var got1 = _.uncountableSize( BufferNode.from( [ 1, 2, 3, 4 ] ) );
    test.identical( got1, 4 );
  }

  test.case = 'Set';
  var got = _.uncountableSize( new Set( [ 1, 2, undefined, 4 ] ) );
  test.identical( got, NaN );

  test.case = 'map';
  var got = _.uncountableSize( { a : 1, b : 2, c : { d : 3 } } );
  test.identical( got, NaN );

  test.case = 'HashMap';
  var got = _.uncountableSize( new Map( [ [ undefined, undefined ], [ 1, 2 ], [ '', 'str' ] ] ) );
  test.identical( got, NaN );

  test.case = 'function';
  var got = _.uncountableSize( function(){} );
  test.identical( got, 8 );

  test.case = 'instance of class';
  function Constr1()
  {
    this.a = 34;
    this.b = 's';
    this[ 100 ] = 'sms';
  };
  var got = _.uncountableSize( new Constr1() );
  test.identical( got, 8 );

  test.case = 'object, some properties are non enumerable';
  var src = Object.create( null );
  var o =
  {
    'property3' :
    {
      enumerable : true,
      value : 'World',
      writable : true
    }
  };
  Object.defineProperties( src, o );
  var got = _.uncountableSize( src );
  test.identical( got, NaN );

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.uncountableSize() );
}

//

/* zzz : find better solution instead of `_.look ?` */

function entitySize( test )
{
  test.case = 'undefined';
  var got = _.entitySize( undefined );
  test.identical( got, 8 );

  test.case = 'null';
  var got = _.entitySize( null );
  test.identical( got, 8 );

  test.case = 'false';
  var got = _.entitySize( false );
  test.identical( got,  8);

  test.case = 'true';
  var got = _.entitySize( true );
  test.identical( got, 8 );

  test.case = 'zero';
  var got = _.entitySize( 0 );
  test.identical( got, 8 );

  test.case = 'number';
  var got = _.entitySize( 34 );
  test.identical( got, 8 );

  test.case = 'NaN';
  var got = _.entitySize( NaN );
  test.identical( got, 8 );

  test.case = 'Infinity';
  var got = _.entitySize( Infinity );
  test.identical( got, 8 );

  test.case = 'empty string';
  var got = _.entitySize( '' );
  test.identical( got, 0 );

  test.case = 'string';
  var got = _.entitySize( 'str' );
  test.identical( got, 3 );

  test.case = 'symbol';
  var got = _.entitySize( Symbol.for( 'x' ) );
  test.identical( got, 8 );

  /* zzz : temp fix */

  test.case = 'empty array';
  var got = _.entitySize( [] );
  var exp = _.look ? 0 : NaN;
  test.identical( got, exp );

  test.case = 'array';
  var got = _.entitySize( [ 3, undefined, 34 ] );
  var exp = _.look ? 24 : NaN;
  test.identical( got, exp );

  test.case = 'argumentsArray';
  var got = _.entitySize( _.argumentsArrayMake( [ 1, null, 4 ] ) );
  var exp = _.look ? 24 : NaN;
  test.identical( got, exp );

  test.case = 'unroll';
  var got = _.entitySize( _.argumentsArrayMake( [ 1, 2, 'str' ] ) );
  var exp = _.look ? 19 : NaN;
  test.identical( got, exp );

  test.case = 'BufferTyped';
  var got = _.entitySize( new U8x( [ 1, 2, 3, 4 ] ) );
  test.identical( got, 4 );

  test.case = 'BufferRaw';
  var got = _.entitySize( new BufferRaw( 10 ) );
  test.identical( got, 10 );

  test.case = 'BufferView';
  var got = _.entitySize( new BufferView( new BufferRaw( 10 ) ) );
  test.identical( got, 10 );

  if( Config.interpreter === 'njs' )
  {
    test.case = 'BufferNode';
    var got1 = _.entitySize( BufferNode.from( [ 1, 2, 3, 4 ] ) );
    test.identical( got1, 4 );
  }

  test.case = 'Set';
  var got = _.entitySize( new Set( [ 1, 2, undefined, 4 ] ) );
  var exp = _.look ? 32 : NaN;
  test.identical( got, exp );

  test.case = 'map';
  var got = _.entitySize( { a : 1, b : 2, c : 'str' } );
  var exp = _.look ? 19 : NaN;
  test.identical( got, exp );

  test.case = 'HashMap';
  var got = _.entitySize( new Map( [ [ undefined, undefined ], [ 1, 2 ], [ '', 'str' ] ] ) );
  var exp = _.look ? 19 : NaN;
  test.identical( got, exp );

  test.case = 'function';
  var got = _.entitySize( function(){} );
  test.identical( got, 8 );

  test.case = 'instance of class';
  function Constr1()
  {
    this.a = 34;
    this.b = 's';
    this[ 100 ] = 'sms';
  };
  var got = _.entitySize( new Constr1() );
  test.identical( got, 8 );

  test.case = 'object, some properties are non enumerable';
  var src = Object.create( null );
  var o =
  {
    'property3' :
    {
      enumerable : true,
      value : 'World',
      writable : true
    }
  };
  Object.defineProperties( src, o );
  var got = _.entitySize( src );
  var exp = _.look ? 5 : NaN;
  test.identical( got, exp );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.entitySize() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.entitySize( 1, 2 ) );
  test.shouldThrowErrorSync( () => _.entitySize( 1, 'extra' ) );
}

// //
//
// function iterableIs( test )
// {
//   test.case = 'without argument';
//   var got = _.iterableIs();
//   var expected = false;
//   test.identical( got, expected );
//
//   test.case = 'undefined';
//   var got = _.iterableIs( undefined );
//   var expected = false;
//   test.identical( got, expected );
//
//   test.case = 'null';
//   var got = _.iterableIs( null );
//   var expected = false;
//   test.identical( got, expected );
//
//   test.case = 'false';
//   var got = _.iterableIs( false );
//   var expected = false;
//   test.identical( got, expected );
//
//   test.case = 'empty string';
//   var got = _.iterableIs( '' );
//   var expected = false;
//   test.identical( got, expected );
//
//   test.case = 'zero';
//   var got = _.iterableIs( 0 );
//   var expected = false;
//   test.identical( got, expected );
//
//   test.case = 'NaN';
//   var got = _.iterableIs( NaN );
//   var expected = false;
//   test.identical( got, expected );
//
//   test.case = 'a boolean';
//   var got = _.iterableIs( true );
//   var expected = false;
//   test.identical( got, expected );
//
//   test.case = 'a number';
//   var got = _.iterableIs( 13 );
//   var expected = false;
//   test.identical( got, expected );
//
//   test.case = 'a function';
//   var got = _.iterableIs( function() {} );
//   var expected = false;
//   test.identical( got, expected );
//
//   test.case = 'constructor';
//   function Constr( x )
//   {
//     this.x = x;
//     return this;
//   }
//   var got = _.iterableIs( new Constr( 0 ) );
//   var expected = false;
//   test.identical( got, expected );
//
//   test.case = 'a string';
//   var got = _.iterableIs( 'str' );
//   var expected = true;
//   test.identical( got, expected );
//
//   test.case = 'an array';
//   var got = _.iterableIs( [] );
//   var expected = true;
//   test.identical( got, expected );
//
//   test.case = 'an unroll';
//   var got = _.iterableIs( _.unrollMake( [ 1 ] ) );
//   var expected = true;
//   test.identical( got, expected );
//
//   test.case = 'an argumentsArray';
//   var got = _.iterableIs( _.argumentsArrayMake( [ 1 ] ) );
//   var expected = true;
//   test.identical( got, expected );
//
//   test.case = 'BufferRaw';
//   var got = _.iterableIs( new BufferRaw( 5 ) );
//   var expected = false;
//   test.identical( got, expected );
//
//   test.case = 'BufferView';
//   var got = _.iterableIs( new BufferView( new BufferRaw( 5 ) ) );
//   var expected = false;
//   test.identical( got, expected );
//
//   test.case = 'BufferTyped';
//   var got = _.iterableIs( new U8x( 5 ) );
//   var expected = true;
//   test.identical( got, expected );
//
//   if( Config.interpreter === 'njs' )
//   {
//     test.case = 'BufferNode';
//     var got1 = _.iterableIs( BufferNode.alloc( 5 ) );
//     var expected1 = true;
//     test.identical( got1, expected1 );
//   }
//
//   test.case = 'Set';
//   var got = _.iterableIs( new Set( [ 5 ] ) );
//   var expected = true;
//   test.identical( got, expected );
//
//   test.case = 'Map';
//   var got = _.iterableIs( new Map( [ [ 1, 2 ] ] ) );
//   var expected = true;
//   test.identical( got, expected );
//
//   test.case = 'pure empty map';
//   var got = _.iterableIs( Object.create( null ) );
//   var expected = true;
//   test.identical( got, expected );
//
//   test.case = 'pure map';
//   var src = Object.create( null );
//   src.x = 1;
//   var got = _.iterableIs( src );
//   var expected = true;
//   test.identical( got, expected );
//
//   // test.case = 'map from pure map'; /* qqq for Dmytro : resolve for complex object without constructors */
//   // var src = Object.create( Object.create( null ) );
//   // var got = _.iterableIs( src );
//   // var expected = true;
//   // test.identical( got, expected );
//
//   test.case = 'an empty object';
//   var got = _.iterableIs( {} );
//   var expected = true;
//   test.identical( got, expected );
//
//   test.case = 'an object';
//   var got = _.iterableIs( { a : 7, b : 13 } );
//   var expected = true;
//   test.identical( got, expected );
// }

//

function methodIteratorOf( test )
{
  test.case = 'without argument';
  var got = _.entity.methodIteratorOf();
  var expected = false;
  test.identical( got, expected );

  test.case = 'undefined';
  var got = _.entity.methodIteratorOf( undefined );
  var expected = false;
  test.identical( got, expected );

  test.case = 'null';
  var got = _.entity.methodIteratorOf( null );
  var expected = false;
  test.identical( got, expected );

  test.case = 'false';
  var got = _.entity.methodIteratorOf( false );
  var expected = false;
  test.identical( got, expected );

  test.case = 'empty string';
  var got = _.entity.methodIteratorOf( '' );
  var expected = false;
  test.identical( got, expected );

  test.case = 'zero';
  var got = _.entity.methodIteratorOf( 0 );
  var expected = false;
  test.identical( got, expected );

  test.case = 'NaN';
  var got = _.entity.methodIteratorOf( NaN );
  var expected = false;
  test.identical( got, expected );

  test.case = 'a boolean';
  var got = _.entity.methodIteratorOf( true );
  var expected = false;
  test.identical( got, expected );

  test.case = 'a number';
  var got = _.entity.methodIteratorOf( 13 );
  var expected = false;
  test.identical( got, expected );

  test.case = 'a function';
  var got = _.entity.methodIteratorOf( function() {} );
  var expected = false;
  test.identical( got, expected );

  test.case = 'constructor';
  var Constr = constr;
  function constr( x )
  {
    this.x = x;
    return this;
  }
  var got = _.entity.methodIteratorOf( new Constr( 0 ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'a string';
  var src = 'str';
  var got = _.entity.methodIteratorOf( src );
  var expected = src[ _.entity.iteratorSymbol ];
  test.identical( got, expected );

  test.case = 'an array';
  var src = [];
  var got = _.entity.methodIteratorOf( src );
  var expected = src[ _.entity.iteratorSymbol ];
  test.identical( got, expected );

  test.case = 'an unroll';
  var src = _.unrollMake( 1 );
  var got = _.entity.methodIteratorOf( src );
  var expected = src[ _.entity.iteratorSymbol ];
  test.identical( got, expected );

  test.case = 'an argumentsArray';
  var src = _.argumentsArrayMake( 1 );
  var got = _.entity.methodIteratorOf( _.argumentsArrayMake( [ 1 ] ) );
  var expected = src[ _.entity.iteratorSymbol ];
  test.identical( got, expected );

  test.case = 'BufferRaw';
  var got = _.entity.methodIteratorOf( new BufferRaw( 5 ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'BufferView';
  var got = _.entity.methodIteratorOf( new BufferView( new BufferRaw( 5 ) ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'BufferTyped';
  var src = new U8x([ 5 ]);
  var got = _.entity.methodIteratorOf( src );
  var expected = src[ _.entity.iteratorSymbol ];
  test.identical( got, expected );

  if( Config.interpreter === 'njs' )
  {
    test.case = 'BufferNode';
    var src = BufferNode.alloc( 3 );
    let got = _.entity.methodIteratorOf( src );
    var expected = src[ _.entity.iteratorSymbol ];
    test.identical( got, expected );
  }

  test.case = 'Set';
  var src = new Set([ 5 ]);
  var got = _.entity.methodIteratorOf( src );
  var expected = src[ _.entity.iteratorSymbol ];
  test.identical( got, expected );

  test.case = 'Map';
  var src = new Map([ [ 1, 2 ] ]);
  var got = _.entity.methodIteratorOf( src );
  var expected = src[ _.entity.iteratorSymbol ];
  test.identical( got, expected );

  test.case = 'pure empty map';
  var got = _.entity.methodIteratorOf( Object.create( null ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'pure map';
  var src = Object.create( null );
  src.x = 1;
  var got = _.entity.methodIteratorOf( src );
  var expected = false;
  test.identical( got, expected );

  test.case = 'map from pure map';
  var src = Object.create( Object.create( null ) );
  var got = _.entity.methodIteratorOf( src );
  var expected = false;
  test.identical( got, expected );

  test.case = 'an empty object';
  var got = _.entity.methodIteratorOf( {} );
  var expected = false;
  test.identical( got, expected );

  test.case = 'an object';
  var got = _.entity.methodIteratorOf( { a : 7, b : 13 } );
  var expected = false;
  test.identical( got, expected );
}

//

function methodEqualOf( test )
{
  test.case = 'without argument';
  var got = _.entity.methodEqualOf();
  var expected = false;
  test.identical( got, expected );

  test.case = 'undefined';
  var got = _.entity.methodEqualOf( undefined );
  var expected = false;
  test.identical( got, expected );

  test.case = 'null';
  var got = _.entity.methodEqualOf( null );
  var expected = false;
  test.identical( got, expected );

  test.case = 'false';
  var got = _.entity.methodEqualOf( false );
  var expected = false;
  test.identical( got, expected );

  test.case = 'empty string';
  var got = _.entity.methodEqualOf( '' );
  var expected = false;
  test.identical( got, expected );

  test.case = 'zero';
  var got = _.entity.methodEqualOf( 0 );
  var expected = false;
  test.identical( got, expected );

  test.case = 'NaN';
  var got = _.entity.methodEqualOf( NaN );
  var expected = false;
  test.identical( got, expected );

  test.case = 'a boolean';
  var got = _.entity.methodEqualOf( true );
  var expected = false;
  test.identical( got, expected );

  test.case = 'a number';
  var got = _.entity.methodEqualOf( 13 );
  var expected = false;
  test.identical( got, expected );

  test.case = 'a function';
  var got = _.entity.methodEqualOf( function() {} );
  var expected = false;
  test.identical( got, expected );

  test.case = 'constructor';
  var Constr = constr;
  function constr( x )
  {
    this.x = x;
    return this;
  }
  var got = _.entity.methodEqualOf( new Constr( 0 ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'a string';
  var got = _.entity.methodEqualOf( 'str' );
  var expected = false;
  test.identical( got, expected );

  test.case = 'an array';
  var got = _.entity.methodEqualOf( [] );
  var expected = false;
  test.identical( got, expected );

  test.case = 'an unroll';
  var got = _.entity.methodEqualOf( _.unrollMake( [ 1 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'an argumentsArray';
  var got = _.entity.methodEqualOf( _.argumentsArrayMake( [ 1 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'BufferRaw';
  var got = _.entity.methodEqualOf( new BufferRaw( 5 ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'BufferView';
  var got = _.entity.methodEqualOf( new BufferView( new BufferRaw( 5 ) ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'BufferTyped';
  var got = _.entity.methodEqualOf( new U8x( 5 ) );
  var expected = false;
  test.identical( got, expected );

  if( Config.interpreter === 'njs' )
  {
    test.case = 'BufferNode';
    let got = _.entity.methodEqualOf( BufferNode.alloc( 5 ) );
    let expected = false;
    test.identical( got, expected );
  }

  test.case = 'Set';
  var got = _.entity.methodEqualOf( new Set( [ 5 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'Map';
  var got = _.entity.methodEqualOf( new Map( [ [ 1, 2 ] ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'pure empty map';
  var got = _.entity.methodEqualOf( Object.create( null ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'pure map';
  var src = Object.create( null );
  src.x = 1;
  var got = _.entity.methodEqualOf( src );
  var expected = false;
  test.identical( got, expected );

  test.case = 'map from pure map';
  var src = Object.create( Object.create( null ) );
  var got = _.entity.methodEqualOf( src );
  var expected = false;
  test.identical( got, expected );

  test.case = 'an empty object';
  var got = _.entity.methodEqualOf( {} );
  var expected = false;
  test.identical( got, expected );

  test.case = 'an object';
  var got = _.entity.methodEqualOf( { a : 7, b : 13 } );
  var expected = false;
  test.identical( got, expected );

  /* */

  test.case = 'map with routine under symbol equalAreSymbol';
  var equivalentAre = ( e1, e2 ) => e1 === e2;
  var src = {};
  src[ _.entity.equalAreSymbol ] = equivalentAre;
  var got = _.entity.methodEqualOf( src );
  test.identical( got, equivalentAre );

  test.case = 'object with routine under symbol equalAreSymbol';
  var equivalentAre = ( e1, e2 ) => e1 === e2;
  function Constr1()
  {
    this.x = 2;
    this[ _.entity.equalAreSymbol ] = equivalentAre;
    return this;
  };
  var src = new Constr1();
  var got = _.entity.methodEqualOf( src );
  test.identical( got, equivalentAre );
}

//

let Self =
{

  name : 'Tools.Entity',
  silencing : 1,

  tests :
  {

    // entityMakeConstructing,
    // entityMakeConstructingArgumentsArray,
    // entityMakeConstructingBufferTyped,
    // entityMakeConstructingLongDescriptor,
    // entityMakeConstructingArgumentsArrayLongDescriptor,
    // entityMakeConstructingBufferTypedLongDescriptor,

    entityMakeEmpty,
    entityMakeEmptyLongDescriptor,

    entityMakeUndefined,
    entityMakeUndefinedLongDescriptor,

    entityMake,
    entityMakeLongDescriptor,

    entityEntityEqualize,

    entityAssign,
    entityAssignFieldFromContainer,

    entityLengthOf,
    uncountableSize,
    entitySize,
    // iterableIs,
    methodIteratorOf,
    methodEqualOf,

  }

};

Self = wTestSuite( Self );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

})();
