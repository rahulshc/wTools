
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

console.log( 'String' )
console.log( 'GOT',  [ _.strLinesStrip( '\b\t\r' ) ]  , 'end'  );
console.log( 'Array' )
//console.log( 'GOT', _.strLinesStrip( [ '\na\n\nbc' ], [ '\ndef\n' ] ), 'end'  );
logger.log( _.strLinesStrip( [ 'Hello world', '', '\t\r\n' ] ) )
