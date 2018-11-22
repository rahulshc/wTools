
if( typeof module !== 'undefined' )
require( 'wTools' );

var _ = wTools;

var srcStr =
`
a
bc
def
ghij

`
;

var crange = [ 0, 4 ];
var sub = _.strSub( srcStr,crange );

var expected =
[
  '',
  'def',
  '',
]
console.log( sub );

var got = _.strLinesNearest
({
  src : srcStr,
  charsRange : crange,
  numberOfLines : 0,
});
console.log('GOT', got );
