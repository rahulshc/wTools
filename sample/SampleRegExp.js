if( typeof module !== 'undefined' )
require( 'wTools' );
var _ = wTools;


var regexp = [ 'abc', 'def' ];;
var str = [ 'abc', 'def', 'ghi' ];
var result = _.regexpsTestAny( regexp, str );
console.log( result );
