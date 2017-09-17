if( typeof module !== 'undefined' )
{
  require( 'wTools' );
  require( 'wConsequence' );
  require( '../staging/dwtools/abase/layer3/ExecTools.s' );
}

var _ = wTools;

/*run two shell commands one by one, ignoring errors*/
/*wConsequence.seal allows to pass arguments to shell through chainers*/

var con = new wConsequence().give();
con.seal( _,_.shell )
.doThen( 'echo shelling ping' )
.doThen( 'ping www.google.com' )
/*wConsequence returned as 'consequence' property */
.consequence
.doThen( function( err,data )
{
  /* handle error if any */
  if( err )
  console.error( err.toString() );
  else
  console.log( "Complete without errors" );
})
;
