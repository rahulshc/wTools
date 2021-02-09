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

module.exports = objectSetValue;
