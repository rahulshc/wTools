if( typeof module !== 'undefined' )
{
  require( 'wTools' );
  require( 'wConsequence' );
  require( '../staging/abase/component/ExecTools.s' );
}

var _ = wTools;

/*run two shell commands one by one, ignoring errors*/
/*wConsequence.seal allows to pass arguments to shell through chainers*/

var con = new wConsequence().give();
con.seal( _,_.shell )
.thenDo( 'invalid command' )
.thenDo( 'ping www.google.com' )
/*wConsequence returned as 'consequence' property by con.seal method used to end 'shell' calls chain */
.consequence
.thenDo(function ()
{
  console.log( "End of shell calls chain" );
})
;
