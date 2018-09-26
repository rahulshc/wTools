if( typeof module !== 'undefined' )
require( 'wTools' );
var _ = wTools;


var regexp = /a/;
var str = [ 'abcdef', ' a '];

var result = _.regexpTestAll( regexp, str );
console.log( result );
