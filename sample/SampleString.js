if( typeof module !== 'undefined' )
require( 'wTools' );
var _ = wTools;


got =_.strReplaceEnd( 'example', /ple/, 'en' );
console.log( got );
