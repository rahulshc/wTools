if( typeof module !== 'undefined' )
require( 'wTools' );
require( 'wPathFundamentals' );
var _ = wTools;



let str = 'exexample';
let ins = 'ex';
let sub = '1';

let result = _.strReplaceBegin( [ 'exexample', 'example', 'ample' ], [ 'ex', 'am' ], [ '1', '2' ] ) 
logger.log( result )
