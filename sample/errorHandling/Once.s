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
    let error = _.err( err, '\nFailed to decrement' );
    if( _.errOnce( error ) )
    console.log( error );
    throw error;
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
    let error = _.err( err );
    if( _.errOnce( error ) )
    console.log( error );
    throw error;
  }
}

try
{
  divide( 0 );
}
catch( err )
{
  let error = _.err( err );
  if( _.errOnce( error ) )
  console.log( error );
}

/*
  Error logged once.
  States of an error make possible to account it and avoid logging second time.
*/
