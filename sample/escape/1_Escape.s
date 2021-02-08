let _ = require( '../..' );

/*
  A fourth argument can be provided to use as identifier whether to assign value or not
*/

function objectSetValue( obj, field, value, skip )
{
  if( skip === true )
  return;
  else
  obj[ field ] = value;
}

let obj = {};

objectSetValue( obj, 'field1', 1 );
objectSetValue( obj, 'field2', 2 );
objectSetValue( obj, 'field3', null );
objectSetValue( obj, 'field4', null, true );

console.log( obj );
/* log : { field1: 1, field2: 2, field3: null } */
