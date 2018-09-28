if( typeof module !== 'undefined' )
require( 'wTools' );
var _ = wTools;


var regexp = /\w{4}/;
var str = 'example';
var result = _.strRemoveEnd( str, regexp );
console.log( result );
