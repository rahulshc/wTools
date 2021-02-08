let _ = require( '../..' );

/* The problem of limited values */

function objectSetValue( obj, field, value )
{
  if( value === null )
  return;
  else
  obj[ field ] = value;
}

let obj = {};

objectSetValue( obj, 'field1', 1 );
objectSetValue( obj, 'field2', 2 );
objectSetValue( obj, 'field3', null ); /* what if we want to add `null` as value ? */

console.log( obj );
/* log : { field1: 1, field2: 2 } */
