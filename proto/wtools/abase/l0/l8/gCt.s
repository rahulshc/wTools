( function _gCt_s_()
{

'use strict';

/* = Glossary::

CT -- colorful text.

*/

//

let _global = _global_;
let _ = _global_.wTools;
let Self = _.ct = _.ct || Object.create( null );

// --
// implementation
// --

function _formatAffixesBackground( color )
{
  let result = Object.create( null );

  _.assert( arguments.length === 1, 'Expects single argument' );
  _.assert( _.strIs( color ) );

  result.pre = `❮background : ${color}❯`;
  result.post = `❮background : default❯`;

  return result;
}

//

function formatBackground( srcStr, color )
{

  if( _.numberIs( color ) )
  color = _.color.colorNameNearest( color );

  _.assert( arguments.length === 2, 'Expects 2 arguments' );
  _.assert( _.strIs( srcStr ), 'Expects string {-srcStr-}' );
  _.assert( _.strIs( color ), 'Expects string {-color-}' );

  return `❮background : ${color}❯${srcStr}❮background : default❯`;
}

//

function _formatAffixesForeground( color )
{
  let result = Object.create( null );

  _.assert( arguments.length === 1, 'Expects single argument' );
  _.assert( _.strIs( color ) );

  result.pre = `❮foreground : ${color}❯`;
  result.post = `❮foreground : default❯`;

  return result;
}

//

function formatForeground( srcStr, color )
{

  if( _.numberIs( color ) )
  color = _.color.colorNameNearest( color );

  _.assert( arguments.length === 2, 'Expects 2 arguments' );
  _.assert( _.strIs( srcStr ), 'Expects string {-srcStr-}' );
  _.assert( _.strIs( color ), 'Expects string {-color-}' );

  return `❮foreground : ${color}❯${srcStr}❮foreground : default❯`;
}

//

function _strEscape( srcStr )
{
  let result = srcStr;
  if( _.numberIs( result ) )
  result = result + '';
  _.assert( arguments.length === 1 || arguments.length === 2 );
  _.assert( _.strIs( result ), 'Expects string got', _.strType( result ) );
  return '❮inputRaw:1❯' + srcStr + '❮inputRaw:0❯'
}

let escape = _.routineVectorize_functor( _strEscape );

//

function _strUnescape( srcStr )
{
  let result = srcStr;
  if( _.numberIs( result ) )
  result = result + '';
  _.assert( arguments.length === 1 || arguments.length === 2 );
  _.assert( _.strIs( result ), 'Expects string got', _.strType( result ) );
  return '❮inputRaw:0❯' + srcStr + '❮inputRaw:1❯'
}

let unescape = _.routineVectorize_functor( _strUnescape );

//

function styleObjectFor( style )
{
  _.assert( arguments.length === 1, 'Expects single argument' );
  _.assert( _.strIs( style ), 'Expects string got', _.strType( style ) );

  let result = _.ct.Style[ style ];

  _.assert( _.mapIs( result ), `No such style : ${style}` );

  return result;
}

//

function _affixesJoin()
{

  _.assert( _.mapIs( arguments[ 0 ] ) );

  for( let a = 1 ; a < arguments.length ; a++ )
  {
    arguments[ 0 ].pre = arguments[ a ].pre + arguments[ 0 ].pre;
    arguments[ 0 ].post = arguments[ 0 ].post + arguments[ a ].post;
  }

  return arguments[ 0 ];
}

//

function _formatAffixesForStyleObject( styleObject )
{
  let result = Object.create( null );
  result.pre = '';
  result.post = '';

  _.assertMapHasOnly( styleObject, _formatAffixesForStyleObject.defaults );

  if( styleObject.fg )
  _.ct._affixesJoin( result, _.ct._formatAffixesForeground( styleObject.fg ) );

  if( styleObject.bg )
  _.ct._affixesJoin( result, _.ct._formatAffixesBackground( styleObject.bg ) );

  return result;
}

_formatAffixesForStyleObject.defaults =
{
  fg : null,
  bg : null,
}

//

function _formatAffixes( styles )
{
  let result = Object.create( null );
  result.pre = '';
  result.post = '';

  // let StyleObjectOptions =
  // {
  //   fg : null,
  //   bg : null,
  // }

  styles = _.arrayAs( styles );

  _.assert( arguments.length === 1, 'Expects single argument' );
  _.assert( _.arrayIs( styles ), 'Expects string or array of strings {- styles -}' );

  for( let s = 0 ; s < styles.length ; s++ )
  {
    let style = styles[ s ];

    if( _.objectIs( style ) )
    {
      // let obj = style[ s ];
      // _.assertMapHasOnly( obj, StyleObjectOptions );
      // if( obj.fg )
      // result = join( result, _.ct._formatAffixesForeground( obj.fg ) );
      // if( obj.bg )
      // result = join( result, _.ct._formatAffixesBackground( obj.bg ) );

      let affixes = _.ct._formatAffixesForStyleObject( style );
      _.ct._affixesJoin( result, affixes );

      continue;
    }

    _.assert( _.strIs( style ), 'Expects string or array of strings { style }' );

    let styleObject = _.ct.styleObjectFor( style );
    _.assert( !!styleObject, 'Unknown style', _.strQuote( style ) );

    // if( styleObject.fg )
    // result = join( result, _.ct._formatAffixesForeground( styleObject.fg ) );
    //
    // if( styleObject.bg )
    // result = join( result, _.ct._formatAffixesBackground( styleObject.bg ) );

    let affixes = _.ct._formatAffixesForStyleObject( styleObject );
    _.ct._affixesJoin( result, affixes );

  }

  return result;

  /* */

  // function join()
  // {
  //   for( let a = 1 ; a < arguments.length ; a++ )
  //   {
  //     arguments[ 0 ].pre = arguments[ a ].pre + arguments[ 0 ].pre;
  //     arguments[ 0 ].post = arguments[ 0 ].post + arguments[ a ].post;
  //   }
  //   return arguments[ 0 ];
  // }

}

//

function _format( srcStr, style )
{
  let result = srcStr;

  if( _.numberIs( result ) )
  result = result + '';
  _.assert( arguments.length === 1 || arguments.length === 2 );
  _.assert( _.strIs( result ), 'Expects string got', _.strType( result ) );

  let r = _.ct._formatAffixes( style );

  result = r.pre + result + r.post;

  return result;
}

let format = _.routineVectorize_functor( _format );

//

function _strip( srcStr )
{
  // let result = '';

  _.assert( _.strIs( srcStr ) );

  let splitted = _.strSplitInlinedStereo_
  ({
    src : srcStr,
    preservingEmpty : 0,
    stripping : 0,
    preservingInlined : 0
  });

  return splitted.join( '' );

  // for( let i = 0 ; i < splitted.length ; i++ )
  // {
  //   if( _.strIs( splitted[ i ] ) )
  //   result += splitted[ i ];
  // }

  // return result;
}

let strip = _.vectorize( _strip );

//

function parse( o )
{
  return _.strSplitInlinedStereo_( o );
}

parse.defaults =
{
  src : null,
  prefix : '❮',
  postfix : '❯',
  onInlined : ( e ) => [ e ],
  onOrdinary : null,

  stripping : 0,
  quoting : 0,

  preservingEmpty : 1,
  preservingDelimeters : 0,
  preservingOrdinary : 1,
  preservingInlined : 1,
}

// --
// relation
// --

let Style =
{

  'positive' : { fg : 'green' },
  'negative' : { fg : 'red' },

  'path' : { fg : 'dark cyan' },
  'code' : { fg : 'dark green' },
  'entity' : { fg : 'bright blue' }, /* zzz : why cant i specify [ 0,0,0 ] ? */

  'topic.up' : { fg : 'white', bg : 'dark blue' },
  'topic.down' : { fg : 'dark black', bg : 'dark blue' },

  'head' : { fg : 'dark black', bg : 'white' },
  'tail' : { fg : 'white', bg : 'dark black' },

  'highlighted' : { fg : 'white', bg : 'dark black' },
  'selected' : { fg : 'dark yellow', bg : 'dark blue' },
  'neutral' : { fg : 'smoke', bg : 'dim' },

  'pipe.neutral' : { fg : 'dark magenta' },
  'pipe.negative' : { fg : 'dark red' },

  'exclusiveOutput.neutral' : { fg : 'dark black', bg : 'dark yellow' },
  'exclusiveOutput.negative' : { fg : 'dark red', bg : 'dark yellow' },

  'info.neutral' : { fg : 'white', bg : 'magenta' },
  'info.negative' : { fg : 'dark red', bg : 'magenta' },

}

// --
// declare
// --

let Extension =
{

  // routines

  _formatAffixesBackground,
  formatBackground,
  bg : formatBackground,

  _formatAffixesForeground,
  formatForeground,
  fg : formatForeground,

  escape,
  unescape,

  styleObjectFor,
  _affixesJoin,
  _formatAffixesForStyleObject,
  _formatAffixes,
  _format,
  format,
  formatFinal : format,

  strip,
  parse, /* qqq : implement | Done. Yevhen S.*/

  // fields

  Style,

}

Object.assign( Self, Extension );

// --
// export
// --

if( typeof module !== 'undefined' )
module[ 'exports' ] = Self;

})();
