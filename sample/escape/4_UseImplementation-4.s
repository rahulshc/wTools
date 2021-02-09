let objectSetValueWithValueDescriptor = require( './4_ImplementationWithValueDescriptor.s' );

let obj = {};

objectSetValueWithValueDescriptor( obj, 'field1', { value : 1, skip : false } );
objectSetValueWithValueDescriptor( obj, 'field2', { value : 2, skip : false } );
objectSetValueWithValueDescriptor( obj, 'field3', { value : null, skip : false } );
objectSetValueWithValueDescriptor( obj, 'field4', { value : null, skip : true } );

console.log( obj );
/* log : { field1: 1, field2: 2, field3: null } */
