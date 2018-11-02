if( typeof module !== 'undefined' )
require( 'wTools' );
var _ = wTools;


// Input element
var ins = [];
var src = _.arrayFillWhole( Buffer.alloc( 5 ), 1 );
logger.log('SRC', src)
var got = _.longMakeSimilar( ins, src );
logger.log( 'result', got )
