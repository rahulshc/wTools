/*
  A map can be provided as a third argument whether to assign value or not
*/

function objectSetValueWithValueDescriptor( obj, field, valueDescriptor )
{
  if( valueDescriptor.skip === true )
  return;
  else
  obj[ field ] = valueDescriptor.value;
}

module.exports = objectSetValueWithValueDescriptor;
