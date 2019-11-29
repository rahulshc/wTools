let _ = require( '../..' );

function decrement( i )
{
  try
  {
    if( i <= 0 )
    throw _.errBrief( 'Please, specify positive number.' );
    return i-1;
  }
  catch( err )
  {
    console.log( err );
    throw err;
  }
}

decrement( 0 );

/*
  Brief error report for end user.
  Brief error report does not have stacks and other diagnostic information.
*/
