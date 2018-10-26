if( typeof module !== 'undefined' )
require( 'wTools' );
require( 'wPathFundamentals' );
var _ = wTools;



let str = 'aAafffAAAcccFF';
let ins = [ /[a]/i, 'f', /[c]/ ];
let sub = [ '1', '2', '3' ];

let result = _._strReplaced( str, ins, sub )
logger.log( result )
