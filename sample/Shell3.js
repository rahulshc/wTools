if( typeof module !== 'undefined' )
{
  require( 'wTools' );
  require( 'wConsequence' );
  require( '../staging/dwtools/abase/akernel/eExecTools.s' );
}

var _ = wTools;

var o =
{
  code : 'ls',
  // mode : 'spawn',
}

_.shell( o )
