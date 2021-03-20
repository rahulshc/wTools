( function _MinimalRoutineLayer3_test_s_()
{

'use strict';

if( typeof module !== 'undefined' )
{
  require( '../l0/l1/Predefined.s' );
  require( '../l0/l3/Array.s' );
  require( '../l0/l3/Entity.s' ); /* Array.s require */
  require( '../l0/l3/Err.s' );
  require( '../l0/l3/Map.s' );
  require( '../l0/l3/Routine.s' );
  require( '../l0/l3/Type.s' ); /* Map.s require */

  let toolsPath = '../../atop/testing/include/Top.s';
  let toolsExternal = 0;
  try
  {
    toolsPath = require.resolve( toolsPath );
  }
  catch( err )
  {
    toolsExternal = 1;
    require( 'wTesting' );
  }
  if( !toolsExternal )
  require( toolsPath );

}

const _ = _global_.wTools;

// --
//
// --

function routineOptions( test )
{
  test.case = 'args - empty map, defaults - empty map';
  var testRoutine = () => true;
  var defaults = {};
  var options = {};
  var got = _.routine.options( testRoutine, options, defaults );
  test.identical( got, {} );
  test.true( got === options );
  test.true( got !== defaults );

  test.case = 'args.length === 0, defaults - empty map';
  var testRoutine = () => true;
  var defaults = {};
  var options = [];
  var got = _.routine.options( testRoutine, options, defaults );
  test.identical( got, {} );
  test.identical( options, [] );
  test.true( got !== defaults );

  test.case = 'args.length === 1 - empty map, defaults - empty map';
  var testRoutine = () => true;
  var defaults = {};
  var options = [ {} ];
  var got = _.routine.options( testRoutine, options, defaults );
  test.identical( got, {} );
  test.identical( options.length, 1 );
  test.true( got === options[ 0 ] );
  test.true( got !== defaults );

  test.case = 'args - empty map, routine.defaults - empty map';
  var testRoutine = () => true;
  testRoutine.defaults = {};
  var options = {};
  var got = _.routine.options( testRoutine, options );
  test.identical( got, {} );
  test.true( got === options );
  test.true( got !== testRoutine.defaults );

  test.case = 'args.length === 0, routine.defaults - empty map';
  var testRoutine = () => true;
  testRoutine.defaults = {};
  var options = [];
  var got = _.routine.options( testRoutine, options );
  test.identical( got, {} );
  test.identical( options, [] );
  test.true( got !== testRoutine.defaults );

  test.case = 'args.length === 1 - empty map, defaults - empty map';
  var testRoutine = () => true;
  testRoutine.defaults = {};
  var options = [ {} ];
  var got = _.routine.options( testRoutine, options );
  test.identical( got, {} );
  test.identical( options.length, 1 );
  test.true( got === options[ 0 ] );
  test.true( got !== testRoutine.defaults );

  /* */

  test.case = 'args - empty map, defaults - map with options';
  var testRoutine = () => true;
  var defaults = { a : null, b : 1 };
  var options = {};
  var got = _.routine.options( testRoutine, options, defaults );
  test.identical( got, { a : null, b : 1 } );
  test.true( got === options );
  test.true( got !== defaults );

  test.case = 'args.length === 0, defaults - map with options';
  var testRoutine = () => true;
  var defaults = { a : null, b : 1 };
  var options = [];
  var got = _.routine.options( testRoutine, options, defaults );
  test.identical( got, { a : null, b : 1 } );
  test.identical( options, [] );
  test.true( got !== defaults );

  test.case = 'args.length === 1 - empty map, defaults - map with options';
  var testRoutine = () => true;
  var defaults = { a : null, b : 1 };
  var options = [ {} ];
  var got = _.routine.options( testRoutine, options, defaults );
  test.identical( got, { a : null, b : 1 } );
  test.identical( options.length, 1 );
  test.true( got === options[ 0 ] );
  test.true( got !== defaults );

  test.case = 'args - empty map, routine.defaults - map with options';
  var testRoutine = () => true;
  testRoutine.defaults = { a : null, b : 1 };
  var options = {};
  var got = _.routine.options( testRoutine, options );
  test.identical( got, { a : null, b : 1 } );
  test.true( got === options );
  test.true( got !== testRoutine.defaults );

  test.case = 'args.length === 0, routine.defaults - map with options';
  var testRoutine = () => true;
  testRoutine.defaults = { a : null, b : 1 };
  var options = [];
  var got = _.routine.options( testRoutine, options );
  test.identical( got, { a : null, b : 1 } );
  test.identical( options, [] );
  test.true( got !== testRoutine.defaults );

  test.case = 'args.length === 1 - empty map, defaults - map with options';
  var testRoutine = () => true;
  testRoutine.defaults = { a : null, b : 1 };
  var options = [ {} ];
  var got = _.routine.options( testRoutine, options );
  test.identical( got, { a : null, b : 1 } );
  test.identical( options.length, 1 );
  test.true( got === options[ 0 ] );
  test.true( got !== testRoutine.defaults );

  /* */

  test.case = 'args - map with undefined, defaults - map with options';
  var testRoutine = () => true;
  var defaults = { a : null, b : 1 };
  var options = { a : undefined, b : undefined };
  var got = _.routine.options( testRoutine, options, defaults );
  test.identical( got, { a : null, b : 1 } );
  test.true( got === options );
  test.true( got !== defaults );

  test.case = 'args.length === 1 - map with undefined, defaults - map with options';
  var testRoutine = () => true;
  var defaults = { a : null, b : 1 };
  var options = [ { a : undefined, b : undefined } ];
  var got = _.routine.options( testRoutine, options, defaults );
  test.identical( got, { a : null, b : 1 } );
  test.identical( options.length, 1 );
  test.true( got === options[ 0 ] );
  test.true( got !== defaults );

  test.case = 'args - map with undefined, routine.defaults - map with options';
  var testRoutine = () => true;
  testRoutine.defaults = { a : null, b : 1 };
  var options = { a : undefined, b : undefined };
  var got = _.routine.options( testRoutine, options );
  test.identical( got, { a : null, b : 1 } );
  test.true( got === options );
  test.true( got !== testRoutine.defaults );

  test.case = 'args.length === 1 - map with undefined, defaults - map with options';
  var testRoutine = () => true;
  testRoutine.defaults = { a : null, b : 1 };
  var options = [ { a : undefined, b : undefined } ];
  var got = _.routine.options( testRoutine, options );
  test.identical( got, { a : null, b : 1 } );
  test.identical( options.length, 1 );
  test.true( got === options[ 0 ] );
  test.true( got !== testRoutine.defaults );

  /* */

  test.case = 'args - map with undefine JS value, but not undefined, defaults - map with options';
  var testRoutine = () => true;
  var defaults = { a : null, b : 1 };
  var options = { a : 0, b : '' };
  var got = _.routine.options( testRoutine, options, defaults );
  test.identical( got, { a : 0, b : '' } );
  test.true( got === options );
  test.true( got !== defaults );

  test.case = 'args.length === 1 - map with undefine JS value, but not undefined, defaults - map with options';
  var testRoutine = () => true;
  var defaults = { a : null, b : 1 };
  var options = [ { a : 0, b : '' } ];
  var got = _.routine.options( testRoutine, options, defaults );
  test.identical( got, { a : 0, b : '' } );
  test.identical( options.length, 1 );
  test.true( got === options[ 0 ] );
  test.true( got !== defaults );

  test.case = 'args - map with undefine JS value, but not undefined, routine.defaults - map with options';
  var testRoutine = () => true;
  testRoutine.defaults = { a : null, b : 1 };
  var options = { a : 0, b : '' };
  var got = _.routine.options( testRoutine, options );
  test.identical( got, { a : 0, b : '' } );
  test.true( got === options );
  test.true( got !== testRoutine.defaults );

  test.case = 'args.length === 1 - map with undefine JS value, but not undefined, defaults - map with options';
  var testRoutine = () => true;
  testRoutine.defaults = { a : null, b : 1 };
  var options = [ { a : 0, b : '' } ];
  var got = _.routine.options( testRoutine, options );
  test.identical( got, { a : 0, b : '' } );
  test.identical( options.length, 1 );
  test.true( got === options[ 0 ] );
  test.true( got !== testRoutine.defaults );

  /* */

  test.case = 'args - map with defined values, defaults - map with options';
  var testRoutine = () => true;
  var defaults = { a : null, b : 1 };
  var options = { a : true, b : 'b' };
  var got = _.routine.options( testRoutine, options, defaults );
  test.identical( got, { a : true, b : 'b' } );
  test.true( got === options );
  test.true( got !== defaults );

  test.case = 'args.length === 1 - map with defined values, defaults - map with options';
  var testRoutine = () => true;
  var defaults = { a : null, b : 1 };
  var options = [ { a : true, b : 'b' } ];
  var got = _.routine.options( testRoutine, options, defaults );
  test.identical( got, { a : true, b : 'b' } );
  test.identical( options.length, 1 );
  test.true( got === options[ 0 ] );
  test.true( got !== defaults );

  test.case = 'args - map with defined values, routine.defaults - map with options';
  var testRoutine = () => true;
  testRoutine.defaults = { a : null, b : 1 };
  var options = { a : true, b : 'b' };
  var got = _.routine.options( testRoutine, options );
  test.identical( got, { a : true, b : 'b' } );
  test.true( got === options );
  test.true( got !== testRoutine.defaults );

  test.case = 'args.length === 1 - map with defined values, defaults - map with options';
  var testRoutine = () => true;
  testRoutine.defaults = { a : null, b : 1 };
  var options = [ { a : true, b : 'b' } ];
  var got = _.routine.options( testRoutine, options );
  test.identical( got, { a : true, b : 'b' } );
  test.identical( options.length, 1 );
  test.true( got === options[ 0 ] );
  test.true( got !== testRoutine.defaults );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.routine.options() );

  test.case = 'not enough arguments';
  var testRoutine = () => true;
  test.shouldThrowErrorSync( () => _.routine.options( testRoutine ) );

  test.case = 'extra arguments';
  var testRoutine = () => true;
  test.shouldThrowErrorSync( () => _.routine.options( testRoutine, {}, {}, {} ) );

  test.case = 'wrong type of routine';
  test.shouldThrowErrorSync( () => _.routine.options( 'wrong', {}, {} ) );

  test.case = 'wrong type of args';
  var testRoutine = () => true;
  test.shouldThrowErrorSync( () => _.routine.options( testRoutine, 'wrong', {} ) );
  test.shouldThrowErrorSync( () => _.routine.options( testRoutine, [ 'wrong' ], {} ) );

  test.case = 'wrong type of defaults';
  var testRoutine = () => true;
  test.shouldThrowErrorSync( () => _.routine.options( testRoutine, {}, 'wrong' ) );

  test.case = 'wrong type of defaults';
  var testRoutine = () => true;
  testRoutine.defaults = 'wrong';
  test.shouldThrowErrorSync( () => _.routine.options( testRoutine, {} ) );

  test.case = 'args.length > 1';
  var testRoutine = () => true;
  test.shouldThrowErrorSync( () => _.routine.options( testRoutine, [ {}, {} ], {} ) );

  test.case = 'options has unknown options';
  var testRoutine = () => true;
  var msg = 'Routine testRoutine does not expect options: "unknown", "b"';
  var errCallback = ( err, arg ) =>
  {
    test.identical( arg, undefined );
    test.true( _.errIs( err ) );
    test.identical( _.strCount( err.message, msg ), 1 );
  };
  test.shouldThrowErrorSync( () => _.routine.options( testRoutine, { unknown : true, b : 1 }, {} ), errCallback );
  test.shouldThrowErrorSync( () => _.routine.options( testRoutine, [ { unknown : true, b : 1 } ], {} ), errCallback );
  test.shouldThrowErrorSync( () => _.routine.options( testRoutine, { unknown : true, b : 1 }, { known : 1 } ), errCallback );
  test.shouldThrowErrorSync( () => _.routine.options( testRoutine, [ { unknown : true, b : 1 } ], { known : 1 } ), errCallback );

  test.case = 'options has unknown options';
  var testRoutine = () => true;
  testRoutine.defaults = { known : 1 };
  var msg = 'Routine testRoutine does not expect options: "unknown"';
  var errCallback = ( err, arg ) =>
  {
    test.identical( arg, undefined );
    test.true( _.errIs( err ) );
    test.identical( _.strCount( err.message, msg ), 1 );
  };
  test.shouldThrowErrorSync( () => _.routine.options( testRoutine, { unknown : true } ), errCallback );
  test.shouldThrowErrorSync( () => _.routine.options( testRoutine, [ { unknown : true } ] ), errCallback );

  test.case = 'defaults has objectLike value';
  var testRoutine = () => true;
  var msg = 'Source map should have only primitive elements, but known is [object Object]';
  var errCallback = ( err, arg ) =>
  {
    test.identical( arg, undefined );
    test.true( _.errIs( err ) );
    test.identical( _.strCount( err.message, msg ), 1 );
  };
  test.shouldThrowErrorSync( () => _.routine.options( testRoutine, {}, { known : { objectLike : true } } ), errCallback );

  test.case = 'defaults has objectLike value';
  var testRoutine = () => true;
  testRoutine.defaults = { known : { objectLike : true } };
  var msg = 'Source map should have only primitive elements, but known is [object Object]';
  var errCallback = ( err, arg ) =>
  {
    test.identical( arg, undefined );
    test.true( _.errIs( err ) );
    test.identical( _.strCount( err.message, msg ), 1 );
  };
  test.shouldThrowErrorSync( () => _.routine.options( testRoutine, {} ), errCallback );

  test.case = 'defaults has value `undefined`';
  var testRoutine = () => true;
  var msg = 'Options map for routine testRoutine should have no undefined fields, but it does have "known"';
  var errCallback = ( err, arg ) =>
  {
    test.identical( arg, undefined );
    test.true( _.errIs( err ) );
    test.identical( _.strCount( err.message, msg ), 1 );
  };
  test.shouldThrowErrorSync( () => _.routine.options( testRoutine, {}, { known : undefined } ), errCallback );

  test.case = 'defaults has value `undefined`';
  var testRoutine = () => true;
  testRoutine.defaults = { known : undefined };
  var msg = 'Options map for routine testRoutine should have no undefined fields, but it does have "known"';
  var errCallback = ( err, arg ) =>
  {
    test.identical( arg, undefined );
    test.true( _.errIs( err ) );
    test.identical( _.strCount( err.message, msg ), 1 );
  };
  test.shouldThrowErrorSync( () => _.routine.options( testRoutine, {} ), errCallback );
}

//

function assertRoutineOptions( test )
{
  test.case = 'args - empty map, defaults - empty map';
  var testRoutine = () => true;
  var defaults = {};
  var options = {};
  var got = _.routine.assertOptions( testRoutine, options, defaults );
  test.identical( got, {} );
  test.true( got === options );
  test.true( got !== defaults );

  test.case = 'args.length === 1 - empty map, defaults - empty map';
  var testRoutine = () => true;
  var defaults = {};
  var options = [ {} ];
  var got = _.routine.assertOptions( testRoutine, options, defaults );
  test.identical( got, {} );
  test.true( got === options[ 0 ] );
  test.true( got !== defaults );

  test.case = 'args - empty map, routine.defaults - empty map';
  var testRoutine = () => true;
  testRoutine.defaults = {};
  var options = {};
  var got = _.routine.assertOptions( testRoutine, options );
  test.identical( got, {} );
  test.true( got === options );
  test.true( got !== defaults );

  test.case = 'args.length === 1 - empty map, routine.defaults - empty map';
  var testRoutine = () => true;
  testRoutine.defaults = {};
  var options = [ {} ];
  var got = _.routine.assertOptions( testRoutine, options );
  test.identical( got, {} );
  test.true( got === options[ 0 ] );
  test.true( got !== defaults );

  /* */

  test.case = 'args - map with undefine JS value, but not undefined, defaults - map with options';
  var testRoutine = () => true;
  var defaults = { a : null, b : 1 };
  var options = { a : 0, b : '' };
  var got = _.routine.assertOptions( testRoutine, options, defaults );
  test.identical( got, { a : 0, b : '' } );
  test.true( got === options );
  test.true( got !== defaults );

  test.case = 'args.length === 1 - map with undefine JS value, but not undefined, defaults - map with options';
  var testRoutine = () => true;
  var defaults = { a : null, b : 1 };
  var options = [ { a : 0, b : '' } ];
  var got = _.routine.assertOptions( testRoutine, options, defaults );
  test.identical( got, { a : 0, b : '' } );
  test.identical( options.length, 1 );
  test.true( got === options[ 0 ] );
  test.true( got !== defaults );

  test.case = 'args - map with undefine JS value, but not undefined, routine.defaults - map with options';
  var testRoutine = () => true;
  testRoutine.defaults = { a : null, b : 1 };
  var options = { a : 0, b : '' };
  var got = _.routine.assertOptions( testRoutine, options );
  test.identical( got, { a : 0, b : '' } );
  test.true( got === options );
  test.true( got !== testRoutine.defaults );

  test.case = 'args.length === 1 - map with undefine JS value, but not undefined, defaults - map with options';
  var testRoutine = () => true;
  testRoutine.defaults = { a : null, b : 1 };
  var options = [ { a : 0, b : '' } ];
  var got = _.routine.assertOptions( testRoutine, options );
  test.identical( got, { a : 0, b : '' } );
  test.identical( options.length, 1 );
  test.true( got === options[ 0 ] );
  test.true( got !== testRoutine.defaults );

  /* */

  test.case = 'args - map with defined values, defaults - map with options';
  var testRoutine = () => true;
  var defaults = { a : null, b : 1 };
  var options = { a : true, b : 'b' };
  var got = _.routine.assertOptions( testRoutine, options, defaults );
  test.identical( got, { a : true, b : 'b' } );
  test.true( got === options );
  test.true( got !== defaults );

  test.case = 'args.length === 1 - map with defined values, defaults - map with options';
  var testRoutine = () => true;
  var defaults = { a : null, b : 1 };
  var options = [ { a : true, b : 'b' } ];
  var got = _.routine.assertOptions( testRoutine, options, defaults );
  test.identical( got, { a : true, b : 'b' } );
  test.identical( options.length, 1 );
  test.true( got === options[ 0 ] );
  test.true( got !== defaults );

  test.case = 'args - map with defined values, routine.defaults - map with options';
  var testRoutine = () => true;
  testRoutine.defaults = { a : null, b : 1 };
  var options = { a : true, b : 'b' };
  var got = _.routine.assertOptions( testRoutine, options );
  test.identical( got, { a : true, b : 'b' } );
  test.true( got === options );
  test.true( got !== testRoutine.defaults );

  test.case = 'args.length === 1 - map with defined values, defaults - map with options';
  var testRoutine = () => true;
  testRoutine.defaults = { a : null, b : 1 };
  var options = [ { a : true, b : 'b' } ];
  var got = _.routine.assertOptions( testRoutine, options );
  test.identical( got, { a : true, b : 'b' } );
  test.identical( options.length, 1 );
  test.true( got === options[ 0 ] );
  test.true( got !== testRoutine.defaults );

  /* */

  test.case = 'args - map with defined values, defaults - map with undefined';
  var testRoutine = () => true;
  var defaults = { a : undefined, b : undefined };
  var options = { a : true, b : 'b' };
  var got = _.routine.assertOptions( testRoutine, options, defaults );
  test.identical( got, { a : true, b : 'b' } );
  test.true( got === options );
  test.true( got !== defaults );

  test.case = 'args.length === 1 - map with defined values, defaults - map with undefined';
  var testRoutine = () => true;
  var defaults = { a : undefined, b : undefined };
  var options = [ { a : true, b : 'b' } ];
  var got = _.routine.assertOptions( testRoutine, options, defaults );
  test.identical( got, { a : true, b : 'b' } );
  test.identical( options.length, 1 );
  test.true( got === options[ 0 ] );
  test.true( got !== defaults );

  test.case = 'args - map with defined values, routine.defaults - map with undefined';
  var testRoutine = () => true;
  testRoutine.defaults = { a : undefined, b : undefined };
  var options = { a : true, b : 'b' };
  var got = _.routine.assertOptions( testRoutine, options );
  test.identical( got, { a : true, b : 'b' } );
  test.true( got === options );
  test.true( got !== testRoutine.defaults );

  test.case = 'args.length === 1 - map with defined values, defaults - map with undefined';
  var testRoutine = () => true;
  testRoutine.defaults = { a : undefined, b : undefined };
  var options = [ { a : true, b : 'b' } ];
  var got = _.routine.assertOptions( testRoutine, options );
  test.identical( got, { a : true, b : 'b' } );
  test.identical( options.length, 1 );
  test.true( got === options[ 0 ] );
  test.true( got !== testRoutine.defaults );

  /* */

  test.case = 'args - map with defined values, defaults - map with undefined';
  var testRoutine = () => true;
  var defaults = { a : { c : 'c' }, b : [ 'b' ] };
  var options = { a : true, b : 'b' };
  var got = _.routine.assertOptions( testRoutine, options, defaults );
  test.identical( got, { a : true, b : 'b' } );
  test.true( got === options );
  test.true( got !== defaults );

  test.case = 'args.length === 1 - map with defined values, defaults - map with undefined';
  var testRoutine = () => true;
  var defaults = { a : { c : 'c' }, b : [ 'b' ] };
  var options = [ { a : true, b : 'b' } ];
  var got = _.routine.assertOptions( testRoutine, options, defaults );
  test.identical( got, { a : true, b : 'b' } );
  test.identical( options.length, 1 );
  test.true( got === options[ 0 ] );
  test.true( got !== defaults );

  test.case = 'args - map with defined values, routine.defaults - map with undefined';
  var testRoutine = () => true;
  testRoutine.defaults = { a : { c : 'c' }, b : [ 'b' ] };
  var options = { a : true, b : 'b' };
  var got = _.routine.assertOptions( testRoutine, options );
  test.identical( got, { a : true, b : 'b' } );
  test.true( got === options );
  test.true( got !== testRoutine.defaults );

  test.case = 'args.length === 1 - map with defined values, defaults - map with maps and arrays';
  var testRoutine = () => true;
  testRoutine.defaults = { a : { c : 'c' }, b : [ 'b' ] };
  var options = [ { a : true, b : 'b' } ];
  var got = _.routine.assertOptions( testRoutine, options );
  test.identical( got, { a : true, b : 'b' } );
  test.identical( options.length, 1 );
  test.true( got === options[ 0 ] );
  test.true( got !== testRoutine.defaults );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.routine.assertOptions() );

  test.case = 'not enough arguments';
  var testRoutine = () => true;
  test.shouldThrowErrorSync( () => _.routine.assertOptions( testRoutine ) );

  test.case = 'extra arguments';
  var testRoutine = () => true;
  test.shouldThrowErrorSync( () => _.routine.assertOptions( testRoutine, {}, {}, {} ) );

  test.case = 'wrong type of routine';
  test.shouldThrowErrorSync( () => _.routine.assertOptions( 'wrong', {}, {} ) );

  test.case = 'wrong type of args';
  var testRoutine = () => true;
  test.shouldThrowErrorSync( () => _.routine.assertOptions( testRoutine, 'wrong', {} ) );
  test.shouldThrowErrorSync( () => _.routine.assertOptions( testRoutine, [ 'wrong' ], {} ) );

  test.case = 'wrong type of defaults';
  var testRoutine = () => true;
  test.shouldThrowErrorSync( () => _.routine.assertOptions( testRoutine, {}, 'wrong' ) );

  test.case = 'wrong type of defaults';
  var testRoutine = () => true;
  testRoutine.defaults = 'wrong';
  test.shouldThrowErrorSync( () => _.routine.assertOptions( testRoutine, {} ) );

  test.case = 'args.length > 1';
  var testRoutine = () => true;
  test.shouldThrowErrorSync( () => _.routine.assertOptions( testRoutine, [ {}, {} ], {} ) );

  test.case = 'options has unknown options';
  var testRoutine = () => true;
  var msg = 'Object should have no fields : "unknown", "b"';
  var errCallback = ( err, arg ) =>
  {
    test.identical( arg, undefined );
    test.true( _.errIs( err ) );
    test.identical( _.strCount( err.message, msg ), 1 );
  };
  test.shouldThrowErrorSync( () => _.routine.assertOptions( testRoutine, { unknown : true, b : 1 }, {} ), errCallback );
  test.shouldThrowErrorSync( () => _.routine.assertOptions( testRoutine, [ { unknown : true, b : 1 } ], {} ), errCallback );
  test.shouldThrowErrorSync( () => _.routine.assertOptions( testRoutine, { unknown : true, b : 1 }, { known : 1 } ), errCallback );
  test.shouldThrowErrorSync( () =>
  {
    return _.routine.assertOptions( testRoutine, [ { unknown : true, b : 1 } ], { known : 1 } );
  },
  errCallback );

  test.case = 'options has unknown options';
  var testRoutine = () => true;
  testRoutine.defaults = { known : 1 };
  var msg = 'Object should have no fields : "unknown"';
  var errCallback = ( err, arg ) =>
  {
    test.identical( arg, undefined );
    test.true( _.errIs( err ) );
    test.identical( _.strCount( err.message, msg ), 1 );
  };
  test.shouldThrowErrorSync( () => _.routine.assertOptions( testRoutine, { unknown : true } ), errCallback );
  test.shouldThrowErrorSync( () => _.routine.assertOptions( testRoutine, [ { unknown : true } ] ), errCallback );

  test.case = 'options has not all keys';
  var testRoutine = () => true;
  var msg = 'Object should have fields : "known", "b"';
  var errCallback = ( err, arg ) =>
  {
    test.identical( arg, undefined );
    test.true( _.errIs( err ) );
    test.identical( _.strCount( err.message, msg ), 1 );
  };
  test.shouldThrowErrorSync( () => _.routine.assertOptions( testRoutine, {}, { known : true, b : 1 } ), errCallback );

  test.case = 'options has not all keys';
  var testRoutine = () => true;
  testRoutine.defaults = { known : true, b : 1 };
  var msg = 'Object should have fields : "known", "b"';
  var errCallback = ( err, arg ) =>
  {
    test.identical( arg, undefined );
    test.true( _.errIs( err ) );
    test.identical( _.strCount( err.message, msg ), 1 );
  };
  test.shouldThrowErrorSync( () => _.routine.assertOptions( testRoutine, {} ), errCallback );

  test.case = 'options has value `undefined`';
  var testRoutine = () => true;
  var msg = 'Object should have no undefines, but has : "known"';
  var errCallback = ( err, arg ) =>
  {
    test.identical( arg, undefined );
    test.true( _.errIs( err ) );
    test.identical( _.strCount( err.message, msg ), 1 );
  };
  test.shouldThrowErrorSync( () => _.routine.assertOptions( testRoutine, { known : undefined }, { known : 1 } ), errCallback );

  test.case = 'options has value `undefined`';
  var testRoutine = () => true;
  testRoutine.defaults = { known : 1 };
  var msg = 'Object should have no undefines, but has : "known"';
  var errCallback = ( err, arg ) =>
  {
    test.identical( arg, undefined );
    test.true( _.errIs( err ) );
    test.identical( _.strCount( err.message, msg ), 1 );
  };
  test.shouldThrowErrorSync( () => _.routine.assertOptions( testRoutine, { known : undefined } ), errCallback );
}

// --
//
// --

let Self =
{

  name : 'Tools.MinimalRoutineLayer3',
  silencing : 1,

  tests :
  {

    routineOptions,
    assertRoutineOptions,

  }

}

Self = wTestSuite( Self );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

})();
