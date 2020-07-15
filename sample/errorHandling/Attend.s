let _ = require( '../..' );

try
{
  throw _.err( 'Simplest error sample' );
}
catch( err )
{
  _.errAttend( err );
  console.log( `Attended: ${ err }` )
}


/*
  This sample outputs nothing.
  If error should not be logged neither halt a porcess then use routine _.errAttend to change state of error object
  from `unattended` to `atteneded`.
*/
