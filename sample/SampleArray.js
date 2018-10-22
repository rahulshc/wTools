if( typeof module !== 'undefined' )
require( 'wTools' );
var _ = wTools;

var dst = [ 0, 1, 2, 3 ];
var result = _.arrayFlattened( dst, 4, 5 );

console.log( result, dst );

result = _.arrayFlatten( [ 0 ], 1, 2, '3'  )
console.log( result );
