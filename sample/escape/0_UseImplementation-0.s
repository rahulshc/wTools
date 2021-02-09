let objectSetValue = require( './0_Implementation.s' );

let obj = {};

objectSetValue( obj, 'field1', 1 );
objectSetValue( obj, 'field2', 2 );
objectSetValue( obj, 'field3', null );

console.log( obj );
/* log : { field1: 1, field2: 2 } */
