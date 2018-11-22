
if( typeof module !== 'undefined' )
require( 'wTools' );

var _ = wTools;

var srcStr =
`\na\nbc\ndef\nghij\n\n`
;

var crange = [ 3, 5];

var expected =
[
  '',
  'def',
  '',
]

var got = _.strLinesNearest
({
  src : srcStr,
  charsRange : 3,
  numberOfLines : 2,
});
console.log('GOT', got );
