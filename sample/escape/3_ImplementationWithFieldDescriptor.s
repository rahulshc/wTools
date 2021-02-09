/*
  A map can be provided as a second argument whether to assign value or not
*/

function objectSetValue( obj, fieldDescriptor, value )
{
  if( fieldDescriptor.skip === true )
  return;
  else
  obj[ fieldDescriptor.name ] = value;
}

module.exports = objectSetValue;
