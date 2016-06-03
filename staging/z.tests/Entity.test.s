( function( ) {

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

  var entityMap = function( test )
  {

    var entity1 = [ 3, 4, 5 ],
      entity2 = { '3': 3, '4': 4, '5': 5 },
      expected1 = [ 9, 16, 25 ],
      expected2 = { '3': 9, '4': 16, '5': 25 },
      expected3 = entity1.slice();

    var constr1 = function() {
      this.a = 1;
      this.b = 3;
      this.c = 4;
    }
    var entity4 = new constr1(),
      expected4 = { a: '1a', b: '9b', c: '16c'};


    var callback1 = function(v, i, ent) {
      return v * v;
    };

    var callback2 = function(v, i, ent) {
      return v * v + i;
    };

    var callback3 = function(v, i, ent) {
      if (externEnt) externEnt = ent;
      return v * v + i;
    };

    test.description = 'simple test with mapping array by sqr';
    var got = _.entityMap(entity1, callback1);
    test.identical( got,expected1 );

    test.description = 'simple test with mapping array by sqr: source array should not be modified';
    var got = _.entityMap(entity1, callback1);
    test.identical( entity1, expected3 );

    test.description = 'simple test with mapping object by sqr';
    var got = _.entityMap(entity2, callback1);
    test.identical( got,expected2 );

    test.description = 'simple test with mapping object by sqr: using constructor';
    var got = _.entityMap(entity4, callback2);
    test.identical( got, expected4 );

    test.description = 'simple test with mapping object by sqr: check constructor';
    test.identical( got instanceof constr1, true );

    test.description = 'simple test with mapping object by sqr: check callback arguments';
    var externEnt = {};
    var got = _.entityMap(entity4, callback3);
    test.identical( externEnt, entity4 );

    if( Object.is )
    {
      test.description = 'simple test with mapping object by sqr: source object should be unmodified';
      test.identical( Object.is(got, entity4), false );
    }

    /**/

    if( Config.debug )
    {

      test.description = 'missed arguments';
      test.shouldThrowError( function()
      {
        _.entityMap();
      });

      test.description = 'extra argument';
      test.shouldThrowError( function()
      {
        _.entityMap( [ 1,3 ], callback1, callback2);
      });

      test.description = 'second argument is not routine';
      test.shouldThrowError( function()
      {
        _.entityMap( [ 1,3 ], 'callback');
      });

    }

  };

  //

  var Proto =
  {

    name : 'entity',

    tests:
    {

      entityMap : entityMap,

    }

  };

  _.mapExtend( Self,Proto );

  if( typeof module !== 'undefined' && !module.parent )
    _.testing.test( Self );

} )( );
