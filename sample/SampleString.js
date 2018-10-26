if( typeof module !== 'undefined' )
require( 'wTools' );
require( 'wPathFundamentals' );
var _ = wTools;



let str = 'abcdAabaefab';
let ins = [ /[a]/i, 'f', /[c]/ ];

let result = _._strRemoved( str, ins )
logger.log( result )
