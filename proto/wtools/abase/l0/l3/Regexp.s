( function _l3_Regexp_s_()
{

'use strict';

const _global = _global_;
const _ = _global_.wTools;

// --
// regexp
// --

function _identicalShallow( src1, src2 )
{
  return src1.source === src2.source && src1.flags === src2.flags;
}

//

function identicalShallow( src1, src2, o )
{
  _.assert( arguments.length === 2 || arguments.length === 3 );
  if( !_.regexp.is( src1 ) || !_.regexp.is( src2 ) )
  return false;
  return _.regexp._identicalShallow( src1, src2 );
}

//

function _equivalentShallow( src1, src2 )
{
  let strIs1 = _.strIs( src1 );
  let strIs2 = _.strIs( src2 );

  _.assert( arguments.length === 2, 'Expects exactly two arguments' );

  if( !strIs1 && strIs2 )
  return _.regexp._equivalentShallow( src2, src1 );

  _.assert( _.regexpLike( src1 ), 'Expects string-like ( string or regexp )' );
  _.assert( _.regexpLike( src1 ), 'Expects string-like ( string or regexp )' );

  if( strIs1 && strIs2 )
  {
    return src1 === src2;
    // if( src1 === src2 )
    // return true;
    // return _.strLinesStrip( src1 ) === _.strLinesStrip( src2 );
  }
  else if( strIs1 )
  {
    _.assert( !!src2.exec );
    let matched = src2.exec( src1 );
    if( !matched )
    return false;
    if( matched[ 0 ].length !== src1.length )
    return false;
    return true;
  }
  else
  {
    return _.regexp.identical( src1, src2 );
  }

  return false;
}

//

function equivalentShallow( src1, src2 )
{
  _.assert( arguments.length === 2 || arguments.length === 3 );
  if( !_.regexp.like( src1 ) || !_.regexp.like( src2 ) )
  return false;
  return _.regexp._equivalentShallow( src1, src2 );
  // _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  // if( !_.regexpIs( src1 ) || !_.regexpIs( src2 ) )
  // return false;
  // return src1.source === src2.source;
}

//

function exportStringShallowDiagnostic( src )
{
  _.assert( arguments.length === 1, 'Expects exactly one argument' );
  _.assert( _.regexp.is( src ) );

  return `/${src.source}/${src.flags}`;
}

//

function regexpsEquivalent( src1, src2 )
{

  _.assert( _.strIs( src1 ) || _.regexpIs( src1 ) || _.longIs( src1 ), 'Expects string/regexp or array of strings/regexps {-src1-}' );
  _.assert( _.strIs( src2 ) || _.regexpIs( src2 ) || _.longIs( src2 ), 'Expects string/regexp or array of strings/regexps {-src2-}' );
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );

  let isLong1 = _.longIs( src1 );
  let isLong2 = _.longIs( src2 );

  if( isLong1 && isLong2 )
  {
    let result = [];
    _.assert( src1.length === src2.length );
    for( let i = 0, len = src1.length ; i < len; i++ )
    {
      result[ i ] = _.regexp.equivalent( src1[ i ], src2[ i ] );
    }
    return result;
  }
  else if( !isLong1 && isLong2 )
  {
    let result = [];
    for( let i = 0, len = src2.length ; i < len; i++ )
    {
      result[ i ] = _.regexp.equivalent( src1, src2[ i ] );
    }
    return result;
  }
  else if( isLong1 && !isLong2 )
  {
    let result = [];
    for( let i = 0, len = src1.length ; i < len; i++ )
    {
      result[ i ] = _.regexp.equivalent( src1[ i ], src2 );
    }
    return result;
  }
  else
  {
    return _.regexp.equivalent( src1, src2 );
  }

}

// --
// extension
// --

let ToolsExtension =
{

  regexpIdentical : identicalShallow, /* qqq : cover please */
  regexpEquivalent : equivalentShallow, /* qqq : cover please | Done. Yevhen S. */

  regexpsEquivalent : regexpsEquivalent,

}

Object.assign( _, ToolsExtension )

//

let RegexpExtension =
{

  // regexp

  _identicalShallow,
  identicalShallow,
  identical : identicalShallow,
  _equivalentShallow,
  equivalentShallow,
  equivalent : equivalentShallow,

  // exporter

  exportString : exportStringShallowDiagnostic,
  exportStringShallow : exportStringShallowDiagnostic,
  exportStringShallowDiagnostic,
  exportStringShallowCode : exportStringShallowDiagnostic,
  exportStringDiagnostic : exportStringShallowDiagnostic,
  exportStringCode : exportStringShallowDiagnostic,

}

Object.assign( _.regexp, RegexpExtension )

//

let RegexpsExtension =
{

  regexpsEquivalent,

}

Object.assign( _.regexp.s, RegexpsExtension )

})();
