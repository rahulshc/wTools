let _ = require( '../..' );

/*
  The problem of limited values :
  Set object field to a value.
  If value === null, do nothing

  What if we want to add `null` as the value ?
*/

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
objectSetValue( obj, 'field3', null );

console.log( obj );
/* log : { field1: 1, field2: 2 } */
