if( typeof module !== 'undefined' )
{
  require( 'wTools' );
  require( 'wConsequence' );
  require( '../staging/abase/component/ExecTools.s' );
}

var _ = wTools;

_.shell( 'mkdir -p sample/temp_dir' )
.thenDo( function( err,code )
{
  if( err )
  throw _.errLogOnce( err );
  console.log( '"mkdir" ended with code:', code );
  this.give( code );
});
