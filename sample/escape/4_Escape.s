let _ = require( '../..' );

/*
  A map can be provided as a third argument whether to assign value or not
*/

function objectSetValue( obj, field, valueDescriptor )
{
  if( valueDescriptor.skip === true )
  return;
  else
  obj[ field ] = valueDescriptor.value;
}

let obj = {};

objectSetValue( obj, 'field1', { value : 1, skip : false } );
objectSetValue( obj, 'field2', { value : 2, skip : false } );
objectSetValue( obj, 'field3', { value : null, skip : false } );
objectSetValue( obj, 'field4', { value : null, skip : true } );

console.log( obj );
/* log : { field1: 1, field2: 2, field3: null } */
