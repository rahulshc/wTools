let _ = require( '../..' );

try
{
  throw _.err( 'Simplest error sample' );
}
catch( err )
{
  console.log( err );
  throw err;
}
