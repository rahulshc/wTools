if( typeof module !== 'undefined' )
require( 'wTools' );
var _ = wTools;

var dstArray = [ ];

let r = _.arrayRemoveElement( [], 1, 1 );
logger.log( r, dstArray )
