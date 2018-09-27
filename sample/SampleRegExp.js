if( typeof module !== 'undefined' )
require( 'wTools' );
var _ = wTools;


var regexp = 'a';
var str = 'abcdef';

var result = _.regexpTestNone( regexp, str );
console.log( result );
