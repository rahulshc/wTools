if( typeof module !== 'undefined' )
require( 'wTools' );
require( 'wPathFundamentals' );
var _ = wTools;



let str = [ 'exexample', 'example', 'ample' ];
let ins = [ 'ex', 'am' ];
let sub = [ '1', '2' ];
let expected = [ '1example', '1ample', '2ple' ];
let result = _.strReplaceBegin( str, ins, sub );
logger.log( result )
