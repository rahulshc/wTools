let objectSetValueWithFieldDescriptor = require( './3_ImplementationWithFieldDescriptor.s' );

let obj = {};

objectSetValueWithFieldDescriptor( obj, { name : 'field1', skip : false }, 1 );
objectSetValueWithFieldDescriptor( obj, { name : 'field2', skip : false }, 2 );
objectSetValueWithFieldDescriptor( obj, { name : 'field3', skip : false }, null );
objectSetValueWithFieldDescriptor( obj, { name : 'field4', skip : true }, null );

console.log( obj );
/* log : { field1: 1, field2: 2, field3: null } */
