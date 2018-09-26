if( typeof module !== 'undefined' )
require( 'wTools' );
var _ = wTools;


var regexp = NaN;
var str = 'abcdef';

var result = _._regexpTest( regexp, str );
console.log( result );
