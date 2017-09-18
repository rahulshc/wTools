
if( typeof module !== 'undefined' )
require( 'wTools' );

var _ = wTools;

var onStrip = function( strip )
{
  var allowedKeys = [ 'bg','background','fg','foreground' ];
  var parts = strip.split( ' : ' )
  if( parts.length === 2 )
  {
    if( allowedKeys.indexOf( parts[ 0 ] ) === -1 )
    return;
    return parts;
  }
}

var src = "this #background : red#is#background : default# text1 and # text2 # and text3";
var got = _.strExtractStrips( src, { onStrip : onStrip } );
console.log( src );
console.log( _.toStr( got,{ levels : 2 } ) );

var src = "this #background : red#is#background : default# #text1";
var got = _.strExtractStrips( src, { onStrip : onStrip } );
console.log( src );
console.log( _.toStr( got,{ levels : 2 } ) );

var src = '#background : red#text#background : default#';
var got = _.strExtractStrips( src, { onStrip : onStrip } );
console.log( src );
console.log( _.toStr( got,{ levels : 2 } ) );

var src = '#background : red#i#s#background : default##text';
var got = _.strExtractStrips( src, { onStrip : onStrip } );
console.log( src );
console.log( _.toStr( got,{ levels : 2 } ) );
