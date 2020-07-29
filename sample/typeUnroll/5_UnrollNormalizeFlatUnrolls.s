if( typeof module !== 'undefined' )
require( 'wTools' );
let _ = wTools;

var unroll1 = _.unrollMake([ '5' ]);
var unroll2 = _.unrollMake([ 'str', [ 3 ] ]);

// unrolling elements of the given array that are unroll-array
var result = _.unrollNormalize([ 0, 7, unroll1, [ unroll2, unroll1 ] ]);
// returns : [ 0, 7, '5', [ 'str', [ 3 ],  '5' ] ]
console.log( _.unrollIs( result ) );
// log : false

