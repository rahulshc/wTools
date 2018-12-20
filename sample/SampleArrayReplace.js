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


var dst = [ [ 1 ], [ 2 ], [ 3 ] ];
function onEqualize1( a, b )
{
  return a[ 0 ] === b;
}
var got = _.arrayReplacedArrays( dst, [ [ 1 ] ], [ [ 0 ] ], onEqualize1 );
logger.log( 'Arrays Replaced', got );

var dst = [ 1, 2, 3 ];
function onEqualize( a, b )
{
  return a === b[ 0 ];
}
var got = _.arrayReplacedArrays( dst, [ [ [ 1 ] ] ], [ [ [ 0 ] ] ], onEqualize );
logger.log( 'Arrays Replaced', got );
