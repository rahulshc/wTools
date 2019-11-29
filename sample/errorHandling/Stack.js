let _ = require( '../..' );

function decrement( i )
{
  debugger;
  return i-1;
}

function divideAndDecrement( i )
{
  return decrement( i / 2 );
}

divideAndDecrement( 6 );

/*
  Simplest sample to illustrate sync stack.
*/
