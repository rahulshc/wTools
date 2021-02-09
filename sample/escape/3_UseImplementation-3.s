let objectSetValue = require( './3_ImplementationWithFieldDescriptor.s' );

let obj = {};

objectSetValue( obj, { name : 'field1', skip : false }, 1 );
objectSetValue( obj, { name : 'field2', skip : false }, 2 );
objectSetValue( obj, { name : 'field3', skip : false }, null );
objectSetValue( obj, { name : 'field4', skip : true }, null );

console.log( obj );
/* log : { field1: 1, field2: 2, field3: null } */
