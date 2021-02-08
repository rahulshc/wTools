let _ = require( '../..' );

/*
  A map can be provided as a first argument whether to assign value or not
*/

function objectSetValue( objectDescriptor, field, value )
{
  if( objectDescriptor.skip === true )
  return;
  else
  objectDescriptor.src[ field ] = value;
}

let obj = {};

objectSetValue( { src : obj, skip : false }, 'field1', 1 );
objectSetValue( { src : obj, skip : false }, 'field2', 2 );
objectSetValue( { src : obj, skip : false }, 'field3', null );
objectSetValue( { src : obj, skip : true }, 'field4', null );

console.log( obj );
/* log : { field1: 1, field2: 2, field3: null } */
