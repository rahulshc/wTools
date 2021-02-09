let objectSetValueWithObjectDescriptor = require( './2_ImplementationWithObjectDescriptor.s' );

let obj = {};

objectSetValueWithObjectDescriptor( { src : obj, skip : false }, 'field1', 1 );
objectSetValueWithObjectDescriptor( { src : obj, skip : false }, 'field2', 2 );
objectSetValueWithObjectDescriptor( { src : obj, skip : false }, 'field3', null );
objectSetValueWithObjectDescriptor( { src : obj, skip : true }, 'field4', null );

console.log( obj );
/* log : { field1: 1, field2: 2, field3: null } */
