( function _Typing_test_s_()
{

'use strict';

if( typeof module !== 'undefined' )
{
  let _ = require( '../Layer1.s' );
  _.include( 'wTesting' );
}

let _global = _global_;
let _ = _global_.wTools;

// --
// tests
// --

function nothingIs( test )
{
  test.case = 'without argument';
  var got = _.nothingIs();
  test.identical( got, true );

  test.case = 'check null';
  var got = _.nothingIs( null );
  test.identical( got, true );

  test.case = 'check undefined';
  var got = _.nothingIs( undefined );
  test.identical( got, true );

  test.case = 'check _.nothing';
  var got = _.nothingIs( _.nothing );
  test.identical( got, true );

  test.case = 'check zero';
  var got = _.nothingIs( 0 );
  test.identical( got, false );

  test.case = 'check empty string';
  var got = _.nothingIs( '' );
  test.identical( got, false );

  test.case = 'check false';
  var got = _.nothingIs( false );
  test.identical( got, false );

  test.case = 'check NaN';
  var got = _.nothingIs( NaN );
  test.identical( got, false );

  test.case = 'check Symbol';
  var got = _.nothingIs( Symbol( 'a' ) );
  test.identical( got, false );

  test.case = 'check empty array';
  var got = _.nothingIs( [] );
  test.identical( got, false );

  test.case = 'check empty arguments array';
  var got = _.nothingIs( _.argumentsArrayMake( [] ) );
  test.identical( got, false );

  test.case = 'check empty unroll';
  var got = _.nothingIs( _.unrollMake( [] ) );
  test.identical( got, false );

  test.case = 'check empty map';
  var got = _.nothingIs( {} );
  test.identical( got, false );

  test.case = 'check empty pure map';
  var got = _.nothingIs( Object.create( null ) );
  test.identical( got, false );

  test.case = 'check empty Set';
  var got = _.nothingIs( new Set( [] ) );
  test.identical( got, false );

  test.case = 'check empty Map';
  var got = _.nothingIs( new Map( [] ) );
  test.identical( got, false );

  test.case = 'check empty BufferRaw';
  var got = _.nothingIs( new BufferRaw() );
  test.identical( got, false );

  test.case = 'check empty BufferTyped';
  var got = _.nothingIs( new U8x() );
  test.identical( got, false );

  test.case = 'check number';
  var got = _.nothingIs( 3 );
  test.identical( got, false );

  test.case = 'check bigInt';
  var got = _.nothingIs( 1n );
  test.identical( got, false );

  test.case = 'check string';
  var got = _.nothingIs( 'str' );
  test.identical( got, false );

  test.case = 'check not empty array';
  var got = _.nothingIs( [ null ] );
  test.identical( got, false );

  test.case = 'check not empty map';
  var got = _.nothingIs( { '' : null } );
  test.identical( got, false );

  test.case = 'check instance of constructor';
  function Constr()
  {
    this.x = 1;
    return this;
  };
  var src = new Constr();
  var got = _.nothingIs( src );
  test.identical( got, false );
}

//

function definedIs( test )
{
  test.case = 'without argument';
  var got = _.definedIs();
  test.identical( got, false );

  test.case = 'check null';
  var got = _.definedIs( null );
  test.identical( got, false );

  test.case = 'check undefined';
  var got = _.definedIs( undefined );
  test.identical( got, false );

  test.case = 'check _.nothing';
  var got = _.definedIs( _.nothing );
  test.identical( got, false );

  test.case = 'check zero';
  var got = _.definedIs( 0 );
  test.identical( got, true );

  test.case = 'check empty string';
  var got = _.definedIs( '' );
  test.identical( got, true );

  test.case = 'check false';
  var got = _.definedIs( false );
  test.identical( got, true );

  test.case = 'check NaN';
  var got = _.definedIs( NaN );
  test.identical( got, false );

  test.case = 'check Symbol';
  var got = _.definedIs( Symbol( 'a' ) );
  test.identical( got, true );

  test.case = 'check empty array';
  var got = _.definedIs( [] );
  test.identical( got, true );

  test.case = 'check empty arguments array';
  var got = _.definedIs( _.argumentsArrayMake( [] ) );
  test.identical( got, true );

  test.case = 'check empty unroll';
  var got = _.definedIs( _.unrollMake( [] ) );
  test.identical( got, true );

  test.case = 'check empty map';
  var got = _.definedIs( {} );
  test.identical( got, true );

  test.case = 'check empty pure map';
  var got = _.definedIs( Object.create( null ) );
  test.identical( got, true );

  test.case = 'check empty Set';
  var got = _.definedIs( new Set( [] ) );
  test.identical( got, true );

  test.case = 'check empty Map';
  var got = _.definedIs( new Map( [] ) );
  test.identical( got, true );

  test.case = 'check empty BufferRaw';
  var got = _.definedIs( new BufferRaw() );
  test.identical( got, true );

  test.case = 'check empty BufferTyped';
  var got = _.definedIs( new U8x() );
  test.identical( got, true );

  test.case = 'check number';
  var got = _.definedIs( 3 );
  test.identical( got, true );

  test.case = 'check bigInt';
  var got = _.definedIs( 1n );
  test.identical( got, true );

  test.case = 'check string';
  var got = _.definedIs( 'str' );
  test.identical( got, true );

  test.case = 'check not empty array';
  var got = _.definedIs( [ null ] );
  test.identical( got, true );

  test.case = 'check not empty map';
  var got = _.definedIs( { '' : null } );
  test.identical( got, true );

  test.case = 'check instance of constructor';
  function Constr()
  {
    this.x = 1;
    return this;
  };
  var src = new Constr();
  var got = _.definedIs( src );
  test.identical( got, true );
}

//

function primitiveIs( test )
{
  test.case = 'without argument';
  var got = _.primitiveIs();
  test.identical( got, true );

  test.case = 'check null';
  var got = _.primitiveIs( null );
  test.identical( got, true );

  test.case = 'check undefined';
  var got = _.primitiveIs( undefined );
  test.identical( got, true );

  test.case = 'check _.nothing';
  var got = _.primitiveIs( _.nothing );
  test.identical( got, true );

  test.case = 'check zero';
  var got = _.primitiveIs( 0 );
  test.identical( got, true );

  test.case = 'check empty string';
  var got = _.primitiveIs( '' );
  test.identical( got, true );

  test.case = 'check false';
  var got = _.primitiveIs( false );
  test.identical( got, true );

  test.case = 'check NaN';
  var got = _.primitiveIs( NaN );
  test.identical( got, true );

  test.case = 'check Symbol';
  var got = _.primitiveIs( Symbol( 'a' ) );
  test.identical( got, true );

  test.case = 'check empty array';
  var got = _.primitiveIs( [] );
  test.identical( got, false );

  test.case = 'check empty arguments array';
  var got = _.primitiveIs( _.argumentsArrayMake( [] ) );
  test.identical( got, false );

  test.case = 'check empty unroll';
  var got = _.primitiveIs( _.unrollMake( [] ) );
  test.identical( got, false );

  test.case = 'check empty map';
  var got = _.primitiveIs( {} );
  test.identical( got, false );

  test.case = 'check empty pure map';
  var got = _.primitiveIs( Object.create( null ) );
  test.identical( got, false );

  test.case = 'check empty Set';
  var got = _.primitiveIs( new Set( [] ) );
  test.identical( got, false );

  test.case = 'check empty Map';
  var got = _.primitiveIs( new Map( [] ) );
  test.identical( got, false );

  test.case = 'check empty BufferRaw';
  var got = _.primitiveIs( new BufferRaw() );
  test.identical( got, false );

  test.case = 'check empty BufferTyped';
  var got = _.primitiveIs( new U8x() );
  test.identical( got, false );

  test.case = 'check number';
  var got = _.primitiveIs( 3 );
  test.identical( got, true );

  test.case = 'check bigInt';
  var got = _.primitiveIs( 1n );
  test.identical( got, true );

  test.case = 'check string';
  var got = _.primitiveIs( 'str' );
  test.identical( got, true );

  test.case = 'check not empty array';
  var got = _.primitiveIs( [ null ] );
  test.identical( got, false );

  test.case = 'check not empty map';
  var got = _.primitiveIs( { '' : null } );
  test.identical( got, false );

  test.case = 'check instance of constructor';
  function Constr()
  {
    this.x = 1;
    return this;
  };
  var src = new Constr();
  var got = _.primitiveIs( src );
  test.identical( got, false );
}

//

function symbolIs( test )
{
  test.case = 'without argument';
  var got = _.symbolIs();
  test.identical( got, false );

  test.case = 'check null';
  var got = _.symbolIs( null );
  test.identical( got, false );

  test.case = 'check undefined';
  var got = _.symbolIs( undefined );
  test.identical( got, false );

  test.case = 'check _.nothing';
  var got = _.symbolIs( _.nothing );
  test.identical( got, true );

  test.case = 'check zero';
  var got = _.symbolIs( 0 );
  test.identical( got, false );

  test.case = 'check empty string';
  var got = _.symbolIs( '' );
  test.identical( got, false );

  test.case = 'check false';
  var got = _.symbolIs( false );
  test.identical( got, false );

  test.case = 'check NaN';
  var got = _.symbolIs( NaN );
  test.identical( got, false );

  test.case = 'check Symbol';
  var got = _.symbolIs( Symbol( 'a' ) );
  test.identical( got, true );

  test.case = 'check empty array';
  var got = _.symbolIs( [] );
  test.identical( got, false );

  test.case = 'check empty arguments array';
  var got = _.symbolIs( _.argumentsArrayMake( [] ) );
  test.identical( got, false );

  test.case = 'check empty unroll';
  var got = _.symbolIs( _.unrollMake( [] ) );
  test.identical( got, false );

  test.case = 'check empty map';
  var got = _.symbolIs( {} );
  test.identical( got, false );

  test.case = 'check empty pure map';
  var got = _.symbolIs( Object.create( null ) );
  test.identical( got, false );

  test.case = 'check empty Set';
  var got = _.symbolIs( new Set( [] ) );
  test.identical( got, false );

  test.case = 'check empty Map';
  var got = _.symbolIs( new Map( [] ) );
  test.identical( got, false );

  test.case = 'check empty BufferRaw';
  var got = _.symbolIs( new BufferRaw() );
  test.identical( got, false );

  test.case = 'check empty BufferTyped';
  var got = _.symbolIs( new U8x() );
  test.identical( got, false );

  test.case = 'check number';
  var got = _.symbolIs( 3 );
  test.identical( got, false );

  test.case = 'check bigInt';
  var got = _.symbolIs( 1n );
  test.identical( got, false );

  test.case = 'check string';
  var got = _.symbolIs( 'str' );
  test.identical( got, false );

  test.case = 'check not empty array';
  var got = _.symbolIs( [ null ] );
  test.identical( got, false );

  test.case = 'check not empty map';
  var got = _.symbolIs( { '' : null } );
  test.identical( got, false );

  test.case = 'check instance of constructor';
  function Constr()
  {
    this.x = 1;
    return this;
  };
  var src = new Constr();
  var got = _.symbolIs( src );
  test.identical( got, false );
}

//

function bigIntIs( test )
{
  test.case = 'without argument';
  var got = _.bigIntIs();
  test.identical( got, false );

  test.case = 'check null';
  var got = _.bigIntIs( null );
  test.identical( got, false );

  test.case = 'check undefined';
  var got = _.bigIntIs( undefined );
  test.identical( got, false );

  test.case = 'check _.nothing';
  var got = _.bigIntIs( _.nothing );
  test.identical( got, false );

  test.case = 'check zero';
  var got = _.bigIntIs( 0 );
  test.identical( got, false );

  test.case = 'check empty string';
  var got = _.bigIntIs( '' );
  test.identical( got, false );

  test.case = 'check false';
  var got = _.bigIntIs( false );
  test.identical( got, false );

  test.case = 'check NaN';
  var got = _.bigIntIs( NaN );
  test.identical( got, false );

  test.case = 'check Symbol';
  var got = _.bigIntIs( Symbol( 'a' ) );
  test.identical( got, false );

  test.case = 'check empty array';
  var got = _.bigIntIs( [] );
  test.identical( got, false );

  test.case = 'check empty arguments array';
  var got = _.bigIntIs( _.argumentsArrayMake( [] ) );
  test.identical( got, false );

  test.case = 'check empty unroll';
  var got = _.bigIntIs( _.unrollMake( [] ) );
  test.identical( got, false );

  test.case = 'check empty map';
  var got = _.bigIntIs( {} );
  test.identical( got, false );

  test.case = 'check empty pure map';
  var got = _.bigIntIs( Object.create( null ) );
  test.identical( got, false );

  test.case = 'check empty Set';
  var got = _.bigIntIs( new Set( [] ) );
  test.identical( got, false );

  test.case = 'check empty Map';
  var got = _.bigIntIs( new Map( [] ) );
  test.identical( got, false );

  test.case = 'check empty BufferRaw';
  var got = _.bigIntIs( new BufferRaw() );
  test.identical( got, false );

  test.case = 'check empty BufferTyped';
  var got = _.bigIntIs( new U8x() );
  test.identical( got, false );

  test.case = 'check number';
  var got = _.bigIntIs( 3 );
  test.identical( got, false );

  test.case = 'check bigInt';
  var got = _.bigIntIs( 1n );
  test.identical( got, true );

  test.case = 'check string';
  var got = _.bigIntIs( 'str' );
  test.identical( got, false );

  test.case = 'check not empty array';
  var got = _.bigIntIs( [ null ] );
  test.identical( got, false );

  test.case = 'check not empty map';
  var got = _.bigIntIs( { '' : null } );
  test.identical( got, false );

  test.case = 'check instance of constructor';
  function Constr()
  {
    this.x = 1;
    return this;
  };
  var src = new Constr();
  var got = _.bigIntIs( src );
  test.identical( got, false );
}

// --
//
// --

function vectorAdapterIs( test )
{
  test.case = 'without argument';
  var got = _.vectorAdapterIs();
  test.identical( got, false );

  test.case = 'check null';
  var got = _.vectorAdapterIs( null );
  test.identical( got, false );

  test.case = 'check undefined';
  var got = _.vectorAdapterIs( undefined );
  test.identical( got, false );

  test.case = 'check _.nothing';
  var got = _.vectorAdapterIs( _.nothing );
  test.identical( got, false );

  test.case = 'check zero';
  var got = _.vectorAdapterIs( 0 );
  test.identical( got, false );

  test.case = 'check empty string';
  var got = _.vectorAdapterIs( '' );
  test.identical( got, false );

  test.case = 'check false';
  var got = _.vectorAdapterIs( false );
  test.identical( got, false );

  test.case = 'check NaN';
  var got = _.vectorAdapterIs( NaN );
  test.identical( got, false );

  test.case = 'check Symbol';
  var got = _.vectorAdapterIs( Symbol( 'a' ) );
  test.identical( got, false );

  test.case = 'check empty array';
  var got = _.vectorAdapterIs( [] );
  test.identical( got, false );

  test.case = 'check empty arguments array';
  var got = _.vectorAdapterIs( _.argumentsArrayMake( [] ) );
  test.identical( got, false );

  test.case = 'check empty unroll';
  var got = _.vectorAdapterIs( _.unrollMake( [] ) );
  test.identical( got, false );

  test.case = 'check empty map';
  var got = _.vectorAdapterIs( {} );
  test.identical( got, false );

  test.case = 'check empty pure map';
  var got = _.vectorAdapterIs( Object.create( null ) );
  test.identical( got, false );

  test.case = 'check empty Set';
  var got = _.vectorAdapterIs( new Set( [] ) );
  test.identical( got, false );

  test.case = 'check empty Map';
  var got = _.vectorAdapterIs( new Map( [] ) );
  test.identical( got, false );

  test.case = 'check empty BufferRaw';
  var got = _.vectorAdapterIs( new BufferRaw() );
  test.identical( got, false );

  test.case = 'check empty BufferTyped';
  var got = _.vectorAdapterIs( new U8x() );
  test.identical( got, false );

  test.case = 'check number';
  var got = _.vectorAdapterIs( 3 );
  test.identical( got, false );

  test.case = 'check bigInt';
  var got = _.vectorAdapterIs( 1n );
  test.identical( got, false );

  test.case = 'check string';
  var got = _.vectorAdapterIs( 'str' );
  test.identical( got, false );

  test.case = 'check not empty array';
  var got = _.vectorAdapterIs( [ null ] );
  test.identical( got, false );

  test.case = 'check not empty map';
  var got = _.vectorAdapterIs( { '' : null } );
  test.identical( got, false );

  /* */

  test.case = 'check not empty map';
  var src = Object.create( null );
  src._vectorBuffer = true;
  var got = _.vectorAdapterIs( src );
  test.identical( got, false );

  test.case = 'check not empty map';
  var src = Object.create( null );
  src._vectorBuffer = false;
  var got = _.vectorAdapterIs( src );
  test.identical( got, false );

  test.case = 'check instance of constructor with not own property "constructor"';
  function Constr1()
  {
    this.x = 1;
    return this;
  };
  var src = new Constr1();
  src._vectorBuffer = true;
  var got = _.vectorAdapterIs( src );
  test.identical( got, false );

  test.case = 'check instance of constructor with own property "constructor"';
  function Constr2()
  {
    this.x = 1;
    return this;
  };
  var src = new Constr2();
  src.constructor = Constr2;
  src._vectorBuffer = true;
  var got = _.vectorAdapterIs( src );
  test.identical( got, false );

  test.case = 'check instance of constructor prototyped by another instance with _vectorBuffer property';
  function Constr3()
  {
    this.x = 1;
    return this;
  };
  var proto = new Constr3();
  proto._vectorBuffer = true;
  var src = new Constr3();
  src.prototype = proto;
  var got = _.vectorAdapterIs( src );
  test.identical( got, false );

  test.case = 'check instance of constructor prototyped by another instance with _vectorBuffer and own "constructor" properties';
  function Constr4()
  {
    this.x = 1;
    return this;
  };
  var proto = new Constr4();
  proto._vectorBuffer = true;
  proto.constructor = Constr4;
  var src = new Constr4();
  src.prototype = proto;
  var got = _.vectorAdapterIs( src );
  test.identical( got, false );

  /* Dmytro : the second part of routine in module wMathVector */
}

//

function constructorIsVad( test )
{
  test.case = 'without argument';
  var got = _.constructorIsVad();
  test.identical( got, false );

  test.case = 'check null';
  var got = _.constructorIsVad( null );
  test.identical( got, false );

  test.case = 'check undefined';
  var got = _.constructorIsVad( undefined );
  test.identical( got, false );

  test.case = 'check zero';
  var got = _.constructorIsVad( 0 );
  test.identical( got, false );

  test.case = 'check empty string';
  var got = _.constructorIsVad( '' );
  test.identical( got, false );

  test.case = 'check false';
  var got = _.constructorIsVad( false );
  test.identical( got, false );

  test.case = 'check NaN';
  var got = _.constructorIsVad( NaN );
  test.identical( got, false );

  /* */

  test.case = 'map has property prototype';
  var proto = { a : 1 };
  var src = {};
  src.prototype = proto;
  var got = _.constructorIsVad( src );
  test.identical( got, false );

  test.case = 'map has property prototype and prototype has property _vectorBuffer';
  var proto = { a : 1 };
  proto._vectorBuffer = true;
  var src = {};
  src.prototype = proto;
  var got = _.constructorIsVad( src );
  test.identical( got, true );

  /* */

  test.case = 'check instance of constructor prototyped by another instance without _vectorBuffer property';
  function Constr1()
  {
    this.x = 1;
    return this;
  };
  var proto = new Constr1();
  var src = new Constr1();
  src.prototype = proto;
  var got = _.constructorIsVad( src );
  test.identical( got, false );

  test.case = 'check instance of constructor prototyped by another instance with _vectorBuffer property';
  function Constr2()
  {
    this.x = 1;
    return this;
  };
  var proto = new Constr2();
  proto._vectorBuffer = true;
  var src = new Constr2();
  src.prototype = proto;
  var got = _.constructorIsVad( src );
  test.identical( got, true );

  test.case = 'check instance of constructor prototyped by another instance with _vectorBuffer and own "constructor" properties';
  function Constr3()
  {
    this.x = 1;
    return this;
  };
  var proto = new Constr3();
  proto._vectorBuffer = true;
  proto.constructor = Constr3;
  var src = new Constr3();
  src.prototype = proto;
  var got = _.constructorIsVad( src );
  test.identical( got, true );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'src.prototype is undefined';
  test.shouldThrowErrorSync( () => _.constructorIsVad( [] ) );
  test.shouldThrowErrorSync( () => _.constructorIsVad( {} ) );

  /* Dmytro : the second part of routine in module wMathVector */
}

//

function streamIs( test )
{

  test.open( 'not stream' )

  test.case = 'check null';
  var got = _.streamIs( null );
  test.identical( got, false );

  test.case = 'check undefined';
  var got = _.streamIs( undefined );
  test.identical( got, false );

  test.case = 'check _.nothing';
  var got = _.streamIs( _.nothing );
  test.identical( got, false );

  test.case = 'check zero';
  var got = _.streamIs( 0 );
  test.identical( got, false );

  test.case = 'check empty string';
  var got = _.streamIs( '' );
  test.identical( got, false );

  test.case = 'check false';
  var got = _.streamIs( false );
  test.identical( got, false );

  test.case = 'check NaN';
  var got = _.streamIs( NaN );
  test.identical( got, false );

  test.case = 'check Symbol';
  var got = _.streamIs( Symbol( '' ) );
  test.identical( got, false );

  test.case = 'check empty array';
  var got = _.streamIs( [] );
  test.identical( got, false );

  test.case = 'check empty arguments array';
  var got = _.streamIs( _.argumentsArrayMake( [] ) );
  test.identical( got, false );

  test.case = 'check empty unroll';
  var got = _.streamIs( _.unrollMake( [] ) );
  test.identical( got, false );

  test.case = 'check empty map';
  var got = _.streamIs( {} );
  test.identical( got, false );

  test.case = 'check empty pure map';
  var got = _.streamIs( Object.create( null ) );
  test.identical( got, false );

  test.case = 'check empty Set';
  var got = _.streamIs( new Set( [] ) );
  test.identical( got, false );

  test.case = 'check empty Map';
  var got = _.streamIs( new Map( [] ) );
  test.identical( got, false );

  test.case = 'check empty BufferRaw';
  var got = _.streamIs( new BufferRaw() );
  test.identical( got, false );

  test.case = 'check empty BufferTyped';
  var got = _.streamIs( new U8x() );
  test.identical( got, false );

  test.case = 'check number';
  var got = _.streamIs( 3 );
  test.identical( got, false );

  test.case = 'check bigInt';
  var got = _.streamIs( 1n );
  test.identical( got, false );

  test.case = 'check string';
  var got = _.streamIs( 'str' );
  test.identical( got, false );

  test.case = 'check not empty array';
  var got = _.streamIs( [ null ] );
  test.identical( got, false );

  test.case = 'check not empty map';
  var got = _.streamIs( { '' : null } );
  test.identical( got, false );

  /* */

  test.case = 'check not empty map';
  var src = Object.create( null );
  src._vectorBuffer = true;
  var got = _.streamIs( src );
  test.identical( got, false );

  /* - */

  test.case = 'check instance of constructor';
  var src = new function()
  {
    this.x = 1;
  };
  var got = _.streamIs( src );
  test.identical( got, false );

  test.case = 'check instance of constructor with pipe field';
  var src = new function()
  {
    this.x = 1;
    this.pipe = 13;
  };
  var got = _.streamIs( src );
  test.identical( got, false );

  test.case = 'IMPORTANT! check instance of constructor with pipe method';
  var src = new function()
  {
    this.x = 1;
    this.pipe = () => '';
  };
  var got = _.streamIs( src );
  test.identical( got, false );

  test.close( 'not stream' );

  /* - */

  test.open( 'stream' )

  let stream = require( 'stream' );

  test.case = 'read stream';
  var src = new stream.Readable();
  var got = _.streamIs( src );
  test.identical( got, true );

  test.case = 'read stream';
  var src = new stream.Writable();
  var got = _.streamIs( src );
  test.identical( got, true );

  test.case = 'read stream';
  var src = new stream.Duplex();
  var got = _.streamIs( src );
  test.identical( got, true );

  test.case = 'read stream';
  var src = new stream.Transform();
  var got = _.streamIs( src );
  test.identical( got, true );

  test.close( 'stream' )

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without argument';
  test.shouldThrowErrorSync( () => _.streamIs() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.streamIs( 1, 2 ) );

}

streamIs.experimental = true;

//

// //
//
// function matrixIs( test )
// {
//   test.case = 'without argument';
//   var got = _.matrixIs();
//   test.identical( got, false );
//
//   test.case = 'check null';
//   var got = _.matrixIs( null );
//   test.identical( got, false );
//
//   test.case = 'check undefined';
//   var got = _.matrixIs( undefined );
//   test.identical( got, false );
//
//   test.case = 'check _.nothing';
//   var got = _.matrixIs( _.nothing );
//   test.identical( got, false );
//
//   test.case = 'check zero';
//   var got = _.matrixIs( 0 );
//   test.identical( got, false );
//
//   test.case = 'check empty string';
//   var got = _.matrixIs( '' );
//   test.identical( got, false );
//
//   test.case = 'check false';
//   var got = _.matrixIs( false );
//   test.identical( got, false );
//
//   test.case = 'check NaN';
//   var got = _.matrixIs( NaN );
//   test.identical( got, false );
//
//   test.case = 'check Symbol';
//   var got = _.matrixIs( Symbol( 'a' ) );
//   test.identical( got, false );
//
//   test.case = 'check empty array';
//   var got = _.matrixIs( [] );
//   test.identical( got, false );
//
//   test.case = 'check empty arguments array';
//   var got = _.matrixIs( _.argumentsArrayMake( [] ) );
//   test.identical( got, false );
//
//   test.case = 'check empty unroll';
//   var got = _.matrixIs( _.unrollMake( [] ) );
//   test.identical( got, false );
//
//   test.case = 'check empty map';
//   var got = _.matrixIs( {} );
//   test.identical( got, false );
//
//   test.case = 'check empty pure map';
//   var got = _.matrixIs( Object.create( null ) );
//   test.identical( got, false );
//
//   test.case = 'check empty Set';
//   var got = _.matrixIs( new Set( [] ) );
//   test.identical( got, false );
//
//   test.case = 'check empty Map';
//   var got = _.matrixIs( new Map( [] ) );
//   test.identical( got, false );
//
//   test.case = 'check empty BufferRaw';
//   var got = _.matrixIs( new BufferRaw() );
//   test.identical( got, false );
//
//   test.case = 'check empty BufferTyped';
//   var got = _.matrixIs( new U8x() );
//   test.identical( got, false );
//
//   test.case = 'check number';
//   var got = _.matrixIs( 3 );
//   test.identical( got, false );
//
//   test.case = 'check bigInt';
//   var got = _.matrixIs( 1n );
//   test.identical( got, false );
//
//   test.case = 'check string';
//   var got = _.matrixIs( 'str' );
//   test.identical( got, false );
//
//   test.case = 'check not empty array';
//   var got = _.matrixIs( [ null ] );
//   test.identical( got, false );
//
//   test.case = 'check not empty map';
//   var got = _.matrixIs( { '' : null } );
//   test.identical( got, false );
//
//   test.case = 'check not empty map';
//   var src = Object.create( null );
//   var got = _.matrixIs( src );
//   test.identical( got, false );
//
//   test.case = 'check not empty map';
//   var src = Object.create( null );
//   src.some = false;
//   var got = _.matrixIs( src );
//   test.identical( got, false );
//
//   test.case = 'check instance of constructor with not own property "constructor"';
//   function Constr()
//   {
//     this.x = 1;
//     return this;
//   };
//   var src = new Constr();
//   var got = _.matrixIs( src );
//   test.identical( got, false );
//
//   // instance of _.Matrix tested in wMathMatrix
// }
//
// //
//
// function constructorIsMatrix( test )
// {
//   test.case = 'without argument';
//   var got = _.constructorIsMatrix();
//   test.identical( got, false );
//
//   test.case = 'check null';
//   var got = _.constructorIsMatrix( null );
//   test.identical( got, false );
//
//   test.case = 'check undefined';
//   var got = _.constructorIsMatrix( undefined );
//   test.identical( got, false );
//
//   test.case = 'check _.nothing';
//   var got = _.constructorIsMatrix( _.nothing );
//   test.identical( got, false );
//
//   test.case = 'check zero';
//   var got = _.constructorIsMatrix( 0 );
//   test.identical( got, false );
//
//   test.case = 'check empty string';
//   var got = _.constructorIsMatrix( '' );
//   test.identical( got, false );
//
//   test.case = 'check false';
//   var got = _.constructorIsMatrix( false );
//   test.identical( got, false );
//
//   test.case = 'check NaN';
//   var got = _.constructorIsMatrix( NaN );
//   test.identical( got, false );
//
//   test.case = 'check Symbol';
//   var got = _.constructorIsMatrix( Symbol( 'a' ) );
//   test.identical( got, false );
//
//   test.case = 'check empty array';
//   var got = _.constructorIsMatrix( [] );
//   test.identical( got, false );
//
//   test.case = 'check empty arguments array';
//   var got = _.constructorIsMatrix( _.argumentsArrayMake( [] ) );
//   test.identical( got, false );
//
//   test.case = 'check empty unroll';
//   var got = _.constructorIsMatrix( _.unrollMake( [] ) );
//   test.identical( got, false );
//
//   test.case = 'check empty map';
//   var got = _.constructorIsMatrix( {} );
//   test.identical( got, false );
//
//   test.case = 'check empty pure map';
//   var got = _.constructorIsMatrix( Object.create( null ) );
//   test.identical( got, false );
//
//   test.case = 'check empty Set';
//   var got = _.constructorIsMatrix( new Set( [] ) );
//   test.identical( got, false );
//
//   test.case = 'check empty Map';
//   var got = _.constructorIsMatrix( new Map( [] ) );
//   test.identical( got, false );
//
//   test.case = 'check empty BufferRaw';
//   var got = _.constructorIsMatrix( new BufferRaw() );
//   test.identical( got, false );
//
//   test.case = 'check empty BufferTyped';
//   var got = _.constructorIsMatrix( new U8x() );
//   test.identical( got, false );
//
//   test.case = 'check number';
//   var got = _.constructorIsMatrix( 3 );
//   test.identical( got, false );
//
//   test.case = 'check bigInt';
//   var got = _.constructorIsMatrix( 1n );
//   test.identical( got, false );
//
//   test.case = 'check string';
//   var got = _.constructorIsMatrix( 'str' );
//   test.identical( got, false );
//
//   test.case = 'check not empty array';
//   var got = _.constructorIsMatrix( [ null ] );
//   test.identical( got, false );
//
//   test.case = 'check not empty map';
//   var got = _.constructorIsMatrix( { '' : null } );
//   test.identical( got, false );
//
//   test.case = 'check not empty map';
//   var src = Object.create( null );
//   var got = _.constructorIsMatrix( src );
//   test.identical( got, false );
//
//   test.case = 'check not empty map';
//   var src = Object.create( null );
//   src.some = false;
//   var got = _.constructorIsMatrix( src );
//   test.identical( got, false );
//
//   test.case = 'check instance of constructor with not own property "constructor"';
//   function Constr()
//   {
//     this.x = 1;
//     return this;
//   };
//   var src = new Constr();
//   var got = _.constructorIsMatrix( src );
//   test.identical( got, false );
//
//   // instance of _.Matrix tested in wMathMatrix
// }

//

function consequenceIs( test )
{
  test.case = 'without argument';
  var got = _.consequenceIs();
  test.identical( got, false );

  test.case = 'check null';
  var got = _.consequenceIs( null );
  test.identical( got, false );

  test.case = 'check undefined';
  var got = _.consequenceIs( undefined );
  test.identical( got, false );

  test.case = 'check _.nothing';
  var got = _.consequenceIs( _.nothing );
  test.identical( got, false );

  test.case = 'check zero';
  var got = _.consequenceIs( 0 );
  test.identical( got, false );

  test.case = 'check empty string';
  var got = _.consequenceIs( '' );
  test.identical( got, false );

  test.case = 'check false';
  var got = _.consequenceIs( false );
  test.identical( got, false );

  test.case = 'check NaN';
  var got = _.consequenceIs( NaN );
  test.identical( got, false );

  test.case = 'check Symbol';
  var got = _.consequenceIs( Symbol( 'a' ) );
  test.identical( got, false );

  test.case = 'check empty array';
  var got = _.consequenceIs( [] );
  test.identical( got, false );

  test.case = 'check empty arguments array';
  var got = _.consequenceIs( _.argumentsArrayMake( [] ) );
  test.identical( got, false );

  test.case = 'check empty unroll';
  var got = _.consequenceIs( _.unrollMake( [] ) );
  test.identical( got, false );

  test.case = 'check empty map';
  var got = _.consequenceIs( {} );
  test.identical( got, false );

  test.case = 'check empty pure map';
  var got = _.consequenceIs( Object.create( null ) );
  test.identical( got, false );

  test.case = 'check empty Set';
  var got = _.consequenceIs( new Set( [] ) );
  test.identical( got, false );

  test.case = 'check empty Map';
  var got = _.consequenceIs( new Map( [] ) );
  test.identical( got, false );

  test.case = 'check empty BufferRaw';
  var got = _.consequenceIs( new BufferRaw() );
  test.identical( got, false );

  test.case = 'check empty BufferTyped';
  var got = _.consequenceIs( new U8x() );
  test.identical( got, false );

  test.case = 'check number';
  var got = _.consequenceIs( 3 );
  test.identical( got, false );

  test.case = 'check bigInt';
  var got = _.consequenceIs( 1n );
  test.identical( got, false );

  test.case = 'check string';
  var got = _.consequenceIs( 'str' );
  test.identical( got, false );

  test.case = 'check not empty array';
  var got = _.consequenceIs( [ null ] );
  test.identical( got, false );

  test.case = 'check not empty map';
  var got = _.consequenceIs( { '' : null } );
  test.identical( got, false );

  test.case = 'check not empty map';
  var src = Object.create( null );
  var got = _.consequenceIs( src );
  test.identical( got, false );

  test.case = 'check not empty map';
  var src = Object.create( null );
  src.some = false;
  var got = _.consequenceIs( src );
  test.identical( got, false );

  test.case = 'check instance of constructor with not own property "constructor"';
  function Constr()
  {
    this.x = 1;
    return this;
  };
  var src = new Constr();
  var got = _.consequenceIs( src );
  test.identical( got, false );

  test.case = 'instance of Promise';
  var src = new Promise( ( resolve, reject ) => { return resolve( 0 ) } );
  var got = _.consequenceIs( src );
  test.identical( got, false );

  // instance of _.Consequence tested in module wConsequence
}

//

function consequenceLike( test )
{
  test.case = 'without argument';
  var got = _.consequenceLike();
  test.identical( got, false );

  test.case = 'check null';
  var got = _.consequenceLike( null );
  test.identical( got, false );

  test.case = 'check undefined';
  var got = _.consequenceLike( undefined );
  test.identical( got, false );

  test.case = 'check _.nothing';
  var got = _.consequenceLike( _.nothing );
  test.identical( got, false );

  test.case = 'check zero';
  var got = _.consequenceLike( 0 );
  test.identical( got, false );

  test.case = 'check empty string';
  var got = _.consequenceLike( '' );
  test.identical( got, false );

  test.case = 'check false';
  var got = _.consequenceLike( false );
  test.identical( got, false );

  test.case = 'check NaN';
  var got = _.consequenceLike( NaN );
  test.identical( got, false );

  test.case = 'check Symbol';
  var got = _.consequenceLike( Symbol( 'a' ) );
  test.identical( got, false );

  test.case = 'check empty array';
  var got = _.consequenceLike( [] );
  test.identical( got, false );

  test.case = 'check empty arguments array';
  var got = _.consequenceLike( _.argumentsArrayMake( [] ) );
  test.identical( got, false );

  test.case = 'check empty unroll';
  var got = _.consequenceLike( _.unrollMake( [] ) );
  test.identical( got, false );

  test.case = 'check empty map';
  var got = _.consequenceLike( {} );
  test.identical( got, false );

  test.case = 'check empty pure map';
  var got = _.consequenceLike( Object.create( null ) );
  test.identical( got, false );

  test.case = 'check empty Set';
  var got = _.consequenceLike( new Set( [] ) );
  test.identical( got, false );

  test.case = 'check empty Map';
  var got = _.consequenceLike( new Map( [] ) );
  test.identical( got, false );

  test.case = 'check empty BufferRaw';
  var got = _.consequenceLike( new BufferRaw() );
  test.identical( got, false );

  test.case = 'check empty BufferTyped';
  var got = _.consequenceLike( new U8x() );
  test.identical( got, false );

  test.case = 'check number';
  var got = _.consequenceLike( 3 );
  test.identical( got, false );

  test.case = 'check bigInt';
  var got = _.consequenceLike( 1n );
  test.identical( got, false );

  test.case = 'check string';
  var got = _.consequenceLike( 'str' );
  test.identical( got, false );

  test.case = 'check not empty array';
  var got = _.consequenceLike( [ null ] );
  test.identical( got, false );

  test.case = 'check not empty map';
  var got = _.consequenceLike( { '' : null } );
  test.identical( got, false );

  test.case = 'check not empty map';
  var src = Object.create( null );
  var got = _.consequenceLike( src );
  test.identical( got, false );

  test.case = 'check not empty map';
  var src = Object.create( null );
  src.some = false;
  var got = _.consequenceLike( src );
  test.identical( got, false );

  test.case = 'check instance of constructor with not own property "constructor"';
  function Constr()
  {
    this.x = 1;
    return this;
  };
  var src = new Constr();
  var got = _.consequenceLike( src );
  test.identical( got, false );

  test.case = 'instance of Promise';
  var src = new Promise( ( resolve, reject ) => { return resolve( 0 ) } );
  var got = _.consequenceLike( src );
  test.identical( got, true );

  // instance of _.Consequence tested in module wConsequence
}

//

function promiseIs( test )
{
  test.case = 'without argument';
  var got = _.promiseIs();
  test.identical( got, false );

  test.case = 'check null';
  var got = _.promiseIs( null );
  test.identical( got, false );

  test.case = 'check undefined';
  var got = _.promiseIs( undefined );
  test.identical( got, false );

  test.case = 'check _.nothing';
  var got = _.promiseIs( _.nothing );
  test.identical( got, false );

  test.case = 'check zero';
  var got = _.promiseIs( 0 );
  test.identical( got, false );

  test.case = 'check empty string';
  var got = _.promiseIs( '' );
  test.identical( got, false );

  test.case = 'check false';
  var got = _.promiseIs( false );
  test.identical( got, false );

  test.case = 'check NaN';
  var got = _.promiseIs( NaN );
  test.identical( got, false );

  test.case = 'check Symbol';
  var got = _.promiseIs( Symbol( 'a' ) );
  test.identical( got, false );

  test.case = 'check empty array';
  var got = _.promiseIs( [] );
  test.identical( got, false );

  test.case = 'check empty arguments array';
  var got = _.promiseIs( _.argumentsArrayMake( [] ) );
  test.identical( got, false );

  test.case = 'check empty unroll';
  var got = _.promiseIs( _.unrollMake( [] ) );
  test.identical( got, false );

  test.case = 'check empty map';
  var got = _.promiseIs( {} );
  test.identical( got, false );

  test.case = 'check empty pure map';
  var got = _.promiseIs( Object.create( null ) );
  test.identical( got, false );

  test.case = 'check empty Set';
  var got = _.promiseIs( new Set( [] ) );
  test.identical( got, false );

  test.case = 'check empty Map';
  var got = _.promiseIs( new Map( [] ) );
  test.identical( got, false );

  test.case = 'check empty BufferRaw';
  var got = _.promiseIs( new BufferRaw() );
  test.identical( got, false );

  test.case = 'check empty BufferTyped';
  var got = _.promiseIs( new U8x() );
  test.identical( got, false );

  test.case = 'check number';
  var got = _.promiseIs( 3 );
  test.identical( got, false );

  test.case = 'check bigInt';
  var got = _.promiseIs( 1n );
  test.identical( got, false );

  test.case = 'check string';
  var got = _.promiseIs( 'str' );
  test.identical( got, false );

  test.case = 'check not empty array';
  var got = _.promiseIs( [ null ] );
  test.identical( got, false );

  test.case = 'check not empty map';
  var got = _.promiseIs( { '' : null } );
  test.identical( got, false );

  test.case = 'check not empty map';
  var src = Object.create( null );
  var got = _.promiseIs( src );
  test.identical( got, false );

  test.case = 'check not empty map';
  var src = Object.create( null );
  src.some = false;
  var got = _.promiseIs( src );
  test.identical( got, false );

  test.case = 'check instance of constructor with not own property "constructor"';
  function Constr()
  {
    this.x = 1;
    return this;
  };
  var src = new Constr();
  var got = _.promiseIs( src );
  test.identical( got, false );

  test.case = 'instance of Promise';
  var src = new Promise( ( resolve, reject ) => { return resolve( 0 ) } );
  var got = _.promiseIs( src );
  test.identical( got, true );

  test.case = 'function _Promise';
  function _Promise(){}
  var src = new _Promise();
  var got = _.promiseIs( src );
  test.identical( got, false );
}

//

function promiseLike( test )
{
  test.case = 'without argument';
  var got = _.promiseLike();
  test.identical( got, false );

  test.case = 'check null';
  var got = _.promiseLike( null );
  test.identical( got, false );

  test.case = 'check undefined';
  var got = _.promiseLike( undefined );
  test.identical( got, false );

  test.case = 'check _.nothing';
  var got = _.promiseLike( _.nothing );
  test.identical( got, false );

  test.case = 'check zero';
  var got = _.promiseLike( 0 );
  test.identical( got, false );

  test.case = 'check empty string';
  var got = _.promiseLike( '' );
  test.identical( got, false );

  test.case = 'check false';
  var got = _.promiseLike( false );
  test.identical( got, false );

  test.case = 'check NaN';
  var got = _.promiseLike( NaN );
  test.identical( got, false );

  test.case = 'check Symbol';
  var got = _.promiseLike( Symbol( 'a' ) );
  test.identical( got, false );

  test.case = 'check empty array';
  var got = _.promiseLike( [] );
  test.identical( got, false );

  test.case = 'check empty arguments array';
  var got = _.promiseLike( _.argumentsArrayMake( [] ) );
  test.identical( got, false );

  test.case = 'check empty unroll';
  var got = _.promiseLike( _.unrollMake( [] ) );
  test.identical( got, false );

  test.case = 'check empty map';
  var got = _.promiseLike( {} );
  test.identical( got, false );

  test.case = 'check empty pure map';
  var got = _.promiseLike( Object.create( null ) );
  test.identical( got, false );

  test.case = 'check empty Set';
  var got = _.promiseLike( new Set( [] ) );
  test.identical( got, false );

  test.case = 'check empty Map';
  var got = _.promiseLike( new Map( [] ) );
  test.identical( got, false );

  test.case = 'check empty BufferRaw';
  var got = _.promiseLike( new BufferRaw() );
  test.identical( got, false );

  test.case = 'check empty BufferTyped';
  var got = _.promiseLike( new U8x() );
  test.identical( got, false );

  test.case = 'check number';
  var got = _.promiseLike( 3 );
  test.identical( got, false );

  test.case = 'check bigInt';
  var got = _.promiseLike( 1n );
  test.identical( got, false );

  test.case = 'check string';
  var got = _.promiseLike( 'str' );
  test.identical( got, false );

  test.case = 'check not empty array';
  var got = _.promiseLike( [ null ] );
  test.identical( got, false );

  test.case = 'check not empty map';
  var got = _.promiseLike( { '' : null } );
  test.identical( got, false );

  test.case = 'check not empty map';
  var src = Object.create( null );
  var got = _.promiseLike( src );
  test.identical( got, false );

  test.case = 'check not empty map';
  var src = Object.create( null );
  src.some = false;
  var got = _.promiseLike( src );
  test.identical( got, false );

  test.case = 'check instance of constructor with not own property "constructor"';
  function Constr()
  {
    this.x = 1;
    return this;
  };
  var src = new Constr();
  var got = _.promiseLike( src );
  test.identical( got, false );

  test.case = 'instance of Promise';
  var src = new Promise( ( resolve, reject ) => { return resolve( 0 ) } );
  var got = _.promiseLike( src );
  test.identical( got, true );

  test.case = 'function _Promise';
  function _Promise(){}
  var src = new _Promise();
  var got = _.promiseLike( src );
  test.identical( got, false );
}

//

function typeOf( test )
{
  test.open( 'one argument' );

  test.case = 'check null';
  var src = null;
  var got = _.typeOf( src );
  test.identical( got, null );

  test.case = 'check undefined';
  var src = undefined;
  var got = _.typeOf( src );
  test.identical( got, null );

  test.case = 'check zero';
  var src = 0;
  var got = _.typeOf( src );
  test.identical( got, src.constructor );
  test.identical( got.name, 'Number' );

  test.case = 'check false';
  var src = false;
  var got = _.typeOf( src );
  test.identical( got, src.constructor );
  test.identical( got.name, 'Boolean' );

  test.case = 'check NaN';
  var src = NaN;
  var got = _.typeOf( src );
  test.identical( got, src.constructor );
  test.identical( got.name, 'Number' );

  test.case = 'check array';
  var src = [ 1, 2 ];
  var got = _.typeOf( src );
  test.identical( got, src.constructor );
  test.identical( got.name, 'Array' );

  test.case = 'check empty arguments array';
  var src = _.argumentsArrayMake( [] );
  var got = _.typeOf( src );
  test.identical( got, src.constructor );
  test.identical( got.name, 'Object' );

  test.case = 'check empty unroll';
  var src = _.unrollMake( [] );
  var got = _.typeOf( src );
  test.identical( got, src.constructor );
  test.identical( got.name, 'Array' );

  test.case = 'check map';
  var src = { a : 2 };
  var got = _.typeOf( src );
  test.identical( got, src.constructor );
  test.identical( got.name, 'Object' );

  test.case = 'check pure map';
  var src = Object.create( null );
  src.a = 2;
  var got = _.typeOf( src );
  test.identical( got, null );

  test.case = 'check Set';
  var src = new Set( [] );
  var got = _.typeOf( src );
  test.identical( got, src.constructor );
  test.identical( got.name, 'Set' );

  test.case = 'check HashMap';
  var src = new Map( [ [ 1, 1 ] ] );
  var got = _.typeOf( src );
  test.identical( got, src.constructor );
  test.identical( got.name, 'Map' );

  test.case = 'check BufferRaw';
  var src = new BufferRaw( 10 );
  var got = _.typeOf( src );
  test.identical( got, src.constructor );
  test.identical( got.name, 'ArrayBuffer' );

  test.case = 'check BufferTyped';
  var src = new U8x( [ 1, 2 ] );
  var got = _.typeOf( src );
  test.identical( got, src.constructor );
  test.identical( got.name, 'Uint8Array' );

  test.case = 'check instance of constructor';
  function Constr()
  {
    this.x = 1;
    return this;
  };
  var src = new Constr();
  var got = _.typeOf( src );
  test.identical( got, src.constructor );
  test.identical( got.name, 'Constr' );

  test.case = 'instance of Promise';
  var src = new Promise( ( resolve, reject ) => { return resolve( 0 ) } );
  var got = _.typeOf( src );
  test.identical( got, src.constructor );
  test.identical( got.name, 'Promise' );

  test.case = 'function _Promise';
  var _Promise = Promise;
  function Promise(){}
  var src = new _Promise();
  var got = _.typeOf( src );
  test.identical( got, src.constructor );
  test.identical( got.name, 'Promise' );

  test.close( 'one argument' );

  /* - */

  test.open( 'two arguments' );

  test.case = 'check null';
  var src = null;
  var got = _.typeOf( src, null );
  test.identical( got, true );

  test.case = 'check undefined';
  var src = undefined;
  var got = _.typeOf( src, null );
  test.identical( got, true );

  test.case = 'check zero';
  var src = 0;
  var src1 = 1;
  var got = _.typeOf( src, src1.constructor );
  test.identical( got, true );

  test.case = 'check false';
  var src = false;
  var src1 = true;
  var got = _.typeOf( src, src1.constructor );
  test.identical( got, true );

  test.case = 'check NaN';
  var src = NaN;
  var src1 = 2;
  var got = _.typeOf( src, src1.constructor );
  test.identical( got, true );

  test.case = 'check array';
  var src = [ 1, 2 ];
  var src1 = [];
  var got = _.typeOf( src, src1.constructor );
  test.identical( got, true );

  test.case = 'check empty arguments array';
  var src = _.argumentsArrayMake( [] );
  var src1 = _.argumentsArrayMake( [ 1, 2 ] );
  var got = _.typeOf( src, src1.constructor );
  test.identical( got, true );

  test.case = 'check empty unroll';
  var src = _.unrollMake( [] );
  var src1 = [ 1, 2 ];
  var got = _.typeOf( src, src1.constructor );
  test.identical( got, true );

  test.case = 'check map';
  var src = { a : 2 };
  var src1 = {};
  var got = _.typeOf( src, src1.constructor );
  test.identical( got, true );

  test.case = 'check pure map';
  var src = Object.create( null );
  src.a = 2;
  var src1 = null;
  var got = _.typeOf( src, src1 );
  test.identical( got, true );

  test.case = 'check Set';
  var src = new Set( [] );
  var src1 = new Set( [ 1, 2, 3 ] );
  var got = _.typeOf( src, src1.constructor );
  test.identical( got, true );

  test.case = 'check HashMap';
  var src = new Map( [ [ 1, 1 ] ] );
  var src1 = new Map();
  var got = _.typeOf( src, src1.constructor );
  test.identical( got, true );

  test.case = 'check BufferRaw';
  var src = new BufferRaw( 10 );
  var src1 = new U8x( 10 ).buffer;
  var got = _.typeOf( src, src1.constructor );
  test.identical( got, true );

  test.case = 'check BufferTyped';
  var src = new U8x( [ 1, 2 ] );
  var src1 = new U8x();
  var got = _.typeOf( src, src1.constructor );
  test.identical( got, true );

  test.case = 'check instance of constructor';
  function Constr()
  {
    this.x = 1;
    return this;
  };
  var src = new Constr();
  var got = _.typeOf( src, src.constructor );
  test.identical( got, true );

  test.case = 'instance of Promise';
  var src = new Promise( ( resolve, reject ) => { return resolve( 0 ) } );
  var src1 = new Promise( ( resolve, reject ) => { return resolve( 1 ) } );
  var got = _.typeOf( src, src1.constructor );
  test.identical( got, true );

  test.case = 'function _Promise';
  function _Promise(){}
  var src = new _Promise();
  var src1 = new _Promise();
  var got = _.typeOf( src, src1.constructor );
  test.identical( got, true );

  test.close( 'two arguments' );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.typeOf() );

  test.case = 'src - Symbol';
  test.shouldThrowErrorSync( () => _.typeOf( Symbol( 'a' ) ) );

  test.case = 'src - BigInt';
  test.shouldThrowErrorSync( () => _.typeOf( 1n ) );
}

//

function isPrototypeOf( test )
{
  test.open( 'subPrototype === superPrototype' );

  var prototypeOf = _.isPrototypeOf;

  test.case = 'check null';
  var src = null;
  var got = prototypeOf( src, src );
  test.identical( got, true );

  test.case = 'check undefined';
  var src = undefined;
  var got = prototypeOf( src, src );
  test.identical( got, true );

  test.case = 'check zero';
  var src = 0;
  var got = prototypeOf( src, src );
  test.identical( got, true );

  test.case = 'check false';
  var src = false;
  var got = prototypeOf( src, src );
  test.identical( got, true );

  test.case = 'check NaN';
  var src = NaN;
  var got = prototypeOf( src, src );
  test.identical( got, false );

  test.case = 'check array';
  var src = [ 1, 2 ];
  var got = prototypeOf( src, src );
  test.identical( got, true );

  test.case = 'check empty arguments array';
  var src = _.argumentsArrayMake( [] );
  var got = prototypeOf( src, src );
  test.identical( got, true );

  test.case = 'check empty unroll';
  var src = _.unrollMake( [] );
  var got = prototypeOf( src, src );
  test.identical( got, true );

  test.case = 'check map';
  var src = { a : 2 };
  var got = prototypeOf( src, src );
  test.identical( got, true );

  test.case = 'check pure map';
  var src = Object.create( null );
  src.a = 2;
  var got = prototypeOf( src, src );
  test.identical( got, true );

  test.case = 'check Set';
  var src = new Set( [] );
  var got = prototypeOf( src, src );
  test.identical( got, true );

  test.case = 'check HashMap';
  var src = new Map( [ [ 1, 1 ] ] );
  var got = prototypeOf( src, src );
  test.identical( got, true );

  test.case = 'check BufferRaw';
  var src = new BufferRaw( 10 );
  var got = prototypeOf( src, src );
  test.identical( got, true );

  test.case = 'check BufferTyped';
  var src = new U8x( [ 1, 2 ] );
  var got = prototypeOf( src, src );
  test.identical( got, true );

  test.case = 'check BigIng';
  var src = 1n;
  var got = prototypeOf( src, src );
  test.identical( got, true );

  test.case = 'check instance of constructor';
  function Constr()
  {
    this.x = 1;
    return this;
  };
  var src = new Constr();
  var got = prototypeOf( src, src );
  test.identical( got, true );

  test.case = 'instance of Promise';
  var src = new Promise( ( resolve, reject ) => { return resolve( 0 ) } );
  var got = prototypeOf( src, src );
  test.identical( got, true );

  test.case = 'function _Promise';
  function _Promise(){}
  var src = new _Promise();
  var got = prototypeOf( src, src );
  test.identical( got, true );

  test.close( 'subPrototype === superPrototype' );

  /* - */

  test.open( 'one argument is undefines' );

  test.case = 'check null';
  var src = null;
  var got = prototypeOf( src, undefined );
  test.identical( got, false );

  test.case = 'check undefined';
  var src = undefined;
  var got = prototypeOf( src, null );
  test.identical( got, false );

  test.case = 'check zero';
  var src = 0;
  var got = prototypeOf( false, src );
  test.identical( got, false );

  test.case = 'check false';
  var src = false;
  var got = prototypeOf( undefined, src );
  test.identical( got, false );

  test.case = 'check NaN';
  var src = NaN;
  var got = prototypeOf( src, src );
  test.identical( got, false );

  test.case = 'check array';
  var src = [ 1, 2 ];
  var got = prototypeOf( false, src );
  test.identical( got, false );

  test.case = 'check empty arguments array';
  var src = _.argumentsArrayMake( [] );
  var got = prototypeOf( src, null );
  test.identical( got, false );

  test.case = 'check empty unroll';
  var src = _.unrollMake( [] );
  var got = prototypeOf( 0, src );
  test.identical( got, false );

  test.case = 'check map';
  var src = { a : 2 };
  var got = prototypeOf( src, undefined );
  test.identical( got, false );

  test.case = 'check pure map';
  var src = Object.create( null );
  src.a = 2;
  var got = prototypeOf( null, src );
  test.identical( got, false );

  test.case = 'check Set';
  var src = new Set( [] );
  var got = prototypeOf( src, false );
  test.identical( got, false );

  test.case = 'check HashMap';
  var src = new Map( [ [ 1, 1 ] ] );
  var got = prototypeOf( null, src );
  test.identical( got, false );

  test.case = 'check BufferRaw';
  var src = new BufferRaw( 10 );
  var got = prototypeOf( src, undefined );
  test.identical( got, false );

  test.case = 'check BufferTyped';
  var src = new U8x( [ 1, 2 ] );
  var got = prototypeOf( false, src );
  test.identical( got, false );

  test.case = 'check BigIng';
  var src = 1n;
  var got = prototypeOf( null, src );
  test.identical( got, false );

  test.case = 'check instance of constructor';
  function Constr()
  {
    this.x = 1;
    return this;
  };
  var src = new Constr();
  var got = prototypeOf( src, undefined );
  test.identical( got, false );

  test.case = 'instance of Promise';
  var src = new Promise( ( resolve, reject ) => { return resolve( 0 ) } );
  var got = prototypeOf( false, src );
  test.identical( got, false );

  test.case = 'function _Promise';
  function _Promise(){}
  var src = new _Promise();
  var got = prototypeOf( undefined, src );
  test.identical( got, false );


  test.close( 'one argument is undefines' );

  /* - */

  test.open( 'two objects' );

  test.case = 'subPrototype - Object.prototype, superPrototype - simple map';
  var src = {};
  var got = prototypeOf( Object.prototype, src );
  test.identical( got, true );

  test.case = 'subPrototype - simple map, superPrototype - Object.prototype';
  var src = {};
  var got = prototypeOf( src, Object.prototype );
  test.identical( got, false );

  test.case = 'subPrototype - simple map, superPrototype - simple map';
  var src = {};
  var got = prototypeOf( src, {} );
  test.identical( got, false );

  test.case = 'subPrototype - simple map, superPrototype - pure map';
  var src = {};
  var got = prototypeOf( src, Object.create( null ) );
  test.identical( got, false );

  test.case = 'subPrototype - pure map, superPrototype - simple map';
  var src = {};
  var got = prototypeOf( Object.create( null ), src );
  test.identical( got, false );

  test.case = 'subPrototype - pure map, superPrototype - Object.prototype';
  var src = Object.create( null );
  var got = prototypeOf( src, Object.prototype );
  test.identical( got, false );

  test.case = 'subPrototype - Object.prototype, superPrototype - pure map';
  var src = Object.create( null );
  var got = prototypeOf( Object.prototype, src );
  test.identical( got, false );

  test.case = 'subPrototype - pure map, superPrototype - simple map';
  var src = Object.create( null );
  var got = prototypeOf( src, {} );
  test.identical( got, false );

  test.case = 'subPrototype - pure map, superPrototype - simple map';
  var src = Object.create( null );
  var got = prototypeOf( {}, src );
  test.identical( got, false );

  test.case = 'subPrototype - pure map, superPrototype - pure map';
  var src = Object.create( null );
  var got = prototypeOf( src, Object.create( null ) );
  test.identical( got, false );

  test.case = 'subPrototype - pure map, superPrototype - pure map from subPrototype';
  var prototype = Object.create( null );
  var src = Object.create( prototype );
  var got = prototypeOf( prototype, src );
  test.identical( got, true );

  test.case = 'subPrototype - pure map from superPrototype, superPrototype - pure map';
  var prototype = Object.create( null );
  var src = Object.create( prototype );
  var got = prototypeOf( src, prototype );
  test.identical( got, false );

  test.case = 'subPrototype - pure map from prototype, superPrototype - Object.prototype';
  var prototype = Object.create( null );
  var src = Object.create( prototype );
  var got = prototypeOf( src, Object.prototype );
  test.identical( got, false );

  test.case = 'subPrototype - Object.prototype, superPrototype - pure map from prototype';
  var prototype = Object.create( null );
  var src = Object.create( prototype );
  var got = prototypeOf( Object.prototype, src );
  test.identical( got, false );

  test.case = 'subPrototype - pure map from prototype, superPrototype - simple map';
  var prototype = Object.create( null );
  var src = Object.create( prototype );
  var got = prototypeOf( src, {} );
  test.identical( got, false );

  test.case = 'subPrototype - simple map, superPrototype - pure map from prototype';
  var prototype = Object.create( null );
  var src = Object.create( prototype );
  var got = prototypeOf( {}, src );
  test.identical( got, false );

  test.case = 'subPrototype - pure map from prototype, superPrototype - pure map';
  var prototype = Object.create( null );
  var src = Object.create( prototype );
  var got = prototypeOf( src, Object.create( null ) );
  test.identical( got, false );

  test.case = 'subPrototype - pure map, superPrototype - pure map from prototype';
  var prototype = Object.create( null );
  var src = Object.create( prototype );
  var got = prototypeOf( Object.create( null ), src );
  test.identical( got, false );

  /* */

  test.case = 'one constructor prototyped by another, not prototype';
  function proto01(){ this.a = 0; return this };
  function proto02(){ this.x = 1; return this };
  proto02.prototype = new proto01();
  function prototyped0(){ this.y = 1; return this };
  prototyped0.prototype = new proto02();
  var src = new prototyped0();
  var got = prototypeOf( src, proto02.prototype );
  test.identical( got, false );

  test.case = 'one constructor prototyped by another, prototype';
  function proto11(){ this.a = 0; return this };
  function proto12(){ this.x = 1; return this };
  proto12.prototype = new proto11();
  function prototyped1(){ this.y = 1; return this };
  prototyped1.prototype = new proto12();
  var src = new prototyped1();
  var got = prototypeOf( proto12.prototype, src );
  test.identical( got, true );

  test.close( 'two objects' );
}

//

function prototypeHas( test )
{
  test.open( 'subPrototype === superPrototype' );

  test.case = 'check null';
  var src = null;
  var got = _.prototypeHas( src, src );
  test.identical( got, true );

  test.case = 'check undefined';
  var src = undefined;
  var got = _.prototypeHas( src, src );
  test.identical( got, true );

  test.case = 'check zero';
  var src = 0;
  var got = _.prototypeHas( src, src );
  test.identical( got, true );

  test.case = 'check false';
  var src = false;
  var got = _.prototypeHas( src, src );
  test.identical( got, true );

  test.case = 'check NaN';
  var src = NaN;
  var got = _.prototypeHas( src, src );
  test.identical( got, false );

  test.case = 'check array';
  var src = [ 1, 2 ];
  var got = _.prototypeHas( src, src );
  test.identical( got, true );

  test.case = 'check empty arguments array';
  var src = _.argumentsArrayMake( [] );
  var got = _.prototypeHas( src, src );
  test.identical( got, true );

  test.case = 'check empty unroll';
  var src = _.unrollMake( [] );
  var got = _.prototypeHas( src, src );
  test.identical( got, true );

  test.case = 'check map';
  var src = { a : 2 };
  var got = _.prototypeHas( src, src );
  test.identical( got, true );

  test.case = 'check pure map';
  var src = Object.create( null );
  src.a = 2;
  var got = _.prototypeHas( src, src );
  test.identical( got, true );

  test.case = 'check Set';
  var src = new Set( [] );
  var got = _.prototypeHas( src, src );
  test.identical( got, true );

  test.case = 'check HashMap';
  var src = new Map( [ [ 1, 1 ] ] );
  var got = _.prototypeHas( src, src );
  test.identical( got, true );

  test.case = 'check BufferRaw';
  var src = new BufferRaw( 10 );
  var got = _.prototypeHas( src, src );
  test.identical( got, true );

  test.case = 'check BufferTyped';
  var src = new U8x( [ 1, 2 ] );
  var got = _.prototypeHas( src, src );
  test.identical( got, true );

  test.case = 'check BigIng';
  var src = 1n;
  var got = _.prototypeHas( src, src );
  test.identical( got, true );

  test.case = 'check instance of constructor';
  function Constr()
  {
    this.x = 1;
    return this;
  };
  var src = new Constr();
  var got = _.prototypeHas( src, src );
  test.identical( got, true );

  test.case = 'instance of Promise';
  var src = new Promise( ( resolve, reject ) => { return resolve( 0 ) } );
  var got = _.prototypeHas( src, src );
  test.identical( got, true );

  test.case = 'function _Promise';
  function _Promise(){}
  var src = new _Promise();
  var got = _.prototypeHas( src, src );
  test.identical( got, true );

  test.close( 'subPrototype === superPrototype' );

  /* - */

  test.open( 'one argument is undefines' );

  test.case = 'check null';
  var src = null;
  var got = _.prototypeHas( src, undefined );
  test.identical( got, false );

  test.case = 'check undefined';
  var src = undefined;
  var got = _.prototypeHas( src, null );
  test.identical( got, false );

  test.case = 'check zero';
  var src = 0;
  var got = _.prototypeHas( false, src );
  test.identical( got, false );

  test.case = 'check false';
  var src = false;
  var got = _.prototypeHas( undefined, src );
  test.identical( got, false );

  test.case = 'check NaN';
  var src = NaN;
  var got = _.prototypeHas( src, src );
  test.identical( got, false );

  test.case = 'check array';
  var src = [ 1, 2 ];
  var got = _.prototypeHas( false, src );
  test.identical( got, false );

  test.case = 'check empty arguments array';
  var src = _.argumentsArrayMake( [] );
  var got = _.prototypeHas( src, null );
  test.identical( got, false );

  test.case = 'check empty unroll';
  var src = _.unrollMake( [] );
  var got = _.prototypeHas( 0, src );
  test.identical( got, false );

  test.case = 'check map';
  var src = { a : 2 };
  var got = _.prototypeHas( src, undefined );
  test.identical( got, false );

  test.case = 'check pure map';
  var src = Object.create( null );
  src.a = 2;
  var got = _.prototypeHas( null, src );
  test.identical( got, false );

  test.case = 'check Set';
  var src = new Set( [] );
  var got = _.prototypeHas( src, false );
  test.identical( got, false );

  test.case = 'check HashMap';
  var src = new Map( [ [ 1, 1 ] ] );
  var got = _.prototypeHas( null, src );
  test.identical( got, false );

  test.case = 'check BufferRaw';
  var src = new BufferRaw( 10 );
  var got = _.prototypeHas( src, undefined );
  test.identical( got, false );

  test.case = 'check BufferTyped';
  var src = new U8x( [ 1, 2 ] );
  var got = _.prototypeHas( false, src );
  test.identical( got, false );

  test.case = 'check BigIng';
  var src = 1n;
  var got = _.prototypeHas( null, src );
  test.identical( got, false );

  test.case = 'check instance of constructor';
  function Constr()
  {
    this.x = 1;
    return this;
  };
  var src = new Constr();
  var got = _.prototypeHas( src, undefined );
  test.identical( got, false );

  test.case = 'instance of Promise';
  var src = new Promise( ( resolve, reject ) => { return resolve( 0 ) } );
  var got = _.prototypeHas( false, src );
  test.identical( got, false );

  test.case = 'function _Promise';
  function _Promise(){}
  var src = new _Promise();
  var got = _.prototypeHas( undefined, src );
  test.identical( got, false );


  test.close( 'one argument is undefines' );

  /* - */

  test.open( 'two objects' );

  test.case = 'superPrototype - Object.prototype, subPrototype - simple map';
  var src = {};
  var got = _.prototypeHas( Object.prototype, src );
  test.identical( got, false );

  test.case = 'superPrototype - simple map, subPrototype - Object.prototype';
  var src = {};
  var got = _.prototypeHas( src, Object.prototype );
  test.identical( got, true );

  test.case = 'superPrototype - simple map, subPrototype - simple map';
  var src = {};
  var got = _.prototypeHas( src, {} );
  test.identical( got, false );

  test.case = 'superPrototype - simple map, subPrototype - pure map';
  var src = {};
  var got = _.prototypeHas( src, Object.create( null ) );
  test.identical( got, false );

  test.case = 'superPrototype - pure map, subPrototype - simple map';
  var src = {};
  var got = _.prototypeHas( Object.create( null ), src );
  test.identical( got, false );

  test.case = 'superPrototype - pure map, subPrototype - Object.prototype';
  var src = Object.create( null );
  var got = _.prototypeHas( src, Object.prototype );
  test.identical( got, false );

  test.case = 'superPrototype - Object.prototype, subPrototype - pure map';
  var src = Object.create( null );
  var got = _.prototypeHas( Object.prototype, src );
  test.identical( got, false );

  test.case = 'superPrototype - pure map, subPrototype - simple map';
  var src = Object.create( null );
  var got = _.prototypeHas( src, {} );
  test.identical( got, false );

  test.case = 'superPrototype - pure map, subPrototype - simple map';
  var src = Object.create( null );
  var got = _.prototypeHas( {}, src );
  test.identical( got, false );

  test.case = 'superPrototype - pure map, subPrototype - pure map';
  var src = Object.create( null );
  var got = _.prototypeHas( src, Object.create( null ) );
  test.identical( got, false );

  test.case = 'superPrototype - pure map, subPrototype - pure map from superPrototype';
  var prototype = Object.create( null );
  var src = Object.create( prototype );
  var got = _.prototypeHas( prototype, src );
  test.identical( got, false );

  test.case = 'superPrototype - pure map from subPrototype, subPrototype - pure map';
  var prototype = Object.create( null );
  var src = Object.create( prototype );
  var got = _.prototypeHas( src, prototype );
  test.identical( got, true );

  test.case = 'superPrototype - pure map from prototype, subPrototype - Object.prototype';
  var prototype = Object.create( null );
  var src = Object.create( prototype );
  var got = _.prototypeHas( src, Object.prototype );
  test.identical( got, false );

  test.case = 'superPrototype - Object.prototype, subPrototype - pure map from prototype';
  var prototype = Object.create( null );
  var src = Object.create( prototype );
  var got = _.prototypeHas( Object.prototype, src );
  test.identical( got, false );

  test.case = 'superPrototype - pure map from prototype, subPrototype - simple map';
  var prototype = Object.create( null );
  var src = Object.create( prototype );
  var got = _.prototypeHas( src, {} );
  test.identical( got, false );

  test.case = 'superPrototype - simple map, subPrototype - pure map from prototype';
  var prototype = Object.create( null );
  var src = Object.create( prototype );
  var got = _.prototypeHas( {}, src );
  test.identical( got, false );

  test.case = 'superPrototype - pure map from prototype, subPrototype - pure map';
  var prototype = Object.create( null );
  var src = Object.create( prototype );
  var got = _.prototypeHas( src, Object.create( null ) );
  test.identical( got, false );

  test.case = 'superPrototype - pure map, subPrototype - pure map from prototype';
  var prototype = Object.create( null );
  var src = Object.create( prototype );
  var got = _.prototypeHas( Object.create( null ), src );
  test.identical( got, false );

  /* */

  test.case = 'one constructor prototyped by another, has prototype';
  function proto01(){ this.a = 0; return this };
  function proto02(){ this.x = 1; return this };
  proto02.prototype = new proto01();
  function prototyped0(){ this.y = 1; return this };
  prototyped0.prototype = new proto02();
  var src = new prototyped0();
  var got = _.prototypeHas( src, proto02.prototype );
  test.identical( got, true );

  test.case = 'one constructor prototyped by another, has not prototype';
  function proto11(){ this.a = 0; return this };
  function proto12(){ this.x = 1; return this };
  proto12.prototype = new proto11();
  function prototyped1(){ this.y = 1; return this };
  prototyped1.prototype = new proto12();
  var src = new prototyped1();
  var got = _.prototypeHas( proto12.prototype, src );
  test.identical( got, false  );

  test.close( 'two objects' );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.prototypeHas() );

  test.case = 'one argument';
  test.shouldThrowErrorSync( () => _.prototypeHas( {} ) );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.prototypeHas( {}, {}, 'extra' ) );
}

//

function prototypeIs( test ) /* qqq : merge test wProto/prototypeIs in this one | Dmytro : routine extended by cases from wProto */
{
  test.case = 'check null';
  var got = _.workpiece.prototypeIs( null );
  test.identical( got, false );

  test.case = 'check undefined';
  var got = _.workpiece.prototypeIs( undefined );
  test.identical( got, false );

  test.case = 'check _.nothing';
  var got = _.workpiece.prototypeIs( _.nothing );
  test.identical( got, false );

  test.case = 'check zero';
  var got = _.workpiece.prototypeIs( 0 );
  test.identical( got, false );

  test.case = 'check empty string';
  var got = _.workpiece.prototypeIs( '' );
  test.identical( got, false );

  test.case = 'check false';
  var got = _.workpiece.prototypeIs( false );
  test.identical( got, false );

  test.case = 'check NaN';
  var got = _.workpiece.prototypeIs( NaN );
  test.identical( got, false );

  test.case = 'check Symbol';
  var got = _.workpiece.prototypeIs( Symbol( 'a' ) );
  test.identical( got, false );

  test.case = 'check empty array';
  var got = _.workpiece.prototypeIs( [] );
  test.identical( got, false );

  test.case = 'check empty arguments array';
  var got = _.workpiece.prototypeIs( _.argumentsArrayMake( [] ) );
  test.identical( got, false );

  test.case = 'check empty unroll';
  var got = _.workpiece.prototypeIs( _.unrollMake( [] ) );
  test.identical( got, false );

  test.case = 'check empty map';
  var got = _.workpiece.prototypeIs( {} );
  test.identical( got, false );

  test.case = 'check empty pure map';
  var got = _.workpiece.prototypeIs( Object.create( null ) );
  test.identical( got, false );

  test.case = 'check empty Set';
  var got = _.workpiece.prototypeIs( new Set( [] ) );
  test.identical( got, false );

  test.case = 'check empty Map';
  var got = _.workpiece.prototypeIs( new Map( [] ) );
  test.identical( got, false );

  test.case = 'check empty BufferRaw';
  var got = _.workpiece.prototypeIs( new BufferRaw() );
  test.identical( got, false );

  test.case = 'check empty BufferTyped';
  var got = _.workpiece.prototypeIs( new U8x() );
  test.identical( got, false );

  test.case = 'check number';
  var got = _.workpiece.prototypeIs( 3 );
  test.identical( got, false );

  test.case = 'check bigInt';
  var got = _.workpiece.prototypeIs( 1n );
  test.identical( got, false );

  test.case = 'check string';
  var got = _.workpiece.prototypeIs( 'str' );
  test.identical( got, false );

  test.case = 'check not empty array';
  var got = _.workpiece.prototypeIs( [ null ] );
  test.identical( got, false );

  test.case = 'check map with property constructor';
  var got = _.workpiece.prototypeIs( { 'constructor' : 1 } );
  test.identical( got, true );

  /* */

  test.case = 'check regexp';
  var got = _.workpiece.prototypeIs( /x/ );
  test.identical( got, false );

  test.case = 'check Date constructor';
  var got = _.workpiece.prototypeIs( Date );
  test.identical( got, false );

  test.case = 'check instance of Date constructor';
  var got = _.workpiece.prototypeIs( new Date() );
  test.identical( got, false );

  test.case = 'check function';
  var got = _.workpiece.prototypeIs( function(){} );
  test.identical( got, false );

  test.case = 'check instance of function';
  var got = _.workpiece.prototypeIs( new ( function(){} )() );
  test.identical( got, false );

  test.case = 'check this.constructor';
  var got = _.workpiece.prototypeIs( Self.constructor );
  test.identical( got, false );

  test.case = 'check Self';
  var got = _.workpiece.prototypeIs( Self );
  test.identical( got, false );

  /* */

  test.case = 'check prototype of array';
  var got = _.workpiece.prototypeIs( Object.getPrototypeOf( [] ) );
  test.identical( got, true );

  test.case = 'check prototype of regexp';
  var got = _.workpiece.prototypeIs( Object.getPrototypeOf( /x/ ) );
  test.identical( got, true );

  test.case = 'check prototype of Date instance';
  var got = _.workpiece.prototypeIs( Object.getPrototypeOf( new Date() ) );
  test.identical( got, true );

  test.case = 'check prototype of BufferTyped instance';
  var got = _.workpiece.prototypeIs( Object.getPrototypeOf( new F32x() ) );
  test.identical( got, true );

  test.case = 'check prototype of function instance';
  var got = _.workpiece.prototypeIs( Object.getPrototypeOf( new (function(){})() ) );
  test.identical( got, true );

  test.case = 'check prototype of Self';
  var got = _.workpiece.prototypeIs( Object.getPrototypeOf( Self ) );
  test.identical( got, true );

  /* */

  test.case = 'check map with property constructor';
  var src = Object.create( null );
  src.constructor = false;
  var got = _.workpiece.prototypeIs( src );
  test.identical( got, true );

  test.case = 'check instance of constructor with own property "constructor"';
  function Constr1()
  {
    this.x = 1;
    return this;
  };
  var src = new Constr1();
  src.constructor = true;
  var got = _.workpiece.prototypeIs( src );
  test.identical( got, true );

  test.case = 'check instance of constructor with not own property "constructor"';
  function Constr2()
  {
    this.x = 1;
    return this;
  };
  var proto = { constructor : true };
  Constr2.prototype = proto;
  var src = new Constr2();
  var got = _.workpiece.prototypeIs( src );
  test.identical( src.constructor, true );
  test.identical( got, false );

  test.case = 'instance of Promise';
  var src = new Promise( ( resolve, reject ) => { return resolve( 0 ) } );
  var got = _.workpiece.prototypeIs( src );
  test.identical( got, false );

  test.case = 'function _Promise';
  function Promise(){}
  var src = Promise;
  var got = _.workpiece.prototypeIs( src );
  test.identical( got, false );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.workpiece.prototypeIs() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.workpiece.prototypeIs( {}, 'extra' ) );
}
//
// //
//
// function prototypeIsStandard( test )
// {
//   test.case = 'check null';
//   var got = _.workpiece.prototypeIsStandard( null );
//   test.identical( got, false );
//
//   test.case = 'check undefined';
//   var got = _.workpiece.prototypeIsStandard( undefined );
//   test.identical( got, false );
//
//   test.case = 'check _.nothing';
//   var got = _.workpiece.prototypeIsStandard( _.nothing );
//   test.identical( got, false );
//
//   test.case = 'check zero';
//   var got = _.workpiece.prototypeIsStandard( 0 );
//   test.identical( got, false );
//
//   test.case = 'check empty string';
//   var got = _.workpiece.prototypeIsStandard( '' );
//   test.identical( got, false );
//
//   test.case = 'check false';
//   var got = _.workpiece.prototypeIsStandard( false );
//   test.identical( got, false );
//
//   test.case = 'check NaN';
//   var got = _.workpiece.prototypeIsStandard( NaN );
//   test.identical( got, false );
//
//   test.case = 'check Symbol';
//   var got = _.workpiece.prototypeIsStandard( Symbol( 'a' ) );
//   test.identical( got, false );
//
//   test.case = 'check empty array';
//   var got = _.workpiece.prototypeIsStandard( [] );
//   test.identical( got, false );
//
//   test.case = 'check empty arguments array';
//   var got = _.workpiece.prototypeIsStandard( _.argumentsArrayMake( [] ) );
//   test.identical( got, false );
//
//   test.case = 'check empty unroll';
//   var got = _.workpiece.prototypeIsStandard( _.unrollMake( [] ) );
//   test.identical( got, false );
//
//   test.case = 'check empty map';
//   var got = _.workpiece.prototypeIsStandard( {} );
//   test.identical( got, false );
//
//   test.case = 'check empty pure map';
//   var got = _.workpiece.prototypeIsStandard( Object.create( null ) );
//   test.identical( got, false );
//
//   test.case = 'check empty Set';
//   var got = _.workpiece.prototypeIsStandard( new Set( [] ) );
//   test.identical( got, false );
//
//   test.case = 'check empty Map';
//   var got = _.workpiece.prototypeIsStandard( new Map( [] ) );
//   test.identical( got, false );
//
//   test.case = 'check empty BufferRaw';
//   var got = _.workpiece.prototypeIsStandard( new BufferRaw() );
//   test.identical( got, false );
//
//   test.case = 'check empty BufferTyped';
//   var got = _.workpiece.prototypeIsStandard( new U8x() );
//   test.identical( got, false );
//
//   test.case = 'check number';
//   var got = _.workpiece.prototypeIsStandard( 3 );
//   test.identical( got, false );
//
//   test.case = 'check bigInt';
//   var got = _.workpiece.prototypeIsStandard( 1n );
//   test.identical( got, false );
//
//   test.case = 'check string';
//   var got = _.workpiece.prototypeIsStandard( 'str' );
//   test.identical( got, false );
//
//   test.case = 'check not empty array';
//   var got = _.workpiece.prototypeIsStandard( [ null ] );
//   test.identical( got, false );
//
//   test.case = 'check map with property constructor';
//   var got = _.workpiece.prototypeIsStandard( { 'constructor' : 1 } );
//   test.identical( got, false );
//
//   test.case = 'check map with properties constructor and Composes';
//   var got = _.workpiece.prototypeIsStandard( { 'constructor' : 1, 'Composes' : 1 } );
//   test.identical( got, true );
//
//   /* */
//
//   test.case = 'check regexp';
//   var got = _.workpiece.prototypeIsStandard( /x/ );
//   test.identical( got, false );
//
//   test.case = 'check Date constructor';
//   var got = _.workpiece.prototypeIsStandard( Date );
//   test.identical( got, false );
//
//   test.case = 'check instance of Date constructor';
//   var got = _.workpiece.prototypeIsStandard( new Date() );
//   test.identical( got, false );
//
//   test.case = 'check function';
//   var got = _.workpiece.prototypeIsStandard( function(){} );
//   test.identical( got, false );
//
//   test.case = 'check instance of function';
//   var got = _.workpiece.prototypeIsStandard( new ( function(){} )() );
//   test.identical( got, false );
//
//   test.case = 'check this.constructor';
//   var got = _.workpiece.prototypeIsStandard( Self.constructor );
//   test.identical( got, false );
//
//   test.case = 'check Self';
//   var got = _.workpiece.prototypeIsStandard( Self );
//   test.identical( got, false );
//
//   /* */
//
//   test.case = 'check prototype of array';
//   var got = _.workpiece.prototypeIsStandard( Object.getPrototypeOf( [] ) );
//   test.identical( got, false );
//
//   test.case = 'check prototype of regexp';
//   var got = _.workpiece.prototypeIsStandard( Object.getPrototypeOf( /x/ ) );
//   test.identical( got, false );
//
//   test.case = 'check prototype of Date instance';
//   var got = _.workpiece.prototypeIsStandard( Object.getPrototypeOf( new Date() ) );
//   test.identical( got, false );
//
//   test.case = 'check prototype of BufferTyped instance';
//   var got = _.workpiece.prototypeIsStandard( Object.getPrototypeOf( new F32x() ) );
//   test.identical( got, false );
//
//   test.case = 'check prototype of function instance';
//   var got = _.workpiece.prototypeIsStandard( Object.getPrototypeOf( new (function(){})() ) );
//   test.identical( got, false );
//
//   test.case = 'check prototype of Self';
//   var got = _.workpiece.prototypeIsStandard( Object.getPrototypeOf( Self ) );
//   test.identical( got, true );
//
//   /* */
//
//   test.case = 'check pure map with property constructor';
//   var src = Object.create( null );
//   src.constructor = false;
//   var got = _.workpiece.prototypeIsStandard( src );
//   test.identical( got, false );
//
//   test.case = 'check pure map with properties constructor and Composes';
//   var src = Object.create( null );
//   src.constructor = false;
//   src.Composes = 1;
//   var got = _.workpiece.prototypeIsStandard( src );
//   test.identical( got, true );
//
//   test.case = 'check instance of constructor with own properties constructor and Composes';
//   function Constr1()
//   {
//     this.x = 1;
//     return this;
//   };
//   var src = new Constr1();
//   src.constructor = true;
//   src.Composes = true;
//   var got = _.workpiece.prototypeIsStandard( src );
//   test.identical( got, true );
//
//   test.case = 'check instance of constructor with not own properties constructor and Composes';
//   function Constr2()
//   {
//     this.x = 1;
//     return this;
//   };
//   var proto = { constructor : true, Composes : true };
//   Constr2.prototype = proto;
//   var src = new Constr2();
//   var got = _.workpiece.prototypeIsStandard( src );
//   test.identical( src.constructor, true );
//   test.identical( got, false );
//
//   test.case = 'instance of Promise';
//   var src = new Promise( ( resolve, reject ) => { return resolve( 0 ) } );
//   var got = _.workpiece.prototypeIsStandard( src );
//   test.identical( got, false );
//
//   test.case = 'function _Promise';
//   function Promise(){}
//   var src = Promise;
//   var got = _.workpiece.prototypeIsStandard( src );
//   test.identical( got, false );
// }

//

function constructorIs( test )
{
  test.case = 'check null';
  var got = _.constructorIs( null );
  test.identical( got, false );

  test.case = 'check undefined';
  var got = _.constructorIs( undefined );
  test.identical( got, false );

  test.case = 'check _.nothing';
  var got = _.constructorIs( _.nothing );
  test.identical( got, false );

  test.case = 'check zero';
  var got = _.constructorIs( 0 );
  test.identical( got, false );

  test.case = 'check empty string';
  var got = _.constructorIs( '' );
  test.identical( got, false );

  test.case = 'check false';
  var got = _.constructorIs( false );
  test.identical( got, false );

  test.case = 'check NaN';
  var got = _.constructorIs( NaN );
  test.identical( got, false );

  test.case = 'check Symbol';
  var got = _.constructorIs( Symbol( 'a' ) );
  test.identical( got, false );

  test.case = 'check empty array';
  var got = _.constructorIs( [] );
  test.identical( got, false );

  test.case = 'check empty arguments array';
  var got = _.constructorIs( _.argumentsArrayMake( [] ) );
  test.identical( got, false );

  test.case = 'check empty unroll';
  var got = _.constructorIs( _.unrollMake( [] ) );
  test.identical( got, false );

  test.case = 'check empty map';
  var got = _.constructorIs( {} );
  test.identical( got, false );

  test.case = 'check empty pure map';
  var got = _.constructorIs( Object.create( null ) );
  test.identical( got, false );

  test.case = 'check empty Set';
  var got = _.constructorIs( new Set( [] ) );
  test.identical( got, false );

  test.case = 'check empty Map';
  var got = _.constructorIs( new Map( [] ) );
  test.identical( got, false );

  test.case = 'check empty BufferRaw';
  var got = _.constructorIs( new BufferRaw() );
  test.identical( got, false );

  test.case = 'check empty BufferTyped';
  var got = _.constructorIs( new U8x() );
  test.identical( got, false );

  test.case = 'check number';
  var got = _.constructorIs( 3 );
  test.identical( got, false );

  test.case = 'check bigInt';
  var got = _.constructorIs( 1n );
  test.identical( got, false );

  test.case = 'check string';
  var got = _.constructorIs( 'str' );
  test.identical( got, false );

  test.case = 'check not empty array';
  var got = _.constructorIs( [ null ] );
  test.identical( got, false );

  test.case = 'check map with property constructor';
  var got = _.constructorIs( { 'constructor' : 1 } );
  test.identical( got, false );

  test.case = 'check map with properties constructor and Composes';
  var got = _.constructorIs( { 'constructor' : 1, 'Composes' : 1 } );
  test.identical( got, false );

  test.case = 'check pure map with property constructor';
  var src = Object.create( null );
  src.constructor = false;
  var got = _.constructorIs( src );
  test.identical( got, false );

  test.case = 'check pure map with properties constructor and Composes';
  var src = Object.create( null );
  src.constructor = false;
  src.Composes = 1;
  var got = _.constructorIs( src );
  test.identical( got, false );

  test.case = 'check instance of constructor with own properties constructor and Composes';
  function Constr1()
  {
    this.x = 1;
    return this;
  };
  var src = new Constr1();
  src.constructor = true;
  src.Composes = true;
  var got = _.constructorIs( src );
  test.identical( got, false );

  test.case = 'check constructor';
  function Constr2()
  {
    this.x = 1;
    return this;
  };
  var got = _.constructorIs( Constr2 );
  test.identical( got, true );

  test.case = 'instance of Promise';
  var src = new Promise( ( resolve, reject ) => { return resolve( 0 ) } );
  var got = _.constructorIs( src );
  test.identical( got, false );

  test.case = 'function _Promise';
  function Promise(){}
  var src = Promise;
  var got = _.constructorIs( src );
  test.identical( got, true );
}

//

function instanceIs( test )
{
  test.case = 'check null';
  var got = _.instanceIs( null );
  test.identical( got, false );

  test.case = 'check undefined';
  var got = _.instanceIs( undefined );
  test.identical( got, false );

  test.case = 'check _.nothing';
  var got = _.instanceIs( _.nothing );
  test.identical( got, false );

  test.case = 'check zero';
  var got = _.instanceIs( 0 );
  test.identical( got, false );

  test.case = 'check empty string';
  var got = _.instanceIs( '' );
  test.identical( got, false );

  test.case = 'check false';
  var got = _.instanceIs( false );
  test.identical( got, false );

  test.case = 'check NaN';
  var got = _.instanceIs( NaN );
  test.identical( got, false );

  test.case = 'check Symbol';
  var got = _.instanceIs( Symbol( 'a' ) );
  test.identical( got, false );

  test.case = 'check empty array';
  var got = _.instanceIs( [] );
  test.identical( got, true );

  test.case = 'check empty arguments array';
  var got = _.instanceIs( _.argumentsArrayMake( [] ) );
  test.identical( got, false );

  test.case = 'check empty unroll';
  var got = _.instanceIs( _.unrollMake( [] ) );
  test.identical( got, true );

  test.case = 'check empty map';
  var got = _.instanceIs( {} );
  test.identical( got, false );

  test.case = 'check empty pure map';
  var got = _.instanceIs( Object.create( null ) );
  test.identical( got, false );

  test.case = 'check empty Set';
  var got = _.instanceIs( new Set( [] ) );
  test.identical( got, true );

  test.case = 'check empty Map';
  var got = _.instanceIs( new Map( [] ) );
  test.identical( got, true );

  test.case = 'check empty BufferRaw';
  var got = _.instanceIs( new BufferRaw() );
  test.identical( got, true );

  test.case = 'check empty BufferTyped';
  var got = _.instanceIs( new U8x() );
  test.identical( got, true );

  test.case = 'check number';
  var got = _.instanceIs( 3 );
  test.identical( got, false );

  test.case = 'check bigInt';
  var got = _.instanceIs( 1n );
  test.identical( got, false );

  test.case = 'check string';
  var got = _.instanceIs( 'str' );
  test.identical( got, false );

  test.case = 'check not empty array';
  var got = _.instanceIs( [ null ] );
  test.identical( got, true );

  test.case = 'check map with property constructor';
  var got = _.instanceIs( { 'constructor' : 1 } );
  test.identical( got, false );

  test.case = 'check map with properties constructor and Composes';
  var got = _.instanceIs( { 'constructor' : 1, 'Composes' : 1 } );
  test.identical( got, false );

  test.case = 'check pure map with property constructor';
  var src = Object.create( null );
  src.constructor = false;
  var got = _.instanceIs( src );
  test.identical( got, false );

  test.case = 'check pure map with properties constructor and Composes';
  var src = Object.create( null );
  src.constructor = false;
  src.Composes = 1;
  var got = _.instanceIs( src );
  test.identical( got, false );

  test.case = 'check instance of constructor with own properties constructor and Composes';
  function Constr1()
  {
    this.x = 1;
    return this;
  };
  var src = new Constr1();
  src.constructor = true;
  src.Composes = true;
  var got = _.instanceIs( src );
  test.identical( got, false );

  test.case = 'check constructor';
  function Constr2()
  {
    this.x = 1;
    return this;
  };
  var got = _.instanceIs( Constr2 );
  test.identical( got, false );

  test.case = 'instance of Promise';
  var src = new Promise( ( resolve, reject ) => { return resolve( 0 ) } );
  var got = _.instanceIs( src );
  test.identical( got, true );

  test.case = 'function _Promise';
  function Promise(){}
  var src = Promise;
  var got = _.instanceIs( src );
  test.identical( got, false );
}

//

function instanceLike( test )
{
  test.case = 'check null';
  var got = _.instanceLike( null );
  test.identical( got, false );

  test.case = 'check undefined';
  var got = _.instanceLike( undefined );
  test.identical( got, false );

  test.case = 'check _.nothing';
  var got = _.instanceLike( _.nothing );
  test.identical( got, false );

  test.case = 'check zero';
  var got = _.instanceLike( 0 );
  test.identical( got, false );

  test.case = 'check empty string';
  var got = _.instanceLike( '' );
  test.identical( got, false );

  test.case = 'check false';
  var got = _.instanceLike( false );
  test.identical( got, false );

  test.case = 'check NaN';
  var got = _.instanceLike( NaN );
  test.identical( got, false );

  test.case = 'check Symbol';
  var got = _.instanceLike( Symbol( 'a' ) );
  test.identical( got, false );

  test.case = 'check empty array';
  var got = _.instanceLike( [] );
  test.identical( got, false );

  test.case = 'check empty arguments array';
  var got = _.instanceLike( _.argumentsArrayMake( [] ) );
  test.identical( got, false );

  test.case = 'check empty unroll';
  var got = _.instanceLike( _.unrollMake( [] ) );
  test.identical( got, false );

  test.case = 'check empty map';
  var got = _.instanceLike( {} );
  test.identical( got, false );

  test.case = 'check empty pure map';
  var got = _.instanceLike( Object.create( null ) );
  test.identical( got, false );

  test.case = 'check empty Set';
  var got = _.instanceLike( new Set( [] ) );
  test.identical( got, false );

  test.case = 'check empty Map';
  var got = _.instanceLike( new Map( [] ) );
  test.identical( got, false );

  test.case = 'check empty BufferRaw';
  var got = _.instanceLike( new BufferRaw() );
  test.identical( got, false );

  test.case = 'check empty BufferTyped';
  var got = _.instanceLike( new U8x() );
  test.identical( got, false );

  test.case = 'check number';
  var got = _.instanceLike( 3 );
  test.identical( got, false );

  test.case = 'check bigInt';
  var got = _.instanceLike( 1n );
  test.identical( got, false );

  test.case = 'check string';
  var got = _.instanceLike( 'str' );
  test.identical( got, false );

  test.case = 'check not empty array';
  var got = _.instanceLike( [ null ] );
  test.identical( got, false );

  test.case = 'check map with property constructor';
  var got = _.instanceLike( { 'constructor' : 1 } );
  test.identical( got, false );

  test.case = 'check map with properties constructor and Composes';
  var got = _.instanceLike( { 'constructor' : 1, 'Composes' : 1 } );
  test.identical( got, true );

  test.case = 'check pure map with property constructor';
  var src = Object.create( null );
  src.constructor = false;
  var got = _.instanceLike( src );
  test.identical( got, false );

  test.case = 'check pure map with properties constructor and Composes';
  var src = Object.create( null );
  src.constructor = false;
  src.Composes = 1;
  var got = _.instanceLike( src );
  test.identical( got, true );

  test.case = 'check instance of constructor with own properties constructor and Composes';
  function Constr1()
  {
    this.x = 1;
    return this;
  };
  var src = new Constr1();
  src.constructor = true;
  src.Composes = true;
  var got = _.instanceLike( src );
  test.identical( got, true );

  test.case = 'check constructor';
  function Constr2()
  {
    this.x = 1;
    return this;
  };
  var got = _.instanceLike( Constr2 );
  test.identical( got, false );

  test.case = 'instance of Promise';
  var src = new Promise( ( resolve, reject ) => { return resolve( 0 ) } );
  var got = _.instanceLike( src );
  test.identical( got, false );

  test.case = 'function _Promise';
  function Promise(){}
  var src = Promise;
  var got = _.instanceLike( src );
  test.identical( got, false );
}

//

function consoleIs( test )
{
  test.case = 'check null';
  var got = _.consoleIs( null );
  test.identical( got, false );

  test.case = 'check undefined';
  var got = _.consoleIs( undefined );
  test.identical( got, false );

  test.case = 'check _.nothing';
  var got = _.consoleIs( _.nothing );
  test.identical( got, false );

  test.case = 'check zero';
  var got = _.consoleIs( 0 );
  test.identical( got, false );

  test.case = 'check empty string';
  var got = _.consoleIs( '' );
  test.identical( got, false );

  test.case = 'check false';
  var got = _.consoleIs( false );
  test.identical( got, false );

  test.case = 'check NaN';
  var got = _.consoleIs( NaN );
  test.identical( got, false );

  test.case = 'check Symbol';
  var got = _.consoleIs( Symbol( 'a' ) );
  test.identical( got, false );

  test.case = 'check empty array';
  var got = _.consoleIs( [] );
  test.identical( got, false );

  test.case = 'check empty arguments array';
  var got = _.consoleIs( _.argumentsArrayMake( [] ) );
  test.identical( got, false );

  test.case = 'check empty unroll';
  var got = _.consoleIs( _.unrollMake( [] ) );
  test.identical( got, false );

  test.case = 'check empty map';
  var got = _.consoleIs( {} );
  test.identical( got, false );

  test.case = 'check empty pure map';
  var got = _.consoleIs( Object.create( null ) );
  test.identical( got, false );

  test.case = 'check empty Set';
  var got = _.consoleIs( new Set( [] ) );
  test.identical( got, false );

  test.case = 'check empty Map';
  var got = _.consoleIs( new Map( [] ) );
  test.identical( got, false );

  test.case = 'check empty BufferRaw';
  var got = _.consoleIs( new BufferRaw() );
  test.identical( got, false );

  test.case = 'check empty BufferTyped';
  var got = _.consoleIs( new U8x() );
  test.identical( got, false );

  test.case = 'check number';
  var got = _.consoleIs( 3 );
  test.identical( got, false );

  test.case = 'check bigInt';
  var got = _.consoleIs( 1n );
  test.identical( got, false );

  test.case = 'check string';
  var got = _.consoleIs( 'str' );
  test.identical( got, false );

  test.case = 'check not empty array';
  var got = _.consoleIs( [ null ] );
  test.identical( got, false );

  test.case = 'check map with properties constructor and Composes';
  var got = _.consoleIs( { 'constructor' : 1, 'Composes' : 1 } );
  test.identical( got, false );

  test.case = 'check pure map with properties constructor and Composes';
  var src = Object.create( null );
  src.constructor = false;
  src.Composes = 1;
  var got = _.consoleIs( src );
  test.identical( got, false );

  test.case = 'check instance of constructor';
  function Constr1()
  {
    this.x = 1;
    return this;
  };
  var src = new Constr1();
  src.constructor = true;
  src.Composes = true;
  var got = _.consoleIs( src );
  test.identical( got, false );

  test.case = 'check constructor';
  function Constr2()
  {
    this.x = 1;
    return this;
  };
  var got = _.consoleIs( Constr2 );
  test.identical( got, false );

  test.case = 'instance of Promise';
  var src = new Promise( ( resolve, reject ) => { return resolve( 0 ) } );
  var got = _.consoleIs( src );
  test.identical( got, false );

  test.case = 'function _Promise';
  function Promise(){}
  var src = Promise;
  var got = _.consoleIs( src );
  test.identical( got, false );

  test.case = 'check console';
  var src = console;
  var got = _.consoleIs( src );
  test.identical( got, true );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.consoleIs() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.consoleIs( console, console ) );

  // instance of _.Logger tested in module wLogger
}

//

function printerIs( test )
{
  test.case = 'check null';
  var got = _.printerIs( null );
  test.identical( got, false );

  test.case = 'check undefined';
  var got = _.printerIs( undefined );
  test.identical( got, false );

  test.case = 'check _.nothing';
  var got = _.printerIs( _.nothing );
  test.identical( got, false );

  test.case = 'check zero';
  var got = _.printerIs( 0 );
  test.identical( got, false );

  test.case = 'check empty string';
  var got = _.printerIs( '' );
  test.identical( got, false );

  test.case = 'check false';
  var got = _.printerIs( false );
  test.identical( got, false );

  test.case = 'check NaN';
  var got = _.printerIs( NaN );
  test.identical( got, false );

  test.case = 'check Symbol';
  var got = _.printerIs( Symbol( 'a' ) );
  test.identical( got, false );

  test.case = 'check empty array';
  var got = _.printerIs( [] );
  test.identical( got, false );

  test.case = 'check empty arguments array';
  var got = _.printerIs( _.argumentsArrayMake( [] ) );
  test.identical( got, false );

  test.case = 'check empty unroll';
  var got = _.printerIs( _.unrollMake( [] ) );
  test.identical( got, false );

  test.case = 'check empty map';
  var got = _.printerIs( {} );
  test.identical( got, false );

  test.case = 'check empty pure map';
  var got = _.printerIs( Object.create( null ) );
  test.identical( got, false );

  test.case = 'check empty Set';
  var got = _.printerIs( new Set( [] ) );
  test.identical( got, false );

  test.case = 'check empty Map';
  var got = _.printerIs( new Map( [] ) );
  test.identical( got, false );

  test.case = 'check empty BufferRaw';
  var got = _.printerIs( new BufferRaw() );
  test.identical( got, false );

  test.case = 'check empty BufferTyped';
  var got = _.printerIs( new U8x() );
  test.identical( got, false );

  test.case = 'check number';
  var got = _.printerIs( 3 );
  test.identical( got, false );

  test.case = 'check bigInt';
  var got = _.printerIs( 1n );
  test.identical( got, false );

  test.case = 'check string';
  var got = _.printerIs( 'str' );
  test.identical( got, false );

  test.case = 'check not empty array';
  var got = _.printerIs( [ null ] );
  test.identical( got, false );

  test.case = 'check map with properties constructor and Composes';
  var got = _.printerIs( { 'constructor' : 1, 'Composes' : 1 } );
  test.identical( got, false );

  test.case = 'check pure map with properties constructor and Composes';
  var src = Object.create( null );
  src.constructor = false;
  src.Composes = 1;
  var got = _.printerIs( src );
  test.identical( got, false );

  test.case = 'check instance of constructor';
  function Constr1()
  {
    this.x = 1;
    return this;
  };
  var src = new Constr1();
  src.constructor = true;
  src.Composes = true;
  var got = _.printerIs( src );
  test.identical( got, false );

  test.case = 'check constructor';
  function Constr2()
  {
    this.x = 1;
    return this;
  };
  var got = _.printerIs( Constr2 );
  test.identical( got, false );

  test.case = 'instance of Promise';
  var src = new Promise( ( resolve, reject ) => { return resolve( 0 ) } );
  var got = _.printerIs( src );
  test.identical( got, false );

  test.case = 'function _Promise';
  function Promise(){}
  var src = Promise;
  var got = _.printerIs( src );
  test.identical( got, false );

  test.case = 'check console';
  var src = console;
  var got = _.printerIs( src );
  test.identical( got, false );

  // instance of _.Logger tested in module wLogger
}

//

function printerLike( test )
{
  test.case = 'check null';
  var got = _.printerLike( null );
  test.identical( got, false );

  test.case = 'check undefined';
  var got = _.printerLike( undefined );
  test.identical( got, false );

  test.case = 'check _.nothing';
  var got = _.printerLike( _.nothing );
  test.identical( got, false );

  test.case = 'check zero';
  var got = _.printerLike( 0 );
  test.identical( got, false );

  test.case = 'check empty string';
  var got = _.printerLike( '' );
  test.identical( got, false );

  test.case = 'check false';
  var got = _.printerLike( false );
  test.identical( got, false );

  test.case = 'check NaN';
  var got = _.printerLike( NaN );
  test.identical( got, false );

  test.case = 'check Symbol';
  var got = _.printerLike( Symbol( 'a' ) );
  test.identical( got, false );

  test.case = 'check empty array';
  var got = _.printerLike( [] );
  test.identical( got, false );

  test.case = 'check empty arguments array';
  var got = _.printerLike( _.argumentsArrayMake( [] ) );
  test.identical( got, false );

  test.case = 'check empty unroll';
  var got = _.printerLike( _.unrollMake( [] ) );
  test.identical( got, false );

  test.case = 'check empty map';
  var got = _.printerLike( {} );
  test.identical( got, false );

  test.case = 'check empty pure map';
  var got = _.printerLike( Object.create( null ) );
  test.identical( got, false );

  test.case = 'check empty Set';
  var got = _.printerLike( new Set( [] ) );
  test.identical( got, false );

  test.case = 'check empty Map';
  var got = _.printerLike( new Map( [] ) );
  test.identical( got, false );

  test.case = 'check empty BufferRaw';
  var got = _.printerLike( new BufferRaw() );
  test.identical( got, false );

  test.case = 'check empty BufferTyped';
  var got = _.printerLike( new U8x() );
  test.identical( got, false );

  test.case = 'check number';
  var got = _.printerLike( 3 );
  test.identical( got, false );

  test.case = 'check bigInt';
  var got = _.printerLike( 1n );
  test.identical( got, false );

  test.case = 'check string';
  var got = _.printerLike( 'str' );
  test.identical( got, false );

  test.case = 'check not empty array';
  var got = _.printerLike( [ null ] );
  test.identical( got, false );

  test.case = 'check map with properties constructor and Composes';
  var got = _.printerLike( { 'constructor' : 1, 'Composes' : 1 } );
  test.identical( got, false );

  test.case = 'check pure map with properties constructor and Composes';
  var src = Object.create( null );
  src.constructor = false;
  src.Composes = 1;
  var got = _.printerLike( src );
  test.identical( got, false );

  test.case = 'check instance of constructor';
  function Constr1()
  {
    this.x = 1;
    return this;
  };
  var src = new Constr1();
  src.constructor = true;
  src.Composes = true;
  var got = _.printerLike( src );
  test.identical( got, false );

  test.case = 'check constructor';
  function Constr2()
  {
    this.x = 1;
    return this;
  };
  var got = _.printerLike( Constr2 );
  test.identical( got, false );

  test.case = 'instance of Promise';
  var src = new Promise( ( resolve, reject ) => { return resolve( 0 ) } );
  var got = _.printerLike( src );
  test.identical( got, false );

  test.case = 'function _Promise';
  function Promise(){}
  var src = Promise;
  var got = _.printerLike( src );
  test.identical( got, false );

  test.case = 'check console';
  var src = console;
  var got = _.printerLike( src );
  test.identical( got, true );

  // instance of _.Logger tested in module wLogger
}

//

function loggerIs( test )
{
  test.case = 'check null';
  var got = _.loggerIs( null );
  test.identical( got, false );

  test.case = 'check undefined';
  var got = _.loggerIs( undefined );
  test.identical( got, false );

  test.case = 'check _.nothing';
  var got = _.loggerIs( _.nothing );
  test.identical( got, false );

  test.case = 'check zero';
  var got = _.loggerIs( 0 );
  test.identical( got, false );

  test.case = 'check empty string';
  var got = _.loggerIs( '' );
  test.identical( got, false );

  test.case = 'check false';
  var got = _.loggerIs( false );
  test.identical( got, false );

  test.case = 'check NaN';
  var got = _.loggerIs( NaN );
  test.identical( got, false );

  test.case = 'check Symbol';
  var got = _.loggerIs( Symbol( 'a' ) );
  test.identical( got, false );

  test.case = 'check empty array';
  var got = _.loggerIs( [] );
  test.identical( got, false );

  test.case = 'check empty arguments array';
  var got = _.loggerIs( _.argumentsArrayMake( [] ) );
  test.identical( got, false );

  test.case = 'check empty unroll';
  var got = _.loggerIs( _.unrollMake( [] ) );
  test.identical( got, false );

  test.case = 'check empty map';
  var got = _.loggerIs( {} );
  test.identical( got, false );

  test.case = 'check empty pure map';
  var got = _.loggerIs( Object.create( null ) );
  test.identical( got, false );

  test.case = 'check empty Set';
  var got = _.loggerIs( new Set( [] ) );
  test.identical( got, false );

  test.case = 'check empty Map';
  var got = _.loggerIs( new Map( [] ) );
  test.identical( got, false );

  test.case = 'check empty BufferRaw';
  var got = _.loggerIs( new BufferRaw() );
  test.identical( got, false );

  test.case = 'check empty BufferTyped';
  var got = _.loggerIs( new U8x() );
  test.identical( got, false );

  test.case = 'check number';
  var got = _.loggerIs( 3 );
  test.identical( got, false );

  test.case = 'check bigInt';
  var got = _.loggerIs( 1n );
  test.identical( got, false );

  test.case = 'check string';
  var got = _.loggerIs( 'str' );
  test.identical( got, false );

  test.case = 'check not empty array';
  var got = _.loggerIs( [ null ] );
  test.identical( got, false );

  test.case = 'check map with properties constructor and Composes';
  var got = _.loggerIs( { 'constructor' : 1, 'Composes' : 1 } );
  test.identical( got, false );

  test.case = 'check pure map with properties constructor and Composes';
  var src = Object.create( null );
  src.constructor = false;
  src.Composes = 1;
  var got = _.loggerIs( src );
  test.identical( got, false );

  test.case = 'check instance of constructor';
  function Constr1()
  {
    this.x = 1;
    return this;
  };
  var src = new Constr1();
  src.constructor = true;
  src.Composes = true;
  var got = _.loggerIs( src );
  test.identical( got, false );

  test.case = 'check constructor';
  function Constr2()
  {
    this.x = 1;
    return this;
  };
  var got = _.loggerIs( Constr2 );
  test.identical( got, false );

  test.case = 'instance of Promise';
  var src = new Promise( ( resolve, reject ) => { return resolve( 0 ) } );
  var got = _.loggerIs( src );
  test.identical( got, false );

  test.case = 'function _Promise';
  function Promise(){}
  var src = Promise;
  var got = _.loggerIs( src );
  test.identical( got, false );

  test.case = 'check console';
  var src = console;
  var got = _.loggerIs( src );
  test.identical( got, false );

  // instance of _.Logger tested in module wLogger
}

//

function processIs( test )
{
  test.case = 'check null';
  var got = _.processIs( null );
  test.identical( got, false );

  test.case = 'check undefined';
  var got = _.processIs( undefined );
  test.identical( got, false );

  test.case = 'check _.nothing';
  var got = _.processIs( _.nothing );
  test.identical( got, false );

  test.case = 'check zero';
  var got = _.processIs( 0 );
  test.identical( got, false );

  test.case = 'check empty string';
  var got = _.processIs( '' );
  test.identical( got, false );

  test.case = 'check false';
  var got = _.processIs( false );
  test.identical( got, false );

  test.case = 'check NaN';
  var got = _.processIs( NaN );
  test.identical( got, false );

  test.case = 'check Symbol';
  var got = _.processIs( Symbol( 'a' ) );
  test.identical( got, false );

  test.case = 'check empty array';
  var got = _.processIs( [] );
  test.identical( got, false );

  test.case = 'check empty arguments array';
  var got = _.processIs( _.argumentsArrayMake( [] ) );
  test.identical( got, false );

  test.case = 'check empty unroll';
  var got = _.processIs( _.unrollMake( [] ) );
  test.identical( got, false );

  test.case = 'check empty map';
  var got = _.processIs( {} );
  test.identical( got, false );

  test.case = 'check empty pure map';
  var got = _.processIs( Object.create( null ) );
  test.identical( got, false );

  test.case = 'check empty Set';
  var got = _.processIs( new Set( [] ) );
  test.identical( got, false );

  test.case = 'check empty Map';
  var got = _.processIs( new Map( [] ) );
  test.identical( got, false );

  test.case = 'check empty BufferRaw';
  var got = _.processIs( new BufferRaw() );
  test.identical( got, false );

  test.case = 'check empty BufferTyped';
  var got = _.processIs( new U8x() );
  test.identical( got, false );

  test.case = 'check number';
  var got = _.processIs( 3 );
  test.identical( got, false );

  test.case = 'check bigInt';
  var got = _.processIs( 1n );
  test.identical( got, false );

  test.case = 'check string';
  var got = _.processIs( 'str' );
  test.identical( got, false );

  test.case = 'check not empty array';
  var got = _.processIs( [ null ] );
  test.identical( got, false );

  test.case = 'check map with properties constructor and Composes';
  var got = _.processIs( { 'constructor' : 1, 'Composes' : 1 } );
  test.identical( got, false );

  test.case = 'check pure map with properties constructor and Composes';
  var src = Object.create( null );
  src.constructor = false;
  src.Composes = 1;
  var got = _.processIs( src );
  test.identical( got, false );

  test.case = 'check instance of constructor';
  function Constr1()
  {
    this.x = 1;
    return this;
  };
  var src = new Constr1();
  src.constructor = true;
  src.Composes = true;
  var got = _.processIs( src );
  test.identical( got, false );

  test.case = 'check constructor';
  function Constr2()
  {
    this.x = 1;
    return this;
  };
  var got = _.processIs( Constr2 );
  test.identical( got, false );

  test.case = 'instance of Promise';
  var src = new Promise( ( resolve, reject ) => { return resolve( 0 ) } );
  var got = _.processIs( src );
  test.identical( got, false );

  test.case = 'function _Promise';
  function Promise(){}
  var src = Promise;
  var got = _.processIs( src );
  test.identical( got, false );

  test.case = 'check process';
  var src = process;
  var got = _.processIs( src );
  test.identical( got, true );
}

//

function procedureIs( test )
{
  test.case = 'check null';
  var got = _.procedureIs( null );
  test.identical( got, false );

  test.case = 'check undefined';
  var got = _.procedureIs( undefined );
  test.identical( got, false );

  test.case = 'check _.nothing';
  var got = _.procedureIs( _.nothing );
  test.identical( got, false );

  test.case = 'check zero';
  var got = _.procedureIs( 0 );
  test.identical( got, false );

  test.case = 'check empty string';
  var got = _.procedureIs( '' );
  test.identical( got, false );

  test.case = 'check false';
  var got = _.procedureIs( false );
  test.identical( got, false );

  test.case = 'check NaN';
  var got = _.procedureIs( NaN );
  test.identical( got, false );

  test.case = 'check Symbol';
  var got = _.procedureIs( Symbol( 'a' ) );
  test.identical( got, false );

  test.case = 'check empty array';
  var got = _.procedureIs( [] );
  test.identical( got, false );

  test.case = 'check empty arguments array';
  var got = _.procedureIs( _.argumentsArrayMake( [] ) );
  test.identical( got, false );

  test.case = 'check empty unroll';
  var got = _.procedureIs( _.unrollMake( [] ) );
  test.identical( got, false );

  test.case = 'check empty map';
  var got = _.procedureIs( {} );
  test.identical( got, false );

  test.case = 'check empty pure map';
  var got = _.procedureIs( Object.create( null ) );
  test.identical( got, false );

  test.case = 'check empty Set';
  var got = _.procedureIs( new Set( [] ) );
  test.identical( got, false );

  test.case = 'check empty Map';
  var got = _.procedureIs( new Map( [] ) );
  test.identical( got, false );

  test.case = 'check empty BufferRaw';
  var got = _.procedureIs( new BufferRaw() );
  test.identical( got, false );

  test.case = 'check empty BufferTyped';
  var got = _.procedureIs( new U8x() );
  test.identical( got, false );

  test.case = 'check number';
  var got = _.procedureIs( 3 );
  test.identical( got, false );

  test.case = 'check bigInt';
  var got = _.procedureIs( 1n );
  test.identical( got, false );

  test.case = 'check string';
  var got = _.procedureIs( 'str' );
  test.identical( got, false );

  test.case = 'check not empty array';
  var got = _.procedureIs( [ null ] );
  test.identical( got, false );

  test.case = 'check map with properties constructor and Composes';
  var got = _.procedureIs( { 'constructor' : 1, 'Composes' : 1 } );
  test.identical( got, false );

  test.case = 'check pure map with properties constructor and Composes';
  var src = Object.create( null );
  src.constructor = false;
  src.Composes = 1;
  var got = _.procedureIs( src );
  test.identical( got, false );

  test.case = 'check instance of constructor';
  function Constr1()
  {
    this.x = 1;
    return this;
  };
  var src = new Constr1();
  src.constructor = true;
  src.Composes = true;
  var got = _.procedureIs( src );
  test.identical( got, false );

  test.case = 'check constructor';
  function Constr2()
  {
    this.x = 1;
    return this;
  };
  var got = _.procedureIs( Constr2 );
  test.identical( got, false );

  test.case = 'instance of Promise';
  var src = new Promise( ( resolve, reject ) => { return resolve( 0 ) } );
  var got = _.procedureIs( src );
  test.identical( got, false );

  test.case = 'function _Promise';
  function Promise(){}
  var src = Promise;
  var got = _.procedureIs( src );
  test.identical( got, false );

  test.case = 'check process';
  var src = process;
  var got = _.procedureIs( src );
  test.identical( got, false );

  // instance of _.Procedure tested in module wProcedure
}

//

function definitionIs( test )
{
  test.case = 'check null';
  var got = _.definitionIs( null );
  test.identical( got, false );

  test.case = 'check undefined';
  var got = _.definitionIs( undefined );
  test.identical( got, false );

  test.case = 'check _.nothing';
  var got = _.definitionIs( _.nothing );
  test.identical( got, false );

  test.case = 'check zero';
  var got = _.definitionIs( 0 );
  test.identical( got, false );

  test.case = 'check empty string';
  var got = _.definitionIs( '' );
  test.identical( got, false );

  test.case = 'check false';
  var got = _.definitionIs( false );
  test.identical( got, false );

  test.case = 'check NaN';
  var got = _.definitionIs( NaN );
  test.identical( got, false );

  test.case = 'check Symbol';
  var got = _.definitionIs( Symbol( 'a' ) );
  test.identical( got, false );

  test.case = 'check empty array';
  var got = _.definitionIs( [] );
  test.identical( got, false );

  test.case = 'check empty arguments array';
  var got = _.definitionIs( _.argumentsArrayMake( [] ) );
  test.identical( got, false );

  test.case = 'check empty unroll';
  var got = _.definitionIs( _.unrollMake( [] ) );
  test.identical( got, false );

  test.case = 'check empty map';
  var got = _.definitionIs( {} );
  test.identical( got, false );

  test.case = 'check empty pure map';
  var got = _.definitionIs( Object.create( null ) );
  test.identical( got, false );

  test.case = 'check empty Set';
  var got = _.definitionIs( new Set( [] ) );
  test.identical( got, false );

  test.case = 'check empty Map';
  var got = _.definitionIs( new Map( [] ) );
  test.identical( got, false );

  test.case = 'check empty BufferRaw';
  var got = _.definitionIs( new BufferRaw() );
  test.identical( got, false );

  test.case = 'check empty BufferTyped';
  var got = _.definitionIs( new U8x() );
  test.identical( got, false );

  test.case = 'check number';
  var got = _.definitionIs( 3 );
  test.identical( got, false );

  test.case = 'check bigInt';
  var got = _.definitionIs( 1n );
  test.identical( got, false );

  test.case = 'check string';
  var got = _.definitionIs( 'str' );
  test.identical( got, false );

  test.case = 'check not empty array';
  var got = _.definitionIs( [ null ] );
  test.identical( got, false );

  test.case = 'check map with properties constructor and Composes';
  var got = _.definitionIs( { 'constructor' : 1, 'Composes' : 1 } );
  test.identical( got, false );

  test.case = 'check pure map with properties constructor and Composes';
  var src = Object.create( null );
  src.constructor = false;
  src.Composes = 1;
  var got = _.definitionIs( src );
  test.identical( got, false );

  test.case = 'check instance of constructor';
  function Constr1()
  {
    this.x = 1;
    return this;
  };
  var src = new Constr1();
  src.constructor = true;
  src.Composes = true;
  var got = _.definitionIs( src );
  test.identical( got, false );

  test.case = 'check constructor';
  function Constr2()
  {
    this.x = 1;
    return this;
  };
  var got = _.definitionIs( Constr2 );
  test.identical( got, false );

  test.case = 'instance of Promise';
  var src = new Promise( ( resolve, reject ) => { return resolve( 0 ) } );
  var got = _.definitionIs( src );
  test.identical( got, false );

  test.case = 'function _Promise';
  function Promise(){}
  var src = Promise;
  var got = _.definitionIs( src );
  test.identical( got, false );

  test.case = 'check process';
  var src = process;
  var got = _.definitionIs( src );
  test.identical( got, false );

  /* aaa2 : ask */
  /* Dmytro : instances of another modules tested outside of module wTools */

  // instance of _.Definition tested in module wBlueprint
}

//

function traitIs( test )
{
  test.case = 'check null';
  var got = _.traitIs( null );
  test.identical( got, false );

  test.case = 'check undefined';
  var got = _.traitIs( undefined );
  test.identical( got, false );

  test.case = 'check _.nothing';
  var got = _.traitIs( _.nothing );
  test.identical( got, false );

  test.case = 'check zero';
  var got = _.traitIs( 0 );
  test.identical( got, false );

  test.case = 'check empty string';
  var got = _.traitIs( '' );
  test.identical( got, false );

  test.case = 'check false';
  var got = _.traitIs( false );
  test.identical( got, false );

  test.case = 'check NaN';
  var got = _.traitIs( NaN );
  test.identical( got, false );

  test.case = 'check Symbol';
  var got = _.traitIs( Symbol( 'a' ) );
  test.identical( got, false );

  test.case = 'check empty array';
  var got = _.traitIs( [] );
  test.identical( got, false );

  test.case = 'check empty arguments array';
  var got = _.traitIs( _.argumentsArrayMake( [] ) );
  test.identical( got, false );

  test.case = 'check empty unroll';
  var got = _.traitIs( _.unrollMake( [] ) );
  test.identical( got, false );

  test.case = 'check empty map';
  var got = _.traitIs( {} );
  test.identical( got, false );

  test.case = 'check empty pure map';
  var got = _.traitIs( Object.create( null ) );
  test.identical( got, false );

  test.case = 'check empty Set';
  var got = _.traitIs( new Set( [] ) );
  test.identical( got, false );

  test.case = 'check empty Map';
  var got = _.traitIs( new Map( [] ) );
  test.identical( got, false );

  test.case = 'check empty BufferRaw';
  var got = _.traitIs( new BufferRaw() );
  test.identical( got, false );

  test.case = 'check empty BufferTyped';
  var got = _.traitIs( new U8x() );
  test.identical( got, false );

  test.case = 'check number';
  var got = _.traitIs( 3 );
  test.identical( got, false );

  test.case = 'check bigInt';
  var got = _.traitIs( 1n );
  test.identical( got, false );

  test.case = 'check string';
  var got = _.traitIs( 'str' );
  test.identical( got, false );

  test.case = 'check not empty array';
  var got = _.traitIs( [ null ] );
  test.identical( got, false );

  test.case = 'check map with properties constructor and Composes';
  var got = _.traitIs( { 'constructor' : 1, 'Composes' : 1 } );
  test.identical( got, false );

  test.case = 'check pure map with properties constructor and Composes';
  var src = Object.create( null );
  src.constructor = false;
  src.Composes = 1;
  var got = _.traitIs( src );
  test.identical( got, false );

  test.case = 'check instance of constructor';
  function Constr1()
  {
    this.x = 1;
    return this;
  };
  var src = new Constr1();
  src.constructor = true;
  src.Composes = true;
  var got = _.traitIs( src );
  test.identical( got, false );

  test.case = 'check constructor';
  function Constr2()
  {
    this.x = 1;
    return this;
  };
  var got = _.traitIs( Constr2 );
  test.identical( got, false );

  test.case = 'instance of Promise';
  var src = new Promise( ( resolve, reject ) => { return resolve( 0 ) } );
  var got = _.traitIs( src );
  test.identical( got, false );

  test.case = 'function _Promise';
  function Promise(){}
  var src = Promise;
  var got = _.traitIs( src );
  test.identical( got, false );

  test.case = 'check process';
  var src = process;
  var got = _.traitIs( src );
  test.identical( got, false );

  // instance of _.trait tested in module wBlueprint
}

//

function objectLike( test )
{
  test.description = 'array-like entities should not overlap with array-like entities set';

  test.identical( _.objectLike( new ArrayBuffer( 10 ) ), false );
  test.identical( _.objectLike( new Float32Array( 10 ) ), false );
  test.identical( _.objectLike( new Int32Array( 10 ) ), false );
  test.identical( _.objectLike( new DataView( new ArrayBuffer( 10 ) ) ), false );
  test.identical( _.objectLike( new Array( 10 ) ), false );
  test.identical( _.objectLike( [ 1, 2, 3 ] ), false );
  test.identical( _.objectLike( new Map ), false );

  test.description = 'this entities are object-like';

  test.identical( _.objectLike( _global_ ), true );
  test.identical( _.objectLike( {} ), true );
  test.identical( _.objectLike( Object.create( null ) ), true );
}

// --
// declaration
// --

var Self =
{

  name : 'Tools.Typing',
  silencing : 1,

  tests :
  {

    nothingIs,
    definedIs,
    primitiveIs,
    symbolIs,
    bigIntIs,

    //

    vectorAdapterIs,
    constructorIsVad,
    streamIs,
    // matrixIs, /* Dmytro : commented before */
    // constructorIsMatrix,

    consequenceIs,
    consequenceLike,
    promiseIs,
    promiseLike,

    typeOf,
    isPrototypeOf,
    prototypeHas,
    prototypeIs,
    prototypeIsStandard,
    constructorIs,
    instanceIs,
    instanceLike,

    consoleIs,
    printerIs,
    printerLike,
    loggerIs,
    processIs,
    procedureIs,
    definitionIs,
    traitIs,

    objectLike,

  }

}

//

Self = wTestSuite( Self );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

} )( );
