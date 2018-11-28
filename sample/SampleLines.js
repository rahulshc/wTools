
if( typeof module !== 'undefined' )
require( 'wTools' );

var _ = wTools;

var srcStr = `\na\nbc\ndef\nghij\n\n`;


console.log( 'Input is a string' )
console.log( 'GOT',  [ _.strLinesStrip( '  Hello \r\n\t World \n\n  ! \n\n' ) ] );
console.log( 'Input is an Array' )
console.log( 'GOT',    _.strLinesStrip( [ '  Hello \r\n\t World \n\n  ! \n\n' ] ) );
