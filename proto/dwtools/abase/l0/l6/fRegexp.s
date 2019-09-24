( function _fRegexp_s_() {

'use strict';

let _global = _global_;
let _ = _global_.wTools;
let Self = _global_.wTools;

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
// fields
// --

let Fields =
{
}

// --
// routines
// --

let Routines =
{

  // regexp

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

Object.assign( Self, Routines );
Object.assign( Self, Fields );

// --
// export
// --

if( typeof module !== 'undefined' && module !== null )
module[ 'exports' ] = Self;

})();
