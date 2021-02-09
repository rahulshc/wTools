let objectSetValue = require( './2_ImplementationWithObjectDescriptor.s' );

let obj = {};

objectSetValue( { src : obj, skip : false }, 'field1', 1 );
objectSetValue( { src : obj, skip : false }, 'field2', 2 );
objectSetValue( { src : obj, skip : false }, 'field3', null );
objectSetValue( { src : obj, skip : true }, 'field4', null );

console.log( obj );
/* log : { field1: 1, field2: 2, field3: null } */
