if( typeof module !== 'undefined' )
require( 'wTools' );
var _ = wTools;

var dstArray = [ 0, 0, '1', 2, '1', 2, 0, 0, 'HI' ];

let r = _.arrayReplacedArrayOnce( dstArray, [ 0, 2 ], [ 'Rep0', 'Rep2', 'Rep3' ] );
logger.log( r, dstArray )
