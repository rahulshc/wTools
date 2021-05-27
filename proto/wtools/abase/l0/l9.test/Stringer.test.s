( function _l0_l9_Stringer_test_s_()
{

'use strict';

if( typeof module !== 'undefined' )
{
  const _ = require( 'Tools' );;
  require( 'wTesting' );
}

const _global = _global_;
const _ = _global_.wTools;
const __ = _globals_.testing.wTools;

// --
// tests
// --

function basic( test )
{

  /* */

  test.case = 'basic';
  var it = _.stringer.it({ verbosity : 5 });
  test.identical( it.tab, '' );
  test.identical( it.dtab, '  ' );
  test.identical( it.tabLevel, 0 );
  test.identical( it.verbosity, 5 );
  var exp = {}
  test.identical( _.props.onlyOwn( _.prototype.each( it )[ 0 ] ), exp );
  var exp =
  {
    // 'tab' : '',
    'verbosity' : 5,
    // 'tabLevel' : 0,
  }
  test.identical( _.props.onlyOwn( _.prototype.each( it )[ 1 ] ), exp );
  // var exp = new Set([ 'verbosity', 'Looker', 'iterator', 'iterationPrototype' ]);
  var exp = new Set([ 'tab', 'verbosity', 'tabLevel' ]);
  test.identical( new Set( _.props.keys( _.props.onlyOwn( _.prototype.each( it )[ 2 ] ) ) ), exp );
  var exp = new Set([ 'verbosity', 'Seeker', 'iterator', 'iterationPrototype', 'firstIterationPrototype' ]);
  test.identical( new Set( _.props.keys( _.props.onlyOwn( _.prototype.each( it )[ 3 ] ) ) ), exp );

  // var exp = new Set
  // ([
  //   'OriginalSeeker',
  //   'Seeker',
  //   'constructor',
  //   'head',
  //   'optionsToIteration',
  //   'optionsFromArguments',
  //   'iteratorProper',
  //   'iteratorRetype',
  //   'iteratorInit',
  //   'iteratorInitBegin',
  //   'iteratorInitEnd',
  //   'iteratorIterationMake',
  //   'iterationMake',
  //   'iterationProper',
  //   'onUp',
  //   'onDown',
  //   'Iterator',
  //   'Iteration',
  //   'IterationPreserve',
  //   'itUp',
  //   'itDown',
  //   'levelUp',
  //   'levelDown',
  //   'write',
  //   'nlWrite',
  //   'tabWrite',
  //   'lineWrite',
  //   'result',
  //   'dtab',
  //   'tab',
  //   'verbosity',
  //   'tabLevel',
  //   'Prime'
  // ]);
  // test.identical( new Set( _.props.keys( _.props.onlyOwn( _.prototype.each( it )[ 4 ] ) ) ), exp );
  test.identical( _.prototype.each( it ).length, 5 );

  /* */

}

// --
// declaration
// --

const Proto =
{

  name : 'Tools.Stringer.l0.l9',
  silencing : 1,

  tests :
  {

    basic,

  }

}

//

const Self = wTestSuite( Proto );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

})();
