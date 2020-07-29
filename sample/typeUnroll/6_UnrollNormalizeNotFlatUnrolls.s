if( typeof module !== 'undefined' )
require( 'wTools' );
let _ = wTools;

var unroll1 = _.unrollMake( [ 1, 2 ] );
var unroll2 = _.unrollMake( [ 3, 4 ] );
unroll1[ 2 ] = unroll2;

console.log( unroll1 );
/* log : [ 1, 2, [ 3, 4 ] ] */
console.log( unroll2 );
/* log : [ 3, 4 ] */

var result = _.unrollNormalize( [ unroll1, unroll2 ] );
console.log( result );
/* log :
[
  1, 2, [ 3, 4 ],
  3, 4
]
*/

