if( typeof module !== 'undefined' )
require( 'wTools' );
var _ = wTools;


  got = _.strPrependOnce( [ 'a', 'b' ], 'Good' );
console.log( got );
