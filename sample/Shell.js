if( typeof module !== 'undefined' )
{
  require( 'wTools' );
  require( 'wConsequence' );
  // require( '../proto/dwtools/abase/layer3/ExecTools.s' );
}

var _ = wTools;

_.process.start( 'mkdir -p sample/temp_dir' )
.doThen( function( err,code )
{
  if( err )
  throw _.errLogOnce( err );
  console.log( '"mkdir" ended with code:', code );
  this.give( code );
});
