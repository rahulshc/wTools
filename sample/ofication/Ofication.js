let _ = require( 'wTools' );

/**
 * Ofication example
 * Got: function mapToStr( src, keyValDelimeter, entryDelimeter) { ... }
 * The mapToStr() routine converts and returns the passed object {-srcMap-} to the string.
 */

function mapToStr( src, keyValDelimeter, entryDelimeter )
{
  let result = '';
  for( let s in src )
  {
    result += s + keyValDelimeter + src[ s ] + entryDelimeter;
  }

  result = result.substr( 0, result.length-entryDelimeter.length );

  return result
}
/**
 * To oficate routine we need:
 *  - Create 1 parameter 'o'
 *  - Add default values map
 *  - Add checks (Here: check for one string argument and the amount of parameters)
 *  - Add call to '_.routineOptions( mapToStr, o )'
 *  - In the routine's body work with parameters through keys - o.src, etc.
 */

// Oficated routine

function mapToStr( o )
{

  if( _.strIs( o ) )
  o = { src : o }

  _.routineOptions( mapToStr, o );
  _.assert( arguments.length === 1, 'Expects single argument' );

  let result = '';
  for( let s in o.src )
  {
    result += s + o.keyValDelimeter + o.src[ s ] + o.entryDelimeter;
  }

  result = result.substr( 0, result.length-o.entryDelimeter.length );

  return result
}

mapToStr.defaults =
{
  src : null,
  keyValDelimeter : ':',
  entryDelimeter : ';',
}


// OFICATED ROUTINES EXAMPLES:

// Selects range( o.range ) of lines from source string( o.src ).
function strLinesSelect( o )
{

  if( arguments.length === 2 )
  {

    if( _.arrayIs( arguments[ 1 ] ) )
    o = { src : arguments[ 0 ], range : arguments[ 1 ] };
    else if( _.numberIs( arguments[ 1 ] ) )
      o = { src : arguments[ 0 ], range : [ arguments[ 1 ], arguments[ 1 ]+1 ] };
    else _.assert( 0, 'unexpected argument', _.strType( range ) );

  }
  else if( arguments.length === 3 )
  {
    o = { src : arguments[ 0 ], range : [ arguments[ 1 ], arguments[ 2 ] ] };
  }

  _.routineOptions( strLinesSelect, o );
  _.assert( arguments.length <= 3 );
  _.assert( _.strIs( o.src ) );
  _.assert( _.boolLike( o.highlighting ) || _.longHas( [ '*' ], o.highlighting ) );

  if( _.boolLike( o.highlighting ) && o.highlighting )
  o.highlighting = '*';

  /* range */

  if( !o.range )
  {
    if( o.line !== null )
    {
      if( o.selectMode === 'center' )
      o.range = [ o.line - Math.ceil( ( o.numberOfLines + 1 ) / 2 ) + 1, o.line + Math.floor( ( o.numberOfLines - 1 ) / 2 ) + 1 ];
      else if( o.selectMode === 'begin' )
        o.range = [ o.line, o.line + o.numberOfLines ];
      else if( o.selectMode === 'end' )
        o.range = [ o.line - o.numberOfLines+1, o.line+1 ];
    }
    else
    {
      o.range = [ 0, _.strCount( o.src, o.delimteter )+1 ];
    }
  }

  if( o.line === null )
  {
    if( o.selectMode === 'center' )
    o.line = Math.floor( ( o.range[ 0 ] + o.range[ 1 ] ) / 2 );
    else if( o.selectMode === 'begin' )
      o.line = o.range[ 0 ];
    else if( o.selectMode === 'end' )
      o.line = o.range[ 1 ] - 1;
  }

  _.assert( _.longIs( o.range ) );
  _.assert( _.intIs( o.line ) );

  /* */

  let f = 0;
  let counter = o.zeroLine;
  while( counter < o.range[ 0 ] )
  {
    f = o.src.indexOf( o.delimteter, f );
    if( f === -1 )
    return '';
    f += o.delimteter.length;
    counter += 1;
  }

  /* */

  let l = f-1;
  while( counter < o.range[ 1 ] )
  {
    l += 1;
    l = o.src.indexOf( o.delimteter, l );
    if( l === -1 )
    {
      l = o.src.length;
      break;
    }
    counter += 1;
  }

  /* */

  let result = f < l ? o.src.substring( f, l ) : '';

  /* numbering */

  if( o.numbering )
  result = _.strLinesNumber
  ( {
    src : result,
    zeroLine : o.range[ 0 ],
    onLine : lineHighlight,
  } );

  return result;

  /* */

  function lineHighlight( line, l )
  {
    if( !o.highlighting )
    return line.join( '' );
    if( l === o.line )
    line[ 0 ] = '* ' + line[ 0 ];
    else
    line[ 0 ] = '  ' + line[ 0 ];
    // line[ 1 ] = _.strBut( line[ 1 ], 0, '*' );
    return line.join( '' );
  }

  /* */

}

strLinesSelect.defaults =
{

  src : null,
  range : null,

  line : null,
  numberOfLines : 3,
  selectMode : 'center',
  highlighting : '*',

  numbering : 0,
  zeroLine : 1,
  delimteter : '\n',

}


// The _mapOnly() returns an object filled by unique [ key, value]
function _mapOnly( o )
{

  let dstMap = o.dstMap || Object.create( null );
  let screenMap = o.screenMaps;
  let srcMaps = o.srcMaps;

  if( !_.arrayIs( srcMaps ) )
  srcMaps = [ srcMaps ];

  if( !o.filter )
  o.filter = _.field.mapper.bypass;

  if( Config.debug )
  {

    _.assert( o.filter.functionFamily === 'field-mapper' );
    _.assert( arguments.length === 1, 'Expects single argument' );
    _.assert( _.objectLike( dstMap ), 'Expects object-like {-dstMap-}' );
    _.assert( !_.primitiveIs( screenMap ), 'Expects not primitive {-screenMap-}' );
    _.assert( _.arrayIs( srcMaps ), 'Expects array {-srcMaps-}' );
    _.assertMapHasOnly( o, _mapOnly.defaults );

    for( let s = srcMaps.length - 1 ; s >= 0 ; s-- )
    _.assert( !_.primitiveIs( srcMaps[ s ] ), 'Expects {-srcMaps-}' );

  }

  if( _.longIs( screenMap ) )
  {
    for( let k in screenMap )
    {

      if( screenMap[ k ] === undefined )
      continue;

      let s;
      for( s = srcMaps.length-1 ; s >= 0 ; s-- )
      {
        if( !_.mapIs( screenMap[ k ] ) && screenMap[ k ] in srcMaps[ s ] )
        {
          k = screenMap[ k ];
          break;
        }
        if( k in srcMaps[ s ] )
        {
          break;
        }
      }

      if( s === -1 )
      continue;

      o.filter.call( this, dstMap, srcMaps[ s ], k );

    }
  }
  else
  {
    for( let k in screenMap )
    {
      if( screenMap[ k ] === undefined )
      continue;

      for( let s in srcMaps )
      if( k in srcMaps[ s ] )
      o.filter.call( this, dstMap, srcMaps[ s ], k );
    }
  }

  return dstMap;
}

_mapOnly.defaults =
{
  dstMap : null,
  srcMaps : null,
  screenMaps : null,
  filter : null,
}
