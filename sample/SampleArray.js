if( typeof module !== 'undefined' )
require( 'wTools' );
var _ = wTools;

var dst = [ 0, 1, 2, 3 ];
var result = _.arrayRemovedOnceElement( dst, 4 );

console.log( result, dst );
