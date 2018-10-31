if( typeof module !== 'undefined' )
require( 'wTools' );
var _ = wTools;

var dstArray = [ 0, 0, '1', 2, '1', 2, 0, 0, 'HI' ];
dst = [ 1, 1, 1 ];
let r = _.arrayRemovedElement( dst,  1   );

logger.log( r, dst )
