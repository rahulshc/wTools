let objectSetValue = require( './1_ImplementationWith4Arguments.s' );

let obj = {};

objectSetValue( obj, 'field1', 1 );
objectSetValue( obj, 'field2', 2 );
objectSetValue( obj, 'field3', null );
objectSetValue( obj, 'field4', null, true );

console.log( obj );
/* log : { field1: 1, field2: 2, field3: null } */
