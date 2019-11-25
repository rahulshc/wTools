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
