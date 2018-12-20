if( typeof module !== 'undefined' )
require( 'wTools' );
var _ = wTools;


// Input element
var got = _.arrayReplace( [ 1, 2, 3, 3, 4 ], 3, 4 );
logger.log( 'Two elements Replaced', got )

var got = _.arrayReplaceOnce( [ 1, 2, 3, 3, 4 ], 3, 4 );
logger.log( 'Two elements Replaced', got )

var got = _.arrayReplaceOnceStrictly( [ 1, 2, 3, 4 ], 3, 5 );
logger.log( 'Two elements Replaced', got )

var got = _.arrayReplaced( [ 1, 2, 3, 3, 4 ], 3, 4 );
logger.log( 'Two elements Replaced', got )

var got = _.arrayReplacedOnce( [ 1, 2, 3, 3, 4 ], 3, 4 );
logger.log( 'Two elements Replaced', got )

var got = _.arrayReplacedOnceStrictly( [ 1, 2, 3, 4 ], 3, 5 );
logger.log( 'Two elements Replaced', got )
