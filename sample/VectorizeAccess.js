if( typeof module !== undefined )
require( '../' );

let _ = wTools;

var cb1 = ( e ) => e;
var cb2 = ( e ) => e ** 2;
var cb3 = ( e ) => Math.sqrt( e );

/* in objects */

var routines = [ { routine : cb1, name : 'first' }, { routine : cb2, name : 'second' }, { routine : cb3, name : 'third' } ];
var vectorizedRoutines = _.vectorizeAccess( routines );

/* get property */

console.log( vectorizedRoutines[ '$' ] );
// log [
//       { routine: [Function: cb1], name: 'first' },
//       { routine: [Function: cb2], name: 'second' },
//       { routine: [Function: cb3], name: 'third' }
//     ]
console.log( vectorizedRoutines.routine ); // log [Function]  
console.log( vectorizedRoutines.name ); // log [ 'first', 'second', 'third' ] 

/* set property */

vectorizedRoutines.name = 'new element';

console.log( vectorizedRoutines[ '$' ] );
// log [
//       { routine: [Function: cb1], name: 'new element' },
//       { routine: [Function: cb2], name: 'new element' },
//       { routine: [Function: cb3], name: 'new element' }
//     ]
console.log( vectorizedRoutines.routine ); // log [Function]  
console.log( vectorizedRoutines.name ); // log [ 'new element', 'new element', 'new element' ] 

/* use callback */

var resultOperations = vectorizedRoutines.routine( 4 );
console.log( resultOperations[ '$' ] ); // log [ 4, 16, 2 ]

/* - */

/* - */

/* in vectors */

var routines = [ [ cb1, 'first' ], [ cb2, 'second' ], [ cb3, 'third' ] ];
var vectorizedRoutines = _.vectorizeAccess( routines );

/* get property */

console.log( vectorizedRoutines[ '$' ] ); 
// log [ 
//       [ [Function: cb1], 'first' ], 
//       [ [Function: cb2], 'second' ], 
//       [ [Function: cb3], 'third' ] 
//     ] 
console.log( vectorizedRoutines[ 0 ] ); // log [Function]  
console.log( vectorizedRoutines[ 1 ] ); // log [ 'first', 'second', 'third' ] 

/* set property */

vectorizedRoutines[ 1 ] = 'new element';

console.log( vectorizedRoutines[ '$' ] ); 
// log 
//     [ 
//       [ [Function: cb1], 'new element' ], 
//       [ [Function: cb2], 'new element' ], 
//       [ [Function: cb3], 'new element' ] 
//     ] 
console.log( vectorizedRoutines[ 0 ] ); // log [Function]  
console.log( vectorizedRoutines[ 1 ] ); // log [ 'new element', 'new element', 'new element' ] 

/* use callback */

var resultOperations = vectorizedRoutines[ 0 ]( 4 );
console.log( resultOperations[ '$' ] ); // log [ 4, 16, 2 ]

