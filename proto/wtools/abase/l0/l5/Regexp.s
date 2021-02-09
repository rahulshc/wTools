( function _l5_Regexp_s_()
{

'use strict';

let _global = _global_;
let _ = _global_.wTools;
// let Self = _global_.wTools;
let Regexp = _global_.wTools.regexp = _global_.wTools.regexp || Object.create( null );
let Regexps = _global_.wTools.regexp.s = _global_.wTools.regexp.s || Object.create( null );


// --
// regexp
// --

function _regexpTest( regexp, str )
{
  _.assert( arguments.length === 2 );
  _.assert( _.regexpLike( regexp ) );
  _.assert( _.strIs( str ) );

  if( _.strIs( regexp ) )
  return regexp === str;
  else
  return regexp.test( str );

}

//

function regexpTest( regexp, strs )
{
  _.assert( arguments.length === 2 );
  _.assert( _.regexpLike( regexp ) );

  if( _.strIs( strs ) )
  return _._regexpTest( regexp, strs );
  else if( _.arrayLike( strs ) )
  return strs.map( ( str ) => _._regexpTest( regexp, str ) )
  else _.assert( 0 );

}

//

function regexpTestAll( regexp, strs )
{
  _.assert( arguments.length === 2 );
  _.assert( _.regexpLike( regexp ) );

  if( _.strIs( strs ) )
  return _._regexpTest( regexp, strs );
  else if( _.arrayLike( strs ) )
  return strs.every( ( str ) => _._regexpTest( regexp, str ) )
  else _.assert( 0 );

}

//

function regexpTestAny( regexp, strs )
{
  _.assert( arguments.length === 2 );
  _.assert( _.regexpLike( regexp ) );

  if( _.strIs( strs ) )
  return _._regexpTest( regexp, strs );
  else if( _.arrayLike( strs ) )
  return strs.some( ( str ) => _._regexpTest( regexp, str ) )
  else _.assert( 0 );

}

//

function regexpTestNone( regexp, strs )
{
  _.assert( arguments.length === 2 );
  _.assert( _.regexpLike( regexp ) );

  if( _.strIs( strs ) )
  return !_._regexpTest( regexp, strs );
  else if( _.arrayLike( strs ) )
  return !strs.some( ( str ) => _._regexpTest( regexp, str ) )
  else _.assert( 0 );

}

//

function regexpsTestAll( regexps, strs )
{
  _.assert( arguments.length === 2 );

  if( !_.arrayIs( regexps ) )
  return _.regexpTestAll( regexps, strs );

  _.assert( _.regexpsLike( regexps ) );

  return regexps.every( ( regexp ) => _.regexpTestAll( regexp, strs ) );
}

//

function regexpsTestAny( regexps, strs )
{
  _.assert( arguments.length === 2 );

  if( !_.arrayIs( regexps ) )
  return _.regexpTestAny( regexps, strs );

  _.assert( _.regexpsLike( regexps ) );

  return regexps.some( ( regexp ) => _.regexpTestAny( regexp, strs ) );
}

//

function regexpsTestNone( regexps, strs )
{
  _.assert( arguments.length === 2 );

  if( !_.arrayIs( regexps ) )
  return _.regexpTestNone( regexps, strs );

  _.assert( _.regexpsLike( regexps ) );

  return regexps.every( ( regexp ) => _.regexpTestNone( regexp, strs ) );
}

// --
// extension
// --

let ExtensionTools =
{

  regexpsEscape : _.vectorize( _.regexpEscape ),

  _regexpTest,
  regexpTest,

  regexpTestAll,
  regexpTestAny,
  regexpTestNone,

  regexpsTestAll,
  regexpsTestAny,
  regexpsTestNone,

}

//

let Extension =
{

  // regexp

  _test : _regexpTest,
  test : regexpTest,

  testAll : regexpTestAll,
  testAny : regexpTestAny,
  testNone : regexpTestNone,

}

//

let ExtensionS =
{

  // regexps

  escape : _.vectorize( _.regexpEscape ),

  testAll : regexpsTestAll,
  testAny : regexpsTestAny,
  testNone : regexpsTestNone,

}

//

_.mapSupplement( Regexp, Extension );
_.mapSupplement( Regexps, ExtensionS );
_.mapSupplement( _, ExtensionTools ); /* qqq for Yevhen : create namespace _.regexp. stand-alone PR | aaa : Done. */

// --
// export
// --

if( typeof module !== 'undefined' )
module[ 'exports' ] = _;

})();
