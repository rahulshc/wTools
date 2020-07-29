if( typeof module !== 'undefined' )
require( 'wTools' );
let _ = wTools;

// creating unroll array
var unroll = _.unrollMake([ 2, 3, 4 ]);

var result = _.arrayAppend( unroll, 5 );
// returns : [ 2, 3, 4, 5 ]
console.log( _.unrollIs( result ) );
// log : true

unroll.push( 'str' );
console.log( _.unrollIs( unroll ) );
// log : true

