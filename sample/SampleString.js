if( typeof module !== 'undefined' )
require( 'wTools' );
require( 'wPathFundamentals' );
var _ = wTools;



let str = [ 'abcdAabaefab', 'kjbkjbadKBDKbkfffcc' ];
let ins = [ /[a]/i, 'f', /[c]/ ];

let result = _.strRemove( str, ins )
logger.log( result )
