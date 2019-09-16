if( typeof module !== 'undefined' )
{
  require( 'wTools' );
  require( 'wConsequence' );
  // require( '../proto/dwtools/abase/akernel/eExecTools.s' );
}

var _ = wTools;

var o =
{
  code : 'ls',
  // mode : 'spawn',
}

_.process.start( o )
