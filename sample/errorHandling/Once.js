let _ = require( '../..' );
function decrement( i )
{
  try
  {
    if( i <= 0 )
    throw _.err( 'negative!' );
    return i-1;
  }
  catch( err )
  {
    err = _.err( err, '\nFailed to decrement' );
    if( _.errOnce( err ) )
    console.log( err );
    throw err;
  }
}

function divide( i )
{
  try
  {
    if( i % 2 === 1 )
    throw _.err( 'odd!' );
    return decrement( i / 2 );
  }
  catch( err )
  {
    err = _.err( err, '\nFailed to divide' );
    if( _.errOnce( err ) )
    console.log( err );
    throw err;
  }
}

divide( 0 );
