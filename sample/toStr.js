if( typeof module !== 'undefined' )
require( '../staging/abase/wTools.s' );

var _ = wTools;

//returns '{ routine add }'
console.log( 'toStrMethods',_.toStrMethods( ( function add(){} ),{} ) );

//returns '{ routine add }'
console.log( 'toStr( onlyRoutines : 0 )',_.toStr( ( function add(){} ),{ onlyRoutines : 0 } ) );

//returns '{ routine add }'
console.log( 'toStr( onlyRoutines : 1 )',_.toStr( ( function add(){} ),{ onlyRoutines : 1 } ) );

//returns ''
console.log( _.toStr( { a : 1, b : 2 } ) );
