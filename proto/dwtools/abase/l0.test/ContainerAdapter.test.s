( function _ContainerAdapter_test_s_( ) {

'use strict';

if( typeof module !== 'undefined' )
{
  let _ = require( '../Layer2.s' );
  _.include( 'wTesting' );
}

var _ = wTools;

// --
// base tests
// --

function is( test )
{
  test.case = 'empty';
  var got = _.containerAdapter.is();
  test.identical( got, false );

  test.case = 'src - null';
  var got = _.containerAdapter.is( null );
  test.identical( got, false );

  test.case = 'src - undefined';
  var got = _.containerAdapter.is( undefined );
  test.identical( got, false );

  test.case = 'src - number';
  var got = _.containerAdapter.is( 1 );
  test.identical( got, false );

  test.case = 'src - string';
  var got = _.containerAdapter.is( 'str' );
  test.identical( got, false );

  test.case = 'src - boolean, true';
  var got = _.containerAdapter.is( true );
  test.identical( got, false );

  test.case = 'src - boolean, false';
  var got = _.containerAdapter.is( false );
  test.identical( got, false );

  test.case = 'src - array';
  var got = _.containerAdapter.is( [ 1, 2 ] );
  test.identical( got, false );

  test.case = 'src - unroll';
  var got = _.containerAdapter.is( _.unrollMake( [ 1, 2 ] ) );
  test.identical( got, false );

  test.case = 'src - argumentsArray';
  var got = _.containerAdapter.is( _.argumentsArrayMake( [ 1, 2 ] ) );
  test.identical( got, false );

  test.case = 'src - BufferRaw';
  var got = _.containerAdapter.is( new BufferRaw( 5 ) );
  test.identical( got, false );

  test.case = 'src - BufferTyped';
  var got = _.containerAdapter.is( new U8x( [ 1, 2 ] ) );
  test.identical( got, false );

  test.case = 'src - map';
  var got = _.containerAdapter.is( { a : 0 } );
  test.identical( got, false );

  test.case = 'src - Map';
  var got = _.containerAdapter.is( new Map() );
  test.identical( got, false );

  test.case = 'src - Set';
  var got = _.containerAdapter.is( new Set() );
  test.identical( got, false );

  test.case = 'src - Symbol';
  var got = _.containerAdapter.is( Symbol( 'a' ) );
  test.identical( got, false );

  test.case = 'src - instance of constructor';
  function Constr()
  {
    this.x = 1;
    return this;
  }
  var got = _.containerAdapter.is( new Constr() );
  test.identical( got, false );

  /* */

  test.case = 'check instance of ContainerAdapter';
  var src = _.containerAdapter.make( [ 1, 2 ] );
  var got = _.containerAdapter.is( src );
  test.identical( got, true );

  test.case = 'check instance of ContainerAdapter';
  var src = _.containerAdapter.make( new Set( [ 1, 2 ] ) );
  var got = _.containerAdapter.is( src );
  test.identical( got, true );
}

//

function make( test )
{
  test.case = 'from empty array';
  var src = [];
  var exp = _.containerAdapter.make( [] );
  var got = _.containerAdapter.make( src );
  test.is( got !== src );
  test.is( _.arrayIs( got.original ) );
  test.identical( got, exp );

  test.case = 'from array';
  var src = [ 1, 2, '', {}, [], null, undefined ];
  var exp = _.containerAdapter.make( [ 1, 2, '', {}, [], null, undefined ] );
  var got = _.containerAdapter.make( src );
  test.is( got !== src );
  test.is( _.arrayIs( got.original ) );
  test.identical( got, exp );

  test.case = 'from empty unroll';
  var src = _.unrollMake( [] );
  var exp = _.containerAdapter.make( [] );
  var got = _.containerAdapter.make( src );
  test.is( got !== src );
  test.is( _.arrayIs( got.original ) );
  test.identical( got, exp );

  test.case = 'from unroll';
  var src = _.unrollMake( [ 1, 2, '', {}, [], null, undefined ] );
  var exp = _.containerAdapter.make( [ 1, 2, '', {}, [], null, undefined ] );
  var got = _.containerAdapter.make( src );
  test.is( got !== src );
  test.is( _.arrayIs( got.original ) );
  test.identical( got, exp );

  test.case = 'from empty Set';
  var src = new Set();
  var exp = _.containerAdapter.make( new Set() );
  var got = _.containerAdapter.make( src );
  test.is( got !== src );
  test.is( _.setIs( got.original ) );
  test.identical( got, exp );

  test.case = 'from Set';
  var src = new Set( [ 1, 2, '', {}, [], null, undefined ] );
  var exp = _.containerAdapter.make( new Set( [ 1, 2, '', {}, [], null, undefined ] ) );
  var got = _.containerAdapter.make( src );
  test.is( got !== src );
  test.is( _.setIs( got.original ) );
  test.identical( got, exp );

  test.case = 'from empty arrayAdapterContainer';
  var src = _.containerAdapter.make( [] );
  var exp = _.containerAdapter.make( [] );
  var got = _.containerAdapter.make( src );
  test.is( got !== src );
  test.is( _.arrayIs( got.original ) );
  test.identical( got, exp );

  test.case = 'from arrayAdapterContainer';
  var src = _.containerAdapter.make( [ 1, 2, '', {}, [], null, undefined ] );
  var exp = _.containerAdapter.make( [ 1, 2, '', {}, [], null, undefined ] );
  var got = _.containerAdapter.make( src );
  test.is( got !== src );
  test.is( _.arrayIs( got.original ) );
  test.identical( got, exp );

  test.case = 'from empty setAdapterContainer';
  var src = _.containerAdapter.make( new Set( [] ) );
  var exp = _.containerAdapter.make( new Set( [ 1, 2, '', {}, [], null, undefined ] ) );
  var got = _.containerAdapter.make( src );
  test.is( got !== src );
  test.is( _.setIs( got.original ) );
  test.identical( got, exp );

  test.case = 'from setAdapterContainer';
  var src = _.containerAdapter.make( new Set( [ 1, 2, '', {}, [], null, undefined ] ) );
  var exp = _.containerAdapter.make( new Set( [ 1, 2, '', {}, [], null, undefined ] ) );
  var got = _.containerAdapter.make( src );
  test.is( got !== src );
  test.is( _.setIs( got.original ) );
  test.identical( got, exp );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.containerAdapter.make( [ 1, 2 ], [ 1, 2 ] ) );

  test.case = 'container is not an array or a set';
  test.shouldThrowErrorSync( () => _.containerAdapter.make( _.argumentsArrayMake( 10 ) ) );
  test.shouldThrowErrorSync( () => _.containerAdapter.make( new U8x( 10 ) ) );
  test.shouldThrowErrorSync( () => _.containerAdapter.make( { a : 0 } ) );
  test.shouldThrowErrorSync( () => _.containerAdapter.make( 'str' ) );
  test.shouldThrowErrorSync( () => _.containerAdapter.make( 0 ) );
  test.shouldThrowErrorSync( () => _.containerAdapter.make( null ) );
  test.shouldThrowErrorSync( () => _.containerAdapter.make( undefined ) );
}

//

function from( test )
{
  test.case = 'from empty array';
  var src = [];
  var exp = _.containerAdapter.from( [] );
  var got = _.containerAdapter.from( src );
  test.is( got !== src );
  test.is( _.arrayIs( got.original ) );
  test.identical( got, exp );

  test.case = 'from array';
  var src = [ 1, 2, '', {}, [], null, undefined ];
  var exp = _.containerAdapter.from( [ 1, 2, '', {}, [], null, undefined ] );
  var got = _.containerAdapter.from( src );
  test.is( got !== src );
  test.is( _.arrayIs( got.original ) );
  test.identical( got, exp );

  test.case = 'from empty unroll';
  var src = _.unrollFrom( [] );
  var exp = _.containerAdapter.from( [] );
  var got = _.containerAdapter.from( src );
  test.is( got !== src );
  test.is( _.arrayIs( got.original ) );
  test.identical( got, exp );

  test.case = 'from unroll';
  var src = _.unrollFrom( [ 1, 2, '', {}, [], null, undefined ] );
  var exp = _.containerAdapter.from( [ 1, 2, '', {}, [], null, undefined ] );
  var got = _.containerAdapter.from( src );
  test.is( got !== src );
  test.is( _.arrayIs( got.original ) );
  test.identical( got, exp );

  test.case = 'from empty Set';
  var src = new Set();
  var exp = _.containerAdapter.from( new Set() );
  var got = _.containerAdapter.from( src );
  test.is( got !== src );
  test.is( _.setIs( got.original ) );
  test.identical( got, exp );

  test.case = 'from Set';
  var src = new Set( [ 1, 2, '', {}, [], null, undefined ] );
  var exp = _.containerAdapter.from( new Set( [ 1, 2, '', {}, [], null, undefined ] ) );
  var got = _.containerAdapter.from( src );
  test.is( got !== src );
  test.is( _.setIs( got.original ) );
  test.identical( got, exp );

  test.case = 'from empty arrayAdapterContainer';
  var src = _.containerAdapter.from( [] );
  var exp = _.containerAdapter.from( [] );
  var got = _.containerAdapter.from( src );
  test.is( got === src );
  test.is( _.arrayIs( got.original ) );
  test.identical( got, exp );

  test.case = 'from arrayAdapterContainer';
  var src = _.containerAdapter.from( [ 1, 2, '', {}, [], null, undefined ] );
  var exp = _.containerAdapter.from( [ 1, 2, '', {}, [], null, undefined ] );
  var got = _.containerAdapter.from( src );
  test.is( got === src );
  test.is( _.arrayIs( got.original ) );
  test.identical( got, exp );

  test.case = 'from empty setAdapterContainer';
  var src = _.containerAdapter.from( new Set( [] ) );
  var exp = _.containerAdapter.from( new Set( [ 1, 2, '', {}, [], null, undefined ] ) );
  var got = _.containerAdapter.from( src );
  test.is( got === src );
  test.is( _.setIs( got.original ) );
  test.identical( got, exp );

  test.case = 'from setAdapterContainer';
  var src = _.containerAdapter.from( new Set( [ 1, 2, '', {}, [], null, undefined ] ) );
  var exp = _.containerAdapter.from( new Set( [ 1, 2, '', {}, [], null, undefined ] ) );
  var got = _.containerAdapter.from( src );
  test.is( got === src );
  test.is( _.setIs( got.original ) );
  test.identical( got, exp );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.containerAdapter.from( [ 1, 2 ], [ 1, 2 ] ) );

  test.case = 'container is not an array or a set';
  test.shouldThrowErrorSync( () => _.containerAdapter.from( _.argumentsArrayfrom( 10 ) ) );
  test.shouldThrowErrorSync( () => _.containerAdapter.from( new U8x( 10 ) ) );
  test.shouldThrowErrorSync( () => _.containerAdapter.from( { a : 0 } ) );
  test.shouldThrowErrorSync( () => _.containerAdapter.from( 'str' ) );
  test.shouldThrowErrorSync( () => _.containerAdapter.from( 0 ) );
  test.shouldThrowErrorSync( () => _.containerAdapter.from( null ) );
  test.shouldThrowErrorSync( () => _.containerAdapter.from( undefined ) );
}

//

function toOriginal( test )
{
  test.case = 'empty';
  var exp = undefined;
  var got = _.containerAdapter.toOriginal();
  test.identical( got, exp );

  test.case = 'from null';
  var src = null;
  var exp = null;
  var got = _.containerAdapter.toOriginal( src );
  test.is( got === src );
  test.identical( got, exp );

  test.case = 'from undefined';
  var src = undefined;
  var exp = undefined;
  var got = _.containerAdapter.toOriginal( src );
  test.is( got === src );
  test.identical( got, exp );

  test.case = 'from number';
  var src = 5;
  var exp = 5;
  var got = _.containerAdapter.toOriginal( src );
  test.is( got === src );
  test.identical( got, exp );

  test.case = 'from string';
  var src = 'str';
  var exp = 'str';
  var got = _.containerAdapter.toOriginal( src );
  test.is( got === src );
  test.identical( got, exp );

  test.case = 'from boolean';
  var src = true;
  var exp = true;
  var got = _.containerAdapter.toOriginal( src );
  test.is( got === src );
  test.identical( got, exp );

  test.case = 'from array';
  var src = [ 1, 2, 'str' ];
  var exp = [ 1, 2, 'str' ];
  var got = _.containerAdapter.toOriginal( src );
  test.is( got === src );
  test.identical( got, exp );

  test.case = 'from unroll';
  var src = _.unrollMake( [ 1, 2, 'str' ] );
  var exp = _.unrollMake( [ 1, 2, 'str' ] );
  var got = _.containerAdapter.toOriginal( src );
  test.is( got === src );
  test.identical( got, exp );

  test.case = 'from argumentsArray';
  var src = _.argumentsArrayMake( [ 1, 2, 'str' ] );
  var exp = _.argumentsArrayMake( [ 1, 2, 'str' ] );
  var got = _.containerAdapter.toOriginal( src );
  test.is( got === src );
  test.identical( got, exp );

  test.case = 'from BufferRaw';
  var src = new BufferRaw( [ 1, 2, 'str' ] );
  var exp = new BufferRaw( [ 1, 2, 'str' ] );
  var got = _.containerAdapter.toOriginal( src );
  test.is( got === src );
  test.identical( got, exp );

  test.case = 'from BufferTyped';
  var src = new I16x( [ 1, 2, 'str' ] );
  var exp = new I16x( [ 1, 2, 'str' ] );
  var got = _.containerAdapter.toOriginal( src );
  test.is( got === src );
  test.identical( got, exp );

  test.case = 'from map';
  var src = { a : 0 };
  var exp = { a : 0 };
  var got = _.containerAdapter.toOriginal( src );
  test.is( got === src );
  test.identical( got, exp );

  test.case = 'from Map';
  var src = new Map( [ [ 1, 2 ] ] );
  var exp = new Map( [ [ 1, 2 ] ] );
  var got = _.containerAdapter.toOriginal( src );
  test.is( got === src );
  test.identical( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'from Set';
  var src = new Set();
  var exp = new Set();
  var got = _.containerAdapter.toOriginal( src );
  test.is( got === src );
  test.identical( [ ... got ], [ ... exp ] );

  test.case = 'from Symbol';
  var src = Symbol( 'a' );
  var exp = src;
  var got = _.containerAdapter.toOriginal( src );
  test.is( got === src );
  test.identical( got, exp );

  test.case = 'from instance of constructor';
  function Constr()
  {
    this.x = 1;
    return this;
  }
  var src = new Constr();
  var exp = new Constr();
  var got = _.containerAdapter.toOriginal( src );
  test.is( got === src );
  test.identical( got, exp );

  /* */

  test.case = 'from ArrayContainerAdapter';
  var src = _.containerAdapter.make( [ 1, 2, '', {}, [], null, undefined ] );
  var got = _.containerAdapter.toOriginal( src );
  test.is( got !== src );
  test.identical( got, src.original );

  test.case = 'from SetContainerAdapter';
  var src = _.containerAdapter.make( new Set( [ 1, 2, '', {}, [], null, undefined ] ) );
  var got = _.containerAdapter.toOriginal( src );
  test.is( got !== src );
  test.identical( got, src.original );
}

//

function toOriginals( test )
{
  test.open( 'dsts' );

  test.case = 'empty';
  var exp = undefined;
  var got = _.containerAdapter.toOriginals();
  test.identical( got, exp );

  test.case = 'from null';
  var src = null;
  var exp = null;
  var got = _.containerAdapter.toOriginals( src );
  test.is( got === src );
  test.identical( got, exp );

  test.case = 'dsts - null, from null';
  var src = null;
  var exp = null;
  var got = _.containerAdapter.toOriginals( null, src );
  test.is( got === src );
  test.identical( got, exp );

  test.case = 'from undefined';
  var src = undefined;
  var exp = undefined;
  var got = _.containerAdapter.toOriginals( src );
  test.is( got === src );
  test.identical( got, exp );

  test.case = 'dsts - null, from undefined';
  var src = undefined;
  var exp = null;
  var got = _.containerAdapter.toOriginals( null, src );
  test.is( got !== src );
  test.identical( got, exp );

  test.case = 'from number';
  var src = 5;
  var exp = 5;
  var got = _.containerAdapter.toOriginals( src );
  test.is( got === src );
  test.identical( got, exp );

  test.case = 'dsts - null, from number';
  var src = 5;
  var exp = [ 5 ];
  var got = _.containerAdapter.toOriginals( null, src );
  test.is( got !== src );
  test.identical( got, exp );

  test.case = 'from string';
  var src = 'str';
  var exp = 'str';
  var got = _.containerAdapter.toOriginals( src );
  test.is( got === src );
  test.identical( got, exp );

  test.case = 'dsts - null, from string';
  var src = 'str';
  var exp = [ 'str' ];
  var got = _.containerAdapter.toOriginals( null, src );
  test.is( got !== src );
  test.identical( got, exp );

  test.case = 'from boolean';
  var src = true;
  var exp = true;
  var got = _.containerAdapter.toOriginals( src );
  test.is( got === src );
  test.identical( got, exp );

  test.case = 'dsts - null, from boolean';
  var src = true;
  var exp = [ true ];
  var got = _.containerAdapter.toOriginals( null, src );
  test.is( got !== src );
  test.identical( got, exp );

  test.case = 'from array';
  var src = [ 1, 2, 'str' ];
  var exp = [ 1, 2, 'str' ];
  var got = _.containerAdapter.toOriginals( src );
  test.is( got === src );
  test.identical( got, exp );

  test.case = 'dsts - null, from array';
  var src = [ 1, 2, 'str' ];
  var exp = [ 1, 2, 'str' ];
  var got = _.containerAdapter.toOriginals( null, src );
  test.is( got !== src );
  test.identical( got, exp );

  test.case = 'from empty array';
  var src = [];
  var exp = [];
  var got = _.containerAdapter.toOriginals( src );
  test.is( got === src );
  test.identical( got, exp );

  test.case = 'dsts - null, from empty array';
  var src = [];
  var exp = [];
  var got = _.containerAdapter.toOriginals( null, src );
  test.is( got !== src );
  test.identical( got, exp );

  test.case = 'from unroll';
  var src = _.unrollMake( [ 1, 2, 'str' ] );
  var exp = _.unrollMake( [ 1, 2, 'str' ] );
  var got = _.containerAdapter.toOriginals( src );
  test.is( got === src );
  test.identical( got, exp );

  test.case = 'dsts - null, from unroll';
  var src = _.unrollMake( [ 1, 2, 'str' ] );
  var exp = _.unrollMake( [ 1, 2, 'str' ] );
  var got = _.containerAdapter.toOriginals( null, src );
  test.is( got !== src );
  test.identical( got, exp );

  test.case = 'from argumentsArray';
  var src = _.argumentsArrayMake( [ 1, 2, 'str' ] );
  var exp = _.argumentsArrayMake( [ 1, 2, 'str' ] );
  var got = _.containerAdapter.toOriginals( src );
  test.is( got === src );
  test.identical( got, exp );

  test.case = 'dsts - null, from argumentsArray';
  var src = _.argumentsArrayMake( [ 1, 2, 'str' ] );
  var exp = [ 1, 2, 'str' ];
  var got = _.containerAdapter.toOriginals( null, src );
  test.is( got !== src );
  test.identical( got, exp );

  test.case = 'from BufferRaw';
  var src = new BufferRaw( [ 1, 2, 'str' ] );
  var exp = new BufferRaw( [ 1, 2, 'str' ] );
  var got = _.containerAdapter.toOriginals( src );
  test.is( got === src );
  test.identical( got, exp );

  test.case = 'dsts - null, from BufferRaw';
  var src = new BufferRaw( [ 1, 2, 'str' ] );
  var exp = [ new BufferRaw( [ 1, 2, 'str' ] ) ];
  var got = _.containerAdapter.toOriginals( null, src );
  test.is( got !== src );
  test.identical( got, exp );

  test.case = 'from BufferTyped';
  var src = new I16x( [ 1, 2, 'str' ] );
  var exp = new I16x( [ 1, 2, 'str' ] );
  var got = _.containerAdapter.toOriginals( src );
  test.is( got === src );
  test.identical( got, exp );

  test.case = 'from map';
  var src = { a : 0 };
  var exp = { a : 0 };
  var got = _.containerAdapter.toOriginals( src );
  test.is( got === src );
  test.identical( got, exp );

  test.case = 'dsts - null, from map';
  var src = { a : 0 };
  var exp = [ { a : 0 } ];
  var got = _.containerAdapter.toOriginals( null, src );
  test.is( got !== src );
  test.identical( got, exp );

  test.case = 'from Map';
  var src = new Map( [ [ 1, 2 ] ] );
  var exp = new Map( [ [ 1, 2 ] ] );
  var got = _.containerAdapter.toOriginals( src );
  test.is( got === src );
  test.identical( [ ... got.entries() ], [ ... exp.entries() ] );

  test.case = 'dsts - null, from Map';
  var src = new Map( [ [ 1, 2 ] ] );
  var exp = new Map( [ [ 1, 2 ] ] );
  var got = _.containerAdapter.toOriginals( null, src );
  test.is( got !== src );
  test.identical( [ ... got[ 0 ].entries() ], [ ... exp.entries() ] );

  test.case = 'from Set';
  var src = new Set();
  var exp = new Set();
  var got = _.containerAdapter.toOriginals( src );
  test.is( got === src );
  test.identical( [ ... got ], [ ... exp ] );

  test.case = 'dsts - null, from Set';
  var src = new Set();
  var exp = new Set();
  var got = _.containerAdapter.toOriginals( null, src );
  test.is( got !== src );
  test.identical( [ ... got[ 0 ] ], [ ... exp ] );

  test.case = 'from Symbol';
  var src = Symbol( 'a' );
  var exp = src;
  var got = _.containerAdapter.toOriginals( src );
  test.is( got === src );
  test.identical( got, exp );

  test.case = 'from instance of constructor';
  function Constr()
  {
    this.x = 1;
    return this;
  }
  var src = new Constr();
  var exp = new Constr();
  var got = _.containerAdapter.toOriginals( src );
  test.is( got === src );
  test.identical( got, exp );

  /* */

  test.case = 'from ArrayContainerAdapter';
  var src = _.containerAdapter.make( [ 1, 2, '', {}, [], null, undefined ] );
  var got = _.containerAdapter.toOriginals( src );
  test.is( got !== src );
  test.identical( got, src.original );

  test.case = 'dsts - null, from ArrayContainerAdapter';
  var src = _.containerAdapter.make( [ 1, 2, '', {}, [], null, undefined ] );
  var got = _.containerAdapter.toOriginals( null, src );
  test.is( got !== src );
  test.identical( got[ 0 ], src.original );

  test.case = 'from SetContainerAdapter';
  var src = _.containerAdapter.make( new Set( [ 1, 2, '', {}, [], null, undefined ] ) );
  var got = _.containerAdapter.toOriginals( src );
  test.is( got !== src );
  test.identical( got, src.original );

  test.case = 'dsts - null, from SetContainerAdapter';
  var src = _.containerAdapter.make( new Set( [ 1, 2, '', {}, [], null, undefined ] ) );
  var got = _.containerAdapter.toOriginals( null, src );
  test.is( got !== src );
  test.identical( got[ 0 ], src.original );

  /* */

  test.case = 'array contains ArrayContainerAdapter';
  var src = _.containerAdapter.make( [ 1, 2, 'str' ] );
  var srcs = [ src, 1, src, 'str', src, undefined, null, false ];
  var got = _.containerAdapter.toOriginals( srcs );
  test.is( got === srcs );
  test.identical( got.length, 8 );
  test.identical( got[ 0 ], src.original );
  test.identical( got[ 2 ], src.original );

  test.case = 'dsts - null, array contains ArrayContainerAdapter';
  var src = _.containerAdapter.make( [ 1, 2, 'str' ] );
  var srcs = [ src, 1, src, 'str', src, undefined, null, false ];
  var got = _.containerAdapter.toOriginals( null, srcs );
  test.is( got !== srcs );
  test.identical( got.length, 8 );
  test.identical( got[ 0 ], src.original );
  test.identical( got[ 2 ], src.original );

  test.case = 'array contains SetContainerAdapter';
  var src = _.containerAdapter.make( new Set( [ 1, 2, 'str' ] ) );
  var srcs = [ src, 1, src, 'str', src, undefined, null, false ];
  var got = _.containerAdapter.toOriginals( srcs );
  test.is( got === srcs );
  test.identical( got.length, 8 );
  test.identical( [ ... got[ 0 ] ], [ ... src.original ] );
  test.identical( [ ... got[ 2 ] ], [ ... src.original ] );

  test.case = 'array contains ArrayContainerAdapter and SetContainerAdapter';
  var src1 = _.containerAdapter.make( [ 1, 2, 'str' ] );
  var src2 = _.containerAdapter.make( new Set( [ 1, 2, 'str' ] ) );
  var srcs = [ src1, 1, src2, 'str', src1, undefined, null, false ];
  var got = _.containerAdapter.toOriginals( srcs );
  test.is( got === srcs );
  test.identical( got.length, 8 );
  test.identical( got[ 0 ], src1.original );
  test.identical( [ ... got[ 2 ] ], [ ... src2.original ] );

  test.case = 'array contains ArrayContainerAdapter and SetContainerAdapter';
  var src1 = _.containerAdapter.make( [ 1, 2, 'str' ] );
  var src2 = _.containerAdapter.make( new Set( [ 1, 2, 'str' ] ) );
  var srcs = [ src1, 1, src2, 'str', src1, undefined, null, false ];
  var got = _.containerAdapter.toOriginals( null, srcs );
  test.is( got !== srcs );
  test.identical( got.length, 8 );
  test.identical( got[ 0 ], src1.original );
  test.identical( [ ... got[ 2 ] ], [ ... src2.original ] );

  test.close( 'dsts' );

  /* - */

  test.case = 'from two primitive';
  var dst = 1;
  var src = 'str';
  var exp = [ 1, 'str' ];
  var got = _.containerAdapter.toOriginals( dst, src );
  test.is( got !== dst );
  test.is( got !== src );
  test.identical( got, exp );

  var dst = new Constr();
  var src = true;
  var exp = [ new Constr(), true ];
  var got = _.containerAdapter.toOriginals( dst, src );
  test.is( got !== dst );
  test.is( got !== src );
  test.identical( got, exp );

  test.case = 'dsts - primitive, src - array';
  var dst = 1;
  var src = [ [ 2, 'str'], ... new Set( [ new Constr ] ) ];
  var exp = [ 1, [ 2, 'str'], ... new Set( [ new Constr ] ) ];
  var got = _.containerAdapter.toOriginals( dst, src );
  test.is( got !== dst );
  test.is( got !== src );
  test.identical( got, exp );

  test.case = 'dsts - primitive, src - unroll';
  var dst = 1;
  var src = _.unrollMake( [ [ 2, 'str'], ... new Set( [ new Constr ] ) ] );
  var exp = [ 1, [ 2, 'str'], ... new Set( [ new Constr ] ) ];
  var got = _.containerAdapter.toOriginals( dst, src );
  test.is( got !== dst );
  test.is( got !== src );
  test.identical( got, exp );

  test.case = 'dsts - primitive, src - argumentsArray';
  var dst = 1;
  var src = _.argumentsArrayMake( [ [ 2, 'str'], ... new Set( [ new Constr ] ) ] );
  var exp = [ 1, [ 2, 'str'], ... new Set( [ new Constr ] ) ];
  var got = _.containerAdapter.toOriginals( dst, src );
  test.is( got !== dst );
  test.is( got !== src );
  test.identical( got, exp );

  test.case = 'dsts - array, src - array';
  var dst = [ 1, { a : 0 } ];
  var src = [ [ 2, 'str'], ... new Set( [ new Constr ] ) ];
  var exp = [ 1, { a : 0 }, [ 2, 'str'], ... new Set( [ new Constr ] ) ];
  var got = _.containerAdapter.toOriginals( dst, src );
  test.is( got === dst );
  test.is( got !== src );
  test.identical( got, exp );

  test.case = 'dsts - unroll, src - array';
  var dst = _.unrollMake( [ 1, { a : 0 } ] );
  var src = [ [ 2, 'str'], ... new Set( [ new Constr ] ) ];
  var exp = [ 1, { a : 0 }, [ 2, 'str'], ... new Set( [ new Constr ] ) ];
  var got = _.containerAdapter.toOriginals( dst, src );
  test.is( got === dst );
  test.is( got !== src );
  test.identical( got, exp );

  test.case = 'dsts - argumentsArray, src - array';
  var dst = _.argumentsArrayMake( [ 1, { a : 0 } ] );
  var src = [ [ 2, 'str'], ... new Set( [ new Constr ] ) ];
  var exp = [ dst, [ 2, 'str'], ... new Set( [ new Constr ] ) ];
  var got = _.containerAdapter.toOriginals( dst, src );
  test.is( got !== dst );
  test.is( got !== src );
  test.identical( got, exp );
}

//--
// ContainerAdapterAbstract
//--

function min( test )
{
  test.open( 'arrayContainerAdapter' );

  test.case = 'without onEach, has minimum';
  var src = _.containerAdapter.make( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
  var got = src.min();
  var exp = -20;
  test.identical( got, exp );

  test.case = 'without onEach, has minimum - -Infinity';
  var src = _.containerAdapter.make( [ -10, 5, -15, 4, -Infinity, 2, 15, 21, -20 ] );
  var got = src.min();
  var exp = -Infinity;
  test.identical( got, exp );

  test.case = 'without onEach, has minimum, small difference';
  var src = _.containerAdapter.make( [ -10, 5, -15, -20.0001, 4, 1, 2, 15, 21, -20 ] );
  var got = src.min();
  var exp = -20.0001;
  test.identical( got, exp );

  test.case = 'without onEach, all equal';
  var src = _.containerAdapter.make( [ -1, -1, -1, -1 ] );
  var got = src.min();
  var exp = -1;
  test.identical( got, exp );

  test.case = 'without onEach, all -Infinity';
  var src = _.containerAdapter.make( [ -Infinity, -Infinity, -Infinity, -Infinity ] );
  var got = src.min();
  var exp = -Infinity;
  test.identical( got, exp );

  test.case = 'without onEach, all Infinity';
  var src = _.containerAdapter.make( [ Infinity, Infinity, Infinity, Infinity ] );
  var got = src.min();
  var exp = Infinity;
  test.identical( got, exp );

  test.case = 'without onEach, all NaN';
  var src = _.containerAdapter.make( [ NaN, NaN, NaN, NaN ] );
  var got = src.min();
  var exp = NaN;
  test.identical( got, exp );

  test.case = 'without onEach, has minimum and NaN';
  var src = _.containerAdapter.make( [ -10, 5, -15, '4', 1, NaN, 15, -1, 21, '-20' ] );
  var got = src.min();
  var exp = NaN;
  test.identical( got, exp );

  /* */

  test.case = 'onEach, has minimum';
  var src = _.containerAdapter.make( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
  var got = src.min( ( e ) => e < 0 ? -e : e );
  var exp = 1;
  test.identical( got, exp );

  test.case = 'onEach, has minimum - -Infinity';
  var src = _.containerAdapter.make( [ -10, 5, -15, 4, -Infinity, 2, 15, 21, -20 ] );
  var got = src.min( ( e ) => e < 0 ? -e : e );
  var exp = 2;
  test.identical( got, exp );

  test.case = 'onEach, has minimum, small difference';
  var src = _.containerAdapter.make( [ -10, 5, -15, -20.0001, 4, 1, 2, 15, 21, -20 ] );
  var got = src.min( ( e ) => e < 0 ? -e : e );
  var exp = 1;
  test.identical( got, exp );

  test.case = 'onEach, all equal';
  var src = _.containerAdapter.make( [ -1, -1, -1, -1 ] );
  var got = src.min( ( e ) => e < 0 ? -e : e );
  var exp = 1;
  test.identical( got, exp );

  test.case = 'onEach, all -Infinity';
  var src = _.containerAdapter.make( [ -Infinity, -Infinity, -Infinity, -Infinity ] );
  var got = src.min( ( e ) => e < 0 ? -e : e );
  var exp = Infinity;
  test.identical( got, exp );

  test.case = 'onEach, all Infinity';
  var src = _.containerAdapter.make( [ Infinity, Infinity, Infinity, Infinity ] );
  var got = src.min( ( e ) => e < 0 ? -e : e );
  var exp = Infinity;
  test.identical( got, exp );

  test.case = 'onEach, all NaN';
  var src = _.containerAdapter.make( [ NaN, NaN, NaN, NaN ] );
  var got = src.min( ( e ) => isNaN( e ) ? 0 : e );
  var exp = 0;
  test.identical( got, exp );

  test.case = 'onEach, has minimum and NaN';
  var src = _.containerAdapter.make( [ -10, 5, -15, '4', 1, NaN, 15, -1, 21, '-20' ] );
  var got = src.min( ( e ) => isNaN( e ) || _.strIs( e ) ? 0 : e );
  var exp = -15;
  test.identical( got, exp );

  test.close( 'arrayContainerAdapter' );

  /* - */

  test.open( 'setContainerAdapter' );

  test.case = 'without onEach, has minimum';
  var src = _.containerAdapter.make( new Set( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] ) );
  var got = src.min();
  var exp = -20;
  test.identical( got, exp );

  test.case = 'without onEach, has minimum - -Infinity';
  var src = _.containerAdapter.make( new Set( [ -10, 5, -15, 4, -Infinity, 2, 15, 21, -20 ] ) );
  var got = src.min();
  var exp = -Infinity;
  test.identical( got, exp );

  test.case = 'without onEach, has minimum, small difference';
  var src = _.containerAdapter.make( new Set( [ -10, 5, -15, -20.0001, 4, 1, 2, 15, 21, -20 ] ) );
  var got = src.min();
  var exp = -20.0001;
  test.identical( got, exp );

  test.case = 'without onEach, all equal';
  var src = _.containerAdapter.make( new Set( [ -1, -1, -1, -1 ] ) );
  var got = src.min();
  var exp = -1;
  test.identical( got, exp );

  test.case = 'without onEach, all -Infinity';
  var src = _.containerAdapter.make( new Set( [ -Infinity, -Infinity, -Infinity, -Infinity ] ) );
  var got = src.min();
  var exp = -Infinity;
  test.identical( got, exp );

  test.case = 'without onEach, all Infinity';
  var src = _.containerAdapter.make( new Set( [ Infinity, Infinity, Infinity, Infinity ] ) );
  var got = src.min();
  var exp = Infinity;
  test.identical( got, exp );

  test.case = 'without onEach, all NaN';
  var src = _.containerAdapter.make( new Set( [ NaN, NaN, NaN, NaN ] ) );
  var got = src.min();
  var exp = NaN;
  test.identical( got, exp );

  test.case = 'without onEach, has minimum and NaN';
  var src = _.containerAdapter.make( new Set( [ -10, 5, -15, '4', 1, NaN, 15, -1, 21, '-20' ] ) );
  var got = src.min();
  var exp = NaN;
  test.identical( got, exp );

  /* */

  test.case = 'onEach, has minimum';
  var src = _.containerAdapter.make( new Set( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] ) );
  var got = src.min( ( e ) => e < 0 ? -e : e );
  var exp = 1;
  test.identical( got, exp );

  test.case = 'onEach, has minimum - -Infinity';
  var src = _.containerAdapter.make( new Set( [ -10, 5, -15, 4, -Infinity, 2, 15, 21, -20 ] ) );
  var got = src.min( ( e ) => e < 0 ? -e : e );
  var exp = 2;
  test.identical( got, exp );

  test.case = 'onEach, has minimum, small difference';
  var src = _.containerAdapter.make( new Set( [ -10, 5, -15, -20.0001, 4, 1, 2, 15, 21, -20 ] ) );
  var got = src.min( ( e ) => e < 0 ? -e : e );
  var exp = 1;
  test.identical( got, exp );

  test.case = 'onEach, all equal';
  var src = _.containerAdapter.make( new Set( [ -1, -1, -1, -1 ] ) );
  var got = src.min( ( e ) => e < 0 ? -e : e );
  var exp = 1;
  test.identical( got, exp );

  test.case = 'onEach, all -Infinity';
  var src = _.containerAdapter.make( new Set( [ -Infinity, -Infinity, -Infinity, -Infinity ] ) );
  var got = src.min( ( e ) => e < 0 ? -e : e );
  var exp = Infinity;
  test.identical( got, exp );

  test.case = 'onEach, all Infinity';
  var src = _.containerAdapter.make( new Set( [ Infinity, Infinity, Infinity, Infinity ] ) );
  var got = src.min( ( e ) => e < 0 ? -e : e );
  var exp = Infinity;
  test.identical( got, exp );

  test.case = 'onEach, all NaN';
  var src = _.containerAdapter.make( new Set( [ NaN, NaN, NaN, NaN ] ) );
  var got = src.min( ( e ) => isNaN( e ) ? 0 : e );
  var exp = 0;
  test.identical( got, exp );

  test.case = 'onEach, has minimum and NaN';
  var src = _.containerAdapter.make( new Set( [ -10, 5, -15, '4', 1, NaN, 15, -1, 21, '-20' ] ) );
  var got = src.min( ( e ) => isNaN( e ) || _.strIs( e ) ? 0 : e );
  var exp = -15;
  test.identical( got, exp );

  test.close( 'setContainerAdapter' );
}

//

function max( test )
{
  test.open( 'arrayContainerAdapter' );

  test.case = 'without onEach, has maximum';
  var src = _.containerAdapter.make( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
  var got = src.max();
  var exp = 21;
  test.identical( got, exp );

  test.case = 'without onEach, has maximum - Infinity';
  var src = _.containerAdapter.make( [ -10, 5, -15, 4, Infinity, 2, 15, 21, -20 ] );
  var got = src.max();
  var exp = Infinity;
  test.identical( got, exp );

  test.case = 'without onEach, has maximum, small difference';
  var src = _.containerAdapter.make( [ -10, 5, -15, 21.0001, 4, 1, 2, 15, 21, -20 ] );
  var got = src.max();
  var exp = 21.0001;
  test.identical( got, exp );

  test.case = 'without onEach, all equal';
  var src = _.containerAdapter.make( [ 1, 1, 1, 1 ] );
  var got = src.max();
  var exp = 1;
  test.identical( got, exp );

  test.case = 'without onEach, all -Infinity';
  var src = _.containerAdapter.make( [ -Infinity, -Infinity, -Infinity, -Infinity ] );
  var got = src.max();
  var exp = -Infinity;
  test.identical( got, exp );

  test.case = 'without onEach, all Infinity';
  var src = _.containerAdapter.make( [ Infinity, Infinity, Infinity, Infinity ] );
  var got = src.max();
  var exp = Infinity;
  test.identical( got, exp );

  test.case = 'without onEach, all NaN';
  var src = _.containerAdapter.make( [ NaN, NaN, NaN, NaN ] );
  var got = src.max();
  var exp = NaN;
  test.identical( got, exp );

  test.case = 'without onEach, has maximum and NaN';
  var src = _.containerAdapter.make( [ -10, 5, -15, '4', 1, NaN, 15, -1, 21, '-20' ] );
  var got = src.max();
  var exp = NaN;
  test.identical( got, exp );

  /* */

  test.case = 'onEach, has maximum';
  var src = _.containerAdapter.make( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
  var got = src.max( ( e ) => e < 0 ? -e : e );
  var exp = 21;
  test.identical( got, exp );

  test.case = 'onEach, has maximum - -Infinity';
  var src = _.containerAdapter.make( [ -10, 5, -15, 4, -Infinity, 2, 15, 21, -20 ] );
  var got = src.max( ( e ) => e < 0 ? -e : e );
  var exp = Infinity;
  test.identical( got, exp );

  test.case = 'onEach, has maximum, small difference';
  var src = _.containerAdapter.make( [ -10, 5, -15, -21.0001, 4, 1, 2, 15, 21, -20 ] );
  var got = src.max( ( e ) => e < 0 ? -e : e );
  var exp = 21.0001;
  test.identical( got, exp );

  test.case = 'onEach, all equal';
  var src = _.containerAdapter.make( [ -1, -1, -1, -1 ] );
  var got = src.max( ( e ) => e < 0 ? -e : e );
  var exp = 1;
  test.identical( got, exp );

  test.case = 'onEach, all -Infinity';
  var src = _.containerAdapter.make( [ -Infinity, -Infinity, -Infinity, -Infinity ] );
  var got = src.max( ( e ) => e < 0 ? -e : e );
  var exp = Infinity;
  test.identical( got, exp );

  test.case = 'onEach, all Infinity';
  var src = _.containerAdapter.make( [ Infinity, Infinity, Infinity, Infinity ] );
  var got = src.max( ( e ) => e < 0 ? -e : e );
  var exp = Infinity;
  test.identical( got, exp );

  test.case = 'onEach, all NaN';
  var src = _.containerAdapter.make( [ NaN, NaN, NaN, NaN ] );
  var got = src.max( ( e ) => isNaN( e ) ? 0 : e );
  var exp = 0;
  test.identical( got, exp );

  test.case = 'onEach, has maximum and NaN';
  var src = _.containerAdapter.make( [ -10, 5, -15, '4', 1, NaN, 15, -1, 21, '-20' ] );
  var got = src.max( ( e ) => isNaN( e ) || _.strIs( e ) ? 0 : e );
  var exp = 21;
  test.identical( got, exp );

  test.close( 'arrayContainerAdapter' );

  /* - */

  test.open( 'setContainerAdapter' );

  test.case = 'without onEach, has maximum';
  var src = _.containerAdapter.make( new Set( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] ) );
  var got = src.max();
  var exp = 21;
  test.identical( got, exp );

  test.case = 'without onEach, has maximum - Infinity';
  var src = _.containerAdapter.make( new Set( [ -10, 5, -15, 4, Infinity, 2, 15, 21, -20 ] ) );
  var got = src.max();
  var exp = Infinity;
  test.identical( got, exp );

  test.case = 'without onEach, has maximum, small difference';
  var src = _.containerAdapter.make( new Set( [ -10, 5, -15, 21.0001, 4, 1, 2, 15, 21, -20 ] ) );
  var got = src.max();
  var exp = 21.0001;
  test.identical( got, exp );

  test.case = 'without onEach, all equal';
  var src = _.containerAdapter.make( new Set( [ 1, 1, 1, 1 ] ) );
  var got = src.max();
  var exp = 1;
  test.identical( got, exp );

  test.case = 'without onEach, all -Infinity';
  var src = _.containerAdapter.make( new Set( [ -Infinity, -Infinity, -Infinity, -Infinity ] ) );
  var got = src.max();
  var exp = -Infinity;
  test.identical( got, exp );

  test.case = 'without onEach, all Infinity';
  var src = _.containerAdapter.make( new Set( [ Infinity, Infinity, Infinity, Infinity ] ) );
  var got = src.max();
  var exp = Infinity;
  test.identical( got, exp );

  test.case = 'without onEach, all NaN';
  var src = _.containerAdapter.make( new Set( [ NaN, NaN, NaN, NaN ] ) );
  var got = src.max();
  var exp = NaN;
  test.identical( got, exp );

  test.case = 'without onEach, has maximum and NaN';
  var src = _.containerAdapter.make( new Set( [ -10, 5, -15, '4', 1, NaN, 15, -1, 21, '-20' ] ) );
  var got = src.max();
  var exp = NaN;
  test.identical( got, exp );

  /* */

  test.case = 'onEach, has maximum';
  var src = _.containerAdapter.make( new Set( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] ) );
  var got = src.max( ( e ) => e < 0 ? -e : e );
  var exp = 21;
  test.identical( got, exp );

  test.case = 'onEach, has maximum - Infinity';
  var src = _.containerAdapter.make( new Set( [ -10, 5, -15, 4, -Infinity, 2, 15, 21, -20 ] ) );
  var got = src.max( ( e ) => e < 0 ? -e : e );
  var exp = Infinity;
  test.identical( got, exp );

  test.case = 'onEach, has maximum, small difference';
  var src = _.containerAdapter.make( new Set( [ -10, 5, -15, -21.0001, 4, 1, 2, 15, 21, -20 ] ) );
  var got = src.max( ( e ) => e < 0 ? -e : e );
  var exp = 21.0001;
  test.identical( got, exp );

  test.case = 'onEach, all equal';
  var src = _.containerAdapter.make( new Set( [ -1, -1, -1, -1 ] ) );
  var got = src.max( ( e ) => e < 0 ? -e : e );
  var exp = 1;
  test.identical( got, exp );

  test.case = 'onEach, all -Infinity';
  var src = _.containerAdapter.make( new Set( [ -Infinity, -Infinity, -Infinity, -Infinity ] ) );
  var got = src.max( ( e ) => e < 0 ? -e : e );
  var exp = Infinity;
  test.identical( got, exp );

  test.case = 'onEach, all Infinity';
  var src = _.containerAdapter.make( new Set( [ Infinity, Infinity, Infinity, Infinity ] ) );
  var got = src.max( ( e ) => e < 0 ? -e : e );
  var exp = Infinity;
  test.identical( got, exp );

  test.case = 'onEach, all NaN';
  var src = _.containerAdapter.make( new Set( [ NaN, NaN, NaN, NaN ] ) );
  var got = src.max( ( e ) => isNaN( e ) ? 0 : e );
  var exp = 0;
  test.identical( got, exp );

  test.case = 'onEach, has maximum and NaN';
  var src = _.containerAdapter.make( new Set( [ -10, 5, -15, '4', 1, NaN, 15, -1, 21, '-20' ] ) );
  var got = src.max( ( e ) => isNaN( e ) || _.strIs( e ) ? 0 : e );
  var exp = 21;
  test.identical( got, exp );

  test.close( 'setContainerAdapter' );
}

//

function least( test )
{
  test.open( 'arrayContainerAdapter' );

  test.open( 'without dst' );

  test.case = 'without onEach, has one minimum';
  var src = _.containerAdapter.make( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
  var got = src.least();
  var exp = [ -20 ];
  test.is( got !== src );
  test.identical( got.original, exp );

  test.case = 'without onEach, has minimum - -Infinity';
  var src = _.containerAdapter.make( [ -10, 5, -15, 4, -Infinity, 2, 15, 21, -20 ] );
  var got = src.least();
  var exp = [ -Infinity ];
  test.is( got !== src );
  test.identical( got.original, exp );

  test.case = 'without onEach, has minimum, small difference';
  var src = _.containerAdapter.make( [ -10, 5, -15, -20.0001, 4, 1, 2, 15, 21, -20 ] );
  var got = src.least();
  var exp = [ -20.0001 ];
  test.is( got !== src );
  test.identical( got.original, exp );

  test.case = 'without onEach, all equal';
  var src = _.containerAdapter.make( [ -1, -1, -1, -1 ] );
  var got = src.least();
  var exp = [ -1, -1, -1, -1 ];
  test.is( got !== src );
  test.identical( got.original, exp );

  test.case = 'without onEach, all -Infinity';
  var src = _.containerAdapter.make( [ -Infinity, -Infinity, -Infinity, -Infinity ] );
  var got = src.least();
  var exp = [ -Infinity, -Infinity, -Infinity, -Infinity ];
  test.is( got !== src );
  test.identical( got.original, exp );

  test.case = 'without onEach, all Infinity';
  var src = _.containerAdapter.make( [ Infinity, Infinity, Infinity, Infinity ] );
  var got = src.least();
  var exp = [ Infinity, Infinity, Infinity, Infinity ];
  test.is( got !== src );
  test.identical( got.original, exp );

  test.case = 'without onEach, all NaN';
  var src = _.containerAdapter.make( [ NaN, NaN, NaN, NaN ] );
  var got = src.least();
  var exp = [];
  test.is( got !== src );
  test.identical( got.original, exp );

  test.case = 'without onEach, has minimum and NaN';
  var src = _.containerAdapter.make( [ -10, 5, -15, '4', 1, NaN, 15, -1, 21, '-20' ] );
  var got = src.least();
  var exp = [];
  test.is( got !== src );
  test.identical( got.original, exp );

  /* */

  test.case = 'onEach, has minimum';
  var src = _.containerAdapter.make( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
  var got = src.least( ( e ) => e < 0 ? -e : e );
  var exp = [ 1 ];
  test.is( got !== src );
  test.identical( got.original, exp );

  test.case = 'onEach, has minimum - -Infinity';
  var src = _.containerAdapter.make( [ -10, 5, -15, 4, -Infinity, 2, 15, 21, -20 ] );
  var got = src.least( ( e ) => e < 0 ? -e : e );
  var exp = [ 2 ];
  test.is( got !== src );
  test.identical( got.original, exp );

  test.case = 'onEach, has minimum, small difference';
  var src = _.containerAdapter.make( [ -10, 5, -15, -20.0001, 4, 1, 2, 15, 21, -20 ] );
  var got = src.least( ( e ) => e < 0 ? -e : e );
  var exp = [ 1 ];
  test.is( got !== src );
  test.identical( got.original, exp );

  test.case = 'onEach, all equal';
  var src = _.containerAdapter.make( [ -1, -1, -1, -1 ] );
  var got = src.least( ( e ) => isNaN( e ) || _.strIs( e ) ? 0 : e );
  var exp = [ -1, -1, -1, -1 ];
  test.is( got !== src );
  test.identical( got.original, exp );

  test.case = 'onEach, all -Infinity';
  var src = _.containerAdapter.make( [ -Infinity, -Infinity, -Infinity, -Infinity ] );
  var got = src.least( ( e ) => isNaN( e ) || _.strIs( e ) ? 0 : e );
  var exp = [ -Infinity, -Infinity, -Infinity, -Infinity ];
  test.is( got !== src );
  test.identical( got.original, exp );

  test.case = 'onEach, all Infinity';
  var src = _.containerAdapter.make( [ Infinity, Infinity, Infinity, Infinity ] );
  var got = src.least( ( e ) => e < 0 ? -e : e );
  var exp = [ Infinity, Infinity, Infinity, Infinity ];
  test.is( got !== src );
  test.identical( got.original, exp );

  test.case = 'onEach, all NaN';
  var src = _.containerAdapter.make( [ NaN, NaN, NaN, NaN ] );
  var got = src.least( ( e ) => isNaN( e ) ? 0 : e );
  var exp = [ NaN, NaN, NaN, NaN ];
  test.is( got !== src );
  test.identical( got.original, exp );

  test.case = 'onEach, has minimum and NaN';
  var src = _.containerAdapter.make( [ -10, 5, -15, '4', 1, NaN, 15, -1, 21, '-20' ] );
  var got = src.least( ( e ) => isNaN( e ) || _.strIs( e ) ? 0 : e );
  var exp = [ -15 ];
  test.is( got !== src );
  test.identical( got.original, exp );

  test.close( 'without dst' );

  /* - */

  test.open( 'dst - null' );

  test.case = 'without onEach, has one minimum';
  var src = _.containerAdapter.make( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
  var got = src.least( null );
  var exp = [ -20 ];
  test.is( got !== src );
  test.identical( got.original, exp );

  test.case = 'without onEach, has minimum - -Infinity';
  var src = _.containerAdapter.make( [ -10, 5, -15, 4, -Infinity, 2, 15, 21, -20 ] );
  var got = src.least( null );
  var exp = [ -Infinity ];
  test.is( got !== src );
  test.identical( got.original, exp );

  test.case = 'without onEach, has minimum, small difference';
  var src = _.containerAdapter.make( [ -10, 5, -15, -20.0001, 4, 1, 2, 15, 21, -20 ] );
  var got = src.least( null );
  var exp = [ -20.0001 ];
  test.is( got !== src );
  test.identical( got.original, exp );

  test.case = 'without onEach, all equal';
  var src = _.containerAdapter.make( [ -1, -1, -1, -1 ] );
  var got = src.least( null );
  var exp = [ -1, -1, -1, -1 ];
  test.is( got !== src );
  test.identical( got.original, exp );

  test.case = 'without onEach, all -Infinity';
  var src = _.containerAdapter.make( [ -Infinity, -Infinity, -Infinity, -Infinity ] );
  var got = src.least( null );
  var exp = [ -Infinity, -Infinity, -Infinity, -Infinity ];
  test.is( got !== src );
  test.identical( got.original, exp );

  test.case = 'without onEach, all Infinity';
  var src = _.containerAdapter.make( [ Infinity, Infinity, Infinity, Infinity ] );
  var got = src.least( null );
  var exp = [ Infinity, Infinity, Infinity, Infinity ];
  test.is( got !== src );
  test.identical( got.original, exp );

  test.case = 'without onEach, all NaN';
  var src = _.containerAdapter.make( [ NaN, NaN, NaN, NaN ] );
  var got = src.least( null );
  var exp = [];
  test.is( got !== src );
  test.identical( got.original, exp );

  test.case = 'without onEach, has minimum and NaN';
  var src = _.containerAdapter.make( [ -10, 5, -15, '4', 1, NaN, 15, -1, 21, '-20' ] );
  var got = src.least( null );
  var exp = [];
  test.is( got !== src );
  test.identical( got.original, exp );

  /* */

  test.case = 'onEach, has minimum';
  var src = _.containerAdapter.make( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
  var got = src.least( null, ( e ) => e < 0 ? -e : e );
  var exp = [ 1 ];
  test.is( got !== src );
  test.identical( got.original, exp );

  test.case = 'onEach, has minimum - -Infinity';
  var src = _.containerAdapter.make( [ -10, 5, -15, 4, -Infinity, 2, 15, 21, -20 ] );
  var got = src.least( null, ( e ) => e < 0 ? -e : e );
  var exp = [ 2 ];
  test.is( got !== src );
  test.identical( got.original, exp );

  test.case = 'onEach, has minimum, small difference';
  var src = _.containerAdapter.make( [ -10, 5, -15, -20.0001, 4, 1, 2, 15, 21, -20 ] );
  var got = src.least( null, ( e ) => e < 0 ? -e : e );
  var exp = [ 1 ];
  test.is( got !== src );
  test.identical( got.original, exp );

  test.case = 'onEach, all equal';
  var src = _.containerAdapter.make( [ -1, -1, -1, -1 ] );
  var got = src.least( null, ( e ) => isNaN( e ) || _.strIs( e ) ? 0 : e );
  var exp = [ -1, -1, -1, -1 ];
  test.is( got !== src );
  test.identical( got.original, exp );

  test.case = 'onEach, all -Infinity';
  var src = _.containerAdapter.make( [ -Infinity, -Infinity, -Infinity, -Infinity ] );
  var got = src.least( null, ( e ) => isNaN( e ) || _.strIs( e ) ? 0 : e );
  var exp = [ -Infinity, -Infinity, -Infinity, -Infinity ];
  test.is( got !== src );
  test.identical( got.original, exp );

  test.case = 'onEach, all Infinity';
  var src = _.containerAdapter.make( [ Infinity, Infinity, Infinity, Infinity ] );
  var got = src.least( null, ( e ) => e < 0 ? -e : e );
  var exp = [ Infinity, Infinity, Infinity, Infinity ];
  test.is( got !== src );
  test.identical( got.original, exp );

  test.case = 'onEach, all NaN';
  var src = _.containerAdapter.make( [ NaN, NaN, NaN, NaN ] );
  var got = src.least( null, ( e ) => isNaN( e ) ? 0 : e );
  var exp = [ NaN, NaN, NaN, NaN ];
  test.is( got !== src );
  test.identical( got.original, exp );

  test.case = 'onEach, has minimum and NaN';
  var src = _.containerAdapter.make( [ -10, 5, -15, '4', 1, NaN, 15, -1, 21, '-20' ] );
  var got = src.least( null, ( e ) => isNaN( e ) || _.strIs( e ) ? 0 : e );
  var exp = [ -15 ];
  test.is( got !== src );
  test.identical( got.original, exp );

  test.close( 'dst - null' );

  /* - */

  test.open( 'dst - new container' );

  test.case = 'without onEach, has one minimum';
  var dst = _.containerAdapter.make( [] );
  var src = _.containerAdapter.make( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
  var got = src.least( dst );
  var exp = [ -20 ];
  test.is( got === dst );
  test.is( got !== src );
  test.identical( got.original, exp );

  test.case = 'without onEach, has minimum - -Infinity';
  var dst = _.containerAdapter.make( [] );
  var src = _.containerAdapter.make( [ -10, 5, -15, 4, -Infinity, 2, 15, 21, -20 ] );
  var got = src.least( dst );
  var exp = [ -Infinity ];
  test.is( got === dst );
  test.is( got !== src );
  test.identical( got.original, exp );

  test.case = 'without onEach, has minimum, small difference';
  var dst = _.containerAdapter.make( [] );
  var src = _.containerAdapter.make( [ -10, 5, -15, -20.0001, 4, 1, 2, 15, 21, -20 ] );
  var got = src.least( dst );
  var exp = [ -20.0001 ];
  test.is( got === dst );
  test.is( got !== src );
  test.identical( got.original, exp );

  test.case = 'without onEach, all equal';
  var dst = _.containerAdapter.make( [] );
  var src = _.containerAdapter.make( [ -1, -1, -1, -1 ] );
  var got = src.least( dst );
  var exp = [ -1, -1, -1, -1 ];
  test.is( got === dst );
  test.is( got !== src );
  test.identical( got.original, exp );

  test.case = 'without onEach, all -Infinity';
  var dst = _.containerAdapter.make( [] );
  var src = _.containerAdapter.make( [ -Infinity, -Infinity, -Infinity, -Infinity ] );
  var got = src.least( dst );
  var exp = [ -Infinity, -Infinity, -Infinity, -Infinity ];
  test.is( got === dst );
  test.is( got !== src );
  test.identical( got.original, exp );

  test.case = 'without onEach, all Infinity';
  var dst = _.containerAdapter.make( [] );
  var src = _.containerAdapter.make( [ Infinity, Infinity, Infinity, Infinity ] );
  var got = src.least( dst );
  var exp = [ Infinity, Infinity, Infinity, Infinity ];
  test.is( got === dst );
  test.is( got !== src );
  test.identical( got.original, exp );

  test.case = 'without onEach, all NaN';
  var dst = _.containerAdapter.make( [] );
  var src = _.containerAdapter.make( [ NaN, NaN, NaN, NaN ] );
  var got = src.least( dst );
  var exp = [];
  test.is( got === dst );
  test.is( got !== src );
  test.identical( got.original, exp );

  test.case = 'without onEach, has minimum and NaN';
  var dst = _.containerAdapter.make( [] );
  var src = _.containerAdapter.make( [ -10, 5, -15, '4', 1, NaN, 15, -1, 21, '-20' ] );
  var got = src.least( dst );
  var exp = [];
  test.is( got === dst );
  test.is( got !== src );
  test.identical( got.original, exp );

  /* */

  test.case = 'onEach, has minimum';
  var dst = _.containerAdapter.make( [] );
  var src = _.containerAdapter.make( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
  var got = src.least( dst, ( e ) => e < 0 ? -e : e );
  var exp = [ 1 ];
  test.is( got === dst );
  test.is( got !== src );
  test.identical( got.original, exp );

  test.case = 'onEach, has minimum - -Infinity';
  var dst = _.containerAdapter.make( [] );
  var src = _.containerAdapter.make( [ -10, 5, -15, 4, -Infinity, 2, 15, 21, -20 ] );
  var got = src.least( dst, ( e ) => e < 0 ? -e : e );
  var exp = [ 2 ];
  test.is( got === dst );
  test.is( got !== src );
  test.identical( got.original, exp );

  test.case = 'onEach, has minimum, small difference';
  var dst = _.containerAdapter.make( [] );
  var src = _.containerAdapter.make( [ -10, 5, -15, -20.0001, 4, 1, 2, 15, 21, -20 ] );
  var got = src.least( dst, ( e ) => e < 0 ? -e : e );
  var exp = [ 1 ];
  test.is( got === dst );
  test.is( got !== src );
  test.identical( got.original, exp );

  test.case = 'onEach, all equal';
  var dst = _.containerAdapter.make( [] );
  var src = _.containerAdapter.make( [ -1, -1, -1, -1 ] );
  var got = src.least( dst, ( e ) => isNaN( e ) || _.strIs( e ) ? 0 : e );
  var exp = [ -1, -1, -1, -1 ];
  test.is( got === dst );
  test.is( got !== src );
  test.identical( got.original, exp );

  test.case = 'onEach, all -Infinity';
  var dst = _.containerAdapter.make( [] );
  var src = _.containerAdapter.make( [ -Infinity, -Infinity, -Infinity, -Infinity ] );
  var got = src.least( dst, ( e ) => isNaN( e ) || _.strIs( e ) ? 0 : e );
  var exp = [ -Infinity, -Infinity, -Infinity, -Infinity ];
  test.is( got === dst );
  test.is( got !== src );
  test.identical( got.original, exp );

  test.case = 'onEach, all Infinity';
  var dst = _.containerAdapter.make( [] );
  var src = _.containerAdapter.make( [ Infinity, Infinity, Infinity, Infinity ] );
  var got = src.least( dst, ( e ) => e < 0 ? -e : e );
  var exp = [ Infinity, Infinity, Infinity, Infinity ];
  test.is( got === dst );
  test.is( got !== src );
  test.identical( got.original, exp );

  test.case = 'onEach, all NaN';
  var dst = _.containerAdapter.make( [] );
  var src = _.containerAdapter.make( [ NaN, NaN, NaN, NaN ] );
  var got = src.least( dst, ( e ) => isNaN( e ) ? 0 : e );
  var exp = [ NaN, NaN, NaN, NaN ];
  test.is( got === dst );
  test.is( got !== src );
  test.identical( got.original, exp );

  test.case = 'onEach, has minimum and NaN';
  var dst = _.containerAdapter.make( [] );
  var src = _.containerAdapter.make( [ -10, 5, -15, '4', 1, NaN, 15, -1, 21, '-20' ] );
  var got = src.least( dst, ( e ) => isNaN( e ) || _.strIs( e ) ? 0 : e );
  var exp = [ -15 ];
  test.is( got === dst );
  test.is( got !== src );
  test.identical( got.original, exp );

  /* */

  test.case = 'onEach, has minimum';
  var dst = _.containerAdapter.make( new Set() );
  var src = _.containerAdapter.make( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
  var got = src.least( dst, ( e ) => e < 0 ? -e : e );
  var exp = [ 1 ];
  test.is( got === dst );
  test.is( got !== src );
  test.identical( [ ... got.original ], exp );

  test.case = 'onEach, has minimum - -Infinity';
  var dst = _.containerAdapter.make( new Set() );
  var src = _.containerAdapter.make( [ -10, 5, -15, 4, -Infinity, 2, 15, 21, -20 ] );
  var got = src.least( dst, ( e ) => e < 0 ? -e : e );
  var exp = [ 2 ];
  test.is( got === dst );
  test.is( got !== src );
  test.identical( [ ... got.original ], exp );

  test.case = 'onEach, has minimum, small difference';
  var dst = _.containerAdapter.make( new Set() );
  var src = _.containerAdapter.make( [ -10, 5, -15, -20.0001, 4, 1, 2, 15, 21, -20 ] );
  var got = src.least( dst, ( e ) => e < 0 ? -e : e );
  var exp = [ 1 ];
  test.is( got === dst );
  test.is( got !== src );
  test.identical( [ ... got.original ], exp );

  test.case = 'onEach, all equal';
  var dst = _.containerAdapter.make( new Set() );
  var src = _.containerAdapter.make( [ -1, -1, -1, -1 ] );
  var got = src.least( dst, ( e ) => isNaN( e ) || _.strIs( e ) ? 0 : e );
  var exp = [ -1 ];
  test.is( got === dst );
  test.is( got !== src );
  test.identical( [ ... got.original ], exp );

  test.case = 'onEach, all -Infinity';
  var dst = _.containerAdapter.make( new Set() );
  var src = _.containerAdapter.make( [ -Infinity, -Infinity, -Infinity, -Infinity ] );
  var got = src.least( dst, ( e ) => isNaN( e ) || _.strIs( e ) ? 0 : e );
  var exp = [ -Infinity ];
  test.is( got === dst );
  test.is( got !== src );
  test.identical( [ ... got.original ], exp );

  test.case = 'onEach, all Infinity';
  var dst = _.containerAdapter.make( new Set() );
  var src = _.containerAdapter.make( [ Infinity, Infinity, Infinity, Infinity ] );
  var got = src.least( dst, ( e ) => e < 0 ? -e : e );
  var exp = [ Infinity ];
  test.is( got === dst );
  test.is( got !== src );
  test.identical( [ ... got.original ], exp );

  test.case = 'onEach, all NaN';
  var dst = _.containerAdapter.make( new Set() );
  var src = _.containerAdapter.make( [ NaN, NaN, NaN, NaN ] );
  var got = src.least( dst, ( e ) => isNaN( e ) ? 0 : e );
  var exp = [ NaN ];
  test.is( got === dst );
  test.is( got !== src );
  test.identical( [ ... got.original ], exp );

  test.case = 'onEach, has minimum and NaN';
  var dst = _.containerAdapter.make( new Set() );
  var src = _.containerAdapter.make( [ -10, 5, -15, '4', 1, NaN, 15, -1, 21, '-20' ] );
  var got = src.least( dst, ( e ) => isNaN( e ) || _.strIs( e ) ? 0 : e );
  var exp = [ -15 ];
  test.is( got === dst );
  test.is( got !== src );
  test.identical( [ ... got.original ], exp );

  test.close( 'dst - new container' );

  /* - */

  test.open( 'dst - src' );

  test.case = 'without onEach, has one minimum';
  var src = _.containerAdapter.make( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
  var got = src.least( src );
  var exp = [ -20 ];
  test.is( got === src );
  test.identical( got.original, exp );

  test.case = 'without onEach, has minimum - -Infinity';
  var src = _.containerAdapter.make( [ -10, 5, -15, 4, -Infinity, 2, 15, 21, -20 ] );
  var got = src.least( src );
  var exp = [ -Infinity ];
  test.is( got === src );
  test.identical( got.original, exp );

  test.case = 'without onEach, has minimum, small difference';
  var src = _.containerAdapter.make( [ -10, 5, -15, -20.0001, 4, 1, 2, 15, 21, -20 ] );
  var got = src.least( src );
  var exp = [ -20.0001 ];
  test.is( got === src );
  test.identical( got.original, exp );

  test.case = 'without onEach, all equal';
  var src = _.containerAdapter.make( [ -1, -1, -1, -1 ] );
  var got = src.least( src );
  var exp = [ -1, -1, -1, -1 ];
  test.is( got === src );
  test.identical( got.original, exp );

  test.case = 'without onEach, all -Infinity';
  var src = _.containerAdapter.make( [ -Infinity, -Infinity, -Infinity, -Infinity ] );
  var got = src.least( src );
  var exp = [ -Infinity, -Infinity, -Infinity, -Infinity ];
  test.is( got === src );
  test.identical( got.original, exp );

  test.case = 'without onEach, all Infinity';
  var src = _.containerAdapter.make( [ Infinity, Infinity, Infinity, Infinity ] );
  var got = src.least( src );
  var exp = [ Infinity, Infinity, Infinity, Infinity ];
  test.is( got === src );
  test.identical( got.original, exp );

  test.case = 'without onEach, all NaN';
  var src = _.containerAdapter.make( [ NaN, NaN, NaN, NaN ] );
  var got = src.least( src );
  var exp = [];
  test.is( got === src );
  test.identical( got.original, exp );

  test.case = 'without onEach, has minimum and NaN';
  var src = _.containerAdapter.make( [ -10, 5, -15, '4', 1, NaN, 15, -1, 21, '-20' ] );
  var got = src.least( src );
  var exp = [];
  test.is( got === src );
  test.identical( got.original, exp );

  /* */

  test.case = 'onEach, has minimum';
  var src = _.containerAdapter.make( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
  var got = src.least( src, ( e ) => e < 0 ? -e : e );
  var exp = [ 1 ];
  test.is( got === src );
  test.identical( got.original, exp );

  test.case = 'onEach, has minimum - -Infinity';
  var src = _.containerAdapter.make( [ -10, 5, -15, 4, -Infinity, 2, 15, 21, -20 ] );
  var got = src.least( src, ( e ) => e < 0 ? -e : e );
  var exp = [ 2 ];
  test.is( got === src );
  test.identical( got.original, exp );

  test.case = 'onEach, has minimum, small difference';
  var src = _.containerAdapter.make( [ -10, 5, -15, -20.0001, 4, 1, 2, 15, 21, -20 ] );
  var got = src.least( src, ( e ) => e < 0 ? -e : e );
  var exp = [ 1 ];
  test.is( got === src );
  test.identical( got.original, exp );

  test.case = 'onEach, all equal';
  var src = _.containerAdapter.make( [ -1, -1, -1, -1 ] );
  var got = src.least( src, ( e ) => isNaN( e ) || _.strIs( e ) ? 0 : e );
  var exp = [ -1, -1, -1, -1 ];
  test.is( got === src );
  test.identical( got.original, exp );

  test.case = 'onEach, all -Infinity';
  var src = _.containerAdapter.make( [ -Infinity, -Infinity, -Infinity, -Infinity ] );
  var got = src.least( src, ( e ) => isNaN( e ) || _.strIs( e ) ? 0 : e );
  var exp = [ -Infinity, -Infinity, -Infinity, -Infinity ];
  test.is( got === src );
  test.identical( got.original, exp );

  test.case = 'onEach, all Infinity';
  var src = _.containerAdapter.make( [ Infinity, Infinity, Infinity, Infinity ] );
  var got = src.least( src, ( e ) => e < 0 ? -e : e );
  var exp = [ Infinity, Infinity, Infinity, Infinity ];
  test.is( got === src );
  test.identical( got.original, exp );

  test.case = 'onEach, all NaN';
  var src = _.containerAdapter.make( [ NaN, NaN, NaN, NaN ] );
  var got = src.least( src, ( e ) => isNaN( e ) ? 0 : e );
  var exp = [ NaN, NaN, NaN, NaN ];
  test.is( got === src );
  test.identical( got.original, exp );

  test.case = 'onEach, has minimum and NaN';
  var src = _.containerAdapter.make( [ -10, 5, -15, '4', 1, NaN, 15, -1, 21, '-20' ] );
  var got = src.least( src, ( e ) => isNaN( e ) || _.strIs( e ) ? 0 : e );
  var exp = [ -15 ];
  test.is( got === src );
  test.identical( got.original, exp );

  test.close( 'dst - src' );

  test.close( 'arrayContainerAdapter' );

  /* - */

  test.open( 'setContainerAdapter' );

  test.open( 'without dst' );

  test.case = 'without onEach, has one minimum';
  var src = _.containerAdapter.make( new Set( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] ) );
  var got = src.least();
  var exp = [ -20 ];
  test.is( got !== src );
  test.identical( [ ... got.original ], exp );

  test.case = 'without onEach, has minimum - -Infinity';
  var src = _.containerAdapter.make( new Set( [ -10, 5, -15, 4, -Infinity, 2, 15, 21, -20 ] ) );
  var got = src.least();
  var exp = [ -Infinity ];
  test.is( got !== src );
  test.identical( [ ... got.original ], exp );

  test.case = 'without onEach, has minimum, small difference';
  var src = _.containerAdapter.make( new Set(  [ -10, 5, -15, -20.0001, 4, 1, 2, 15, 21, -20 ] ) );
  var got = src.least();
  var exp = [ -20.0001 ];
  test.is( got !== src );
  test.identical( [ ... got.original ], exp );

  test.case = 'without onEach, all equal';
  var src = _.containerAdapter.make( new Set( [ -1, -1, -1, -1 ] ) );
  var got = src.least();
  var exp = [ -1 ];
  test.is( got !== src );
  test.identical( [ ... got.original ], exp );

  test.case = 'without onEach, all -Infinity';
  var src = _.containerAdapter.make( new Set( [ -Infinity, -Infinity, -Infinity, -Infinity ] ) );
  var got = src.least();
  var exp = [ -Infinity ];
  test.is( got !== src );
  test.identical( [ ... got.original ], exp );

  test.case = 'without onEach, all Infinity';
  var src = _.containerAdapter.make( new Set( [ Infinity, Infinity, Infinity, Infinity ] ) );
  var got = src.least();
  var exp = [ Infinity ];
  test.is( got !== src );
  test.identical( [ ... got.original ], exp );

  test.case = 'without onEach, all NaN';
  var src = _.containerAdapter.make( new Set( [ NaN, NaN, NaN, NaN ] ) );
  var got = src.least();
  var exp = [];
  test.is( got !== src );
  test.identical( [ ... got.original ], exp );

  test.case = 'without onEach, has minimum and NaN';
  var src = _.containerAdapter.make( new Set( [ -10, 5, -15, '4', 1, NaN, 15, -1, 21, '-20' ] ) );
  var got = src.least();
  var exp = [];
  test.is( got !== src );
  test.identical( [ ... got.original ], exp );

  /* */

  test.case = 'onEach, has minimum';
  var src = _.containerAdapter.make( new Set( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] ) );
  var got = src.least( ( e ) => e < 0 ? -e : e );
  var exp = [ 1 ];
  test.is( got !== src );
  test.identical( [ ... got.original ], exp );

  test.case = 'onEach, has minimum - -Infinity';
  var src = _.containerAdapter.make( new Set( [ -10, 5, -15, 4, -Infinity, 2, 15, 21, -20 ] ) );
  var got = src.least( ( e ) => e < 0 ? -e : e );
  var exp = [ 2 ];
  test.is( got !== src );
  test.identical( [ ... got.original ], exp );

  test.case = 'onEach, has minimum, small difference';
  var src = _.containerAdapter.make( new Set( [ -10, 5, -15, -20.0001, 4, 1, 2, 15, 21, -20 ] ) );
  var got = src.least( ( e ) => e < 0 ? -e : e );
  var exp = [ 1 ];
  test.is( got !== src );
  test.identical( [ ... got.original ], exp );

  test.case = 'onEach, all equal';
  var src = _.containerAdapter.make( new Set( [ -1, -1, -1, -1 ] ) );
  var got = src.least( ( e ) => isNaN( e ) || _.strIs( e ) ? 0 : e );
  var exp = [ -1 ];
  test.is( got !== src );
  test.identical( [ ... got.original ], exp );

  test.case = 'onEach, all -Infinity';
  var src = _.containerAdapter.make( new Set( [ -Infinity, -Infinity, -Infinity, -Infinity ] ) );
  var got = src.least( ( e ) => isNaN( e ) || _.strIs( e ) ? 0 : e );
  var exp = [ -Infinity ];
  test.is( got !== src );
  test.identical( [ ... got.original ], exp );

  test.case = 'onEach, all Infinity';
  var src = _.containerAdapter.make( new Set( [ Infinity, Infinity, Infinity, Infinity ] ) );
  var got = src.least( ( e ) => e < 0 ? -e : e );
  var exp = [ Infinity ];
  test.is( got !== src );
  test.identical( [ ... got.original ], exp );

  test.case = 'onEach, all NaN';
  var src = _.containerAdapter.make( new Set( [ NaN, NaN, NaN, NaN ] ) );
  var got = src.least( ( e ) => isNaN( e ) ? 0 : e );
  var exp = [ NaN ];
  test.is( got !== src );
  test.identical( [ ... got.original ], exp );

  test.case = 'onEach, has minimum and NaN';
  var src = _.containerAdapter.make( new Set( [ -10, 5, -15, '4', 1, NaN, 15, -1, 21, '-20' ] ) );
  var got = src.least( ( e ) => isNaN( e ) || _.strIs( e ) ? 0 : e );
  var exp = [ -15 ];
  test.is( got !== src );
  test.identical( [ ... got.original ], exp );

  test.close( 'without dst' );

  /* - */

  test.open( 'dst - null' );

  test.case = 'without onEach, has one minimum';
  var src = _.containerAdapter.make( new Set( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] ) );
  var got = src.least( null );
  var exp = [ -20 ];
  test.is( got !== src );
  test.identical( [ ... got.original ], exp );

  test.case = 'without onEach, has minimum - -Infinity';
  var src = _.containerAdapter.make( new Set( [ -10, 5, -15, 4, -Infinity, 2, 15, 21, -20 ] ) );
  var got = src.least( null );
  var exp = [ -Infinity ];
  test.is( got !== src );
  test.identical( [ ... got.original ], exp );

  test.case = 'without onEach, has minimum, small difference';
  var src = _.containerAdapter.make( new Set( [ -10, 5, -15, -20.0001, 4, 1, 2, 15, 21, -20 ] ) );
  var got = src.least( null );
  var exp = [ -20.0001 ];
  test.is( got !== src );
  test.identical( [ ... got.original ], exp );

  test.case = 'without onEach, all equal';
  var src = _.containerAdapter.make( new Set( [ -1, -1, -1, -1 ] ) );
  var got = src.least( null );
  var exp = [ -1 ];
  test.is( got !== src );
  test.identical( [ ... got.original ], exp );

  test.case = 'without onEach, all -Infinity';
  var src = _.containerAdapter.make( new Set( [ -Infinity, -Infinity, -Infinity, -Infinity ] ) );
  var got = src.least( null );
  var exp = [ -Infinity ];
  test.is( got !== src );
  test.identical( [ ... got.original ], exp );

  test.case = 'without onEach, all Infinity';
  var src = _.containerAdapter.make( new Set( [ Infinity, Infinity, Infinity, Infinity ] ) );
  var got = src.least( null );
  var exp = [ Infinity ];
  test.is( got !== src );
  test.identical( [ ... got.original ], exp );

  test.case = 'without onEach, all NaN';
  var src = _.containerAdapter.make( new Set( [ NaN, NaN, NaN, NaN ] ) );
  var got = src.least( null );
  var exp = [];
  test.is( got !== src );
  test.identical( [ ... got.original ], exp );

  test.case = 'without onEach, has minimum and NaN';
  var src = _.containerAdapter.make( new Set( [ -10, 5, -15, '4', 1, NaN, 15, -1, 21, '-20' ] ) );
  var got = src.least( null );
  var exp = [];
  test.is( got !== src );
  test.identical( [ ... got.original ], exp );

  /* */

  test.case = 'onEach, has minimum';
  var src = _.containerAdapter.make( new Set( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] ) );
  var got = src.least( null, ( e ) => e < 0 ? -e : e );
  var exp = [ 1 ];
  test.is( got !== src );
  test.identical( [ ... got.original ], exp );

  test.case = 'onEach, has minimum - -Infinity';
  var src = _.containerAdapter.make( new Set( [ -10, 5, -15, 4, -Infinity, 2, 15, 21, -20 ] ) );
  var got = src.least( null, ( e ) => e < 0 ? -e : e );
  var exp = [ 2 ];
  test.is( got !== src );
  test.identical( [ ... got.original ], exp );

  test.case = 'onEach, has minimum, small difference';
  var src = _.containerAdapter.make( new Set( [ -10, 5, -15, -20.0001, 4, 1, 2, 15, 21, -20 ] ) );
  var got = src.least( null, ( e ) => e < 0 ? -e : e );
  var exp = [ 1 ];
  test.is( got !== src );
  test.identical( [ ... got.original ], exp );

  test.case = 'onEach, all equal';
  var src = _.containerAdapter.make( new Set( [ -1, -1, -1, -1 ] ) );
  var got = src.least( null, ( e ) => isNaN( e ) || _.strIs( e ) ? 0 : e );
  var exp = [ -1 ];
  test.is( got !== src );
  test.identical( [ ... got.original ], exp );

  test.case = 'onEach, all -Infinity';
  var src = _.containerAdapter.make( new Set( [ -Infinity, -Infinity, -Infinity, -Infinity ] ) );
  var got = src.least( null, ( e ) => isNaN( e ) || _.strIs( e ) ? 0 : e );
  var exp = [ -Infinity ];
  test.is( got !== src );
  test.identical( [ ... got.original ], exp );

  test.case = 'onEach, all Infinity';
  var src = _.containerAdapter.make( new Set( [ Infinity, Infinity, Infinity, Infinity ] ) );
  var got = src.least( null, ( e ) => e < 0 ? -e : e );
  var exp = [ Infinity ];
  test.is( got !== src );
  test.identical( [ ... got.original ], exp );

  test.case = 'onEach, all NaN';
  var src = _.containerAdapter.make( new Set( [ NaN, NaN, NaN, NaN ] ) );
  var got = src.least( null, ( e ) => isNaN( e ) ? 0 : e );
  var exp = [ NaN ];
  test.is( got !== src );
  test.identical( [ ... got.original ], exp );

  test.case = 'onEach, has minimum and NaN';
  var src = _.containerAdapter.make( new Set( [ -10, 5, -15, '4', 1, NaN, 15, -1, 21, '-20' ] ) );
  var got = src.least( null, ( e ) => isNaN( e ) || _.strIs( e ) ? 0 : e );
  var exp = [ -15 ];
  test.is( got !== src );
  test.identical( [ ... got.original ], exp );

  test.close( 'dst - null' );

  /* - */

  test.open( 'dst - new container' );

  test.case = 'without onEach, has one minimum';
  var dst = _.containerAdapter.make( new Set( [] ) );
  var src = _.containerAdapter.make( new Set( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] ) );
  var got = src.least( dst );
  var exp = [ -20 ];
  test.is( got === dst );
  test.is( got !== src );
  test.identical( [ ... got.original ], exp );

  test.case = 'without onEach, has minimum - -Infinity';
  var dst = _.containerAdapter.make( new Set( [] ) );
  var src = _.containerAdapter.make( new Set( [ -10, 5, -15, 4, -Infinity, 2, 15, 21, -20 ] ) );
  var got = src.least( dst );
  var exp = [ -Infinity ];
  test.is( got === dst );
  test.is( got !== src );
  test.identical( [ ... got.original ], exp );

  test.case = 'without onEach, has minimum, small difference';
  var dst = _.containerAdapter.make( new Set( [] ) );
  var src = _.containerAdapter.make( new Set( [ -10, 5, -15, -20.0001, 4, 1, 2, 15, 21, -20 ] ) );
  var got = src.least( dst );
  var exp = [ -20.0001 ];
  test.is( got === dst );
  test.is( got !== src );
  test.identical( [ ... got.original ], exp );

  test.case = 'without onEach, all equal';
  var dst = _.containerAdapter.make( new Set( [] ) );
  var src = _.containerAdapter.make( new Set( [ -1, -1, -1, -1 ] ) );
  var got = src.least( dst );
  var exp = [ -1 ];
  test.is( got === dst );
  test.is( got !== src );
  test.identical( [ ... got.original ], exp );

  test.case = 'without onEach, all -Infinity';
  var dst = _.containerAdapter.make( new Set( [] ) );
  var src = _.containerAdapter.make( new Set( [ -Infinity, -Infinity, -Infinity, -Infinity ] ) );
  var got = src.least( dst );
  var exp = [ -Infinity ];
  test.is( got === dst );
  test.is( got !== src );
  test.identical( [ ... got.original ], exp );

  test.case = 'without onEach, all Infinity';
  var dst = _.containerAdapter.make( new Set( [] ) );
  var src = _.containerAdapter.make( new Set( [ Infinity, Infinity, Infinity, Infinity ] ) );
  var got = src.least( dst );
  var exp = [ Infinity ];
  test.is( got === dst );
  test.is( got !== src );
  test.identical( [ ... got.original ], exp );

  test.case = 'without onEach, all NaN';
  var dst = _.containerAdapter.make( new Set( [] ) );
  var src = _.containerAdapter.make( new Set( [ NaN, NaN, NaN, NaN ] ) );
  var got = src.least( dst );
  var exp = [];
  test.is( got === dst );
  test.is( got !== src );
  test.identical( [ ... got.original ], exp );

  test.case = 'without onEach, has minimum and NaN';
  var dst = _.containerAdapter.make( new Set( [] ) );
  var src = _.containerAdapter.make( new Set( [ -10, 5, -15, '4', 1, NaN, 15, -1, 21, '-20' ] ) );
  var got = src.least( dst );
  var exp = [];
  test.is( got === dst );
  test.is( got !== src );
  test.identical( [ ... got.original ], exp );

  /* */

  test.case = 'onEach, has minimum';
  var dst = _.containerAdapter.make( new Set( [] ) );
  var src = _.containerAdapter.make( new Set( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] ) );
  var got = src.least( dst, ( e ) => e < 0 ? -e : e );
  var exp = [ 1 ];
  test.is( got === dst );
  test.is( got !== src );
  test.identical( [ ... got.original ], exp );

  test.case = 'onEach, has minimum - -Infinity';
  var dst = _.containerAdapter.make( new Set( [] ) );
  var src = _.containerAdapter.make( new Set( [ -10, 5, -15, 4, -Infinity, 2, 15, 21, -20 ] ) );
  var got = src.least( dst, ( e ) => e < 0 ? -e : e );
  var exp = [ 2 ];
  test.is( got === dst );
  test.is( got !== src );
  test.identical( [ ... got.original ], exp );

  test.case = 'onEach, has minimum, small difference';
  var dst = _.containerAdapter.make( new Set( [] ) );
  var src = _.containerAdapter.make( new Set( [ -10, 5, -15, -20.0001, 4, 1, 2, 15, 21, -20 ] ) );
  var got = src.least( dst, ( e ) => e < 0 ? -e : e );
  var exp = [ 1 ];
  test.is( got === dst );
  test.is( got !== src );
  test.identical( [ ... got.original ], exp );

  test.case = 'onEach, all equal';
  var dst = _.containerAdapter.make( new Set( [] ) );
  var src = _.containerAdapter.make( new Set( [ -1, -1, -1, -1 ] ) );
  var got = src.least( dst, ( e ) => isNaN( e ) || _.strIs( e ) ? 0 : e );
  var exp = [ -1 ];
  test.is( got === dst );
  test.is( got !== src );
  test.identical( [ ... got.original ], exp );

  test.case = 'onEach, all -Infinity';
  var dst = _.containerAdapter.make( new Set( [] ) );
  var src = _.containerAdapter.make( new Set( [ -Infinity, -Infinity, -Infinity, -Infinity ] ) );
  var got = src.least( dst, ( e ) => isNaN( e ) || _.strIs( e ) ? 0 : e );
  var exp = [ -Infinity ];
  test.is( got === dst );
  test.is( got !== src );
  test.identical( [ ... got.original ], exp );

  test.case = 'onEach, all Infinity';
  var dst = _.containerAdapter.make( new Set( [] ) );
  var src = _.containerAdapter.make( new Set( [ Infinity, Infinity, Infinity, Infinity ] ) );
  var got = src.least( dst, ( e ) => e < 0 ? -e : e );
  var exp = [ Infinity ];
  test.is( got === dst );
  test.is( got !== src );
  test.identical( [ ... got.original ], exp );

  test.case = 'onEach, all NaN';
  var dst = _.containerAdapter.make( new Set( [] ) );
  var src = _.containerAdapter.make( new Set( [ NaN, NaN, NaN, NaN ] ) );
  var got = src.least( dst, ( e ) => isNaN( e ) ? 0 : e );
  var exp = [ NaN ];
  test.is( got === dst );
  test.is( got !== src );
  test.identical( [ ... got.original ], exp );

  test.case = 'onEach, has minimum and NaN';
  var dst = _.containerAdapter.make( new Set( [] ) );
  var src = _.containerAdapter.make( [ -10, 5, -15, '4', 1, NaN, 15, -1, 21, '-20' ] );
  var got = src.least( dst, ( e ) => isNaN( e ) || _.strIs( e ) ? 0 : e );
  var exp = [ -15 ];
  test.is( got === dst );
  test.is( got !== src );
  test.identical( [ ... got.original ], exp );

  /* */

  test.case = 'onEach, has minimum';
  var dst = _.containerAdapter.make( [] );
  var src = _.containerAdapter.make( new Set( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] ) );
  var got = src.least( dst, ( e ) => e < 0 ? -e : e );
  var exp = [ 1 ];
  test.is( got === dst );
  test.is( got !== src );
  test.identical( got.original, exp );

  test.case = 'onEach, has minimum - -Infinity';
  var dst = _.containerAdapter.make( [] );
  var src = _.containerAdapter.make( new Set( [ -10, 5, -15, 4, -Infinity, 2, 15, 21, -20 ] ) );
  var got = src.least( dst, ( e ) => e < 0 ? -e : e );
  var exp = [ 2 ];
  test.is( got === dst );
  test.is( got !== src );
  test.identical( got.original, exp );

  test.case = 'onEach, has minimum, small difference';
  var dst = _.containerAdapter.make( [] );
  var src = _.containerAdapter.make( new Set( [ -10, 5, -15, -20.0001, 4, 1, 2, 15, 21, -20 ] ) );
  var got = src.least( dst, ( e ) => e < 0 ? -e : e );
  var exp = [ 1 ];
  test.is( got === dst );
  test.is( got !== src );
  test.identical( got.original, exp );

  test.case = 'onEach, all equal';
  var dst = _.containerAdapter.make( [] );
  var src = _.containerAdapter.make( new Set( [ -1, -1, -1, -1 ] ) );
  var got = src.least( dst, ( e ) => isNaN( e ) || _.strIs( e ) ? 0 : e );
  var exp = [ -1 ];
  test.is( got === dst );
  test.is( got !== src );
  test.identical( got.original, exp );

  test.case = 'onEach, all -Infinity';
  var dst = _.containerAdapter.make( [] );
  var src = _.containerAdapter.make( new Set( [ -Infinity, -Infinity, -Infinity, -Infinity ] ) );
  var got = src.least( dst, ( e ) => isNaN( e ) || _.strIs( e ) ? 0 : e );
  var exp = [ -Infinity ];
  test.is( got === dst );
  test.is( got !== src );
  test.identical( got.original, exp );

  test.case = 'onEach, all Infinity';
  var dst = _.containerAdapter.make( [] );
  var src = _.containerAdapter.make( new Set( [ Infinity, Infinity, Infinity, Infinity ] ) );
  var got = src.least( dst, ( e ) => e < 0 ? -e : e );
  var exp = [ Infinity ];
  test.is( got === dst );
  test.is( got !== src );
  test.identical( got.original, exp );

  test.case = 'onEach, all NaN';
  var dst = _.containerAdapter.make( [] );
  var src = _.containerAdapter.make( new Set( [ NaN, NaN, NaN, NaN ] ) );
  var got = src.least( dst, ( e ) => isNaN( e ) ? 0 : e );
  var exp = [ NaN ];
  test.is( got === dst );
  test.is( got !== src );
  test.identical( got.original, exp );

  test.case = 'onEach, has minimum and NaN';
  var dst = _.containerAdapter.make( [] );
  var src = _.containerAdapter.make( new Set( [ -10, 5, -15, '4', 1, NaN, 15, -1, 21, '-20' ] ) );
  var got = src.least( dst, ( e ) => isNaN( e ) || _.strIs( e ) ? 0 : e );
  var exp = [ -15 ];
  test.is( got === dst );
  test.is( got !== src );
  test.identical( got.original, exp );

  test.close( 'dst - new container' );

  /* - */

  test.open( 'dst - src' );

  test.case = 'without onEach, has one minimum';
  var src = _.containerAdapter.make( new Set( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] ) );
  var got = src.least( src );
  var exp = [ -20 ];
  test.is( got === src );
  test.identical( [ ... got.original ], exp );

  test.case = 'without onEach, has minimum - -Infinity';
  var src = _.containerAdapter.make( new Set( [ -10, 5, -15, 4, -Infinity, 2, 15, 21, -20 ] ) );
  var got = src.least( src );
  var exp = [ -Infinity ];
  test.is( got === src );
  test.identical( [ ... got.original ], exp );

  test.case = 'without onEach, has minimum, small difference';
  var src = _.containerAdapter.make( new Set( [ -10, 5, -15, -20.0001, 4, 1, 2, 15, 21, -20 ] ) );
  var got = src.least( src );
  var exp = [ -20.0001 ];
  test.is( got === src );
  test.identical( [ ... got.original ], exp );

  test.case = 'without onEach, all equal';
  var src = _.containerAdapter.make( new Set( [ -1, -1, -1, -1 ] ) );
  var got = src.least( src );
  var exp = [ -1 ];
  test.is( got === src );
  test.identical( [ ... got.original ], exp );

  test.case = 'without onEach, all -Infinity';
  var src = _.containerAdapter.make( new Set( [ -Infinity, -Infinity, -Infinity, -Infinity ] ) );
  var got = src.least( src );
  var exp = [ -Infinity ];
  test.is( got === src );
  test.identical( [ ... got.original ], exp );

  test.case = 'without onEach, all Infinity';
  var src = _.containerAdapter.make( new Set( [ Infinity, Infinity, Infinity, Infinity ] ) );
  var got = src.least( src );
  var exp = [ Infinity ];
  test.is( got === src );
  test.identical( [ ... got.original ], exp );

  test.case = 'without onEach, all NaN';
  var src = _.containerAdapter.make( new Set( [ NaN, NaN, NaN, NaN ] ) );
  var got = src.least( src );
  var exp = [];
  test.is( got === src );
  test.identical( [ ... got.original ], exp );

  test.case = 'without onEach, has minimum and NaN';
  var src = _.containerAdapter.make( new Set( [ -10, 5, -15, '4', 1, NaN, 15, -1, 21, '-20' ] ) );
  var got = src.least( src );
  var exp = [];
  test.is( got === src );
  test.identical( [ ... got.original ], exp );

  /* */

  test.case = 'onEach, has minimum';
  var src = _.containerAdapter.make( new Set( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] ) );
  var got = src.least( src, ( e ) => e < 0 ? -e : e );
  var exp = [ 1 ];
  test.is( got === src );
  test.identical( [ ... got.original ], exp );

  test.case = 'onEach, has minimum - -Infinity';
  var src = _.containerAdapter.make( new Set( [ -10, 5, -15, 4, -Infinity, 2, 15, 21, -20 ] ) );
  var got = src.least( src, ( e ) => e < 0 ? -e : e );
  var exp = [ 2 ];
  test.is( got === src );
  test.identical( [ ... got.original ], exp );

  test.case = 'onEach, has minimum, small difference';
  var src = _.containerAdapter.make( new Set( [ -10, 5, -15, -20.0001, 4, 1, 2, 15, 21, -20 ] ) );
  var got = src.least( src, ( e ) => e < 0 ? -e : e );
  var exp = [ 1 ];
  test.is( got === src );
  test.identical( [ ... got.original ], exp );

  test.case = 'onEach, all equal';
  var src = _.containerAdapter.make( new Set( [ -1, -1, -1, -1 ] ) );
  var got = src.least( src, ( e ) => isNaN( e ) || _.strIs( e ) ? 0 : e );
  var exp = [ -1 ];
  test.is( got === src );
  test.identical( [ ... got.original ], exp );

  test.case = 'onEach, all -Infinity';
  var src = _.containerAdapter.make( new Set( [ -Infinity, -Infinity, -Infinity, -Infinity ] ) );
  var got = src.least( src, ( e ) => isNaN( e ) || _.strIs( e ) ? 0 : e );
  var exp = [ -Infinity ];
  test.is( got === src );
  test.identical( [ ... got.original ], exp );

  test.case = 'onEach, all Infinity';
  var src = _.containerAdapter.make( new Set( [ Infinity, Infinity, Infinity, Infinity ] ) );
  var got = src.least( src, ( e ) => e < 0 ? -e : e );
  var exp = [ Infinity ];
  test.is( got === src );
  test.identical( [ ... got.original ], exp );

  test.case = 'onEach, all NaN';
  var src = _.containerAdapter.make( new Set( [ NaN, NaN, NaN, NaN ] ) );
  var got = src.least( src, ( e ) => isNaN( e ) ? 0 : e );
  var exp = [];
  test.is( got === src );
  test.identical( [ ... got.original ], exp );

  test.case = 'onEach, has minimum and NaN';
  var src = _.containerAdapter.make( new Set( [ -10, 5, -15, '4', 1, NaN, 15, -1, 21, '-20' ] ) );
  var got = src.least( src, ( e ) => isNaN( e ) || _.strIs( e ) ? 0 : e );
  var exp = [ -15 ];
  test.is( got === src );
  test.identical( [ ... got.original ], exp );

  test.close( 'dst - src' );

  test.close( 'setContainerAdapter' );
}

//

function most( test )
{
  test.open( 'arrayContainerAdapter' );

  test.open( 'without dst' );

  test.case = 'without onEach, has one maximun';
  var src = _.containerAdapter.make( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
  var got = src.most();
  var exp = [ 21 ];
  test.is( got !== src );
  test.identical( got.original, exp );

  test.case = 'without onEach, has maximun - -Infinity';
  var src = _.containerAdapter.make( [ -10, 5, -15, 4, Infinity, 2, 15, 21, -20 ] );
  var got = src.most();
  var exp = [ Infinity ];
  test.is( got !== src );
  test.identical( got.original, exp );

  test.case = 'without onEach, has maximun, small difference';
  var src = _.containerAdapter.make( [ -10, 5, -15, 21.0001, 4, 1, 2, 15, 21, -20 ] );
  var got = src.most();
  var exp = [ 21.0001 ];
  test.is( got !== src );
  test.identical( got.original, exp );

  test.case = 'without onEach, all equal';
  var src = _.containerAdapter.make( [ -1, -1, -1, -1 ] );
  var got = src.most();
  var exp = [ -1, -1, -1, -1 ];
  test.is( got !== src );
  test.identical( got.original, exp );

  test.case = 'without onEach, all -Infinity';
  var src = _.containerAdapter.make( [ -Infinity, -Infinity, -Infinity, -Infinity ] );
  var got = src.most();
  var exp = [ -Infinity, -Infinity, -Infinity, -Infinity ];
  test.is( got !== src );
  test.identical( got.original, exp );

  test.case = 'without onEach, all Infinity';
  var src = _.containerAdapter.make( [ Infinity, Infinity, Infinity, Infinity ] );
  var got = src.most();
  var exp = [ Infinity, Infinity, Infinity, Infinity ];
  test.is( got !== src );
  test.identical( got.original, exp );

  test.case = 'without onEach, all NaN';
  var src = _.containerAdapter.make( [ NaN, NaN, NaN, NaN ] );
  var got = src.most();
  var exp = [];
  test.is( got !== src );
  test.identical( got.original, exp );

  test.case = 'without onEach, has maximun and NaN';
  var src = _.containerAdapter.make( [ -10, 5, -15, '4', 1, NaN, 15, -1, 21, '-20' ] );
  var got = src.most();
  var exp = [];
  test.is( got !== src );
  test.identical( got.original, exp );

  /* */

  test.case = 'onEach, has maximun';
  var src = _.containerAdapter.make( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
  var got = src.most( ( e ) => e < 0 ? -e : e );
  var exp = [ 21 ];
  test.is( got !== src );
  test.identical( got.original, exp );

  test.case = 'onEach, has maximun - Infinity';
  var src = _.containerAdapter.make( [ -10, 5, -15, 4, Infinity, 2, 15, 21, -20 ] );
  var got = src.most( ( e ) => e < 0 ? -e : e );
  var exp = [ Infinity ];
  test.is( got !== src );
  test.identical( got.original, exp );

  test.case = 'onEach, has maximun, small difference';
  var src = _.containerAdapter.make( [ -10, 5, -15, 21.0001, 4, 1, 2, 15, 21, -20 ] );
  var got = src.most( ( e ) => e < 0 ? -e : e );
  var exp = [ 21.0001 ];
  test.is( got !== src );
  test.identical( got.original, exp );

  test.case = 'onEach, all equal';
  var src = _.containerAdapter.make( [ -1, -1, -1, -1 ] );
  var got = src.most( ( e ) => isNaN( e ) || _.strIs( e ) ? 0 : e );
  var exp = [ -1, -1, -1, -1 ];
  test.is( got !== src );
  test.identical( got.original, exp );

  test.case = 'onEach, all -Infinity';
  var src = _.containerAdapter.make( [ -Infinity, -Infinity, -Infinity, -Infinity ] );
  var got = src.most( ( e ) => isNaN( e ) || _.strIs( e ) ? 0 : e );
  var exp = [ -Infinity, -Infinity, -Infinity, -Infinity ];
  test.is( got !== src );
  test.identical( got.original, exp );

  test.case = 'onEach, all Infinity';
  var src = _.containerAdapter.make( [ Infinity, Infinity, Infinity, Infinity ] );
  var got = src.most( ( e ) => e < 0 ? -e : e );
  var exp = [ Infinity, Infinity, Infinity, Infinity ];
  test.is( got !== src );
  test.identical( got.original, exp );

  test.case = 'onEach, all NaN';
  var src = _.containerAdapter.make( [ NaN, NaN, NaN, NaN ] );
  var got = src.most( ( e ) => isNaN( e ) ? 0 : e );
  var exp = [ NaN, NaN, NaN, NaN ];
  test.is( got !== src );
  test.identical( got.original, exp );

  test.case = 'onEach, has maximun and NaN';
  var src = _.containerAdapter.make( [ -10, 5, -15, '4', 1, NaN, 15, -1, 21, '-20' ] );
  var got = src.most( ( e ) => isNaN( e ) || _.strIs( e ) ? 0 : e );
  var exp = [ 21 ];
  test.is( got !== src );
  test.identical( got.original, exp );

  test.close( 'without dst' );

  /* - */

  test.open( 'dst - null' );

  test.case = 'without onEach, has one maximun';
  var src = _.containerAdapter.make( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
  var got = src.most( null );
  var exp = [ 21 ];
  test.is( got !== src );
  test.identical( got.original, exp );

  test.case = 'without onEach, has maximun - Infinity';
  var src = _.containerAdapter.make( [ -10, 5, -15, 4, Infinity, 2, 15, 21, -20 ] );
  var got = src.most( null );
  var exp = [ Infinity ];
  test.is( got !== src );
  test.identical( got.original, exp );

  test.case = 'without onEach, has maximun, small difference';
  var src = _.containerAdapter.make( [ -10, 5, -15, 21.0001, 4, 1, 2, 15, 21, -20 ] );
  var got = src.most( null );
  var exp = [ 21.0001 ];
  test.is( got !== src );
  test.identical( got.original, exp );

  test.case = 'without onEach, all equal';
  var src = _.containerAdapter.make( [ -1, -1, -1, -1 ] );
  var got = src.most( null );
  var exp = [ -1, -1, -1, -1 ];
  test.is( got !== src );
  test.identical( got.original, exp );

  test.case = 'without onEach, all -Infinity';
  var src = _.containerAdapter.make( [ -Infinity, -Infinity, -Infinity, -Infinity ] );
  var got = src.most( null );
  var exp = [ -Infinity, -Infinity, -Infinity, -Infinity ];
  test.is( got !== src );
  test.identical( got.original, exp );

  test.case = 'without onEach, all Infinity';
  var src = _.containerAdapter.make( [ Infinity, Infinity, Infinity, Infinity ] );
  var got = src.most( null );
  var exp = [ Infinity, Infinity, Infinity, Infinity ];
  test.is( got !== src );
  test.identical( got.original, exp );

  test.case = 'without onEach, all NaN';
  var src = _.containerAdapter.make( [ NaN, NaN, NaN, NaN ] );
  var got = src.most( null );
  var exp = [];
  test.is( got !== src );
  test.identical( got.original, exp );

  test.case = 'without onEach, has maximun and NaN';
  var src = _.containerAdapter.make( [ -10, 5, -15, '4', 1, NaN, 15, -1, 21, '-20' ] );
  var got = src.most( null );
  var exp = [];
  test.is( got !== src );
  test.identical( got.original, exp );

  /* */

  test.case = 'onEach, has maximun';
  var src = _.containerAdapter.make( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
  var got = src.most( null, ( e ) => e < 0 ? -e : e );
  var exp = [ 21 ];
  test.is( got !== src );
  test.identical( got.original, exp );

  test.case = 'onEach, has maximun - Infinity';
  var src = _.containerAdapter.make( [ -10, 5, -15, 4, -Infinity, 2, 15, 21, -20 ] );
  var got = src.most( null, ( e ) => e < 0 ? -e : e );
  var exp = [ -Infinity ];
  test.is( got !== src );
  test.identical( got.original, exp );

  test.case = 'onEach, has maximun, small difference';
  var src = _.containerAdapter.make( [ -10, 5, -15, 21.0001, 4, 1, 2, 15, 21, -20 ] );
  var got = src.most( null, ( e ) => e < 0 ? -e : e );
  var exp = [ 21.0001 ];
  test.is( got !== src );
  test.identical( got.original, exp );

  test.case = 'onEach, all equal';
  var src = _.containerAdapter.make( [ -1, -1, -1, -1 ] );
  var got = src.most( null, ( e ) => isNaN( e ) || _.strIs( e ) ? 0 : e );
  var exp = [ -1, -1, -1, -1 ];
  test.is( got !== src );
  test.identical( got.original, exp );

  test.case = 'onEach, all -Infinity';
  var src = _.containerAdapter.make( [ -Infinity, -Infinity, -Infinity, -Infinity ] );
  var got = src.most( null, ( e ) => isNaN( e ) || _.strIs( e ) ? 0 : e );
  var exp = [ -Infinity, -Infinity, -Infinity, -Infinity ];
  test.is( got !== src );
  test.identical( got.original, exp );

  test.case = 'onEach, all Infinity';
  var src = _.containerAdapter.make( [ Infinity, Infinity, Infinity, Infinity ] );
  var got = src.most( null, ( e ) => e < 0 ? -e : e );
  var exp = [ Infinity, Infinity, Infinity, Infinity ];
  test.is( got !== src );
  test.identical( got.original, exp );

  test.case = 'onEach, all NaN';
  var src = _.containerAdapter.make( [ NaN, NaN, NaN, NaN ] );
  var got = src.most( null, ( e ) => isNaN( e ) ? 0 : e );
  var exp = [ NaN, NaN, NaN, NaN ];
  test.is( got !== src );
  test.identical( got.original, exp );

  test.case = 'onEach, has maximun and NaN';
  var src = _.containerAdapter.make( [ -10, 5, -15, '4', 1, NaN, 15, -1, 21, '-20' ] );
  var got = src.most( null, ( e ) => isNaN( e ) || _.strIs( e ) ? 0 : e );
  var exp = [ 21 ];
  test.is( got !== src );
  test.identical( got.original, exp );

  test.close( 'dst - null' );

  /* - */

  test.open( 'dst - new container' );

  test.case = 'without onEach, has one maximun';
  var dst = _.containerAdapter.make( [] );
  var src = _.containerAdapter.make( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
  var got = src.most( dst );
  var exp = [ 21 ];
  test.is( got === dst );
  test.is( got !== src );
  test.identical( got.original, exp );

  test.case = 'without onEach, has maximun - Infinity';
  var dst = _.containerAdapter.make( [] );
  var src = _.containerAdapter.make( [ -10, 5, -15, 4, Infinity, 2, 15, 21, -20 ] );
  var got = src.most( dst );
  var exp = [ Infinity ];
  test.is( got === dst );
  test.is( got !== src );
  test.identical( got.original, exp );

  test.case = 'without onEach, has maximun, small difference';
  var dst = _.containerAdapter.make( [] );
  var src = _.containerAdapter.make( [ -10, 5, -15, 21.0001, 4, 1, 2, 15, 21, -20 ] );
  var got = src.most( dst );
  var exp = [ 21.0001 ];
  test.is( got === dst );
  test.is( got !== src );
  test.identical( got.original, exp );

  test.case = 'without onEach, all equal';
  var dst = _.containerAdapter.make( [] );
  var src = _.containerAdapter.make( [ -1, -1, -1, -1 ] );
  var got = src.most( dst );
  var exp = [ -1, -1, -1, -1 ];
  test.is( got === dst );
  test.is( got !== src );
  test.identical( got.original, exp );

  test.case = 'without onEach, all -Infinity';
  var dst = _.containerAdapter.make( [] );
  var src = _.containerAdapter.make( [ -Infinity, -Infinity, -Infinity, -Infinity ] );
  var got = src.most( dst );
  var exp = [ -Infinity, -Infinity, -Infinity, -Infinity ];
  test.is( got === dst );
  test.is( got !== src );
  test.identical( got.original, exp );

  test.case = 'without onEach, all Infinity';
  var dst = _.containerAdapter.make( [] );
  var src = _.containerAdapter.make( [ Infinity, Infinity, Infinity, Infinity ] );
  var got = src.most( dst );
  var exp = [ Infinity, Infinity, Infinity, Infinity ];
  test.is( got === dst );
  test.is( got !== src );
  test.identical( got.original, exp );

  test.case = 'without onEach, all NaN';
  var dst = _.containerAdapter.make( [] );
  var src = _.containerAdapter.make( [ NaN, NaN, NaN, NaN ] );
  var got = src.most( dst );
  var exp = [];
  test.is( got === dst );
  test.is( got !== src );
  test.identical( got.original, exp );

  test.case = 'without onEach, has maximun and NaN';
  var dst = _.containerAdapter.make( [] );
  var src = _.containerAdapter.make( [ -10, 5, -15, '4', 1, NaN, 15, -1, 21, '-20' ] );
  var got = src.most( dst );
  var exp = [];
  test.is( got === dst );
  test.is( got !== src );
  test.identical( got.original, exp );

  /* */

  test.case = 'onEach, has maximun';
  var dst = _.containerAdapter.make( [] );
  var src = _.containerAdapter.make( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
  var got = src.most( dst, ( e ) => e < 0 ? -e : e );
  var exp = [ 21 ];
  test.is( got === dst );
  test.is( got !== src );
  test.identical( got.original, exp );

  test.case = 'onEach, has maximun - -Infinity';
  var dst = _.containerAdapter.make( [] );
  var src = _.containerAdapter.make( [ -10, 5, -15, 4, -Infinity, 2, 15, 21, -20 ] );
  var got = src.most( dst, ( e ) => e < 0 ? -e : e );
  var exp = [ -Infinity ];
  test.is( got === dst );
  test.is( got !== src );
  test.identical( got.original, exp );

  test.case = 'onEach, has maximun, small difference';
  var dst = _.containerAdapter.make( [] );
  var src = _.containerAdapter.make( [ -10, 5, -15, 21.0001, 4, 1, 2, 15, 21, -20 ] );
  var got = src.most( dst, ( e ) => e < 0 ? -e : e );
  var exp = [ 21.0001 ];
  test.is( got === dst );
  test.is( got !== src );
  test.identical( got.original, exp );

  test.case = 'onEach, all equal';
  var dst = _.containerAdapter.make( [] );
  var src = _.containerAdapter.make( [ -1, -1, -1, -1 ] );
  var got = src.most( dst, ( e ) => isNaN( e ) || _.strIs( e ) ? 0 : e );
  var exp = [ -1, -1, -1, -1 ];
  test.is( got === dst );
  test.is( got !== src );
  test.identical( got.original, exp );

  test.case = 'onEach, all -Infinity';
  var dst = _.containerAdapter.make( [] );
  var src = _.containerAdapter.make( [ -Infinity, -Infinity, -Infinity, -Infinity ] );
  var got = src.most( dst, ( e ) => isNaN( e ) || _.strIs( e ) ? 0 : e );
  var exp = [ -Infinity, -Infinity, -Infinity, -Infinity ];
  test.is( got === dst );
  test.is( got !== src );
  test.identical( got.original, exp );

  test.case = 'onEach, all Infinity';
  var dst = _.containerAdapter.make( [] );
  var src = _.containerAdapter.make( [ Infinity, Infinity, Infinity, Infinity ] );
  var got = src.most( dst, ( e ) => e < 0 ? -e : e );
  var exp = [ Infinity, Infinity, Infinity, Infinity ];
  test.is( got === dst );
  test.is( got !== src );
  test.identical( got.original, exp );

  test.case = 'onEach, all NaN';
  var dst = _.containerAdapter.make( [] );
  var src = _.containerAdapter.make( [ NaN, NaN, NaN, NaN ] );
  var got = src.most( dst, ( e ) => isNaN( e ) ? 0 : e );
  var exp = [ NaN, NaN, NaN, NaN ];
  test.is( got === dst );
  test.is( got !== src );
  test.identical( got.original, exp );

  test.case = 'onEach, has maximun and NaN';
  var dst = _.containerAdapter.make( [] );
  var src = _.containerAdapter.make( [ -10, 5, -15, '4', 1, NaN, 15, -1, 21, '-20' ] );
  var got = src.most( dst, ( e ) => isNaN( e ) || _.strIs( e ) ? 0 : e );
  var exp = [ 21 ];
  test.is( got === dst );
  test.is( got !== src );
  test.identical( got.original, exp );

  /* */

  test.case = 'onEach, has maximun';
  var dst = _.containerAdapter.make( new Set() );
  var src = _.containerAdapter.make( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
  var got = src.most( dst, ( e ) => e < 0 ? -e : e );
  var exp = [ 21 ];
  test.is( got === dst );
  test.is( got !== src );
  test.identical( [ ... got.original ], exp );

  test.case = 'onEach, has maximun - -Infinity';
  var dst = _.containerAdapter.make( new Set() );
  var src = _.containerAdapter.make( [ -10, 5, -15, 4, -Infinity, 2, 15, 21, -20 ] );
  var got = src.most( dst, ( e ) => e < 0 ? -e : e );
  var exp = [ -Infinity ];
  test.is( got === dst );
  test.is( got !== src );
  test.identical( [ ... got.original ], exp );

  test.case = 'onEach, has maximun, small difference';
  var dst = _.containerAdapter.make( new Set() );
  var src = _.containerAdapter.make( [ -10, 5, -15, 21.0001, 4, 1, 2, 15, 21, -20 ] );
  var got = src.most( dst, ( e ) => e < 0 ? -e : e );
  var exp = [ 21.0001 ];
  test.is( got === dst );
  test.is( got !== src );
  test.identical( [ ... got.original ], exp );

  test.case = 'onEach, all equal';
  var dst = _.containerAdapter.make( new Set() );
  var src = _.containerAdapter.make( [ -1, -1, -1, -1 ] );
  var got = src.most( dst, ( e ) => isNaN( e ) || _.strIs( e ) ? 0 : e );
  var exp = [ -1 ];
  test.is( got === dst );
  test.is( got !== src );
  test.identical( [ ... got.original ], exp );

  test.case = 'onEach, all -Infinity';
  var dst = _.containerAdapter.make( new Set() );
  var src = _.containerAdapter.make( [ -Infinity, -Infinity, -Infinity, -Infinity ] );
  var got = src.most( dst, ( e ) => isNaN( e ) || _.strIs( e ) ? 0 : e );
  var exp = [ -Infinity ];
  test.is( got === dst );
  test.is( got !== src );
  test.identical( [ ... got.original ], exp );

  test.case = 'onEach, all Infinity';
  var dst = _.containerAdapter.make( new Set() );
  var src = _.containerAdapter.make( [ Infinity, Infinity, Infinity, Infinity ] );
  var got = src.most( dst, ( e ) => e < 0 ? -e : e );
  var exp = [ Infinity ];
  test.is( got === dst );
  test.is( got !== src );
  test.identical( [ ... got.original ], exp );

  test.case = 'onEach, all NaN';
  var dst = _.containerAdapter.make( new Set() );
  var src = _.containerAdapter.make( [ NaN, NaN, NaN, NaN ] );
  var got = src.most( dst, ( e ) => isNaN( e ) ? 0 : e );
  var exp = [ NaN ];
  test.is( got === dst );
  test.is( got !== src );
  test.identical( [ ... got.original ], exp );

  test.case = 'onEach, has maximun and NaN';
  var dst = _.containerAdapter.make( new Set() );
  var src = _.containerAdapter.make( [ -10, 5, -15, '4', 1, NaN, 15, -1, 21, '-20' ] );
  var got = src.most( dst, ( e ) => isNaN( e ) || _.strIs( e ) ? 0 : e );
  var exp = [ 21 ];
  test.is( got === dst );
  test.is( got !== src );
  test.identical( [ ... got.original ], exp );

  test.close( 'dst - new container' );

  /* - */

  test.open( 'dst - src' );

  test.case = 'without onEach, has one maximun';
  var src = _.containerAdapter.make( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
  var got = src.most( src );
  var exp = [ 21 ];
  test.is( got === src );
  test.identical( got.original, exp );

  test.case = 'without onEach, has maximun - Infinity';
  var src = _.containerAdapter.make( [ -10, 5, -15, 4, Infinity, 2, 15, 21, -20 ] );
  var got = src.most( src );
  var exp = [ Infinity ];
  test.is( got === src );
  test.identical( got.original, exp );

  test.case = 'without onEach, has maximun, small difference';
  var src = _.containerAdapter.make( [ -10, 5, -15, 21.0001, 4, 1, 2, 15, 21, -20 ] );
  var got = src.most( src );
  var exp = [ 21.0001 ];
  test.is( got === src );
  test.identical( got.original, exp );

  test.case = 'without onEach, all equal';
  var src = _.containerAdapter.make( [ -1, -1, -1, -1 ] );
  var got = src.most( src );
  var exp = [ -1, -1, -1, -1 ];
  test.is( got === src );
  test.identical( got.original, exp );

  test.case = 'without onEach, all -Infinity';
  var src = _.containerAdapter.make( [ -Infinity, -Infinity, -Infinity, -Infinity ] );
  var got = src.most( src );
  var exp = [ -Infinity, -Infinity, -Infinity, -Infinity ];
  test.is( got === src );
  test.identical( got.original, exp );

  test.case = 'without onEach, all Infinity';
  var src = _.containerAdapter.make( [ Infinity, Infinity, Infinity, Infinity ] );
  var got = src.most( src );
  var exp = [ Infinity, Infinity, Infinity, Infinity ];
  test.is( got === src );
  test.identical( got.original, exp );

  test.case = 'without onEach, all NaN';
  var src = _.containerAdapter.make( [ NaN, NaN, NaN, NaN ] );
  var got = src.most( src );
  var exp = [];
  test.is( got === src );
  test.identical( got.original, exp );

  test.case = 'without onEach, has maximun and NaN';
  var src = _.containerAdapter.make( [ -10, 5, -15, '4', 1, NaN, 15, -1, 21, '-20' ] );
  var got = src.most( src );
  var exp = [];
  test.is( got === src );
  test.identical( got.original, exp );

  /* */

  test.case = 'onEach, has maximun';
  var src = _.containerAdapter.make( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
  var got = src.most( src, ( e ) => e < 0 ? -e : e );
  var exp = [ 21 ];
  test.is( got === src );
  test.identical( got.original, exp );

  test.case = 'onEach, has maximun - -Infinity';
  var src = _.containerAdapter.make( [ -10, 5, -15, 4, -Infinity, 2, 15, 21, -20 ] );
  var got = src.most( src, ( e ) => e < 0 ? -e : e );
  var exp = [ -Infinity ];
  test.is( got === src );
  test.identical( got.original, exp );

  test.case = 'onEach, has maximun, small difference';
  var src = _.containerAdapter.make( [ -10, 5, -15, 21.0001, 4, 1, 2, 15, 21, -20 ] );
  var got = src.most( src, ( e ) => e < 0 ? -e : e );
  var exp = [ 21.0001 ];
  test.is( got === src );
  test.identical( got.original, exp );

  test.case = 'onEach, all equal';
  var src = _.containerAdapter.make( [ -1, -1, -1, -1 ] );
  var got = src.most( src, ( e ) => isNaN( e ) || _.strIs( e ) ? 0 : e );
  var exp = [ -1, -1, -1, -1 ];
  test.is( got === src );
  test.identical( got.original, exp );

  test.case = 'onEach, all -Infinity';
  var src = _.containerAdapter.make( [ -Infinity, -Infinity, -Infinity, -Infinity ] );
  var got = src.most( src, ( e ) => isNaN( e ) || _.strIs( e ) ? 0 : e );
  var exp = [ -Infinity, -Infinity, -Infinity, -Infinity ];
  test.is( got === src );
  test.identical( got.original, exp );

  test.case = 'onEach, all Infinity';
  var src = _.containerAdapter.make( [ Infinity, Infinity, Infinity, Infinity ] );
  var got = src.most( src, ( e ) => e < 0 ? -e : e );
  var exp = [ Infinity, Infinity, Infinity, Infinity ];
  test.is( got === src );
  test.identical( got.original, exp );

  test.case = 'onEach, all NaN';
  var src = _.containerAdapter.make( [ NaN, NaN, NaN, NaN ] );
  var got = src.most( src, ( e ) => isNaN( e ) ? 0 : e );
  var exp = [ NaN, NaN, NaN, NaN ];
  test.is( got === src );
  test.identical( got.original, exp );

  test.case = 'onEach, has maximun and NaN';
  var src = _.containerAdapter.make( [ -10, 5, -15, '4', 1, NaN, 15, -1, 21, '-20' ] );
  var got = src.most( src, ( e ) => isNaN( e ) || _.strIs( e ) ? 0 : e );
  var exp = [ 21 ];
  test.is( got === src );
  test.identical( got.original, exp );

  test.close( 'dst - src' );

  test.close( 'arrayContainerAdapter' );

  /* - */

  test.open( 'setContainerAdapter' );

  test.open( 'without dst' );

  test.case = 'without onEach, has one maximun';
  var src = _.containerAdapter.make( new Set( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] ) );
  var got = src.most();
  var exp = [ 21 ];
  test.is( got !== src );
  test.identical( [ ... got.original ], exp );

  test.case = 'without onEach, has maximun - Infinity';
  var src = _.containerAdapter.make( new Set( [ -10, 5, -15, 4, Infinity, 2, 15, 21, -20 ] ) );
  var got = src.most();
  var exp = [ Infinity ];
  test.is( got !== src );
  test.identical( [ ... got.original ], exp );

  test.case = 'without onEach, has maximun, small difference';
  var src = _.containerAdapter.make( new Set(  [ -10, 5, -15, 21.0001, 4, 1, 2, 15, 21, -20 ] ) );
  var got = src.most();
  var exp = [ 21.0001 ];
  test.is( got !== src );
  test.identical( [ ... got.original ], exp );

  test.case = 'without onEach, all equal';
  var src = _.containerAdapter.make( new Set( [ -1, -1, -1, -1 ] ) );
  var got = src.most();
  var exp = [ -1 ];
  test.is( got !== src );
  test.identical( [ ... got.original ], exp );

  test.case = 'without onEach, all -Infinity';
  var src = _.containerAdapter.make( new Set( [ -Infinity, -Infinity, -Infinity, -Infinity ] ) );
  var got = src.most();
  var exp = [ -Infinity ];
  test.is( got !== src );
  test.identical( [ ... got.original ], exp );

  test.case = 'without onEach, all Infinity';
  var src = _.containerAdapter.make( new Set( [ Infinity, Infinity, Infinity, Infinity ] ) );
  var got = src.most();
  var exp = [ Infinity ];
  test.is( got !== src );
  test.identical( [ ... got.original ], exp );

  test.case = 'without onEach, all NaN';
  var src = _.containerAdapter.make( new Set( [ NaN, NaN, NaN, NaN ] ) );
  var got = src.most();
  var exp = [];
  test.is( got !== src );
  test.identical( [ ... got.original ], exp );

  test.case = 'without onEach, has maximun and NaN';
  var src = _.containerAdapter.make( new Set( [ -10, 5, -15, '4', 1, NaN, 15, -1, 21, '-20' ] ) );
  var got = src.most();
  var exp = [];
  test.is( got !== src );
  test.identical( [ ... got.original ], exp );

  /* */

  test.case = 'onEach, has maximun';
  var src = _.containerAdapter.make( new Set( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] ) );
  var got = src.most( ( e ) => e < 0 ? -e : e );
  var exp = [ 21 ];
  test.is( got !== src );
  test.identical( [ ... got.original ], exp );

  test.case = 'onEach, has maximun - -Infinity';
  var src = _.containerAdapter.make( new Set( [ -10, 5, -15, 4, -Infinity, 2, 15, 21, -20 ] ) );
  var got = src.most( ( e ) => e < 0 ? -e : e );
  var exp = [ -Infinity ];
  test.is( got !== src );
  test.identical( [ ... got.original ], exp );

  test.case = 'onEach, has maximun, small difference';
  var src = _.containerAdapter.make( new Set( [ -10, 5, -15, 21.0001, 4, 1, 2, 15, 21, -20 ] ) );
  var got = src.most( ( e ) => e < 0 ? -e : e );
  var exp = [ 21.0001 ];
  test.is( got !== src );
  test.identical( [ ... got.original ], exp );

  test.case = 'onEach, all equal';
  var src = _.containerAdapter.make( new Set( [ -1, -1, -1, -1 ] ) );
  var got = src.most( ( e ) => isNaN( e ) || _.strIs( e ) ? 0 : e );
  var exp = [ -1 ];
  test.is( got !== src );
  test.identical( [ ... got.original ], exp );

  test.case = 'onEach, all -Infinity';
  var src = _.containerAdapter.make( new Set( [ -Infinity, -Infinity, -Infinity, -Infinity ] ) );
  var got = src.most( ( e ) => isNaN( e ) || _.strIs( e ) ? 0 : e );
  var exp = [ -Infinity ];
  test.is( got !== src );
  test.identical( [ ... got.original ], exp );

  test.case = 'onEach, all Infinity';
  var src = _.containerAdapter.make( new Set( [ Infinity, Infinity, Infinity, Infinity ] ) );
  var got = src.most( ( e ) => e < 0 ? -e : e );
  var exp = [ Infinity ];
  test.is( got !== src );
  test.identical( [ ... got.original ], exp );

  test.case = 'onEach, all NaN';
  var src = _.containerAdapter.make( new Set( [ NaN, NaN, NaN, NaN ] ) );
  var got = src.most( ( e ) => isNaN( e ) ? 0 : e );
  var exp = [ NaN ];
  test.is( got !== src );
  test.identical( [ ... got.original ], exp );

  test.case = 'onEach, has maximun and NaN';
  var src = _.containerAdapter.make( new Set( [ -10, 5, -15, '4', 1, NaN, 15, -1, 21, '-20' ] ) );
  var got = src.most( ( e ) => isNaN( e ) || _.strIs( e ) ? 0 : e );
  var exp = [ 21 ];
  test.is( got !== src );
  test.identical( [ ... got.original ], exp );

  test.close( 'without dst' );

  /* - */

  test.open( 'dst - null' );

  test.case = 'without onEach, has one maximun';
  var src = _.containerAdapter.make( new Set( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] ) );
  var got = src.most( null );
  var exp = [ 21 ];
  test.is( got !== src );
  test.identical( [ ... got.original ], exp );

  test.case = 'without onEach, has maximun - Infinity';
  var src = _.containerAdapter.make( new Set( [ -10, 5, -15, 4, Infinity, 2, 15, 21, -20 ] ) );
  var got = src.most( null );
  var exp = [ Infinity ];
  test.is( got !== src );
  test.identical( [ ... got.original ], exp );

  test.case = 'without onEach, has maximun, small difference';
  var src = _.containerAdapter.make( new Set( [ -10, 5, -15, 21.0001, 4, 1, 2, 15, 21, -20 ] ) );
  var got = src.most( null );
  var exp = [ 21.0001 ];
  test.is( got !== src );
  test.identical( [ ... got.original ], exp );

  test.case = 'without onEach, all equal';
  var src = _.containerAdapter.make( new Set( [ -1, -1, -1, -1 ] ) );
  var got = src.most( null );
  var exp = [ -1 ];
  test.is( got !== src );
  test.identical( [ ... got.original ], exp );

  test.case = 'without onEach, all -Infinity';
  var src = _.containerAdapter.make( new Set( [ -Infinity, -Infinity, -Infinity, -Infinity ] ) );
  var got = src.most( null );
  var exp = [ -Infinity ];
  test.is( got !== src );
  test.identical( [ ... got.original ], exp );

  test.case = 'without onEach, all Infinity';
  var src = _.containerAdapter.make( new Set( [ Infinity, Infinity, Infinity, Infinity ] ) );
  var got = src.most( null );
  var exp = [ Infinity ];
  test.is( got !== src );
  test.identical( [ ... got.original ], exp );

  test.case = 'without onEach, all NaN';
  var src = _.containerAdapter.make( new Set( [ NaN, NaN, NaN, NaN ] ) );
  var got = src.most( null );
  var exp = [];
  test.is( got !== src );
  test.identical( [ ... got.original ], exp );

  test.case = 'without onEach, has maximun and NaN';
  var src = _.containerAdapter.make( new Set( [ -10, 5, -15, '4', 1, NaN, 15, -1, 21, '-20' ] ) );
  var got = src.most( null );
  var exp = [];
  test.is( got !== src );
  test.identical( [ ... got.original ], exp );

  /* */

  test.case = 'onEach, has maximun';
  var src = _.containerAdapter.make( new Set( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] ) );
  var got = src.most( null, ( e ) => e < 0 ? -e : e );
  var exp = [ 21 ];
  test.is( got !== src );
  test.identical( [ ... got.original ], exp );

  test.case = 'onEach, has maximun - -Infinity';
  var src = _.containerAdapter.make( new Set( [ -10, 5, -15, 4, -Infinity, 2, 15, 21, -20 ] ) );
  var got = src.most( null, ( e ) => e < 0 ? -e : e );
  var exp = [ -Infinity ];
  test.is( got !== src );
  test.identical( [ ... got.original ], exp );

  test.case = 'onEach, has maximun, small difference';
  var src = _.containerAdapter.make( new Set( [ -10, 5, -15, -21.0001, 4, 1, 2, 15, 21, -20 ] ) );
  var got = src.most( null, ( e ) => e < 0 ? -e : e );
  var exp = [ -21.0001 ];
  test.is( got !== src );
  test.identical( [ ... got.original ], exp );

  test.case = 'onEach, all equal';
  var src = _.containerAdapter.make( new Set( [ -1, -1, -1, -1 ] ) );
  var got = src.most( null, ( e ) => isNaN( e ) || _.strIs( e ) ? 0 : e );
  var exp = [ -1 ];
  test.is( got !== src );
  test.identical( [ ... got.original ], exp );

  test.case = 'onEach, all -Infinity';
  var src = _.containerAdapter.make( new Set( [ -Infinity, -Infinity, -Infinity, -Infinity ] ) );
  var got = src.most( null, ( e ) => isNaN( e ) || _.strIs( e ) ? 0 : e );
  var exp = [ -Infinity ];
  test.is( got !== src );
  test.identical( [ ... got.original ], exp );

  test.case = 'onEach, all Infinity';
  var src = _.containerAdapter.make( new Set( [ Infinity, Infinity, Infinity, Infinity ] ) );
  var got = src.most( null, ( e ) => e < 0 ? -e : e );
  var exp = [ Infinity ];
  test.is( got !== src );
  test.identical( [ ... got.original ], exp );

  test.case = 'onEach, all NaN';
  var src = _.containerAdapter.make( new Set( [ NaN, NaN, NaN, NaN ] ) );
  var got = src.most( null, ( e ) => isNaN( e ) ? 0 : e );
  var exp = [ NaN ];
  test.is( got !== src );
  test.identical( [ ... got.original ], exp );

  test.case = 'onEach, has maximun and NaN';
  var src = _.containerAdapter.make( new Set( [ -10, 5, -15, '4', 1, NaN, 15, -1, 21, '-20' ] ) );
  var got = src.most( null, ( e ) => isNaN( e ) || _.strIs( e ) ? 0 : e );
  var exp = [ 21 ];
  test.is( got !== src );
  test.identical( [ ... got.original ], exp );

  test.close( 'dst - null' );

  /* - */

  test.open( 'dst - new container' );

  test.case = 'without onEach, has one maximun';
  var dst = _.containerAdapter.make( new Set( [] ) );
  var src = _.containerAdapter.make( new Set( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] ) );
  var got = src.most( dst );
  var exp = [ 21 ];
  test.is( got === dst );
  test.is( got !== src );
  test.identical( [ ... got.original ], exp );

  test.case = 'without onEach, has maximun - Infinity';
  var dst = _.containerAdapter.make( new Set( [] ) );
  var src = _.containerAdapter.make( new Set( [ -10, 5, -15, 4, Infinity, 2, 15, 21, -20 ] ) );
  var got = src.most( dst );
  var exp = [ Infinity ];
  test.is( got === dst );
  test.is( got !== src );
  test.identical( [ ... got.original ], exp );

  test.case = 'without onEach, has maximun, small difference';
  var dst = _.containerAdapter.make( new Set( [] ) );
  var src = _.containerAdapter.make( new Set( [ -10, 5, -15, 21.0001, 4, 1, 2, 15, 21, -20 ] ) );
  var got = src.most( dst );
  var exp = [ 21.0001 ];
  test.is( got === dst );
  test.is( got !== src );
  test.identical( [ ... got.original ], exp );

  test.case = 'without onEach, all equal';
  var dst = _.containerAdapter.make( new Set( [] ) );
  var src = _.containerAdapter.make( new Set( [ -1, -1, -1, -1 ] ) );
  var got = src.most( dst );
  var exp = [ -1 ];
  test.is( got === dst );
  test.is( got !== src );
  test.identical( [ ... got.original ], exp );

  test.case = 'without onEach, all -Infinity';
  var dst = _.containerAdapter.make( new Set( [] ) );
  var src = _.containerAdapter.make( new Set( [ -Infinity, -Infinity, -Infinity, -Infinity ] ) );
  var got = src.most( dst );
  var exp = [ -Infinity ];
  test.is( got === dst );
  test.is( got !== src );
  test.identical( [ ... got.original ], exp );

  test.case = 'without onEach, all Infinity';
  var dst = _.containerAdapter.make( new Set( [] ) );
  var src = _.containerAdapter.make( new Set( [ Infinity, Infinity, Infinity, Infinity ] ) );
  var got = src.most( dst );
  var exp = [ Infinity ];
  test.is( got === dst );
  test.is( got !== src );
  test.identical( [ ... got.original ], exp );

  test.case = 'without onEach, all NaN';
  var dst = _.containerAdapter.make( new Set( [] ) );
  var src = _.containerAdapter.make( new Set( [ NaN, NaN, NaN, NaN ] ) );
  var got = src.most( dst );
  var exp = [];
  test.is( got === dst );
  test.is( got !== src );
  test.identical( [ ... got.original ], exp );

  test.case = 'without onEach, has maximun and NaN';
  var dst = _.containerAdapter.make( new Set( [] ) );
  var src = _.containerAdapter.make( new Set( [ -10, 5, -15, '4', 1, NaN, 15, -1, 21, '-20' ] ) );
  var got = src.most( dst );
  var exp = [];
  test.is( got === dst );
  test.is( got !== src );
  test.identical( [ ... got.original ], exp );

  /* */

  test.case = 'onEach, has maximun';
  var dst = _.containerAdapter.make( new Set( [] ) );
  var src = _.containerAdapter.make( new Set( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] ) );
  var got = src.most( dst, ( e ) => e < 0 ? -e : e );
  var exp = [ 21 ];
  test.is( got === dst );
  test.is( got !== src );
  test.identical( [ ... got.original ], exp );

  test.case = 'onEach, has maximun - -Infinity';
  var dst = _.containerAdapter.make( new Set( [] ) );
  var src = _.containerAdapter.make( new Set( [ -10, 5, -15, 4, -Infinity, 2, 15, 21, -20 ] ) );
  var got = src.most( dst, ( e ) => e < 0 ? -e : e );
  var exp = [ -Infinity ];
  test.is( got === dst );
  test.is( got !== src );
  test.identical( [ ... got.original ], exp );

  test.case = 'onEach, has maximun, small difference';
  var dst = _.containerAdapter.make( new Set( [] ) );
  var src = _.containerAdapter.make( new Set( [ -10, 5, -15, 21.0001, 4, 1, 2, 15, 21, -20 ] ) );
  var got = src.most( dst, ( e ) => e < 0 ? -e : e );
  var exp = [ 21.0001 ];
  test.is( got === dst );
  test.is( got !== src );
  test.identical( [ ... got.original ], exp );

  test.case = 'onEach, all equal';
  var dst = _.containerAdapter.make( new Set( [] ) );
  var src = _.containerAdapter.make( new Set( [ -1, -1, -1, -1 ] ) );
  var got = src.most( dst, ( e ) => isNaN( e ) || _.strIs( e ) ? 0 : e );
  var exp = [ -1 ];
  test.is( got === dst );
  test.is( got !== src );
  test.identical( [ ... got.original ], exp );

  test.case = 'onEach, all -Infinity';
  var dst = _.containerAdapter.make( new Set( [] ) );
  var src = _.containerAdapter.make( new Set( [ -Infinity, -Infinity, -Infinity, -Infinity ] ) );
  var got = src.most( dst, ( e ) => isNaN( e ) || _.strIs( e ) ? 0 : e );
  var exp = [ -Infinity ];
  test.is( got === dst );
  test.is( got !== src );
  test.identical( [ ... got.original ], exp );

  test.case = 'onEach, all Infinity';
  var dst = _.containerAdapter.make( new Set( [] ) );
  var src = _.containerAdapter.make( new Set( [ Infinity, Infinity, Infinity, Infinity ] ) );
  var got = src.most( dst, ( e ) => e < 0 ? -e : e );
  var exp = [ Infinity ];
  test.is( got === dst );
  test.is( got !== src );
  test.identical( [ ... got.original ], exp );

  test.case = 'onEach, all NaN';
  var dst = _.containerAdapter.make( new Set( [] ) );
  var src = _.containerAdapter.make( new Set( [ NaN, NaN, NaN, NaN ] ) );
  var got = src.most( dst, ( e ) => isNaN( e ) ? 0 : e );
  var exp = [ NaN ];
  test.is( got === dst );
  test.is( got !== src );
  test.identical( [ ... got.original ], exp );

  test.case = 'onEach, has maximun and NaN';
  var dst = _.containerAdapter.make( new Set( [] ) );
  var src = _.containerAdapter.make( [ -10, 5, -15, '4', 1, NaN, 15, -1, 21, '-20' ] );
  var got = src.most( dst, ( e ) => isNaN( e ) || _.strIs( e ) ? 0 : e );
  var exp = [ 21 ];
  test.is( got === dst );
  test.is( got !== src );
  test.identical( [ ... got.original ], exp );

  /* */

  test.case = 'onEach, has maximun';
  var dst = _.containerAdapter.make( [] );
  var src = _.containerAdapter.make( new Set( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] ) );
  var got = src.most( dst, ( e ) => e < 0 ? -e : e );
  var exp = [ 21 ];
  test.is( got === dst );
  test.is( got !== src );
  test.identical( got.original, exp );

  test.case = 'onEach, has maximun - -Infinity';
  var dst = _.containerAdapter.make( [] );
  var src = _.containerAdapter.make( new Set( [ -10, 5, -15, 4, -Infinity, 2, 15, 21, -20 ] ) );
  var got = src.most( dst, ( e ) => e < 0 ? -e : e );
  var exp = [ -Infinity ];
  test.is( got === dst );
  test.is( got !== src );
  test.identical( got.original, exp );

  test.case = 'onEach, has maximun, small difference';
  var dst = _.containerAdapter.make( [] );
  var src = _.containerAdapter.make( new Set( [ -10, 5, -15, 21.0001, 4, 1, 2, 15, 21, -20 ] ) );
  var got = src.most( dst, ( e ) => e < 0 ? -e : e );
  var exp = [ 21.0001 ];
  test.is( got === dst );
  test.is( got !== src );
  test.identical( got.original, exp );

  test.case = 'onEach, all equal';
  var dst = _.containerAdapter.make( [] );
  var src = _.containerAdapter.make( new Set( [ -1, -1, -1, -1 ] ) );
  var got = src.most( dst, ( e ) => isNaN( e ) || _.strIs( e ) ? 0 : e );
  var exp = [ -1 ];
  test.is( got === dst );
  test.is( got !== src );
  test.identical( got.original, exp );

  test.case = 'onEach, all -Infinity';
  var dst = _.containerAdapter.make( [] );
  var src = _.containerAdapter.make( new Set( [ -Infinity, -Infinity, -Infinity, -Infinity ] ) );
  var got = src.most( dst, ( e ) => isNaN( e ) || _.strIs( e ) ? 0 : e );
  var exp = [ -Infinity ];
  test.is( got === dst );
  test.is( got !== src );
  test.identical( got.original, exp );

  test.case = 'onEach, all Infinity';
  var dst = _.containerAdapter.make( [] );
  var src = _.containerAdapter.make( new Set( [ Infinity, Infinity, Infinity, Infinity ] ) );
  var got = src.most( dst, ( e ) => e < 0 ? -e : e );
  var exp = [ Infinity ];
  test.is( got === dst );
  test.is( got !== src );
  test.identical( got.original, exp );

  test.case = 'onEach, all NaN';
  var dst = _.containerAdapter.make( [] );
  var src = _.containerAdapter.make( new Set( [ NaN, NaN, NaN, NaN ] ) );
  var got = src.most( dst, ( e ) => isNaN( e ) ? 0 : e );
  var exp = [ NaN ];
  test.is( got === dst );
  test.is( got !== src );
  test.identical( got.original, exp );

  test.case = 'onEach, has maximun and NaN';
  var dst = _.containerAdapter.make( [] );
  var src = _.containerAdapter.make( new Set( [ -10, 5, -15, '4', 1, NaN, 15, -1, 21, '-20' ] ) );
  var got = src.most( dst, ( e ) => isNaN( e ) || _.strIs( e ) ? 0 : e );
  var exp = [ 21 ];
  test.is( got === dst );
  test.is( got !== src );
  test.identical( got.original, exp );

  test.close( 'dst - new container' );

  /* - */

  test.open( 'dst - src' );

  test.case = 'without onEach, has one maximun';
  var src = _.containerAdapter.make( new Set( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] ) );
  var got = src.most( src );
  var exp = [ 21 ];
  test.is( got === src );
  test.identical( [ ... got.original ], exp );

  test.case = 'without onEach, has maximun - Infinity';
  var src = _.containerAdapter.make( new Set( [ -10, 5, -15, 4, Infinity, 2, 15, 21, -20 ] ) );
  var got = src.most( src );
  var exp = [ Infinity ];
  test.is( got === src );
  test.identical( [ ... got.original ], exp );

  test.case = 'without onEach, has maximun, small difference';
  var src = _.containerAdapter.make( new Set( [ -10, 5, -15, 21.0001, 4, 1, 2, 15, 21, -20 ] ) );
  var got = src.most( src );
  var exp = [ 21.0001 ];
  test.is( got === src );
  test.identical( [ ... got.original ], exp );

  test.case = 'without onEach, all equal';
  var src = _.containerAdapter.make( new Set( [ -1, -1, -1, -1 ] ) );
  var got = src.most( src );
  var exp = [ -1 ];
  test.is( got === src );
  test.identical( [ ... got.original ], exp );

  test.case = 'without onEach, all -Infinity';
  var src = _.containerAdapter.make( new Set( [ -Infinity, -Infinity, -Infinity, -Infinity ] ) );
  var got = src.most( src );
  var exp = [ -Infinity ];
  test.is( got === src );
  test.identical( [ ... got.original ], exp );

  test.case = 'without onEach, all Infinity';
  var src = _.containerAdapter.make( new Set( [ Infinity, Infinity, Infinity, Infinity ] ) );
  var got = src.most( src );
  var exp = [ Infinity ];
  test.is( got === src );
  test.identical( [ ... got.original ], exp );

  test.case = 'without onEach, all NaN';
  var src = _.containerAdapter.make( new Set( [ NaN, NaN, NaN, NaN ] ) );
  var got = src.most( src );
  var exp = [];
  test.is( got === src );
  test.identical( [ ... got.original ], exp );

  test.case = 'without onEach, has maximun and NaN';
  var src = _.containerAdapter.make( new Set( [ -10, 5, -15, '4', 1, NaN, 15, -1, 21, '-20' ] ) );
  var got = src.most( src );
  var exp = [];
  test.is( got === src );
  test.identical( [ ... got.original ], exp );

  /* */

  test.case = 'onEach, has maximun';
  var src = _.containerAdapter.make( new Set( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] ) );
  var got = src.most( src, ( e ) => e < 0 ? -e : e );
  var exp = [ 21 ];
  test.is( got === src );
  test.identical( [ ... got.original ], exp );

  test.case = 'onEach, has maximun - -Infinity';
  var src = _.containerAdapter.make( new Set( [ -10, 5, -15, 4, -Infinity, 2, 15, 21, -20 ] ) );
  var got = src.most( src, ( e ) => e < 0 ? -e : e );
  var exp = [ -Infinity ];
  test.is( got === src );
  test.identical( [ ... got.original ], exp );

  test.case = 'onEach, has maximun, small difference';
  var src = _.containerAdapter.make( new Set( [ -10, 5, -15, 21.0001, 4, 1, 2, 15, 21, -20 ] ) );
  var got = src.most( src, ( e ) => e < 0 ? -e : e );
  var exp = [ 21.0001 ];
  test.is( got === src );
  test.identical( [ ... got.original ], exp );

  test.case = 'onEach, all equal';
  var src = _.containerAdapter.make( new Set( [ -1, -1, -1, -1 ] ) );
  var got = src.most( src, ( e ) => isNaN( e ) || _.strIs( e ) ? 0 : e );
  var exp = [ -1 ];
  test.is( got === src );
  test.identical( [ ... got.original ], exp );

  test.case = 'onEach, all -Infinity';
  var src = _.containerAdapter.make( new Set( [ -Infinity, -Infinity, -Infinity, -Infinity ] ) );
  var got = src.most( src, ( e ) => isNaN( e ) || _.strIs( e ) ? 0 : e );
  var exp = [ -Infinity ];
  test.is( got === src );
  test.identical( [ ... got.original ], exp );

  test.case = 'onEach, all Infinity';
  var src = _.containerAdapter.make( new Set( [ Infinity, Infinity, Infinity, Infinity ] ) );
  var got = src.most( src, ( e ) => e < 0 ? -e : e );
  var exp = [ Infinity ];
  test.is( got === src );
  test.identical( [ ... got.original ], exp );

  test.case = 'onEach, all NaN';
  var src = _.containerAdapter.make( new Set( [ NaN, NaN, NaN, NaN ] ) );
  var got = src.most( src, ( e ) => isNaN( e ) ? 0 : e );
  var exp = [];
  test.is( got === src );
  test.identical( [ ... got.original ], exp );

  test.case = 'onEach, has maximun and NaN';
  var src = _.containerAdapter.make( new Set( [ -10, 5, -15, '4', 1, NaN, 15, -1, 21, '-20' ] ) );
  var got = src.most( src, ( e ) => isNaN( e ) || _.strIs( e ) ? 0 : e );
  var exp = [ 21 ];
  test.is( got === src );
  test.identical( [ ... got.original ], exp );

  test.close( 'dst - src' );

  test.close( 'setContainerAdapter' );
}

//

function onlyWithoutCallbacks( test )
{
  test.open( 'arrayContainerAdapter' );
  run( ( e ) => _.containerAdapter.make( e ) );
  test.close( 'arrayContainerAdapter' );

  /* - */

  test.open( 'setContainerAdapter' );
  run( ( e ) => _.containerAdapter.make( new Set( e ) ) );
  test.close( 'setContainerAdapter' );

  /* - */

  function run( makeSrc )
  {
    test.open( 'without src2' );

    var result = ( src, got ) => _.setIs( src ) || _.setIs( src.original ) ? [ ... got.original ] : got.original;

    test.case = 'without arguments';
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var got = src.only();
    var exp = [];
    test.is( got !== src );
    test.identical( result( src, got ), exp );

    test.case = 'dst - null';
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var got = src.only( null );
    var exp = [];
    test.is( got !== src );
    test.identical( result( src, got ), exp );

    test.case = 'dst - empty array';
    var dst = [];
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var got = src.only( dst );
    var exp = [];
    test.is( got !== dst );
    test.is( got !== src );
    test.identical( result( dst, got ), exp );

    test.case = 'dst - empty arrayAdapter';
    var dst = _.containerAdapter.make( [] );
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var got = src.only( dst );
    var exp = [];
    test.is( got === dst );
    test.is( got !== src );
    test.identical( result( dst, got ), exp );

    test.case = 'dst - empty Set';
    var dst = new Set();
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var got = src.only( dst );
    var exp = [];
    test.is( got !== dst );
    test.is( got !== src );
    test.identical( result( dst, got), exp );

    test.case = 'dst - empty setAdapter';
    var dst = _.containerAdapter.make( new Set() );
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var got = src.only( dst );
    var exp = [];
    test.is( got === dst );
    test.is( got !== src );
    test.identical( result( dst, got ), exp );

    test.case = 'dst - src';
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var got = src.only( src );
    var exp = [];
    test.is( got === src );
    test.identical( result( src, got ), exp );

    test.close( 'without src2' );

    /* - */

    test.open( 'src2 is empty' );

    test.case = 'dst - null';
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var got = src.only( null, [] );
    var exp = [];
    test.is( got !== src );
    test.identical( result( src, got ), exp );

    test.case = 'dst - empty array';
    var dst = [];
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var got = src.only( dst, new Set() );
    var exp = [];
    test.is( got !== dst );
    test.is( got !== src );
    test.identical( result( dst, got ), exp );

    test.case = 'dst - empty arrayAdapter';
    var dst = _.containerAdapter.make( [] );
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var src2 = _.containerAdapter.make( [] );
    var got = src.only( dst, src2 );
    var exp = [];
    test.is( got === dst );
    test.is( got !== src );
    test.identical( result( dst, got ), exp );

    test.case = 'dst - empty Set';
    var dst = new Set();
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var got = src.only( dst, new Set() );
    var exp = [];
    test.is( got !== dst );
    test.is( got !== src );
    test.identical( result( dst, got ), exp );

    test.case = 'dst - empty setAdapter';
    var dst = _.containerAdapter.make( new Set() );
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var got = src.only( dst, [] );
    var exp = [];
    test.is( got === dst );
    test.is( got !== src );
    test.identical( result( dst, got ), exp );

    test.case = 'dst - src';
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var got = src.only( src, [] );
    var exp = [];
    test.is( got === src );
    test.identical( result( src, got ), exp );

    test.close( 'src2 is empty' );

    /* */

    test.open( 'src2 == dst' );

    test.case = 'dst - empty array';
    var dst = [];
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var src2 = _.containerAdapter.make( new Set( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] ) );
    var got = src.only( dst, src2 );
    var exp = [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ];
    test.is( got !== dst );
    test.is( got !== src );
    test.identical( result( dst, got ), exp );

    test.case = 'dst - empty arrayAdapter';
    var dst = _.containerAdapter.make( [] );
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var src2 = _.containerAdapter.make( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var got = src.only( dst, src2 );
    var exp = [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ];
    test.is( got === dst );
    test.is( got !== src );
    test.identical( result( dst, got ), exp );

    test.case = 'dst - empty Set';
    var dst = new Set();
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var src2 = new Set( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var got = src.only( dst, src2 );
    var exp = [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ];
    test.is( got !== dst );
    test.is( got !== src );
    test.identical( result( dst, got ), exp );

    test.case = 'dst - empty setAdapter';
    var dst = _.containerAdapter.make( new Set() );
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var src2 = [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ];
    var got = src.only( dst, src2 );
    var exp = [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ];
    test.is( got === dst );
    test.is( got !== src );
    test.identical( result( dst, got ), exp );

    test.case = 'dst - src';
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var src2 = [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ];
    var got = src.only( src, src2 );
    var exp = [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ];
    test.is( got === src );
    test.identical( result( src, got ), exp );

    test.close( 'src2 == dst' );

    /* - */

    test.open( 'src2 != dst' );

    test.case = 'dst - empty array';
    var dst = [];
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var src2 = _.containerAdapter.make( new Set( [ -10, 6, -14, 4, 1, 1, 15, 21, -1 ] ) );
    var got = src.only( dst, src2 );
    var exp = [ -10, 4, 1, 15, 21 ];
    test.is( got !== dst );
    test.is( got !== src );
    test.identical( result( dst, got ), exp );

    test.case = 'dst - arrayAdapter';
    var dst = _.containerAdapter.make( [ 1 ] );
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var src2 = _.containerAdapter.make( [ -10, 6, -14, 4, 1, 1, 15, 21, -1 ] );
    var got = src.only( dst, src2 );
    var exp = [ 1, -10, 4, 15, 21 ];
    test.is( got === dst );
    test.is( got !== src );
    test.identical( result( dst, got ), exp );

    test.case = 'dst - empty Set';
    var dst = new Set();
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var src2 = new Set( [ -10, 6, -14, 4, 1, 1, 15, 21, -1 ] );
    var got = src.only( dst, src2 );
    var exp = [ -10, 4, 1, 15, 21 ];
    test.is( got !== dst );
    test.is( got !== src );
    test.identical( result( dst, got ), exp );

    test.case = 'dst - empty setAdapter';
    var dst = _.containerAdapter.make( new Set() );
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var src2 = [ -10, 6, -14, 4, 1, 1, 15, 21, -1 ];
    var got = src.only( dst, src2 );
    var exp = [ -10, 4, 1, 15, 21 ];
    test.is( got === dst );
    test.is( got !== src );
    test.identical( result( dst, got ), exp );

    test.case = 'dst - src';
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var src2 = [ -10, 6, -14, 4, 1, 1, 15, 21, -1 ];
    var got = src.only( src, src2 );
    var exp = [ -10, 4, 1, 15, 21 ];
    test.is( got === src );
    test.identical( result( src, got ), exp );

    test.close( 'src2 != dst' );
  }
}

//

function onlyOneEvaluator( test )
{
  test.open( 'arrayContainerAdapter' );
  run( ( e ) => _.containerAdapter.make( e ) );
  test.close( 'arrayContainerAdapter' );

  /* - */

  test.open( 'setContainerAdapter' );
  run( ( e ) => _.containerAdapter.make( new Set( e ) ) );
  test.close( 'setContainerAdapter' );

  /* - */

  function run( makeSrc )
  {
    test.open( 'without dst' );

    var result = ( src, got ) => _.setIs( src ) || _.setIs( src.original ) ? [ ... got.original ] : got.original;

    test.case = 'dst - null';
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var got = src.only( null, ( e ) => e );
    var exp = [];
    test.is( got !== src );
    test.identical( result( src, got ), exp );

    test.case = 'dst - empty array';
    var dst = [];
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var got = src.only( dst, ( e ) => e );
    var exp = [];
    test.is( got !== dst );
    test.is( got !== src );
    test.identical( result( src, got ), exp );

    test.case = 'dst - empty arrayAdapter';
    var dst = _.containerAdapter.make( [] );
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var got = src.only( dst, ( e ) => e );
    var exp = [];
    test.is( got !== dst );
    test.is( got !== src );
    test.identical( result( src, got ), exp );

    test.case = 'dst - empty Set';
    var dst = new Set();
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var got = src.only( dst, ( e ) => e );
    var exp = [];
    test.is( got !== dst );
    test.is( got !== src );
    test.identical( result( dst, got), exp );

    test.case = 'dst - empty setAdapter';
    var dst = _.containerAdapter.make( new Set() );
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var got = src.only( dst, ( e ) => e );
    var exp = [];
    test.is( got !== dst );
    test.is( got !== src );
    test.identical( result( dst, got ), exp );

    test.case = 'dst - src';
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var got = src.only( src, ( e ) => e );
    var exp = [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ];
    test.is( got === src );
    test.identical( result( src, got ), exp );

    test.close( 'without dst' );

    /* - */

    test.open( 'src2 is empty' );

    test.case = 'dst - null';
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var got = src.only( null, [], ( e ) => e );
    var exp = [];
    test.is( got !== src );
    test.identical( result( src, got ), exp );

    test.case = 'dst - empty array';
    var dst = [];
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var got = src.only( dst, new Set(), ( e ) => e );
    var exp = [];
    test.is( got !== dst );
    test.is( got !== src );
    test.identical( result( dst, got ), exp );

    test.case = 'dst - empty arrayAdapter';
    var dst = _.containerAdapter.make( [] );
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var src2 = _.containerAdapter.make( [] );
    var got = src.only( dst, src2, ( e ) => e );
    var exp = [];
    test.is( got === dst );
    test.is( got !== src );
    test.identical( result( dst, got ), exp );

    test.case = 'dst - empty Set';
    var dst = new Set();
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var got = src.only( dst, new Set(), ( e ) => e );
    var exp = [];
    test.is( got !== dst );
    test.is( got !== src );
    test.identical( result( dst, got ), exp );

    test.case = 'dst - empty setAdapter';
    var dst = _.containerAdapter.make( new Set() );
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var got = src.only( dst, [], ( e ) => e );
    var exp = [];
    test.is( got === dst );
    test.is( got !== src );
    test.identical( result( dst, got ), exp );

    test.case = 'dst - src';
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var got = src.only( src, [], ( e ) => e );
    var exp = [];
    test.is( got === src );
    test.identical( result( src, got ), exp );

    test.close( 'src2 is empty' );

    /* */

    test.open( 'src2 == dst' );

    test.case = 'dst - empty array';
    var dst = [];
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var src2 = _.containerAdapter.make( new Set( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] ) );
    var got = src.only( dst, src2, ( e ) => e );
    var exp = [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ];
    test.is( got !== dst );
    test.is( got !== src );
    test.identical( result( dst, got ), exp );

    test.case = 'dst - empty arrayAdapter';
    var dst = _.containerAdapter.make( [] );
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var src2 = _.containerAdapter.make( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var got = src.only( dst, src2, ( e ) => e );
    var exp = [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ];
    test.is( got === dst );
    test.is( got !== src );
    test.identical( result( dst, got ), exp );

    test.case = 'dst - empty Set';
    var dst = new Set();
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var src2 = new Set( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var got = src.only( dst, src2, ( e ) => e );
    var exp = [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ];
    test.is( got !== dst );
    test.is( got !== src );
    test.identical( result( dst, got ), exp );

    test.case = 'dst - setAdapter';
    var dst = _.containerAdapter.make( new Set( [ -20, 5 ] ) );
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20, [ 22 ], [ 20 ] ] );
    var src2 = [ -10, 5, -15, 4, 1, 2, 15, [ 21 ], [ -20 ], [ 22 ], [ 20 ] ];
    var got = src.only( dst, src2, ( e ) => e[ 0 ] );
    var exp = [ -20, 5, -10, -15, 4, 1, 2, 15, [ 22 ], [ 20 ] ];
    test.is( got === dst );
    test.is( got !== src );
    test.identical( result( dst, got ), exp );

    test.case = 'dst - src';
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var src2 = [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ];
    var got = src.only( src, src2, ( e ) => e );
    var exp = [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ];
    test.is( got === src );
    test.identical( result( src, got ), exp );

    test.close( 'src2 == dst' );

    /* - */

    test.open( 'src2 != dst' );

    test.case = 'dst - empty array';
    var dst = [];
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var src2 = _.containerAdapter.make( new Set( [ -10, 6, -14, 4, 1, 1, 15, 21, -1 ] ) );
    var got = src.only( dst, src2, ( e ) => e );
    var exp = [ -10, 4, 1, 15, 21 ];
    test.is( got !== dst );
    test.is( got !== src );
    test.identical( result( dst, got ), exp );

    test.case = 'dst - arrayAdapter';
    var dst = _.containerAdapter.make( [ 1 ] );
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var src2 = _.containerAdapter.make( [ -10, 6, -14, 4, 1, 1, 15, 21, -1 ] );
    var got = src.only( dst, src2, ( e ) => e );
    var exp = [ 1, -10, 4, 15, 21 ];
    test.is( got === dst );
    test.is( got !== src );
    test.identical( result( dst, got ), exp );

    test.case = 'dst - empty Set';
    var dst = new Set();
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20, [ 22 ] ] );
    var src2 = new Set( [ -10, 6, -14, 4, 1, 1, 15, 21, -1, [ 22 ] ] );
    var got = src.only( dst, src2, ( e ) => e[ 0 ] );
    var exp = [ -10, 6, -14, 4, 1, 15, 21, -1, [ 22 ] ];
    test.is( got !== dst );
    test.is( got !== src );
    test.identical( result( dst, got ), exp );

    test.case = 'dst - Set';
    var dst = new Set( [ [ 22 ] ] );
    var src = makeSrc( [ -15, 4, 1, 2, 15, 21, -20, [ 22 ] ] );
    var src2 = new Set( [ [ 22 ], -10, 6, -14, 4, 1, 1, 15, 21, -1 ] );
    var got = src.only( dst, src2, ( e ) => e[ 0 ] );
    var exp = [ [ 22 ], [ 22 ], -10, 6, -14, 4, 1, 15, 21, -1 ];
    test.is( got !== dst );
    test.is( got !== src );
    test.identical( result( dst, got ), exp );

    test.case = 'dst - empty setAdapter';
    var dst = _.containerAdapter.make( new Set() );
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var src2 = [ -10, 6, -14, 4, 1, 1, 15, 21, -1 ];
    var got = src.only( dst, src2, ( e ) => e );
    var exp = [ -10, 4, 1, 15, 21 ];
    test.is( got === dst );
    test.is( got !== src );
    test.identical( result( dst, got ), exp );

    test.case = 'dst - src';
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var src2 = [ -10, 6, -14, 4, 1, 1, 15, 21, -1 ];
    var got = src.only( src, src2, ( e ) => e );
    var exp = [ -10, 4, 1, 15, 21 ];
    test.is( got === src );
    test.identical( result( src, got ), exp );

    test.close( 'src2 != dst' );
  }
}

//

function onlyTwoEvaluators( test )
{
  test.open( 'arrayContainerAdapter' );
  run( ( e ) => _.containerAdapter.make( e ) );
  test.close( 'arrayContainerAdapter' );

  /* - */

  test.open( 'setContainerAdapter' );
  run( ( e ) => _.containerAdapter.make( new Set( e ) ) );
  test.close( 'setContainerAdapter' );

  /* - */

  function run( makeSrc )
  {
    test.open( 'without dst' );

    var result = ( src, got ) => _.setIs( src ) || _.setIs( src.original ) ? [ ... got.original ] : got.original;

    test.case = 'dst - null';
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var got = src.only( null, ( e ) => e, ( ins ) => ins );
    var exp = [];
    test.is( got !== src );
    test.identical( result( src, got ), exp );

    test.case = 'dst - empty array';
    var dst = [];
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var got = src.only( dst, ( e ) => e, ( ins ) => ins );
    var exp = [];
    test.is( got !== dst );
    test.is( got !== src );
    test.identical( result( src, got ), exp );

    test.case = 'dst - empty arrayAdapter';
    var dst = _.containerAdapter.make( [] );
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var got = src.only( dst, ( e ) => e, ( ins ) => ins );
    var exp = [];
    test.is( got !== dst );
    test.is( got !== src );
    test.identical( result( src, got ), exp );

    test.case = 'dst - empty Set';
    var dst = new Set();
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var got = src.only( dst, ( e ) => e, ( ins ) => ins );
    var exp = [];
    test.is( got !== dst );
    test.is( got !== src );
    test.identical( result( dst, got), exp );

    test.case = 'dst - empty setAdapter';
    var dst = _.containerAdapter.make( new Set() );
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var got = src.only( dst, ( e ) => e, ( ins ) => ins );
    var exp = [];
    test.is( got !== dst );
    test.is( got !== src );
    test.identical( result( dst, got ), exp );

    test.case = 'dst - src';
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var got = src.only( src, ( e ) => e, ( ins ) => ins );
    var exp = [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ];
    test.is( got === src );
    test.identical( result( src, got ), exp );

    test.close( 'without dst' );

    /* - */

    test.open( 'src2 is empty' );

    test.case = 'dst - null';
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var got = src.only( null, [], ( e ) => e, ( ins ) => ins );
    var exp = [];
    test.is( got !== src );
    test.identical( result( src, got ), exp );

    test.case = 'dst - empty array';
    var dst = [];
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var got = src.only( dst, new Set(), ( e ) => e, ( ins ) => ins );
    var exp = [];
    test.is( got !== dst );
    test.is( got !== src );
    test.identical( result( dst, got ), exp );

    test.case = 'dst - empty arrayAdapter';
    var dst = _.containerAdapter.make( [] );
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var src2 = _.containerAdapter.make( [] );
    var got = src.only( dst, src2, ( e ) => e, ( ins ) => ins );
    var exp = [];
    test.is( got === dst );
    test.is( got !== src );
    test.identical( result( dst, got ), exp );

    test.case = 'dst - empty Set';
    var dst = new Set();
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var got = src.only( dst, new Set(), ( e ) => e, ( ins ) => ins );
    var exp = [];
    test.is( got !== dst );
    test.is( got !== src );
    test.identical( result( dst, got ), exp );

    test.case = 'dst - empty setAdapter';
    var dst = _.containerAdapter.make( new Set() );
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var got = src.only( dst, [], ( e ) => e, ( ins ) => ins );
    var exp = [];
    test.is( got === dst );
    test.is( got !== src );
    test.identical( result( dst, got ), exp );

    test.case = 'dst - src';
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var got = src.only( src, [], ( e ) => e, ( ins ) => ins );
    var exp = [];
    test.is( got === src );
    test.identical( result( src, got ), exp );

    test.close( 'src2 is empty' );

    /* */

    test.open( 'src2 == dst' );

    test.case = 'dst - empty array';
    var dst = [];
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var src2 = _.containerAdapter.make( new Set( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] ) );
    var got = src.only( dst, src2, ( e ) => e, ( ins ) => ins );
    var exp = [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ];
    test.is( got !== dst );
    test.is( got !== src );
    test.identical( result( dst, got ), exp );

    test.case = 'dst - empty arrayAdapter';
    var dst = _.containerAdapter.make( [] );
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var src2 = _.containerAdapter.make( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var got = src.only( dst, src2, ( e ) => e, ( ins ) => ins );
    var exp = [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ];
    test.is( got === dst );
    test.is( got !== src );
    test.identical( result( dst, got ), exp );

    test.case = 'dst - empty Set';
    var dst = new Set();
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var src2 = new Set( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var got = src.only( dst, src2, ( e ) => e, ( ins ) => ins );
    var exp = [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ];
    test.is( got !== dst );
    test.is( got !== src );
    test.identical( result( dst, got ), exp );

    test.case = 'dst - setAdapter';
    var dst = _.containerAdapter.make( new Set( [ -20, 5 ] ) );
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20, [ 22 ], [ 20 ] ] );
    var src2 = [ -10, 5, -15, 4, 1, 2, 15, [ 21 ], [ -20 ], [ 22 ], [ 20 ] ];
    var got = src.only( dst, src2, ( e ) => e, ( ins ) => ins[ 0 ] );
    var exp = [ -20, 5, [ 21 ], [ -20 ] ];
    test.is( got === dst );
    test.is( got !== src );
    test.identical( result( dst, got ), exp );

    test.case = 'dst - src';
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var src2 = [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ];
    var got = src.only( src, src2, ( e ) => e, ( ins ) => ins );
    var exp = [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ];
    test.is( got === src );
    test.identical( result( src, got ), exp );

    test.close( 'src2 == dst' );

    /* - */

    test.open( 'src2 != dst' );

    test.case = 'dst - empty array';
    var dst = [];
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var src2 = _.containerAdapter.make( new Set( [ -10, 6, -14, 4, 1, 1, 15, 21, -1 ] ) );
    var got = src.only( dst, src2, ( e ) => e, ( ins ) => ins );
    var exp = [ -10, 4, 1, 15, 21 ];
    test.is( got !== dst );
    test.is( got !== src );
    test.identical( result( dst, got ), exp );

    test.case = 'dst - arrayAdapter';
    var dst = _.containerAdapter.make( [ 1 ] );
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var src2 = _.containerAdapter.make( [ -10, 6, -14, 4, 1, 1, 15, 21, -1 ] );
    var got = src.only( dst, src2, ( e ) => e, ( ins ) => ins );
    var exp = [ 1, -10, 4, 15, 21 ];
    test.is( got === dst );
    test.is( got !== src );
    test.identical( result( dst, got ), exp );

    test.case = 'dst - empty Set';
    var dst = new Set();
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20, 22 ] );
    var src2 = new Set( [ -10, 6, -14, 4, 1, 1, 15, 21, -1, [ 22 ] ] );
    var got = src.only( dst, src2, ( e ) => e, ( ins ) => ins[ 0 ] );
    var exp = [ [ 22 ] ];
    test.is( got !== dst );
    test.is( got !== src );
    test.identical( result( dst, got ), exp );

    test.case = 'dst - Set';
    var dst = new Set( [ [ 22 ] ] );
    var src = makeSrc( [ -15, 4, 1, 2, 15, 21, -20, [ 22 ] ] );
    var src2 = new Set( [ [ 22 ], -10, 6, -14, 4, 1, 1, 15, 21, -1 ] );
    var got = src.only( dst, src2, ( e ) => e[ 0 ], ( ins ) => ins[ 0 ] );
    var exp = [ [ 22 ], [ 22 ], -10, 6, -14, 4, 1, 15, 21, -1 ];
    test.is( got !== dst );
    test.is( got !== src );
    test.identical( result( dst, got ), exp );

    test.case = 'dst - empty setAdapter';
    var dst = _.containerAdapter.make( new Set() );
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var src2 = [ -10, 6, -14, 4, 1, 1, 15, 21, -1 ];
    var got = src.only( dst, src2, ( e ) => e, ( ins ) => ins );
    var exp = [ -10, 4, 1, 15, 21 ];
    test.is( got === dst );
    test.is( got !== src );
    test.identical( result( dst, got ), exp );

    test.case = 'dst - src';
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var src2 = [ -10, 6, -14, 4, 1, 1, 15, 21, -1 ];
    var got = src.only( src, src2, ( e ) => e, ( ins ) => ins );
    var exp = [ -10, 4, 1, 15, 21 ];
    test.is( got === src );
    test.identical( result( src, got ), exp );

    test.close( 'src2 != dst' );
  }
}

//

function onlyEqualizer( test )
{
  test.open( 'arrayContainerAdapter' );
  run( ( e ) => _.containerAdapter.make( e ) );
  test.close( 'arrayContainerAdapter' );

  /* - */

  test.open( 'setContainerAdapter' );
  run( ( e ) => _.containerAdapter.make( new Set( e ) ) );
  test.close( 'setContainerAdapter' );

  /* - */

  function run( makeSrc )
  {
    test.open( 'without dst' );

    var result = ( src, got ) => _.setIs( src ) || _.setIs( src.original ) ? [ ... got.original ] : got.original;

    test.case = 'dst - null';
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var got = src.only( null, ( e, ins ) => e === ins );
    var exp = [];
    test.is( got !== src );
    test.identical( result( src, got ), exp );

    test.case = 'dst - empty array';
    var dst = [];
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var got = src.only( dst, ( e, ins ) => e === ins );
    var exp = [];
    test.is( got !== dst );
    test.is( got !== src );
    test.identical( result( src, got ), exp );

    test.case = 'dst - empty arrayAdapter';
    var dst = _.containerAdapter.make( [] );
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var got = src.only( dst, ( e, ins ) => e === ins );
    var exp = [];
    test.is( got !== dst );
    test.is( got !== src );
    test.identical( result( src, got ), exp );

    test.case = 'dst - empty Set';
    var dst = new Set();
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var got = src.only( dst, ( e, ins ) => e === ins );
    var exp = [];
    test.is( got !== dst );
    test.is( got !== src );
    test.identical( result( dst, got), exp );

    test.case = 'dst - empty setAdapter';
    var dst = _.containerAdapter.make( new Set() );
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var got = src.only( dst, ( e, ins ) => e === ins );
    var exp = [];
    test.is( got !== dst );
    test.is( got !== src );
    test.identical( result( dst, got ), exp );

    test.case = 'dst - src';
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var got = src.only( src, ( e, ins ) => e === ins );
    var exp = [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ];
    test.is( got === src );
    test.identical( result( src, got ), exp );

    test.close( 'without dst' );

    /* - */

    test.open( 'src2 is empty' );

    test.case = 'dst - null';
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var got = src.only( null, [], ( e, ins ) => e === ins );
    var exp = [];
    test.is( got !== src );
    test.identical( result( src, got ), exp );

    test.case = 'dst - empty array';
    var dst = [];
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var got = src.only( dst, new Set(), ( e, ins ) => e === ins );
    var exp = [];
    test.is( got !== dst );
    test.is( got !== src );
    test.identical( result( dst, got ), exp );

    test.case = 'dst - empty arrayAdapter';
    var dst = _.containerAdapter.make( [] );
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var src2 = _.containerAdapter.make( [] );
    var got = src.only( dst, src2, ( e, ins ) => e === ins );
    var exp = [];
    test.is( got === dst );
    test.is( got !== src );
    test.identical( result( dst, got ), exp );

    test.case = 'dst - empty Set';
    var dst = new Set();
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var got = src.only( dst, new Set(), ( e, ins ) => e === ins );
    var exp = [];
    test.is( got !== dst );
    test.is( got !== src );
    test.identical( result( dst, got ), exp );

    test.case = 'dst - empty setAdapter';
    var dst = _.containerAdapter.make( new Set() );
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var got = src.only( dst, [], ( e, ins ) => e === ins );
    var exp = [];
    test.is( got === dst );
    test.is( got !== src );
    test.identical( result( dst, got ), exp );

    test.case = 'dst - src';
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var got = src.only( src, [], ( e, ins ) => e === ins );
    var exp = [];
    test.is( got === src );
    test.identical( result( src, got ), exp );

    test.close( 'src2 is empty' );

    /* */

    test.open( 'src2 == dst' );

    test.case = 'dst - empty array';
    var dst = [];
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var src2 = _.containerAdapter.make( new Set( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] ) );
    var got = src.only( dst, src2, ( e, ins ) => e === ins );
    var exp = [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ];
    test.is( got !== dst );
    test.is( got !== src );
    test.identical( result( dst, got ), exp );

    test.case = 'dst - empty arrayAdapter';
    var dst = _.containerAdapter.make( [] );
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var src2 = _.containerAdapter.make( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var got = src.only( dst, src2, ( e, ins ) => e === ins );
    var exp = [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ];
    test.is( got === dst );
    test.is( got !== src );
    test.identical( result( dst, got ), exp );

    test.case = 'dst - empty Set';
    var dst = new Set();
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var src2 = new Set( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var got = src.only( dst, src2, ( e, ins ) => e === ins );
    var exp = [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ];
    test.is( got !== dst );
    test.is( got !== src );
    test.identical( result( dst, got ), exp );

    test.case = 'dst - setAdapter';
    var dst = _.containerAdapter.make( new Set( [ -20, 5 ] ) );
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20, [ 22 ], [ 20 ] ] );
    var src2 = [ -10, 5, -15, 4, 1, 2, 15, [ 21 ], [ -20 ], [ 22 ], [ 20 ] ];
    var got = src.only( dst, src2, ( e, ins ) => e === ins[ 0 ] );
    var exp = [ -20, 5, [ 21 ], [ -20 ] ];
    test.is( got === dst );
    test.is( got !== src );
    test.identical( result( dst, got ), exp );

    test.case = 'dst - src';
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var src2 = [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ];
    var got = src.only( src, src2, ( e, ins ) => e === ins );
    var exp = [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ];
    test.is( got === src );
    test.identical( result( src, got ), exp );

    test.close( 'src2 == dst' );

    /* - */

    test.open( 'src2 != dst' );

    test.case = 'dst - empty array';
    var dst = [];
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var src2 = _.containerAdapter.make( new Set( [ -10, 6, -14, 4, 1, 1, 15, 21, -1 ] ) );
    var got = src.only( dst, src2, ( e, ins ) => e === ins );
    var exp = [ -10, 4, 1, 15, 21 ];
    test.is( got !== dst );
    test.is( got !== src );
    test.identical( result( dst, got ), exp );

    test.case = 'dst - arrayAdapter';
    var dst = _.containerAdapter.make( [ 1 ] );
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var src2 = _.containerAdapter.make( [ -10, 6, -14, 4, 1, 1, 15, 21, -1 ] );
    var got = src.only( dst, src2, ( e, ins ) => e === ins );
    var exp = [ 1, -10, 4, 15, 21 ];
    test.is( got === dst );
    test.is( got !== src );
    test.identical( result( dst, got ), exp );

    test.case = 'dst - empty Set';
    var dst = new Set();
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20, 22 ] );
    var src2 = new Set( [ -10, 6, -14, 4, 1, 1, 15, 21, -1, [ 22 ] ] );
    var got = src.only( dst, src2, ( e, ins ) => e === ins[ 0 ] );
    var exp = [ [ 22 ] ];
    test.is( got !== dst );
    test.is( got !== src );
    test.identical( result( dst, got ), exp );

    test.case = 'dst - Set';
    var dst = new Set( [ [ 22 ] ] );
    var src = makeSrc( [ -15, 4, 1, 2, 15, 21, -20, [ 22 ] ] );
    var src2 = new Set( [ [ 22 ], -10, 6, -14, 4, 1, 1, 15, 21, -1 ] );
    var got = src.only( dst, src2, ( e, ins ) => e[ 0 ] === ins[ 0 ] );
    var exp = [ [ 22 ], [ 22 ], -10, 6, -14, 4, 1, 15, 21, -1 ];
    test.is( got !== dst );
    test.is( got !== src );
    test.identical( result( dst, got ), exp );

    test.case = 'dst - empty setAdapter';
    var dst = _.containerAdapter.make( new Set() );
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var src2 = [ -10, 6, -14, 4, 1, 1, 15, 21, -1 ];
    var got = src.only( dst, src2, ( e, ins ) => e === ins );
    var exp = [ -10, 4, 1, 15, 21 ];
    test.is( got === dst );
    test.is( got !== src );
    test.identical( result( dst, got ), exp );

    test.case = 'dst - src';
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var src2 = [ -10, 6, -14, 4, 1, 1, 15, 21, -1 ];
    var got = src.only( src, src2, ( e, ins ) => e === ins );
    var exp = [ -10, 4, 1, 15, 21 ];
    test.is( got === src );
    test.identical( result( src, got ), exp );

    test.close( 'src2 != dst' );
  }
}

//

function butWithoutCallbacks( test )
{
  test.open( 'arrayContainerAdapter' );
  run( ( e ) => _.containerAdapter.make( e ) );
  test.close( 'arrayContainerAdapter' );

  /* - */

  test.open( 'setContainerAdapter' );
  run( ( e ) => _.containerAdapter.make( new Set( e ) ) );
  test.close( 'setContainerAdapter' );

  /* - */

  function run( makeSrc )
  {
    test.open( 'without src2' );

    var result = ( src, got ) => _.setIs( src ) || _.setIs( src.original ) ? [ ... got.original ] : got.original;

    test.case = 'without arguments';
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var got = src.but();
    var exp = [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ];
    test.is( got !== src );
    test.identical( result( src, got ), exp );

    test.case = 'dst - null';
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var got = src.but( null );
    var exp = [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ];
    test.is( got !== src );
    test.identical( result( src, got ), exp );

    test.case = 'dst - empty array';
    var dst = [];
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var got = src.but( dst );
    var exp = [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ];
    test.is( got !== dst );
    test.is( got !== src );
    test.identical( result( dst, got ), exp );

    test.case = 'dst - empty arrayAdapter';
    var dst = _.containerAdapter.make( [] );
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var got = src.but( dst );
    var exp = [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ];
    test.is( got === dst );
    test.is( got !== src );
    test.identical( result( dst, got ), exp );

    test.case = 'dst - empty Set';
    var dst = new Set();
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var got = src.but( dst );
    var exp = [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ];
    test.is( got !== dst );
    test.is( got !== src );
    test.identical( result( dst, got), exp );

    test.case = 'dst - empty setAdapter';
    var dst = _.containerAdapter.make( new Set() );
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var got = src.but( dst );
    var exp = [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ];
    test.is( got === dst );
    test.is( got !== src );
    test.identical( result( dst, got ), exp );

    test.case = 'dst - src';
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var got = src.but( src );
    var exp = [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ];
    test.is( got === src );
    test.identical( result( src, got ), exp );

    test.close( 'without src2' );

    /* - */

    test.open( 'src2 is empty' );

    test.case = 'dst - null';
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var got = src.but( null, [] );
    var exp = [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ];
    test.is( got !== src );
    test.identical( result( src, got ), exp );

    test.case = 'dst - empty array';
    var dst = [];
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var got = src.but( dst, new Set() );
    var exp = [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ];
    test.is( got !== dst );
    test.is( got !== src );
    test.identical( result( dst, got ), exp );

    test.case = 'dst - empty arrayAdapter';
    var dst = _.containerAdapter.make( [] );
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var src2 = _.containerAdapter.make( [] );
    var got = src.but( dst, src2 );
    var exp = [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ];
    test.is( got === dst );
    test.is( got !== src );
    test.identical( result( dst, got ), exp );

    test.case = 'dst - empty Set';
    var dst = new Set();
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var got = src.but( dst, new Set() );
    var exp = [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ];
    test.is( got !== dst );
    test.is( got !== src );
    test.identical( result( dst, got ), exp );

    test.case = 'dst - empty setAdapter';
    var dst = _.containerAdapter.make( new Set() );
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var got = src.but( dst, [] );
    var exp = [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ];
    test.is( got === dst );
    test.is( got !== src );
    test.identical( result( dst, got ), exp );

    test.case = 'dst - src';
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var got = src.but( src, [] );
    var exp = [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ];
    test.is( got === src );
    test.identical( result( src, got ), exp );

    test.close( 'src2 is empty' );

    /* */

    test.open( 'src2 == dst' );

    test.case = 'dst - empty array';
    var dst = [];
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var src2 = _.containerAdapter.make( new Set( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] ) );
    var got = src.but( dst, src2 );
    var exp = [];
    test.is( got !== dst );
    test.is( got !== src );
    test.identical( result( dst, got ), exp );

    test.case = 'dst - empty arrayAdapter';
    var dst = _.containerAdapter.make( [] );
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var src2 = _.containerAdapter.make( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var got = src.but( dst, src2 );
    var exp = [];
    test.is( got === dst );
    test.is( got !== src );
    test.identical( result( dst, got ), exp );

    test.case = 'dst - empty Set';
    var dst = new Set();
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var src2 = new Set( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var got = src.but( dst, src2 );
    var exp = [];
    test.is( got !== dst );
    test.is( got !== src );
    test.identical( result( dst, got ), exp );

    test.case = 'dst - empty setAdapter';
    var dst = _.containerAdapter.make( new Set() );
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var src2 = [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ];
    var got = src.but( dst, src2 );
    var exp = [];
    test.is( got === dst );
    test.is( got !== src );
    test.identical( result( dst, got ), exp );

    test.case = 'dst - src';
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var src2 = [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ];
    var got = src.but( src, src2 );
    var exp = [];
    test.is( got === src );
    test.identical( result( src, got ), exp );

    test.close( 'src2 == dst' );

    /* - */

    test.open( 'src2 != dst' );

    test.case = 'dst - empty array';
    var dst = [];
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var src2 = _.containerAdapter.make( new Set( [ -10, 6, -14, 4, 1, 1, 15, 21, -1 ] ) );
    var got = src.but( dst, src2 );
    var exp = [ 5, -15, 2, -20 ];
    test.is( got !== dst );
    test.is( got !== src );
    test.identical( result( dst, got ), exp );

    test.case = 'dst - arrayAdapter';
    var dst = _.containerAdapter.make( [ 1 ] );
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var src2 = _.containerAdapter.make( [ -10, 6, -14, 4, 1, 1, 15, 21, -1 ] );
    var got = src.but( dst, src2 );
    var exp = [ 1, 5, -15, 2, -20 ];
    test.is( got === dst );
    test.is( got !== src );
    test.identical( result( dst, got ), exp );

    test.case = 'dst - empty Set';
    var dst = new Set();
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var src2 = new Set( [ -10, 6, -14, 4, 1, 1, 15, 21, -1 ] );
    var got = src.but( dst, src2 );
    var exp = [ 5, -15, 2, -20 ];
    test.is( got !== dst );
    test.is( got !== src );
    test.identical( result( dst, got ), exp );

    test.case = 'dst - empty setAdapter';
    var dst = _.containerAdapter.make( new Set() );
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var src2 = [ -10, 6, -14, 4, 1, 1, 15, 21, -1 ];
    var got = src.but( dst, src2 );
    var exp = [ 5, -15, 2, -20 ];
    test.is( got === dst );
    test.is( got !== src );
    test.identical( result( dst, got ), exp );

    test.case = 'dst - src';
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var src2 = [ -10, 6, -14, 4, 1, 1, 15, 21, -1 ];
    var got = src.but( src, src2 );
    var exp = [ 5, -15, 2, -20 ];
    test.is( got === src );
    test.identical( result( src, got ), exp );

    test.close( 'src2 != dst' );
  }
}

//

function butOneEvaluator( test )
{
  test.open( 'arrayContainerAdapter' );
  run( ( e ) => _.containerAdapter.make( e ) );
  test.close( 'arrayContainerAdapter' );

  /* - */

  test.open( 'setContainerAdapter' );
  run( ( e ) => _.containerAdapter.make( new Set( e ) ) );
  test.close( 'setContainerAdapter' );

  /* - */

  function run( makeSrc )
  {
    test.open( 'without dst' );

    var result = ( src, got ) => _.setIs( src ) || _.setIs( src.original ) ? [ ... got.original ] : got.original;

    test.case = 'dst - null';
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var got = src.but( null, ( e ) => e );
    var exp = [];
    test.is( got !== src );
    test.identical( result( src, got ), exp );

    test.case = 'dst - empty array';
    var dst = [];
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var got = src.but( dst, ( e ) => e );
    var exp = [];
    test.is( got !== dst );
    test.is( got !== src );
    test.identical( result( src, got ), exp );

    test.case = 'dst - empty arrayAdapter';
    var dst = _.containerAdapter.make( [] );
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var got = src.but( dst, ( e ) => e );
    var exp = [];
    test.is( got !== dst );
    test.is( got !== src );
    test.identical( result( src, got ), exp );

    test.case = 'dst - empty Set';
    var dst = new Set();
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var got = src.but( dst, ( e ) => e );
    var exp = [];
    test.is( got !== dst );
    test.is( got !== src );
    test.identical( result( dst, got), exp );

    test.case = 'dst - empty setAdapter';
    var dst = _.containerAdapter.make( new Set() );
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var got = src.but( dst, ( e ) => e );
    var exp = [];
    test.is( got !== dst );
    test.is( got !== src );
    test.identical( result( dst, got ), exp );

    test.case = 'dst - src';
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var got = src.but( src, ( e ) => e );
    var exp = [];
    test.is( got === src );
    test.identical( result( src, got ), exp );

    test.close( 'without dst' );

    /* - */

    test.open( 'src2 is empty' );

    test.case = 'dst - null';
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var got = src.but( null, [], ( e ) => e );
    var exp = [];
    test.is( got !== src );
    test.identical( result( src, got ), exp );

    test.case = 'dst - empty array';
    var dst = [];
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var got = src.but( dst, new Set(), ( e ) => e );
    var exp = [];
    test.is( got !== dst );
    test.is( got !== src );
    test.identical( result( dst, got ), exp );

    test.case = 'dst - empty arrayAdapter';
    var dst = _.containerAdapter.make( [] );
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var src2 = _.containerAdapter.make( [] );
    var got = src.but( dst, src2, ( e ) => e );
    var exp = [];
    test.is( got === dst );
    test.is( got !== src );
    test.identical( result( dst, got ), exp );

    test.case = 'dst - empty Set';
    var dst = new Set();
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var got = src.but( dst, new Set(), ( e ) => e );
    var exp = [];
    test.is( got !== dst );
    test.is( got !== src );
    test.identical( result( dst, got ), exp );

    test.case = 'dst - empty setAdapter';
    var dst = _.containerAdapter.make( new Set() );
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var got = src.but( dst, [], ( e ) => e );
    var exp = [];
    test.is( got === dst );
    test.is( got !== src );
    test.identical( result( dst, got ), exp );

    test.case = 'dst - src';
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var got = src.but( src, [], ( e ) => e );
    var exp = [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ];
    test.is( got === src );
    test.identical( result( src, got ), exp );

    test.close( 'src2 is empty' );

    /* */

    test.open( 'src2 == dst' );

    test.case = 'dst - empty array';
    var dst = [];
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var src2 = _.containerAdapter.make( new Set( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] ) );
    var got = src.but( dst, src2, ( e ) => e );
    var exp = [];
    test.is( got !== dst );
    test.is( got !== src );
    test.identical( result( dst, got ), exp );

    test.case = 'dst - empty arrayAdapter';
    var dst = _.containerAdapter.make( [] );
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var src2 = _.containerAdapter.make( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var got = src.but( dst, src2, ( e ) => e );
    var exp = [];
    test.is( got === dst );
    test.is( got !== src );
    test.identical( result( dst, got ), exp );

    test.case = 'dst - empty Set';
    var dst = new Set();
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var src2 = new Set( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var got = src.but( dst, src2, ( e ) => e );
    var exp = [];
    test.is( got !== dst );
    test.is( got !== src );
    test.identical( result( dst, got ), exp );

    test.case = 'dst - setAdapter';
    var dst = _.containerAdapter.make( new Set( [ -20, 5 ] ) );
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20, [ 22 ], [ 20 ] ] );
    var src2 = [ -10, 5, -15, 4, 1, 2, 15, [ 21 ], [ -20 ], [ 22 ], [ 20 ] ];
    var got = src.but( dst, src2, ( e ) => e[ 0 ] );
    var exp = [ -20, 5, [ 21 ], [ -20 ], ];
    test.is( got === dst );
    test.is( got !== src );
    test.identical( result( dst, got ), exp );

    test.case = 'dst - src';
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var src2 = [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ];
    var got = src.but( src, src2, ( e ) => e );
    var exp = [];
    test.is( got === src );
    test.identical( result( src, got ), exp );

    test.close( 'src2 == dst' );

    /* - */

    test.open( 'src2 != dst' );

    test.case = 'dst - empty array';
    var dst = [];
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var src2 = _.containerAdapter.make( new Set( [ -10, 6, -14, 4, 1, 1, 15, 21, -1 ] ) );
    var got = src.but( dst, src2, ( e ) => e );
    var exp = [ 6, -14, -1 ];
    test.is( got !== dst );
    test.is( got !== src );
    test.identical( result( dst, got ), exp );

    test.case = 'dst - arrayAdapter';
    var dst = _.containerAdapter.make( [ 1 ] );
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var src2 = _.containerAdapter.make( [ -10, 6, -14, 4, 1, 1, 15, 21, -1 ] );
    var got = src.but( dst, src2, ( e ) => e );
    var exp = [ 1, 6, -14, -1 ];
    test.is( got === dst );
    test.is( got !== src );
    test.identical( result( dst, got ), exp );

    test.case = 'dst - empty Set';
    var dst = new Set();
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20, [ 22 ] ] );
    var src2 = new Set( [ -10, 6, -14, 4, 1, 1, 15, 21, -1, [ 22 ] ] );
    var got = src.but( dst, src2, ( e ) => e[ 0 ] );
    var exp = [];
    test.is( got !== dst );
    test.is( got !== src );
    test.identical( result( dst, got ), exp );

    test.case = 'dst - Set';
    var dst = new Set( [ [ 22 ] ] );
    var src = makeSrc( [ -15, 4, 1, 2, 15, 21, -20, [ 22 ] ] );
    var src2 = new Set( [ [ 22 ], -10, 6, -14, 4, 1, 1, 15, 21, -1 ] );
    var got = src.but( dst, src2, ( e ) => e[ 0 ] );
    var exp = [ [ 22 ] ];
    test.is( got !== dst );
    test.is( got !== src );
    test.identical( result( dst, got ), exp );

    test.case = 'dst - empty setAdapter';
    var dst = _.containerAdapter.make( new Set() );
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var src2 = [ -10, 6, -14, 4, 1, 1, 15, 21, -1 ];
    var got = src.but( dst, src2, ( e ) => e );
    var exp = [ 6, -14, -1 ];
    test.is( got === dst );
    test.is( got !== src );
    test.identical( result( dst, got ), exp );

    test.case = 'dst - src';
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var src2 = [ -10, 6, -14, 4, 1, 1, 15, 21, -1 ];
    var got = src.but( src, src2, ( e ) => e );
    var exp = [ 5, -15, 2, -20 ];
    test.is( got === src );
    test.identical( result( src, got ), exp );

    test.close( 'src2 != dst' );
  }
}

//

function butTwoEvaluators( test )
{
  test.open( 'arrayContainerAdapter' );
  run( ( e ) => _.containerAdapter.make( e ) );
  test.close( 'arrayContainerAdapter' );

  /* - */

  test.open( 'setContainerAdapter' );
  run( ( e ) => _.containerAdapter.make( new Set( e ) ) );
  test.close( 'setContainerAdapter' );

  /* - */

  function run( makeSrc )
  {
    test.open( 'without dst' );

    var result = ( src, got ) => _.setIs( src ) || _.setIs( src.original ) ? [ ... got.original ] : got.original;

    test.case = 'dst - null';
    var src = makeSrc( [] );
    var got = src.but( null, ( e ) => e, ( ins ) => ins );
    var exp = [];
    test.is( got !== src );
    test.identical( result( src, got ), exp );

    test.case = 'dst - empty array';
    var dst = [];
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var got = src.but( dst, ( e ) => e, ( ins ) => ins );
    var exp = [];
    test.is( got !== dst );
    test.is( got !== src );
    test.identical( result( src, got ), exp );

    test.case = 'dst - empty arrayAdapter';
    var dst = _.containerAdapter.make( [] );
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var got = src.but( dst, ( e ) => e, ( ins ) => ins );
    var exp = [];
    test.is( got !== dst );
    test.is( got !== src );
    test.identical( result( src, got ), exp );

    test.case = 'dst - empty Set';
    var dst = new Set();
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var got = src.but( dst, ( e ) => e, ( ins ) => ins );
    var exp = [];
    test.is( got !== dst );
    test.is( got !== src );
    test.identical( result( dst, got), exp );

    test.case = 'dst - empty setAdapter';
    var dst = _.containerAdapter.make( new Set() );
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var got = src.but( dst, ( e ) => e, ( ins ) => ins );
    var exp = [];
    test.is( got !== dst );
    test.is( got !== src );
    test.identical( result( dst, got ), exp );

    test.case = 'dst - src';
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var got = src.but( src, ( e ) => e, ( ins ) => ins );
    var exp = [];
    test.is( got === src );
    test.identical( result( src, got ), exp );

    test.close( 'without dst' );

    /* - */

    test.open( 'src2 is empty' );

    test.case = 'dst - null';
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var got = src.but( null, [], ( e ) => e, ( ins ) => ins );
    var exp = [];
    test.is( got !== src );
    test.identical( result( src, got ), exp );

    test.case = 'dst - empty array';
    var dst = [];
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var got = src.but( dst, new Set(), ( e ) => e, ( ins ) => ins );
    var exp = [];
    test.is( got !== dst );
    test.is( got !== src );
    test.identical( result( dst, got ), exp );

    test.case = 'dst - empty arrayAdapter';
    var dst = _.containerAdapter.make( [] );
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var src2 = _.containerAdapter.make( [] );
    var got = src.but( dst, src2, ( e ) => e, ( ins ) => ins );
    var exp = [];
    test.is( got === dst );
    test.is( got !== src );
    test.identical( result( dst, got ), exp );

    test.case = 'dst - empty Set';
    var dst = new Set();
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var got = src.but( dst, new Set(), ( e ) => e, ( ins ) => ins );
    var exp = [];
    test.is( got !== dst );
    test.is( got !== src );
    test.identical( result( dst, got ), exp );

    test.case = 'dst - empty setAdapter';
    var dst = _.containerAdapter.make( new Set() );
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var got = src.but( dst, [], ( e ) => e, ( ins ) => ins );
    var exp = [];
    test.is( got === dst );
    test.is( got !== src );
    test.identical( result( dst, got ), exp );

    test.case = 'dst - src';
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var got = src.but( src, [], ( e ) => e, ( ins ) => ins );
    var exp = [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ];
    test.is( got === src );
    test.identical( result( src, got ), exp );

    test.close( 'src2 is empty' );

    /* */

    test.open( 'src2 == dst' );

    test.case = 'dst - empty array';
    var dst = [];
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var src2 = _.containerAdapter.make( new Set( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] ) );
    var got = src.but( dst, src2, ( e ) => e, ( ins ) => ins );
    var exp = [];
    test.is( got !== dst );
    test.is( got !== src );
    test.identical( result( dst, got ), exp );

    test.case = 'dst - empty arrayAdapter';
    var dst = _.containerAdapter.make( [] );
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var src2 = _.containerAdapter.make( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var got = src.but( dst, src2, ( e ) => e, ( ins ) => ins );
    var exp = [];
    test.is( got === dst );
    test.is( got !== src );
    test.identical( result( dst, got ), exp );

    test.case = 'dst - empty Set';
    var dst = new Set();
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var src2 = new Set( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var got = src.but( dst, src2, ( e ) => e, ( ins ) => ins );
    var exp = [];
    test.is( got !== dst );
    test.is( got !== src );
    test.identical( result( dst, got ), exp );

    test.case = 'dst - setAdapter';
    var dst = _.containerAdapter.make( new Set( [ -20, 5 ] ) );
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20, [ 22 ], [ 20 ] ] );
    var src2 = [ -10, 5, -15, 4, 1, 2, 15, [ 21 ], [ -20 ], [ 22 ], [ 20 ] ];
    var got = src.but( dst, src2, ( e ) => e, ( ins ) => ins[ 0 ] );
    var exp = [ -20, 5, -10, -15, 4, 1, 2, 15, [ 22 ], [ 20 ] ];
    test.is( got === dst );
    test.is( got !== src );
    test.identical( result( dst, got ), exp );

    test.case = 'dst - src';
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var src2 = [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ];
    var got = src.but( src, src2, ( e ) => e, ( ins ) => ins );
    var exp = [];
    test.is( got === src );
    test.identical( result( src, got ), exp );

    test.close( 'src2 == dst' );

    /* - */

    test.open( 'src2 != dst' );

    test.case = 'dst - empty array';
    var dst = [];
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var src2 = _.containerAdapter.make( new Set( [ -10, 6, -14, 4, 1, 1, 15, 21, -1 ] ) );
    var got = src.but( dst, src2, ( e ) => e, ( ins ) => ins );
    var exp = [ 6, -14, -1 ];
    test.is( got !== dst );
    test.is( got !== src );
    test.identical( result( dst, got ), exp );

    test.case = 'dst - arrayAdapter';
    var dst = _.containerAdapter.make( [ 1 ] );
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var src2 = _.containerAdapter.make( [ -10, 6, -14, 4, 1, 1, 15, 21, -1 ] );
    var got = src.but( dst, src2, ( e ) => e, ( ins ) => ins );
    var exp = [ 1, 6, -14, -1 ];
    test.is( got === dst );
    test.is( got !== src );
    test.identical( result( dst, got ), exp );

    test.case = 'dst - empty Set';
    var dst = new Set();
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20, 22 ] );
    var src2 = new Set( [ -10, 6, -14, 4, 1, 1, 15, 21, -1, [ 22 ] ] );
    var got = src.but( dst, src2, ( e ) => e, ( ins ) => ins[ 0 ] );
    var exp = [ -10, 6, -14, 4, 1, 15, 21, -1 ];
    test.is( got !== dst );
    test.is( got !== src );
    test.identical( result( dst, got ), exp );

    test.case = 'dst - Set';
    var dst = new Set( [ [ 22 ] ] );
    var src = makeSrc( [ -15, 4, 1, 2, 15, 21, -20, [ 22 ] ] );
    var src2 = new Set( [ [ 22 ], -10, 6, -14, 4, 1, 1, 15, 21, -1 ] );
    var got = src.but( dst, src2, ( e ) => e[ 0 ], ( ins ) => ins[ 0 ] );
    var exp = [ [ 22 ] ];
    test.is( got !== dst );
    test.is( got !== src );
    test.identical( result( dst, got ), exp );

    test.case = 'dst - empty setAdapter';
    var dst = _.containerAdapter.make( new Set() );
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var src2 = [ -10, 6, -14, 4, 1, 1, 15, 21, -1 ];
    var got = src.but( dst, src2, ( e ) => e, ( ins ) => ins );
    var exp = [ 6, -14, -1 ];
    test.is( got === dst );
    test.is( got !== src );
    test.identical( result( dst, got ), exp );

    test.case = 'dst - src';
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var src2 = [ -10, 6, -14, 4, 1, 1, 15, 21, -1 ];
    var got = src.but( src, src2, ( e ) => e, ( ins ) => ins );
    var exp = [ 5, -15, 2, -20 ];
    test.is( got === src );
    test.identical( result( src, got ), exp );

    test.close( 'src2 != dst' );
  }
}

//

function butEqualizer( test )
{
  test.open( 'arrayContainerAdapter' );
  run( ( e ) => _.containerAdapter.make( e ) );
  test.close( 'arrayContainerAdapter' );

  /* - */

  test.open( 'setContainerAdapter' );
  run( ( e ) => _.containerAdapter.make( new Set( e ) ) );
  test.close( 'setContainerAdapter' );

  /* - */

  function run( makeSrc )
  {
    test.open( 'without dst' );

    var result = ( src, got ) => _.setIs( src ) || _.setIs( src.original ) ? [ ... got.original ] : got.original;

    test.case = 'dst - null';
    var src = makeSrc( [] );
    var got = src.but( null, ( e, ins ) => e === ins );
    var exp = [];
    test.is( got !== src );
    test.identical( result( src, got ), exp );

    test.case = 'dst - empty array';
    var dst = [];
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var got = src.but( dst, ( e, ins ) => e === ins );
    var exp = [];
    test.is( got !== dst );
    test.is( got !== src );
    test.identical( result( src, got ), exp );

    test.case = 'dst - empty arrayAdapter';
    var dst = _.containerAdapter.make( [] );
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var got = src.but( dst, ( e, ins ) => e === ins );
    var exp = [];
    test.is( got !== dst );
    test.is( got !== src );
    test.identical( result( src, got ), exp );

    test.case = 'dst - empty Set';
    var dst = new Set();
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var got = src.but( dst, ( e, ins ) => e === ins );
    var exp = [];
    test.is( got !== dst );
    test.is( got !== src );
    test.identical( result( dst, got), exp );

    test.case = 'dst - empty setAdapter';
    var dst = _.containerAdapter.make( new Set() );
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var got = src.but( dst, ( e, ins ) => e === ins );
    var exp = [];
    test.is( got !== dst );
    test.is( got !== src );
    test.identical( result( dst, got ), exp );

    test.case = 'dst - src';
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var got = src.but( src, ( e, ins ) => e === ins );
    var exp = [];
    test.is( got === src );
    test.identical( result( src, got ), exp );

    test.close( 'without dst' );

    /* - */

    test.open( 'src2 is empty' );

    test.case = 'dst - null';
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var got = src.but( null, [], ( e, ins ) => e === ins );
    var exp = [];
    test.is( got !== src );
    test.identical( result( src, got ), exp );

    test.case = 'dst - empty array';
    var dst = [];
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var got = src.but( dst, new Set(), ( e, ins ) => e === ins );
    var exp = [];
    test.is( got !== dst );
    test.is( got !== src );
    test.identical( result( dst, got ), exp );

    test.case = 'dst - empty arrayAdapter';
    var dst = _.containerAdapter.make( [] );
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var src2 = _.containerAdapter.make( [] );
    var got = src.but( dst, src2, ( e, ins ) => e === ins );
    var exp = [];
    test.is( got === dst );
    test.is( got !== src );
    test.identical( result( dst, got ), exp );

    test.case = 'dst - empty Set';
    var dst = new Set();
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var got = src.but( dst, new Set(), ( e, ins ) => e === ins );
    var exp = [];
    test.is( got !== dst );
    test.is( got !== src );
    test.identical( result( dst, got ), exp );

    test.case = 'dst - empty setAdapter';
    var dst = _.containerAdapter.make( new Set() );
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var got = src.but( dst, [], ( e, ins ) => e === ins );
    var exp = [];
    test.is( got === dst );
    test.is( got !== src );
    test.identical( result( dst, got ), exp );

    test.case = 'dst - src';
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var got = src.but( src, [], ( e, ins ) => e === ins );
    var exp = [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ];
    test.is( got === src );
    test.identical( result( src, got ), exp );

    test.close( 'src2 is empty' );

    /* */

    test.open( 'src2 == dst' );

    test.case = 'dst - empty array';
    var dst = [];
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var src2 = _.containerAdapter.make( new Set( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] ) );
    var got = src.but( dst, src2, ( e, ins ) => e === ins );
    var exp = [];
    test.is( got !== dst );
    test.is( got !== src );
    test.identical( result( dst, got ), exp );

    test.case = 'dst - empty arrayAdapter';
    var dst = _.containerAdapter.make( [] );
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var src2 = _.containerAdapter.make( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var got = src.but( dst, src2, ( e, ins ) => e === ins );
    var exp = [];
    test.is( got === dst );
    test.is( got !== src );
    test.identical( result( dst, got ), exp );

    test.case = 'dst - empty Set';
    var dst = new Set();
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var src2 = new Set( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var got = src.but( dst, src2, ( e, ins ) => e === ins );
    var exp = [];
    test.is( got !== dst );
    test.is( got !== src );
    test.identical( result( dst, got ), exp );

    test.case = 'dst - setAdapter';
    var dst = _.containerAdapter.make( new Set( [ -20, 5 ] ) );
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20, [ 22 ], [ 20 ] ] );
    var src2 = [ -10, 5, -15, 4, 1, 2, 15, [ 21 ], [ -20 ], [ 22 ], [ 20 ] ];
    var got = src.but( dst, src2, ( e, ins ) => e === ins[ 0 ] );
    var exp = [ -20, 5, -10, -15, 4, 1, 2, 15, [ 22 ], [ 20 ] ];
    test.is( got === dst );
    test.is( got !== src );
    test.identical( result( dst, got ), exp );

    test.case = 'dst - src';
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var src2 = [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ];
    var got = src.but( src, src2, ( e, ins ) => e === ins );
    var exp = [];
    test.is( got === src );
    test.identical( result( src, got ), exp );

    test.close( 'src2 == dst' );

    /* - */

    test.open( 'src2 != dst' );

    test.case = 'dst - empty array';
    var dst = [];
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var src2 = _.containerAdapter.make( new Set( [ -10, 6, -14, 4, 1, 1, 15, 21, -1 ] ) );
    var got = src.but( dst, src2, ( e, ins ) => e === ins );
    var exp = [ 6, -14, -1 ];
    test.is( got !== dst );
    test.is( got !== src );
    test.identical( result( dst, got ), exp );

    test.case = 'dst - arrayAdapter';
    var dst = _.containerAdapter.make( [ 1 ] );
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var src2 = _.containerAdapter.make( [ -10, 6, -14, 4, 1, 1, 15, 21, -1 ] );
    var got = src.but( dst, src2, ( e, ins ) => e === ins );
    var exp = [ 1, 6, -14, -1 ];
    test.is( got === dst );
    test.is( got !== src );
    test.identical( result( dst, got ), exp );

    test.case = 'dst - empty Set';
    var dst = new Set();
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20, 22 ] );
    var src2 = new Set( [ -10, 6, -14, 4, 1, 1, 15, 21, -1, [ 22 ] ] );
    var got = src.but( dst, src2, ( e, ins ) => e === ins[ 0 ] );
    var exp = [ -10, 6, -14, 4, 1, 15, 21, -1 ];
    test.is( got !== dst );
    test.is( got !== src );
    test.identical( result( dst, got ), exp );

    test.case = 'dst - Set';
    var dst = new Set( [ [ 22 ] ] );
    var src = makeSrc( [ -15, 4, 1, 2, 15, 21, -20, [ 22 ] ] );
    var src2 = new Set( [ [ 22 ], -10, 6, -14, 4, 1, 1, 15, 21, -1 ] );
    var got = src.but( dst, src2, ( e ) => e[ 0 ], ( ins ) => ins[ 0 ] );
    var exp = [ [ 22 ] ];
    test.is( got !== dst );
    test.is( got !== src );
    test.identical( result( dst, got ), exp );

    test.case = 'dst - empty setAdapter';
    var dst = _.containerAdapter.make( new Set() );
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var src2 = [ -10, 6, -14, 4, 1, 1, 15, 21, -1 ];
    var got = src.but( dst, src2, ( e, ins ) => e === ins );
    var exp = [ 6, -14, -1 ];
    test.is( got === dst );
    test.is( got !== src );
    test.identical( result( dst, got ), exp );

    test.case = 'dst - src';
    var src = makeSrc( [ -10, 5, -15, 4, 1, 2, 15, 21, -20 ] );
    var src2 = [ -10, 6, -14, 4, 1, 1, 15, 21, -1 ];
    var got = src.but( src, src2, ( e ) => e, ( ins ) => ins );
    var exp = [ 5, -15, 2, -20 ];
    test.is( got === src );
    test.identical( result( src, got ), exp );

    test.close( 'src2 != dst' );
  }
}

//--
// SetContainerAdapter
//--

function setAdapterMap( test )
{
  test.case = 'without arguments';
  var src = _.containerAdapter.make( new Set( [] ) );
  var exp = _.containerAdapter.make( new Set( [] ) );
  var got = src.map( null );
  test.is( got !== src );
  test.identical( got, exp );

  /* - */

  test.open( 'only onEach' );

  test.case = 'from empty array, onEach returns number';
  var src = _.containerAdapter.make( new Set( [] ) );
  var exp = _.containerAdapter.make( new Set( [] ) );
  var got = src.map( ( e ) => 123 );
  test.is( got !== src );
  test.identical( [ ... got.original ], [ ... exp.original ] );

  test.case = 'from array, onEach returns original';
  var src = _.containerAdapter.make( new Set( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] ) );
  var exp = _.containerAdapter.make( new Set( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] ) );
  var got = src.map( ( e ) => e );
  test.is( got !== src );
  test.identical( [ ... got.original ], [ ... exp.original ] );

  test.case = 'from array, onEach returns undefined';
  var src = _.containerAdapter.make( new Set( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] ) );
  var exp = _.containerAdapter.make( new Set( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] ) );
  var got = src.map( ( e ) => undefined );
  test.is( got !== src );
  test.identical( [ ... got.original ], [ ... exp.original ] );

  test.case = 'from array, onEach returns array';
  var src = _.containerAdapter.make( new Set( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] ) );
  var exp = _.containerAdapter.make( new Set( [ [ 0 ], [ 1 ], [ null ], [ true ], [ false ], [ undefined ], [ '' ], [ [ 2 ] ], [ { a : 0 } ] ] ) );
  var got = src.map( ( e ) => [ e ] );
  test.is( got !== src );
  test.identical( [ ... got.original ], [ ... exp.original ] );

  test.case = 'from array, onEach returns element of array';
  var src = _.containerAdapter.make( new Set( [ 0, 1, NaN, true, false, [ undefined ], '', [ 2 ], { a : 0 } ] ) );
  var exp = _.containerAdapter.make( new Set( [ 0, 1, NaN, true, false, [ undefined ], '', 2, { a : 0 } ] ) );
  var got = src.map( ( e ) => e[ 0 ] );
  test.is( got !== src );
  test.identical( [ ... got.original ], [ ... exp.original ] );

  test.close( 'only onEach' );

  /* - */

  test.open( 'dst === null' );

  test.case = 'from array, onEach returns container';
  var src = _.containerAdapter.make( new Set( [ 1 ] ) );
  var exp = [ ... new Set( [ 1 ] ) ];
  var got = src.map( null, ( e, k, src ) => src );
  test.is( got !== src );
  test.identical( Array.from( ... got.original ),  exp );

  test.case = 'from array, onEach returns original';
  var src = _.containerAdapter.make( new Set( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] ) );
  var exp = _.containerAdapter.make( new Set( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] ) );
  var got = src.map( null, ( e ) => e );
  test.is( got !== src );
  test.identical( [ ... got.original ], [ ... exp.original ] );

  test.case = 'from array, onEach returns undefined';
  var src = _.containerAdapter.make( new Set( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] ) );
  var exp = _.containerAdapter.make( new Set( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] ) );
  var got = src.map( null, ( e ) => undefined );
  test.is( got !== src );
  test.identical( [ ... got.original ], [ ... exp.original ] );

  test.case = 'from array, onEach returns array';
  var src = _.containerAdapter.make( new Set( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] ) );
  var exp = _.containerAdapter.make( new Set( [ [ 0 ], [ 1 ], [ null ], [ true ], [ false ], [ undefined ], [ '' ], [ [ 2 ] ], [ { a : 0 } ] ] ) );
  var got = src.map( null, ( e ) => [ e ] );
  test.is( got !== src );
  test.identical( [ ... got.original ], [ ... exp.original ] );

  test.case = 'from array, onEach returns element of array';
  var src = _.containerAdapter.make( new Set( [ 0, 1, NaN, true, false, [ undefined ], '', [ 2 ], { a : 0 } ] ) );
  var exp = _.containerAdapter.make( new Set( [ 0, 1, NaN, true, false, [ undefined ], '', 2, { a : 0 } ] ) );
  var got = src.map( null, ( e ) => e[ 0 ] );
  test.is( got !== src );
  test.identical( [ ... got.original ], [ ... exp.original ] );

  test.close( 'dst === null' );

  /* - */

  test.open( 'dst === src' );

  test.case = 'from empty array, onEach returns container';
  var src = _.containerAdapter.make( new Set( [] ) );
  var exp = _.containerAdapter.make( new Set( [] ) );
  var got = src.map( src, ( e, k, src ) => src );
  test.is( got === src );
  test.identical( [ ... got.original ], [ ... exp.original ] );

  test.case = 'from array, onEach returns original';
  var src = _.containerAdapter.make( new Set( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] ) );
  var exp = _.containerAdapter.make( new Set( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] ) );
  var got = src.map( src, ( e ) => e );
  test.is( got === src );
  test.identical( [ ... got.original ], [ ... exp.original ] );

  test.case = 'from array, onEach returns undefined';
  var src = _.containerAdapter.make( new Set( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] ) );
  var exp = _.containerAdapter.make( new Set( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] ) );
  var got = src.map( src, ( e ) => undefined );
  test.is( got === src );
  test.identical( [ ... got.original ], [ ... exp.original ] );

  test.case = 'from array, onEach returns array';
  var src = _.containerAdapter.make( new Set( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] ) );
  var exp = _.containerAdapter.make( new Set( [ [ 0 ], [ 1 ], [ null ], [ true ], [ false ], [ undefined ], [ '' ], [ [ 2 ] ], [ { a : 0 } ] ] ) );
  var got = src.map( src, ( e ) => [ e ] );
  test.is( got === src );
  test.identical( [ ... got.original ], [ ... exp.original ] );

  test.case = 'from array, onEach returns element of array';
  var src = _.containerAdapter.make( new Set( [ 0, 1, NaN, true, false, [ undefined ], '', [ 2 ], { a : 0 } ] ) );
  var exp = _.containerAdapter.make( new Set( [ 0, 1, NaN, true, false, [ undefined ], '', 2, { a : 0 } ] ) );
  var got = src.map( src, ( e ) => e[ 0 ] );
  test.is( got === src );
  test.identical( [ ... got.original ], [ ... exp.original ] );

  test.close( 'dst === src' );
}

//

function setAdapterFilter( test )
{
  test.case = 'without arguments';
  var src = _.containerAdapter.make( new Set( [] ) );
  var exp = [];
  var got = src.filter( null );
  test.is( got !== src );
  test.identical( [ ... got.original ], exp );

  /* - */

  test.open( 'only onEach' );

  test.case = 'from empty array, onEach returns number';
  var src = _.containerAdapter.make( new Set( [] ) );
  var exp = [];
  var got = src.filter( ( e ) => 123 );
  test.is( got !== src );
  test.identical( [ ... got.original ], exp );

  test.case = 'from array, onEach returns original';
  var src = _.containerAdapter.make( new Set( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] ) );
  var exp = [ 0, 1, null, true, false, '', [ 2 ], { a : 0 } ];
  var got = src.filter( ( e ) => e );
  test.is( got !== src );
  test.identical( [ ... got.original ], exp );

  test.case = 'from array, onEach returns undefined';
  var src = _.containerAdapter.make( new Set( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] ) );
  var exp = [];
  var got = src.filter( ( e ) => undefined );
  test.is( got !== src );
  test.identical( [ ... got.original ], exp );

  test.case = 'from array, onEach returns array';
  var src = _.containerAdapter.make( new Set( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] ) );
  var exp = [ [ 0 ], [ 1 ], [ null ], [ true ], [ false ], [ undefined ], [ '' ], [ [ 2 ] ], [ { a : 0 } ] ];
  var got = src.filter( ( e ) => [ e ] );
  test.is( got !== src );
  test.identical( [ ... got.original ], exp );

  test.case = 'from array, onEach returns element of array';
  var src = _.containerAdapter.make( new Set( [ 0, 1, NaN, true, false, [ undefined ], '', [ 2 ], { a : 0 } ] ) );
  var exp = [ 2 ];
  var got = src.filter( ( e ) => e[ 0 ] );
  test.is( got !== src );
  test.identical( [ ... got.original ], exp );

  test.close( 'only onEach' );

  /* - */

  test.open( 'dst === null' );

  test.case = 'from array, onEach returns container';
  var src = _.containerAdapter.make( new Set( [ 1 ] ) );
  var exp = [ src ];
  var got = src.filter( null, ( e, k, src ) => src );
  test.is( got !== src );
  test.identical( [ ... got.original ], exp );

  test.case = 'from array, onEach returns original';
  var src = _.containerAdapter.make( new Set( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] ) );
  var exp = [ 0, 1, null, true, false, '', [ 2 ], { a : 0 } ];
  var got = src.filter( null, ( e ) => e );
  test.is( got !== src );
  test.identical( [ ... got.original ], exp );

  test.case = 'from array, onEach returns undefined';
  var src = _.containerAdapter.make( new Set( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] ) );
  var exp = [];
  var got = src.filter( null, ( e ) => undefined );
  test.is( got !== src );
  test.identical( [ ... got.original ], exp );

  test.case = 'from array, onEach returns array';
  var src = _.containerAdapter.make( new Set( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] ) );
  var exp = [ [ 0 ], [ 1 ], [ null ], [ true ], [ false ], [ undefined ], [ '' ], [ [ 2 ] ], [ { a : 0 } ] ];
  var got = src.filter( null, ( e ) => [ e ] );
  test.is( got !== src );
  test.identical( [ ... got.original ], exp );

  test.case = 'from array, onEach returns element of array';
  var src = _.containerAdapter.make( new Set( [ 0, 1, NaN, true, false, [ undefined ], '', [ 2 ], { a : 0 } ] ) );
  var exp = [ 2 ];
  var got = src.filter( null, ( e ) => e[ 0 ] );
  test.is( got !== src );
  test.identical( [ ... got.original ], exp );

  test.close( 'dst === null' );

  /* - */

  test.open( 'dst != src' );

  test.case = 'dst - array, from empty array, onEach returns container';
  var dst = [ 1, 2 ];
  var src = _.containerAdapter.make( new Set( [] ) );
  var exp = [ 1, 2 ];
  var got = src.filter( dst, ( e, k, src ) => src );
  test.is( got !== dst );
  test.is( got !== src );
  test.identical( got.original, exp );

  test.case = 'dst - arrayAdapter, from array, onEach returns original';
  var dst = _.containerAdapter.make( [ 1, 2 ] );
  var src = _.containerAdapter.make( new Set( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] ) );
  var exp = [ 1, 2, 0, 1, null, true, false, '', [ 2 ], { a : 0 } ];
  var got = src.filter( dst, ( e ) => e );
  test.is( got === dst );
  test.is( got !== src );
  test.identical( got.original, exp );

  test.case = 'dst - Set, from array, onEach returns undefined';
  var dst = new Set( [ 1, 2 ] );
  var src = _.containerAdapter.make( new Set( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] ) );
  var exp = [ 1, 2 ];
  var got = src.filter( dst, ( e ) => undefined );
  test.is( got.original === dst );
  test.is( got !== src );
  test.identical( [ ... got.original ], exp );

  test.case = 'dst - setAdapter, from array, onEach returns array';
  var dst = _.containerAdapter.make( new Set( [ 1, 2 ] ) );
  var src = _.containerAdapter.make( new Set( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] ) );
  var exp = [ 1, 2, [ 0 ], [ 1 ], [ null ], [ true ], [ false ], [ undefined ], [ '' ], [ [ 2 ] ], [ { a : 0 } ] ];
  var got = src.filter( dst, ( e ) => [ e ] );
  test.is( got === dst );
  test.is( got !== src );
  test.identical( [ ... got.original ], exp );

  test.case = 'dst - array, from array, onEach returns element of array';
  var dst = [ 1, 2 ];
  var src = _.containerAdapter.make( new Set( [ 0, 1, NaN, true, false, [ undefined ], '', [ 2 ], { a : 0 } ] ) );
  var exp = [ 1, 2, 2 ];
  var got = src.filter( dst, ( e ) => e[ 0 ] );
  test.is( got.original === dst );
  test.is( got !== src );
  test.identical( got.original, exp );

  test.close( 'dst != src' );

  /* - */

  test.open( 'dst === src' );

  test.case = 'from empty array, onEach returns container';
  var src = _.containerAdapter.make( new Set( [] ) );
  var exp = [];
  var got = src.filter( src, ( e, k, src ) => src );
  test.is( got === src );
  test.identical( [ ... got.original ], exp );

  test.case = 'from array, onEach returns original';
  var src = _.containerAdapter.make( new Set( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] ) );
  var exp = [ 0, 1, null, true, false, '', [ 2 ], { a : 0 } ];
  var got = src.filter( src, ( e ) => e );
  test.is( got === src );
  test.identical( [ ... got.original ], exp );

  test.case = 'from array, onEach returns undefined';
  var src = _.containerAdapter.make( new Set( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] ) );
  var exp = [];
  var got = src.filter( src, ( e ) => undefined );
  test.is( got === src );
  test.identical( [ ... got.original ], exp );

  test.case = 'from array, onEach returns array';
  var src = _.containerAdapter.make( new Set( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] ) );
  var exp = [ [ 0 ], [ 1 ], [ null ], [ true ], [ false ], [ undefined ], [ '' ], [ [ 2 ] ], [ { a : 0 } ] ];
  var got = src.filter( src, ( e ) => [ e ] );
  test.is( got === src );
  test.identical( [ ... got.original ], exp );

  test.case = 'from array, onEach returns element of array';
  var src = _.containerAdapter.make( new Set( [ 0, 1, NaN, true, false, [ undefined ], '', [ 2 ], { a : 0 } ] ) );
  var exp = [ 2 ];
  var got = src.filter( src, ( e ) => e[ 0 ] );
  test.is( got === src );
  test.identical( [ ... got.original ], exp );

  test.close( 'dst === src' );
}

//

function setAdapterFlatFilter( test )
{
  test.case = 'without arguments';
  var src = _.containerAdapter.make( new Set( [] ) );
  var exp = [];
  var got = src.flatFilter( null );
  test.is( got !== src );
  test.identical( [ ... got.original ], exp );

  /* - */

  test.open( 'only onEach' );

  test.case = 'from empty array, onEach returns number';
  var src = _.containerAdapter.make( new Set( [] ) );
  var exp = [];
  var got = src.flatFilter( ( e ) => 123 );
  test.is( got !== src );
  test.identical( [ ... got.original ], exp );

  test.case = 'from array, onEach returns original';
  var src = _.containerAdapter.make( new Set( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] ) );
  var exp = [ 0, 1, null, true, false, '', 2, { a : 0 } ];
  var got = src.flatFilter( ( e ) => e );
  test.is( got !== src );
  test.identical( [ ... got.original ], exp );

  test.case = 'from array, onEach returns undefined';
  var src = _.containerAdapter.make( new Set( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] ) );
  var exp = [];
  var got = src.flatFilter( ( e ) => undefined );
  test.is( got !== src );
  test.identical( [ ... got.original ], exp );

  test.case = 'from array, onEach returns array';
  var src = _.containerAdapter.make( new Set( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] ) );
  var exp = [ 0, '0', 1, '1', null, 'null', true, 'true', false, 'false', undefined, 'undefined', '', [ 2 ], '2', { a : 0 }, '[object Object]' ];
  var got = src.flatFilter( ( e ) => [ e, String( e ) ] );
  test.is( got !== src );
  test.identical( [ ... got.original ], exp );

  test.case = 'from array, onEach returns element of array';
  var src = _.containerAdapter.make( new Set( [ 0, 1, NaN, true, false, [ undefined ], '', [ 2 ], { a : 0 } ] ) );
  var exp = [ 2 ];
  var got = src.flatFilter( ( e ) => e[ 0 ] );
  test.is( got !== src );
  test.identical( [ ... got.original ], exp );

  test.close( 'only onEach' );

  /* - */

  test.open( 'dst === null' );

  test.case = 'from array, onEach returns container';
  var src = _.containerAdapter.make( new Set( [ 1 ] ) );
  var exp = [ ... src.original ];
  var got = src.flatFilter( null, ( e, k, src ) => src );
  test.is( got !== src );
  test.identical( [ ... got.original ], exp );

  test.case = 'from array, onEach returns original';
  var src = _.containerAdapter.make( new Set( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] ) );
  var exp = [ 0, 1, null, true, false, '', 2, { a : 0 } ];
  var got = src.flatFilter( null, ( e ) => e );
  test.is( got !== src );
  test.identical( [ ... got.original ], exp );

  test.case = 'from array, onEach returns undefined';
  var src = _.containerAdapter.make( new Set( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] ) );
  var exp = [];
  var got = src.flatFilter( null, ( e ) => undefined );
  test.is( got !== src );
  test.identical( [ ... got.original ], exp );

  test.case = 'from array, onEach returns array';
  var src = _.containerAdapter.make( new Set( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] ) );
  var exp = [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ];
  var got = src.flatFilter( null, ( e ) => [ e ] );
  test.is( got !== src );
  test.identical( [ ... got.original ], exp );

  test.case = 'from array, onEach returns element of array';
  var src = _.containerAdapter.make( new Set( [ 0, 1, NaN, true, false, [ undefined ], '', [ 2 ], { a : 0 } ] ) );
  var exp = [ 2 ];
  var got = src.flatFilter( null, ( e ) => e[ 0 ] );
  test.is( got !== src );
  test.identical( [ ... got.original ], exp );

  test.close( 'dst === null' );

  /* - */

  test.open( 'dst != src' );

  test.case = 'dst - array, from empty array, onEach returns container';
  var dst = [ 1, 2 ];
  var src = _.containerAdapter.make( new Set( [] ) );
  var exp = [ 1, 2 ];
  var got = src.flatFilter( dst, ( e, k, src ) => src );
  test.is( got !== dst );
  test.is( got !== src );
  test.identical( got.original, exp );

  test.case = 'dst - arrayAdapter, from array, onEach returns original';
  var dst = _.containerAdapter.make( [ 1, 2 ] );
  var src = _.containerAdapter.make( new Set( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] ) );
  var exp = [ 1, 2, 0, 1, null, true, false, '', 2, { a : 0 } ];
  var got = src.flatFilter( dst, ( e ) => e );
  test.is( got === dst );
  test.is( got !== src );
  test.identical( got.original, exp );

  test.case = 'dst - Set, from array, onEach returns undefined';
  var dst = new Set( [ 1, 2 ] );
  var src = _.containerAdapter.make( new Set( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] ) );
  var exp = [ 1, 2 ];
  var got = src.flatFilter( dst, ( e ) => undefined );
  test.is( got.original === dst );
  test.is( got !== src );
  test.identical( [ ... got.original ], exp );

  test.case = 'dst - setAdapter, from array, onEach returns array';
  var dst = _.containerAdapter.make( new Set( [ 1, 2 ] ) );
  var src = _.containerAdapter.make( new Set( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] ) );
  var exp = [ 1, 2, 0, null, true, false, undefined, '',[ 2 ], { a : 0 } ];
  var got = src.flatFilter( dst, ( e ) => [ e ] );
  test.is( got === dst );
  test.is( got !== src );
  test.identical( [ ... got.original ], exp );

  test.case = 'dst - array, from array, onEach returns element of array';
  var dst = [ 1, 2 ];
  var src = _.containerAdapter.make( new Set( [ 0, 1, NaN, true, false, [ undefined ], '', [ 2 ], { a : 0 } ] ) );
  var exp = [ 1, 2, 2 ];
  var got = src.flatFilter( dst, ( e ) => e[ 0 ] );
  test.is( got.original === dst );
  test.is( got !== src );
  test.identical( got.original, exp );

  test.close( 'dst != src' );

  /* - */

  test.open( 'dst === src' );

  test.case = 'from empty array, onEach returns container';
  var src = _.containerAdapter.make( new Set( [] ) );
  var exp = [];
  var got = src.flatFilter( src, ( e, k, src ) => src );
  test.is( got === src );
  test.identical( [ ... got.original ], exp );

  test.case = 'from array, onEach returns original';
  var src = _.containerAdapter.make( new Set( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] ) );
  var exp = [ 0, 1, null, true, false, '', [ 2 ], { a : 0 } ];
  var got = src.flatFilter( src, ( e ) => e );
  test.is( got === src );
  test.identical( [ ... got.original ], exp );

  test.case = 'from array, onEach returns undefined';
  var src = _.containerAdapter.make( new Set( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] ) );
  var exp = [];
  var got = src.flatFilter( src, ( e ) => undefined );
  test.is( got === src );
  test.identical( [ ... got.original ], exp );

  test.case = 'from array, onEach returns array';
  var src = _.containerAdapter.make( new Set( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] ) );
  var exp = [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ];
  var got = src.flatFilter( src, ( e ) => [ e ] );
  test.is( got === src );
  test.identical( [ ... got.original ], exp );

  test.case = 'from array, onEach returns element of array';
  var src = _.containerAdapter.make( new Set( [ 0, 1, NaN, true, false, [ undefined ], '', [ 2 ], { a : 0 } ] ) );
  var exp = [ 2 ];
  var got = src.flatFilter( src, ( e ) => e[ 0 ] );
  test.is( got === src );
  test.identical( [ ... got.original ], exp );

  test.close( 'dst === src' );
}

//

function setAdapterOnce( test )
{
  test.case = 'without arguments';
  var src = _.containerAdapter.make( new Set( [] ) );
  var exp = _.containerAdapter.make( new Set( [] ) );
  var got = src.once( null );
  test.is( got !== src );
  test.identical( [ ... got.original ], [ ... exp.original ] );

  /* - */

  test.open( 'only onEval' );

  test.case = 'onEval returns element';
  var src = _.containerAdapter.make( new Set( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] ) );
  var exp = _.containerAdapter.make( new Set( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] ) );
  var got = src.once( ( e ) => e );
  test.is( got !== src );
  test.identical( [ ... got.original ], [ ... exp.original ] );

  test.case = 'onEval is simple equalizer';
  var src = _.containerAdapter.make( new Set( [ 0, 0, 1, 1, null, true, true, false, undefined, '', [ 2 ], { a : 0 } ] ) );
  var exp = _.containerAdapter.make( new Set( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] ) );
  var got = src.once( ( e, e2 ) => e === e2 );
  test.is( got !== src );
  test.identical( [ ... got.original ], [ ... exp.original ] );

  test.case = 'onEval remove undefined';
  var src = _.containerAdapter.make( new Set( [ 0, 0, 1, 1, undefined, undefined, undefined, true, false, undefined, '', [ 2 ], { a : 0 } ] ) );
  var exp = _.containerAdapter.make( new Set( [ 0 ] ) );
  var got = src.once( ( e ) => undefined );
  test.is( got !== src );
  test.identical( [ ... got.original ], [ ... exp.original ] );

  test.case = 'onEval check element of array';
  var src = _.containerAdapter.make( new Set( [ 0, 1, [ null ], [ true ], false, [ undefined ], '', [ 2 ], { a : 0 } ] ) );
  var exp = _.containerAdapter.make( new Set( [ 0, [ null ], [ true ], [ 2 ] ] ) );
  var got = src.once( ( e ) => e[ 0 ] );
  test.is( got !== src );
  test.identical( [ ... got.original ], [ ... exp.original ] );

  test.close( 'only onEval' );

  /* - */

  test.open( 'only dst' );

  test.case = 'src - from empty array, dst - empty ArrayContainerAdapter, no onEval';
  var src = _.containerAdapter.make( new Set( [] ) );
  var dst = _.containerAdapter.make( new Set( [] ) );
  var exp = _.containerAdapter.make( new Set( [] ) );
  var got = src.once( dst );
  test.is( got !== src );
  test.identical( [ ... got.original ], [ ... exp.original ] );

  test.case = 'the same containers, onEval returns element';
  var src = _.containerAdapter.make( new Set( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] ) );
  var dst = _.containerAdapter.make( new Set( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] ) );
  var exp = _.containerAdapter.make( new Set( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 }, [ 2 ], { a : 0 } ] ) );
  var got = src.once( dst, ( e ) => e );
  test.is( got !== src );
  test.identical( [ ... got.original ], [ ... exp.original ] );

  test.case = 'the same containers, onEval is simple equalizer';
  var src = _.containerAdapter.make( new Set( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] ) );
  var dst = _.containerAdapter.make( new Set( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 }, new U8x( 2 ) ] ) );
  var exp = _.containerAdapter.make( new Set( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 }, new U8x( 2 ), [ 2 ], { a : 0 } ] ) );
  var got = src.once( dst, ( e, e2 ) => e === e2 );
  test.is( got !== src );
  test.identical( [ ... got.original ], [ ... exp.original ] );

  test.case = 'different containers, onEval remove undefined';
  var src = _.containerAdapter.make( new Set( [ 0, 0, 1, 1, undefined, undefined, undefined, true, false, undefined, '', [ 2 ], { a : 0 } ] ) );
  var dst = _.containerAdapter.make( new Set( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] ) );
  var exp = _.containerAdapter.make( new Set( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] ) );
  var got = src.once( dst, ( e ) => undefined );
  test.is( got !== src );
  test.identical( [ ... got.original ], [ ... exp.original ] );

  test.case = 'onEval check element of array, no duplicates in src';
  var src = _.containerAdapter.make( new Set( [ 0, 1, [ null ], [ true ], false, [ undefined ], '', [ 2 ], { a : 0 } ] ) );
  var dst = _.containerAdapter.make( new Set( [ 0, 1, [ null ], [ true ], false, [ undefined ], '', [ 2 ], { a : 0 } ] ) );
  var exp = _.containerAdapter.make( new Set( [ 0, 1, [ null ], [ true ], false, [ undefined ], '', [ 2 ], { a : 0 }, [ null ], [ true ], [ 2 ] ] ) );
  var got = src.once( dst, ( e ) => e[ 0 ] );
  test.is( got !== src );
  test.identical( [ ... got.original ], [ ... exp.original ] );

  test.case = 'onEval check element of array, duplicates in src';
  var src = _.containerAdapter.make( new Set( [ 0, 1, [ null ], [ true ], [ true ], [ true ], false, [ undefined ], '', [ 2 ], { a : 0 } ] ) );
  var dst = _.containerAdapter.make( new Set( [ 0, 1, [ null ], [ true ], false, [ undefined ], '', [ 2 ], { a : 0 } ] ) );
  var exp = _.containerAdapter.make( new Set( [ 0, 1, [ null ], [ true ], false, [ undefined ], '', [ 2 ], { a : 0 }, [ null ], [ true ], [ 2 ] ] ) );
  var got = src.once( dst, ( e ) => e[ 0 ] );
  test.is( got !== src );
  test.identical( [ ... got.original ], [ ... exp.original ] );

  test.close( 'only dst' );

  /* - */

  test.open( 'dst === null' );

  test.case = 'src - from empty array, dst - empty array, no onEval';
  var src = _.containerAdapter.make( new Set( [] ) );
  var exp = _.containerAdapter.make( new Set( [] ) );
  var got = src.once( null );
  test.is( got !== src );
  test.identical( [ ... got.original ], [ ... exp.original ] );

  test.case = 'src - from empty array, dst - empty ArrayContainerAdapter, no onEval';
  var src = _.containerAdapter.make( new Set( [] ) );
  var dst = _.containerAdapter.make( new Set( [] ) );
  var exp = _.containerAdapter.make( new Set( [] ) );
  var got = src.once( null );
  test.is( got !== src );
  test.identical( got, exp );

  test.case = 'src - from array, dst - empty array, no onEval';
  var src = _.containerAdapter.make( new Set( [ 1, 2, 1, 2, null, null, undefined, false, undefined, false ] ) );
  var exp = _.containerAdapter.make( new Set( [ 1, 2, null, undefined, false ] ) );
  var got = src.once( null );
  test.is( got !== src );
  test.identical( [ ... got.original ], [ ... exp.original ] );

  test.case = 'src - from array, append array, no onEval';
  var src = _.containerAdapter.make( new Set( [ 1, 2, 1, 2, null, null, undefined, false, undefined, false, [ 2 ], [ 2 ], [ 2 ] ] ) );
  var exp = _.containerAdapter.make( new Set( [ 1, 2, null, undefined, false, [ 2 ], [ 2 ], [ 2 ] ] ) );
  var got = src.once( null );
  test.is( got !== src );
  test.identical( [ ... got.original ], [ ... exp.original ] );

  test.case = 'onEval returns element';
  var src = _.containerAdapter.make( new Set( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] ) );
  var exp = _.containerAdapter.make( new Set( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] ) );
  var got = src.once( null, ( e ) => e );
  test.is( got !== src );
  test.identical( [ ... got.original ], [ ... exp.original ] );

  test.case = 'onEval is simple equalizer';
  var src = _.containerAdapter.make( new Set( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] ) );
  var exp = _.containerAdapter.make( new Set( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] ) );
  var got = src.once( null, ( e, e2 ) => e === e2 );
  test.is( got !== src );
  test.identical( [ ... got.original ], [ ... exp.original ] );

  test.case = 'onEval remove undefined';
  var src = _.containerAdapter.make( new Set( [ 0, 0, 1, 1, undefined, undefined, undefined, true, false, undefined, '', [ 2 ], { a : 0 } ] ) );
  var exp = _.containerAdapter.make( new Set( [ 0 ] ) );
  var got = src.once( null, ( e ) => undefined );
  test.is( got !== src );
  test.identical( [ ... got.original ], [ ... exp.original ] );

  test.case = 'onEval check element of array, no duplicates in src';
  var src = _.containerAdapter.make( new Set( [ 0, 1, [ null ], [ true ], false, [ undefined ], '', [ 2 ], { a : 0 } ] ) );
  var exp = _.containerAdapter.make( new Set( [ 0, [ null ], [ true ], [ 2 ] ] ) );
  var got = src.once( null, ( e ) => e[ 0 ] );
  test.is( got !== src );
  test.identical( [ ... got.original ], [ ... exp.original ] );

  test.case = 'onEval check element of array, duplicates in src';
  var src = _.containerAdapter.make( new Set( [ 0, 1, [ null ], [ true ], [ true ], [ true ], false, [ undefined ], '', [ 2 ], { a : 0 } ] ) );
  var exp = _.containerAdapter.make( new Set( [ 0, [ null ], [ true ], [ 2 ] ] ) );
  var got = src.once( null, ( e ) => e[ 0 ] );
  test.is( got !== src );
  test.identical( [ ... got.original ], [ ... exp.original ] );

  test.close( 'dst === null' );

  /* - */

  test.open( 'dst === src' );

  test.case = 'src - from empty array, no onEval';
  var src = _.containerAdapter.make( new Set( [] ) );
  var exp = _.containerAdapter.make( new Set( [] ) );
  var got = src.once( src );
  test.is( got === src );
  test.identical( [ ... got.original ], [ ... exp.original ] );

  test.case = 'src - from empty array, no onEval';
  var src = _.containerAdapter.make( new Set( [] ) );
  var exp = _.containerAdapter.make( new Set( [] ) );
  var got = src.once( src );
  test.is( got === src );
  test.identical( [ ... got.original ], [ ... exp.original ] );

  test.case = 'src - from array, no onEval';
  var src = _.containerAdapter.make( new Set( [ 1, 2, 1, 2, null, null, undefined, false, undefined, false ] ) );
  var exp = _.containerAdapter.make( new Set( [ 1, 2, null, undefined, false ] ) );
  var got = src.once( src );
  test.is( got === src );
  test.identical( [ ... got.original ], [ ... exp.original ] );

  test.case = 'src - from array, no onEval';
  var src = _.containerAdapter.make( new Set( [ 1, 2, 1, 2, null, null, undefined, false, undefined, false, [ 2 ], [ 2 ], [ 2 ] ] ) );
  var exp = _.containerAdapter.make( new Set( [ 1, 2, null, undefined, false, [ 2 ], [ 2 ], [ 2 ] ] ) );
  var got = src.once( src );
  test.is( got === src );
  test.identical( [ ... got.original ], [ ... exp.original ] );

  test.case = 'onEval returns element';
  var src = _.containerAdapter.make( new Set( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] ) );
  var exp = _.containerAdapter.make( new Set( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] ) );
  var got = src.once( src, ( e ) => e );
  test.is( got === src );
  test.identical( [ ... got.original ], [ ... exp.original ] );

  test.case = 'onEval is simple equalizer';
  var src = _.containerAdapter.make( new Set( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] ) );
  var exp = _.containerAdapter.make( new Set( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] ) );
  var got = src.once( src, ( e, e2 ) => e === e2 );
  test.is( got === src );
  test.identical( [ ... got.original ], [ ... exp.original ] );

  test.case = 'different containers, onEval remove undefined';
  var src = _.containerAdapter.make( new Set( [ 0, 0, 1, 1, undefined, undefined, undefined, true, false, undefined, '', [ 2 ], { a : 0 } ] ) );
  var exp = _.containerAdapter.make( new Set( [ 0 ] ) );
  var got = src.once( src, ( e ) => undefined );
  test.is( got === src );
  test.identical( [ ... got.original ], [ ... exp.original ] );

  test.case = 'onEval check element of array, no duplicates in src';
  var src = _.containerAdapter.make( new Set( [ 0, 1, [ null ], [ true ], false, [ undefined ], '', [ 2 ], { a : 0 } ] ) );
  var exp = _.containerAdapter.make( new Set( [ 0, [ null ], [ true ], [ 2 ] ] ) );
  var got = src.once( src, ( e ) => e[ 0 ] );
  test.is( got === src );
  test.identical( [ ... got.original ], [ ... exp.original ] );

  test.close( 'dst === src' );
}

//

function setAdapterEach( test )
{
  test.case = 'without arguments';
  var src = _.containerAdapter.make( new Set( [] ) );
  var exp = [];
  var got = src.each( ( e ) => exp.push( e ) );
  test.is( got === src );
  test.identical( [ ... got.original ], exp );
  test.identical( exp, [] );

  test.case = 'from empty array, onEach returns number';
  var src = _.containerAdapter.make( new Set( [] ) );
  var exp = [];
  var got = src.each( ( e ) => exp.push( 123 ) );
  test.is( got === src );
  test.identical( [ ... got.original ], exp );
  test.identical( exp, [] );

  test.case = 'from array, onEach returns original';
  var src = _.containerAdapter.make( new Set( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] ) );
  var exp = [];
  var got = src.each( ( e ) => exp.push( e ) );
  test.is( got === src );
  test.identical( [ ... got.original ], exp );
  test.identical( exp, [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] );

  test.case = 'from array, onEach returns undefined';
  var src = _.containerAdapter.make( new Set( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] ) );
  var exp = [];
  var got = src.each( ( e ) => exp.push( undefined ) );
  test.is( got === src );
  test.identical( [ ... got.original ], [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] );
  test.identical( exp, [ undefined, undefined, undefined, undefined, undefined, undefined, undefined, undefined, undefined ] );

  test.case = 'from array, onEach returns array';
  var src = _.containerAdapter.make( new Set( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] ) );
  var exp = [];
  var got = src.each( ( e ) => exp.push( [ e ] ) );
  test.is( got === src );
  test.identical( [ ... got.original ], [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] );
  test.identical( exp, [ [ 0 ], [ 1 ], [ null ], [ true ], [ false ], [ undefined ], [ '' ], [ [ 2 ] ], [ { a : 0 } ] ] );

  test.case = 'from array, onEach returns element of array';
  var src = _.containerAdapter.make( new Set( [ 0, 1, NaN, true, false, [ undefined ], '', [ 2 ], { a : 0 } ] ) );
  var exp = [];
  var got = src.each( ( e ) => exp.push( e[ 0 ] ) );
  test.is( got === src );
  test.identical( [ ... got.original ], [ 0, 1, NaN, true, false, [ undefined ], '', [ 2 ], { a : 0 } ] );
  test.identical( exp, [ undefined, undefined, undefined, undefined, undefined, undefined, undefined, 2, undefined ] );
}

//--
// ArrayContainerAdapter
//--

function arrayAdapterMap( test )
{
  test.case = 'without arguments';
  var src = _.containerAdapter.make( [] );
  var exp = _.containerAdapter.make( [] );
  var got = src.map( null );
  test.is( got !== src );
  test.identical( got.original, exp.original );

  /* - */

  test.open( 'only onEach' );

  test.case = 'from empty array, onEach returns number';
  var src = _.containerAdapter.make( [] );
  var exp = _.containerAdapter.make( [] );
  var got = src.map( ( e ) => 123 );
  test.is( got !== src );
  test.identical( got.original, exp.original );

  test.case = 'from array, onEach returns original';
  var src = _.containerAdapter.make( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] );
  var exp = _.containerAdapter.make( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] );
  var got = src.map( ( e ) => e );
  test.is( got !== src );
  test.identical( got.original, exp.original );

  test.case = 'from array, onEach returns undefined';
  var src = _.containerAdapter.make( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] );
  var exp = _.containerAdapter.make( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] );
  var got = src.map( ( e ) => undefined );
  test.is( got !== src );
  test.identical( got.original, exp.original );

  test.case = 'from array, onEach returns array';
  var src = _.containerAdapter.make( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] );
  var exp = _.containerAdapter.make( [ [ 0 ], [ 1 ], [ null ], [ true ], [ false ], [ undefined ], [ '' ], [ [ 2 ] ], [ { a : 0 } ] ] );
  var got = src.map( ( e ) => [ e ] );
  test.is( got !== src );
  test.identical( got.original, exp.original );

  test.case = 'from array, onEach returns element of array';
  var src = _.containerAdapter.make( [ 0, 1, NaN, true, false, [ undefined ], '', [ 2 ], { a : 0 } ] );
  var exp = _.containerAdapter.make( [ 0, 1, NaN, true, false, [ undefined ], '', 2, { a : 0 } ] );
  var got = src.map( ( e ) => e[ 0 ] );
  test.is( got !== src );
  test.identical( got.original, exp.original );

  test.close( 'only onEach' );

  /* - */

  test.open( 'dst === null' );

  test.case = 'from array, onEach returns container';
  var src = _.containerAdapter.make( [ 1 ] );
  var exp = _.containerAdapter.make( [ src ] );
  var got = src.map( null, ( e, k, src ) => src );
  test.is( got !== src );
  test.identical( got.original, exp.original );

  test.case = 'from array, onEach returns original';
  var src = _.containerAdapter.make( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] );
  var exp = _.containerAdapter.make( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] );
  var got = src.map( null, ( e ) => e );
  test.is( got !== src );
  test.identical( got.original, exp.original );

  test.case = 'from array, onEach returns undefined';
  var src = _.containerAdapter.make( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] );
  var exp = _.containerAdapter.make( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] );
  var got = src.map( null, ( e ) => undefined );
  test.is( got !== src );
  test.identical( got.original, exp.original );

  test.case = 'from array, onEach returns array';
  var src = _.containerAdapter.make( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] );
  var exp = _.containerAdapter.make( [ [ 0 ], [ 1 ], [ null ], [ true ], [ false ], [ undefined ], [ '' ], [ [ 2 ] ], [ { a : 0 } ] ] );
  var got = src.map( null, ( e ) => [ e ] );
  test.is( got !== src );
  test.identical( got.original, exp.original );

  test.case = 'from array, onEach returns element of array';
  var src = _.containerAdapter.make( [ 0, 1, NaN, true, false, [ undefined ], '', [ 2 ], { a : 0 } ] );
  var exp = _.containerAdapter.make( [ 0, 1, NaN, true, false, [ undefined ], '', 2, { a : 0 } ] );
  var got = src.map( null, ( e ) => e[ 0 ] );
  test.is( got !== src );
  test.identical( got.original, exp.original );

  test.close( 'dst === null' );

  /* - */

  test.open( 'dst === src' );

  test.case = 'from empty array, onEach returns container';
  var src = _.containerAdapter.make( [] );
  var exp = _.containerAdapter.make( [] );
  var got = src.map( src, ( e, k, src ) => src );
  test.is( got === src );
  test.identical( got.original, exp.original );

  test.case = 'from array, onEach returns original';
  var src = _.containerAdapter.make( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] );
  var exp = _.containerAdapter.make( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] );
  var got = src.map( src, ( e ) => e );
  test.is( got === src );
  test.identical( got.original, exp.original );

  test.case = 'from array, onEach returns undefined';
  var src = _.containerAdapter.make( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] );
  var exp = _.containerAdapter.make( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] );
  var got = src.map( src, ( e ) => undefined );
  test.is( got === src );
  test.identical( got.original, exp.original );

  test.case = 'from array, onEach returns array';
  var src = _.containerAdapter.make( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] );
  var exp = _.containerAdapter.make( [ [ 0 ], [ 1 ], [ null ], [ true ], [ false ], [ undefined ], [ '' ], [ [ 2 ] ], [ { a : 0 } ] ] );
  var got = src.map( src, ( e ) => [ e ] );
  test.is( got === src );
  test.identical( got.original, exp.original );

  test.case = 'from array, onEach returns element of array';
  var src = _.containerAdapter.make( [ 0, 1, NaN, true, false, [ undefined ], '', [ 2 ], { a : 0 } ] );
  var exp = _.containerAdapter.make( [ 0, 1, NaN, true, false, [ undefined ], '', 2, { a : 0 } ] );
  var got = src.map( src, ( e ) => e[ 0 ] );
  test.is( got === src );
  test.identical( got.original, exp.original );

  test.close( 'dst === src' );
}

//

function arrayAdapterFilter( test )
{
  test.case = 'without arguments';
  var src = _.containerAdapter.make( [] );
  var exp = [];
  var got = src.filter( null );
  test.is( got !== src );
  test.identical( got.original, exp );

  /* - */

  test.open( 'only onEach' );

  test.case = 'from empty array, onEach returns number';
  var src = _.containerAdapter.make( [] );
  var exp = [];
  var got = src.filter( ( e ) => 123 );
  test.is( got !== src );
  test.identical( got.original, exp );

  test.case = 'from array, onEach returns original';
  var src = _.containerAdapter.make( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] );
  var exp = [ 0, 1, null, true, false, '', [ 2 ], { a : 0 } ];
  var got = src.filter( ( e ) => e );
  test.is( got !== src );
  test.identical( got.original, exp );

  test.case = 'from array, onEach returns undefined';
  var src = _.containerAdapter.make( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] );
  var exp = [];
  var got = src.filter( ( e ) => undefined );
  test.is( got !== src );
  test.identical( got.original, exp );

  test.case = 'from array, onEach returns array';
  var src = _.containerAdapter.make( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] );
  var exp = [ [ 0 ], [ 1 ], [ null ], [ true ], [ false ], [ undefined ], [ '' ], [ [ 2 ] ], [ { a : 0 } ] ];
  var got = src.filter( ( e ) => [ e ] );
  test.is( got !== src );
  test.identical( got.original, exp );

  test.case = 'from array, onEach returns element of array';
  var src = _.containerAdapter.make( [ 0, 1, NaN, true, false, [ undefined ], '', [ 2 ], { a : 0 } ] );
  var exp = [ 2 ];
  var got = src.filter( ( e ) => e[ 0 ] );
  test.is( got !== src );
  test.identical( got.original, exp );

  test.close( 'only onEach' );

  /* - */

  test.open( 'dst === null' );

  test.case = 'from array, onEach returns container';
  var src = _.containerAdapter.make( [ 1 ] );
  var exp = [ src.original ];
  var got = src.filter( null, ( e, k, src ) => src );
  test.is( got !== src );
  test.identical( got.original, exp );

  test.case = 'from array, onEach returns original';
  var src = _.containerAdapter.make( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] );
  var exp = [ 0, 1, null, true, false, '', [ 2 ], { a : 0 } ];
  var got = src.filter( null, ( e ) => e );
  test.is( got !== src );
  test.identical( got.original, exp );

  test.case = 'from array, onEach returns undefined';
  var src = _.containerAdapter.make( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] );
  var exp = [];
  var got = src.filter( null, ( e ) => undefined );
  test.is( got !== src );
  test.identical( got.original, exp );

  test.case = 'from array, onEach returns array';
  var src = _.containerAdapter.make( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] );
  var exp = [ [ 0 ], [ 1 ], [ null ], [ true ], [ false ], [ undefined ], [ '' ], [ [ 2 ] ], [ { a : 0 } ] ];
  var got = src.filter( null, ( e ) => [ e ] );
  test.is( got !== src );
  test.identical( got.original, exp );

  test.case = 'from array, onEach returns element of array';
  var src = _.containerAdapter.make( [ 0, 1, NaN, true, false, [ undefined ], '', [ 2 ], { a : 0 } ] );
  var exp = [ 2 ];
  var got = src.filter( null, ( e ) => e[ 0 ] );
  test.is( got !== src );
  test.identical( got.original, exp );

  test.close( 'dst === null' );

  /* - */

  test.open( 'dst != src' );

  test.case = 'dst - array, from empty array, onEach returns container';
  var dst = [ 1, 2 ];
  var src = _.containerAdapter.make( [] );
  var exp = [ 1, 2 ];
  var got = src.filter( dst, ( e, k, src ) => src );
  test.is( got !== dst );
  test.is( got !== src );
  test.identical( got.original, exp );

  test.case = 'dst - arrayAdapter, from array, onEach returns original';
  var dst = _.containerAdapter.make( [ 1, 2 ] );
  var src = _.containerAdapter.make( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] );
  var exp = [ 1, 2, 0, 1, null, true, false, '', [ 2 ], { a : 0 } ];
  var got = src.filter( dst, ( e ) => e );
  test.is( got === dst );
  test.is( got !== src );
  test.identical( got.original, exp );

  test.case = 'dst - Set, from array, onEach returns undefined';
  var dst = new Set( [ 1, 2 ] );
  var src = _.containerAdapter.make( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] );
  var exp = [ 1, 2 ];
  var got = src.filter( dst, ( e ) => undefined );
  test.is( got.original === dst );
  test.is( got !== src );
  test.identical( [ ... got.original ], exp );

  test.case = 'dst - setAdapter, from array, onEach returns array';
  var dst = _.containerAdapter.make( new Set( [ 1, 2 ] ) );
  var src = _.containerAdapter.make( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] );
  var exp = [ 1, 2, [ 0 ], [ 1 ], [ null ], [ true ], [ false ], [ undefined ], [ '' ], [ [ 2 ] ], [ { a : 0 } ] ];
  var got = src.filter( dst, ( e ) => [ e ] );
  test.is( got === dst );
  test.is( got !== src );
  test.identical( [ ... got.original ], exp );

  test.case = 'dst - array, from array, onEach returns element of array';
  var dst = [ 1, 2 ];
  var src = _.containerAdapter.make( [ 0, 1, NaN, true, false, [ undefined ], '', [ 2 ], { a : 0 } ] );
  var exp = [ 1, 2, 2 ];
  var got = src.filter( dst, ( e ) => e[ 0 ] );
  test.is( got.original === dst );
  test.is( got !== src );
  test.identical( got.original, exp );

  test.close( 'dst != src' );

  /* - */

  test.open( 'dst === src' );

  test.case = 'from empty array, onEach returns container';
  var src = _.containerAdapter.make( [] );
  var exp = [];
  var got = src.filter( src, ( e, k, src ) => src );
  test.is( got === src );
  test.identical( got.original, exp );

  test.case = 'from array, onEach returns original';
  var src = _.containerAdapter.make( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] );
  var exp = [ 0, 1, null, true, false, '', [ 2 ], { a : 0 } ];
  var got = src.filter( src, ( e ) => e );
  test.is( got === src );
  test.identical( got.original, exp );

  test.case = 'from array, onEach returns undefined';
  var src = _.containerAdapter.make( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] );
  var exp = [];
  var got = src.filter( src, ( e ) => undefined );
  test.is( got === src );
  test.identical( got.original, exp );

  test.case = 'from array, onEach returns array';
  var src = _.containerAdapter.make( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] );
  var exp = [ [ 0 ], [ 1 ], [ null ], [ true ], [ false ], [ undefined ], [ '' ], [ [ 2 ] ], [ { a : 0 } ] ];
  var got = src.filter( src, ( e ) => [ e ] );
  test.is( got === src );
  test.identical( got.original, exp );

  test.case = 'from array, onEach returns element of array';
  var src = _.containerAdapter.make( [ 0, 1, NaN, true, false, [ undefined ], '', [ 2 ], { a : 0 } ] );
  var exp = [ 2 ];
  var got = src.filter( src, ( e ) => e[ 0 ] );
  test.is( got === src );
  test.identical( got.original, exp );

  test.close( 'dst === src' );
}

//

function arrayAdapterFlatFilter( test )
{
  test.case = 'without arguments';
  var src = _.containerAdapter.make( [] );
  var exp = [];
  var got = src.flatFilter( null );
  test.is( got !== src );
  test.identical( got.original, exp );

  /* - */

  test.open( 'only onEach' );

  test.case = 'from empty array, onEach returns number';
  var src = _.containerAdapter.make( [] );
  var exp = [];
  var got = src.flatFilter( ( e ) => 123 );
  test.is( got !== src );
  test.identical( got.original, exp );

  test.case = 'from array, onEach returns original';
  var src = _.containerAdapter.make( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] );
  var exp = [ 0, 1, null, true, false, '', 2, { a : 0 } ];
  var got = src.flatFilter( ( e ) => e );
  test.is( got !== src );
  test.identical( got.original, exp );

  test.case = 'from array, onEach returns undefined';
  var src = _.containerAdapter.make( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] );
  var exp = [];
  var got = src.flatFilter( ( e ) => undefined );
  test.is( got !== src );
  test.identical( got.original, exp );

  test.case = 'from array, onEach returns array';
  var src = _.containerAdapter.make( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] );
  var exp = [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ];
  var got = src.flatFilter( ( e ) => [ e ] );
  test.is( got !== src );
  test.identical( got.original, exp );

  test.case = 'from array, onEach returns element of array';
  var src = _.containerAdapter.make( [ 0, 1, NaN, true, false, [ undefined ], '', [ 2 ], { a : 0 } ] );
  var exp = [ 2 ];
  var got = src.flatFilter( ( e ) => e[ 0 ] );
  test.is( got !== src );
  test.identical( got.original, exp );

  test.close( 'only onEach' );

  /* - */

  test.open( 'dst === null' );

  test.case = 'from array, onEach returns container';
  var src = _.containerAdapter.make( [ 1 ] );
  var exp = src.original;
  var got = src.flatFilter( null, ( e, k, src ) => src );
  test.is( got !== src );
  test.identical( got.original, exp );

  test.case = 'from array, onEach returns original';
  var src = _.containerAdapter.make( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] );
  var exp = [ 0, 1, null, true, false, '', 2, { a : 0 } ];
  var got = src.flatFilter( null, ( e ) => e );
  test.is( got !== src );
  test.identical( got.original, exp );

  test.case = 'from array, onEach returns undefined';
  var src = _.containerAdapter.make( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] );
  var exp = [];
  var got = src.flatFilter( null, ( e ) => undefined );
  test.is( got !== src );
  test.identical( got.original, exp );

  test.case = 'from array, onEach returns array';
  var src = _.containerAdapter.make( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] );
  var exp = [ 0, '0', 1, '1', null, 'null', true, 'true', false, 'false', undefined, 'undefined', '', '', [ 2 ], '2', { a : 0 }, '[object Object]' ];
  var got = src.flatFilter( null, ( e ) => [ e, String( e ) ] );
  test.is( got !== src );
  test.identical( got.original, exp );

  test.case = 'from array, onEach returns element of array';
  var src = _.containerAdapter.make( [ 0, 1, NaN, true, false, [ undefined ], '', [ 2 ], { a : 0 } ] );
  var exp = [ 2 ];
  var got = src.flatFilter( null, ( e ) => e[ 0 ] );
  test.is( got !== src );
  test.identical( got.original, exp );

  test.close( 'dst === null' );

  /* - */

  test.open( 'dst != src' );

  test.case = 'dst - array, from empty array, onEach returns container';
  var dst = [ 1, 2 ];
  var src = _.containerAdapter.make( [] );
  var exp = [ 1, 2 ];
  var got = src.flatFilter( dst, ( e, k, src ) => src );
  test.is( got !== dst );
  test.is( got !== src );
  test.identical( got.original, exp );

  test.case = 'dst - arrayAdapter, from array, onEach returns original';
  var dst = _.containerAdapter.make( [ 1, 2 ] );
  var src = _.containerAdapter.make( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] );
  var exp = [ 1, 2, 0, 1, null, true, false, '', 2, { a : 0 } ];
  var got = src.flatFilter( dst, ( e ) => e );
  test.is( got === dst );
  test.is( got !== src );
  test.identical( got.original, exp );

  test.case = 'dst - Set, from array, onEach returns undefined';
  var dst = new Set( [ 1, 2 ] );
  var src = _.containerAdapter.make( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] );
  var exp = [ 1, 2 ];
  var got = src.flatFilter( dst, ( e ) => undefined );
  test.is( got.original === dst );
  test.is( got !== src );
  test.identical( [ ... got.original ], exp );

  test.case = 'dst - setAdapter, from array, onEach returns array';
  var dst = _.containerAdapter.make( new Set( [ 1, 2 ] ) );
  var src = _.containerAdapter.make( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] );
  var exp = [ 1, 2, 0, null, true, false, undefined, '', [ 2 ], { a : 0 } ];
  var got = src.flatFilter( dst, ( e ) => [ e ] );
  test.is( got === dst );
  test.is( got !== src );
  test.identical( [ ... got.original ], exp );

  test.case = 'dst - array, from array, onEach returns element of array';
  var dst = [ 1, 2 ];
  var src = _.containerAdapter.make( [ 0, 1, NaN, true, false, [ undefined ], '', [ 2 ], { a : 0 } ] );
  var exp = [ 1, 2, 2 ];
  var got = src.flatFilter( dst, ( e ) => e[ 0 ] );
  test.is( got.original === dst );
  test.is( got !== src );
  test.identical( got.original, exp );

  test.close( 'dst != src' );

  /* - */

  test.open( 'dst === src' );

  test.case = 'from empty array, onEach returns container';
  var src = _.containerAdapter.make( [] );
  var exp = [];
  var got = src.flatFilter( src, ( e, k, src ) => src );
  test.is( got === src );
  test.identical( got.original, exp );

  test.case = 'from array, onEach returns original';
  var src = _.containerAdapter.make( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] );
  var exp = [ 0, 1, null, true, false, '', [ 2 ], { a : 0 } ];
  var got = src.flatFilter( src, ( e ) => e );
  test.is( got === src );
  test.identical( got.original, exp );

  test.case = 'from array, onEach returns undefined';
  var src = _.containerAdapter.make( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] );
  var exp = [];
  var got = src.flatFilter( src, ( e ) => undefined );
  test.is( got === src );
  test.identical( got.original, exp );

  test.case = 'from array, onEach returns array';
  var src = _.containerAdapter.make( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] );
  var exp = [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ];
  var got = src.flatFilter( src, ( e ) => [ e ] );
  test.is( got === src );
  test.identical( got.original, exp );

  test.case = 'from array, onEach returns element of array';
  var src = _.containerAdapter.make( [ 0, 1, NaN, true, false, [ undefined ], '', [ 2 ], { a : 0 } ] );
  var exp = [ 2 ];
  var got = src.flatFilter( src, ( e ) => e[ 0 ] );
  test.is( got === src );
  test.identical( got.original, exp );

  test.close( 'dst === src' );
}

//

function arrayAdapterOnce( test )
{
  test.case = 'without arguments';
  var src = _.containerAdapter.make( [] );
  var exp = _.containerAdapter.make( [] );
  var got = src.once( null );
  test.is( got !== src );
  test.identical( got.original, exp.original );

  /* - */

  test.open( 'only onEval' );

  test.case = 'onEval returns element';
  var src = _.containerAdapter.make( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] );
  var exp = _.containerAdapter.make( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] );
  var got = src.once( ( e ) => e );
  test.is( got !== src );
  test.identical( got.original, exp.original );

  test.case = 'onEval is simple equalizer';
  var src = _.containerAdapter.make( [ 0, 0, 1, 1, null, true, true, false, undefined, '', [ 2 ], { a : 0 } ] );
  var exp = _.containerAdapter.make( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] );
  var got = src.once( ( e, e2 ) => e === e2 );
  test.is( got !== src );
  test.identical( got.original, exp.original );

  test.case = 'onEval remove undefined';
  var src = _.containerAdapter.make( [ 0, 0, 1, 1, undefined, undefined, undefined, true, false, undefined, '', [ 2 ], { a : 0 } ] );
  var exp = _.containerAdapter.make( [ 0 ] );
  var got = src.once( ( e ) => undefined );
  test.is( got !== src );
  test.identical( got.original, exp.original );

  test.case = 'onEval check element of array';
  var src = _.containerAdapter.make( [ 0, 1, [ null ], [ true ], false, [ undefined ], '', [ 2 ], { a : 0 } ] );
  var exp = _.containerAdapter.make( [ 0, [ null ], [ true ], [ 2 ] ] );
  var got = src.once( ( e ) => e[ 0 ] );
  test.is( got !== src );
  test.identical( got.original, exp.original );

  test.close( 'only onEval' );

  /* - */

  test.open( 'only dst' );

  test.case = 'src - from empty array, dst - empty array, no onEval';
  var src = _.containerAdapter.make( [] );
  var dst = [];
  var exp = _.containerAdapter.make( [] );
  var got = src.once( dst );
  test.is( got !== src );
  test.identical( got.original, exp.original );

  test.case = 'src - from empty array, dst - empty ArrayContainerAdapter, no onEval';
  var src = _.containerAdapter.make( [] );
  var dst = _.containerAdapter.make( [] );
  var exp = _.containerAdapter.make( [] );
  var got = src.once( dst );
  test.is( got !== src );
  test.identical( got.original, exp.original );

  test.case = 'src - from empty array, dst - array, no onEval';
  var src = _.containerAdapter.make( [] );
  var dst = [ 1, 2, 1, 2, null, null, undefined, false, undefined, false ];
  var exp = _.containerAdapter.make( [ 1, 2, 1, 2, null, null, undefined, false, undefined, false ] );
  var got = src.once( dst );
  test.is( got !== src );
  test.identical( got.original, exp.original );

  test.case = 'src - from array, dst - empty array, no onEval';
  var src = _.containerAdapter.make( [ 1, 2, 1, 2, null, null, undefined, false, undefined, false ] );
  var dst = [];
  var exp = _.containerAdapter.make( [ 1, 2, null, undefined, false ] );
  var got = src.once( dst );
  test.is( got !== src );
  test.identical( got.original, exp.original );

  test.case = 'src - from array, append array, no onEval';
  var src = _.containerAdapter.make( [ 1, 2, 1, 2, null, null, undefined, false, undefined, false, [ 2 ], [ 2 ], [ 2 ] ] );
  var dst = [ 1, 2, null, undefined, false ];
  var exp = _.containerAdapter.make( [ 1, 2, null, undefined, false, [ 2 ], [ 2 ], [ 2 ] ] );
  var got = src.once( dst );
  test.is( got !== src );
  test.identical( got.original, exp.original );

  test.case = 'the same containers, no onEval';
  var src = _.containerAdapter.make( [ 1, 2, 1, 2, null, null, undefined, false, undefined, false ] );
  var dst = [ 1, 2, 1, 2, null, null, undefined, false, undefined, false ];
  var exp = _.containerAdapter.make( [ 1, 2, 1, 2, null, null, undefined, false, undefined, false ] );
  var got = src.once( dst );
  test.is( got !== src );
  test.identical( got.original, exp.original );

  test.case = 'the same containers, onEval returns element';
  var src = _.containerAdapter.make( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] );
  var dst = _.containerAdapter.make( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] );
  var exp = _.containerAdapter.make( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 }, [ 2 ], { a : 0 } ] );
  var got = src.once( dst, ( e ) => e );
  test.is( got !== src );
  test.identical( got.original, exp.original );

  test.case = 'the same containers, onEval is simple equalizer';
  var src = _.containerAdapter.make( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] );
  var dst = _.containerAdapter.make( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 }, new U8x( 2 ) ] );
  var exp = _.containerAdapter.make( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 }, new U8x( 2 ), [ 2 ], { a : 0 } ] );
  var got = src.once( dst, ( e, e2 ) => e === e2 );
  test.is( got !== src );
  test.identical( got.original, exp.original );

  test.case = 'different containers, onEval remove undefined';
  var src = _.containerAdapter.make( [ 0, 0, 1, 1, undefined, undefined, undefined, true, false, undefined, '', [ 2 ], { a : 0 } ] );
  var dst = _.containerAdapter.make( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] );
  var exp = _.containerAdapter.make( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] );
  var got = src.once( dst, ( e ) => undefined );
  test.is( got !== src );
  test.identical( got.original, exp.original );

  test.case = 'onEval check element of array, no duplicates in src';
  var src = _.containerAdapter.make( [ 0, 1, [ null ], [ true ], false, [ undefined ], '', [ 2 ], { a : 0 } ] );
  var dst = _.containerAdapter.make( [ 0, 1, [ null ], [ true ], false, [ undefined ], '', [ 2 ], { a : 0 } ] );
  var exp = _.containerAdapter.make( [ 0, 1, [ null ], [ true ], false, [ undefined ], '', [ 2 ], { a : 0 } ] );
  var got = src.once( dst, ( e ) => e[ 0 ] );
  test.is( got !== src );
  test.identical( got.original, exp.original );

  test.case = 'onEval check element of array, duplicates in src';
  var src = _.containerAdapter.make( [ 0, 1, [ null ], [ true ], [ true ], [ true ], false, [ undefined ], '', [ 2 ], { a : 0 } ] );
  var dst = _.containerAdapter.make( [ 0, 1, [ null ], [ true ], false, [ undefined ], '', [ 2 ], { a : 0 } ] );
  var exp = _.containerAdapter.make( [ 0, 1, [ null ], [ true ], false, [ undefined ], '', [ 2 ], { a : 0 } ] );
  var got = src.once( dst, ( e ) => e[ 0 ] );
  test.is( got !== src );
  test.identical( got.original, exp.original );

  test.close( 'only dst' );

  /* - */

  test.open( 'dst === null' );

  test.case = 'src - from empty array, dst - empty array, no onEval';
  var src = _.containerAdapter.make( [] );
  var got = src.once( null );
  var exp = _.containerAdapter.make( [] );
  test.is( got !== src );
  test.identical( got.original, exp.original );

  test.case = 'src - from empty array, dst - empty ArrayContainerAdapter, no onEval';
  var src = _.containerAdapter.make( [] );
  var dst = _.containerAdapter.make( [] );
  var got = src.once( dst );
  var exp = _.containerAdapter.make( [] );
  test.is( got !== src );
  test.identical( got.original, exp.original );

  test.case = 'src - from array, dst - empty array, no onEval';
  var src = _.containerAdapter.make( [ 1, 2, 1, 2, null, null, undefined, false, undefined, false ] );
  var got = src.once( null );
  var exp = _.containerAdapter.make( [ 1, 2, null, undefined, false ] );
  test.is( got !== src );
  test.identical( got.original, exp.original );

  test.case = 'src - from array, append array, no onEval';
  var src = _.containerAdapter.make( [ 1, 2, 1, 2, null, null, undefined, false, undefined, false, [ 2 ], [ 2 ], [ 2 ] ] );
  var got = src.once( null );
  var exp = _.containerAdapter.make( [ 1, 2, null, undefined, false, [ 2 ], [ 2 ], [ 2 ] ] );
  test.is( got !== src );
  test.identical( got.original, exp.original );

  test.case = 'onEval returns element';
  var src = _.containerAdapter.make( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] );
  var got = src.once( null, ( e ) => e );
  var exp = _.containerAdapter.make( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] );
  test.is( got !== src );
  test.identical( got.original, exp.original );

  test.case = 'onEval is simple equalizer';
  var src = _.containerAdapter.make( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] );
  var got = src.once( null, ( e, e2 ) => e === e2 );
  var exp = _.containerAdapter.make( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] );
  test.is( got !== src );
  test.identical( got.original, exp.original );


  test.case = 'onEval remove undefined';
  var src = _.containerAdapter.make( [ 0, 0, 1, 1, undefined, undefined, undefined, true, false, undefined, '', [ 2 ], { a : 0 } ] );
  var got = src.once( null, ( e ) => undefined );
  var exp = _.containerAdapter.make( [ 0 ] );
  test.is( got !== src );
  test.identical( got.original, exp.original );

  test.case = 'onEval check element of array, no duplicates in src';
  var src = _.containerAdapter.make( [ 0, 1, [ null ], [ true ], false, [ undefined ], '', [ 2 ], { a : 0 } ] );
  var got = src.once( null, ( e ) => e[ 0 ] );
  var exp = _.containerAdapter.make( [ 0, [ null ], [ true ], [ 2 ] ] );
  test.is( got !== src );
  test.identical( got.original, exp.original );

  test.case = 'onEval check element of array, duplicates in src';
  var src = _.containerAdapter.make( [ 0, 1, [ null ], [ true ], [ true ], [ true ], false, [ undefined ], '', [ 2 ], { a : 0 } ] );
  var got = src.once( null, ( e ) => e[ 0 ] );
  var exp = _.containerAdapter.make( [ 0, [ null ], [ true ], [ 2 ] ] );
  test.is( got !== src );
  test.identical( got.original, exp.original );

  test.close( 'dst === null' );

  /* - */

  test.open( 'dst === src' );

  test.case = 'src - from empty array, no onEval';
  var src = _.containerAdapter.make( [] );
  var got = src.once( src );
  var exp = _.containerAdapter.make( [] );
  test.is( got === src );
  test.identical( got.original, exp.original );

  test.case = 'src - from empty array, no onEval';
  var src = _.containerAdapter.make( [] );
  var got = src.once( src );
  var exp = _.containerAdapter.make( [] );
  test.is( got === src );
  test.identical( got.original, exp.original );

  test.case = 'src - from array, no onEval';
  var src = _.containerAdapter.make( [ 1, 2, 1, 2, null, null, undefined, false, undefined, false ] );
  var got = src.once( src );
  var exp = _.containerAdapter.make( [ 1, 2, null, undefined, false ] );
  test.is( got === src );
  test.identical( got.original, exp.original );

  test.case = 'src - from array, no onEval';
  var src = _.containerAdapter.make( [ 1, 2, 1, 2, null, null, undefined, false, undefined, false, [ 2 ], [ 2 ], [ 2 ] ] );
  var got = src.once( src );
  var exp = _.containerAdapter.make( [ 1, 2, null, undefined, false, [ 2 ], [ 2 ], [ 2 ] ] );
  test.is( got === src );
  test.identical( got.original, exp.original );

  test.case = 'onEval returns element';
  var src = _.containerAdapter.make( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] );
  var got = src.once( src, ( e ) => e );
  var exp = _.containerAdapter.make( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] );
  test.is( got === src );
  test.identical( got.original, exp.original );

  test.case = 'onEval is simple equalizer';
  var src = _.containerAdapter.make( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] );
  var got = src.once( src, ( e, e2 ) => e === e2 );
  var exp = _.containerAdapter.make( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] );
  test.is( got === src );
  test.identical( got.original, exp.original );

  test.case = 'different containers, onEval remove undefined';
  var src = _.containerAdapter.make( [ 0, 0, 1, 1, undefined, undefined, undefined, true, false, undefined, '', [ 2 ], { a : 0 } ] );
  var got = src.once( src, ( e ) => undefined );
  var exp = _.containerAdapter.make( [ 0 ] );
  test.is( got === src );
  test.identical( got.original, exp.original );

  test.case = 'onEval check element of array, no duplicates in src';
  var src = _.containerAdapter.make( [ 0, 1, [ null ], [ true ], false, [ undefined ], '', [ 2 ], { a : 0 } ] );
  var got = src.once( src, ( e ) => e[ 0 ] );
  var exp = _.containerAdapter.make( [ 0, [ null ], [ true ], [ 2 ] ] );
  test.is( got === src );
  test.identical( got.original, exp.original );

  test.close( 'dst === src' );
}

//

function arrayAdapterEach( test )
{
  test.case = 'without arguments';
  var src = _.containerAdapter.make( [] );
  var exp = [];
  var got = src.each( ( e ) => exp.push( e ) );
  test.is( got === src );
  test.identical( got.original, exp );
  test.identical( exp, [] );

  test.case = 'from empty array, onEach returns number';
  var src = _.containerAdapter.make( [] );
  var exp = [];
  var got = src.each( ( e ) => exp.push( 123 ) );
  test.is( got === src );
  test.identical( got.original, exp );
  test.identical( exp, [] );

  test.case = 'from array, onEach returns original';
  var src = _.containerAdapter.make( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] );
  var exp = [];
  var got = src.each( ( e ) => exp.push( e ) );
  test.is( got === src );
  test.identical( got.original, exp );
  test.identical( exp, [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] );

  test.case = 'from array, onEach returns undefined';
  var src = _.containerAdapter.make( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] );
  var exp = [];
  var got = src.each( ( e ) => exp.push( undefined ) );
  test.is( got === src );
  test.identical( got.original, [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] );
  test.identical( exp, [ undefined, undefined, undefined, undefined, undefined, undefined, undefined, undefined, undefined ] );

  test.case = 'from array, onEach returns array';
  var src = _.containerAdapter.make( [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] );
  var exp = [];
  var got = src.each( ( e ) => exp.push( [ e ] ) );
  test.is( got === src );
  test.identical( got.original, [ 0, 1, null, true, false, undefined, '', [ 2 ], { a : 0 } ] );
  test.identical( exp, [ [ 0 ], [ 1 ], [ null ], [ true ], [ false ], [ undefined ], [ '' ], [ [ 2 ] ], [ { a : 0 } ] ] );

  test.case = 'from array, onEach returns element of array';
  var src = _.containerAdapter.make( [ 0, 1, NaN, true, false, [ undefined ], '', [ 2 ], { a : 0 } ] );
  var exp = [];
  var got = src.each( ( e ) => exp.push( e[ 0 ] ) );
  test.is( got === src );
  test.identical( got.original, [ 0, 1, NaN, true, false, [ undefined ], '', [ 2 ], { a : 0 } ] );
  test.identical( exp, [ undefined, undefined, undefined, undefined, undefined, undefined, undefined, 2, undefined ] );
}

// --
// declaration
// --

var Self =
{

  name : 'Tools.base.ContainerAdapter',
  silencing : 1,

  tests :
  {
    // containerAdapter

    is,
    make,
    from,
    toOriginal,
    toOriginals,

    // ContainerAdapterAbstract

    min,
    max,
    least,
    most,

    onlyWithoutCallbacks,
    onlyOneEvaluator,
    onlyTwoEvaluators,
    onlyEqualizer,

    butWithoutCallbacks,
    butOneEvaluator,
    butTwoEvaluators,
    butEqualizer,

    // SetContainerAdapter

    setAdapterMap,
    setAdapterFilter,
    setAdapterFlatFilter,
    setAdapterOnce,
    setAdapterEach,

    // ArrayContainerAdapter

    arrayAdapterMap,
    arrayAdapterFilter,
    arrayAdapterFlatFilter,
    arrayAdapterOnce,
    arrayAdapterEach,
  }

}

Self = wTestSuite( Self );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

})();
