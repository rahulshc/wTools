if( typeof module !== 'undefined' )
require( 'wTools' );

var _ = wTools;

//returns '', must { routine add }
console.log( 'toStrMethods',_.toStrMethods( ( function add(){} ),{} ) );

//returns { routine add }
console.log( 'toStr( onlyRoutines : 0 )',_.toStr( ( function add(){} ),{ onlyRoutines : 0 } ) );

//returns '', must { routine add }
console.log( 'toStr( onlyRoutines : 1 )',_.toStr( ( function add(){} ),{ onlyRoutines : 1 } ) );
