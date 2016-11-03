if( typeof module !== 'undefined' )
  require( '../staging/abase/wTools.s' )

var _ = wTools;

var onStrip = function ( part )
{
  var temp = part.split( ':' )
  if( temp.length === 2 )
  {
    return temp;
  }
  return undefined;
}

var src = "this #background:red#is#background:default# text1 and # text2 # and text3";
var result = _.strExtractStrips( src, {  onStrip : onStrip } );

var src1 = "this #background:red#is#background:default# #text1";
var result2 = _.strExtractStrips( src1, {  onStrip : onStrip } );

console.log( result );
console.log( result2 );
