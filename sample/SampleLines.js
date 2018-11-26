
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
console.log( 'GOT',  [ _.strLinesStrip( '  Hello \r\n\t', ' World \n\n  ! \n\n', '\n\n' ) ]  , 'end'  );
console.log( 'Array' )
console.log( 'GOT', _.strLinesStrip( [ '  Hello \r\n\t world \n\n ', '\n! \n' ], [ '\n\nHow\n\nAre  ', '  \r\nyou \n? \n'] ), 'end'  );
