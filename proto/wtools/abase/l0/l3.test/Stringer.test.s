( function _l0_l3_Stringer_test_s_()
{

'use strict';

if( typeof module !== 'undefined' )
{
  const _ = require( '../Include3.s' );
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
  var exp = {}
  test.identical( _.props.onlyOwn( _.prototype.each( it )[ 0 ] ), exp );
  var exp =
  {
    'tab' : '',
    'dtab' : '  ',
    'verbosity' : 5,
    'level' : 0,
  }
  test.identical( _.props.onlyOwn( _.prototype.each( it )[ 1 ] ), exp );
  var exp = new Set([ 'verbosity', 'Looker', 'iterator', 'iterationPrototype' ]);
  test.identical( new Set( _.props.keys( _.props.onlyOwn( _.prototype.each( it )[ 2 ] ) ) ), exp );
  var exp = new Set
  ([
    'OriginalLooker',
    'constructor',
    'optionsToIteration',
    'iteratorRetype',
    'iteratorInit',
    'iteratorIterationMake',
    'iterationMakeCommon',
    'iterationMake',
    'iterationProper',
    'Iterator',
    'Iteration',
    'head',
    'itUp',
    'itDown',
    'levelUp',
    'levelDown',
    'write',
    'nlWrite',
    'lineWrite',
    'IterationPreserve',
    'result',
    'Looker',
    'Prime'
  ]);
  test.identical( new Set( _.props.keys( _.props.onlyOwn( _.prototype.each( it )[ 3 ] ) ) ), exp );
  test.identical( _.prototype.each( it ).length, 4 );

  /* */

}

// --
// declaration
// --

const Proto =
{

  name : 'Tools.Stringer.l0.l3',
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
