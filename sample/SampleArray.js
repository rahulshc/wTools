if( typeof module !== 'undefined' )
require( 'wTools' );
var _ = wTools;

var dst = [];
result = _.arrayFlatten( dst, 1, 2, '3'  )
console.log( result, dst );

result = _.arrayFlatten( null, 1, 2, '3'  )
console.log( result );
