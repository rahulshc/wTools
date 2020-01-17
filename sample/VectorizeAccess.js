if( typeof module !== undefined )
require( 'wTools' );

let _ = wTools;

var cb1 = ( e ) => e;
var cb2 = ( e ) => e ** 2;
var cb3 = ( e ) => Math.sqrt( e );

var routines = [ [ cb1, 'first' ], [ cb2, 'second' ], [ cb3, 'third' ] ];
var vectorizedRoutines = _.vectorizeAccess( routines );

/* get property */

console.log( vectorizedRoutines[ '$' ] ); // log [ [ [Function: cb1], 'first' ], [ [Function: cb2], 'second' ], [ [Function: cb3], 'third' ] ] 
console.log( vectorizedRoutines[ 0 ] ); // log [Function]  
console.log( vectorizedRoutines[ 1 ] ); // log [ 'first', 'second', 'third' ] 

/* use callback */

var resultOperations = vectorizedRoutines[ 0 ]( 4 );
console.log( resultOperations[ '$' ] ); // log [ 4, 16, 2 ]

/* set property */

vectorizedRoutines[ 1 ] = 'new element';

console.log( vectorizedRoutines[ '$' ] ); // log [ [ [Function: cb1], 'new element' ], [ [Function: cb2], 'new element' ], [ [Function: cb3], 'new element' ] ] 
console.log( vectorizedRoutines[ 0 ] ); // log [Function]  
console.log( vectorizedRoutines[ 1 ] ); // log [ 'new element', 'new element', 'new element' ] 


